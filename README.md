# mdh-poisson-cuda

Auto-generated CUDA kernels for the 2D Poisson equation using the MDH (Multi-Dimensional Homomorphisms) framework. The solver is expressed as a high-level algebraic specification, from which production-ready CUDA code is generated automatically -- no hand-written GPU kernel required.

---

## Results at a glance

| Metric | Serial CPU | MDH GPU |
|---|---|---|
| Iterations to converge | 7700 | 7700 |
| Final residual | 9.093e-05 | 9.093e-05 |
| Compute time | 0.113 sec | 0.028 sec |
| Max error vs exact solution | 4.608e-06 | 4.608e-06 |
| Max diff GPU vs serial | -- | 0.000e+00 |
| **Speedup** | | **~4x (4.10x)** |

GPU result is **bit-identical** to the serial reference. No loss of accuracy. Convergence is reached in the same number of iterations.

---

## What is this

The **2D Poisson equation** is one of the most fundamental PDEs in science and engineering -- it appears in electrostatics, fluid flow, heat conduction, and image processing. Solving it numerically by the **Jacobi iterative method** means applying the same 5-point stencil update to every interior grid point, thousands of times, until the solution converges.

The **MDH framework** (Multi-Dimensional Homomorphisms) is a research compiler infrastructure for expressing data-parallel array computations as algebraic skeletons over multi-dimensional arrays. It uses dimension-specific combine operators -- not a simple map-reduce -- and automatically generates efficient OpenCL or CUDA kernels from those specifications. The framework was introduced by Rasch, Schulze, and Gorlatch at PACT 2019.

This repository extends MDH to support **stencil-based PDE solvers** for the first time on the CUDA backend. The entire GPU kernel is produced from a ~15-line C++ specification in `src/poisson/poisson.cpp`.

---

## How it works -- pipeline

```
src/poisson/poisson.cpp        (MDH algebraic specification, ~15 lines)
        |
        |  cmake + make
        v
./poisson  (MDH CUDA generator binary)
        |
        |  runs generator
        v
generated/poisson_1.cu         (auto-generated CUDA kernel, ~540 KB)
generated/poisson_2.cu         (auto-generated reduction kernel)
        |
        |  nvcc + compile flags from tests/poisson_64x64_config.json
        v
test_poisson_converge          (executable: runs GPU solver to convergence)
        |
        v
4x faster than serial, bit-identical solution
```

The key insight: **you write the math, the generator writes the GPU code.**

---

## Stencil -- the 5-point cross

The Jacobi update for the Poisson equation at interior point (i, j):

```
u_new[i][j] = 0.25 * ( u[i-1][j] + u[i+1][j] + u[i][j-1] + u[i][j+1] + h^2 * source[i][j] )
```

Visualized on the grid:

```
         col j-1      col j      col j+1
            |            |            |
row i-1  [  0  ]  [ U_val_l1_m1 ]  [  0  ]
row i    [ U_val_l2_m1 ] [ U_val ] [ U_val_l2_p1 ]
row i+1  [  0  ]  [ U_val_l1_p1 ]  [  0  ]
```

Zero Dirichlet boundary conditions (u = 0 on all 4 edges) are handled automatically by `oob::ZERO` in the MDH spec -- boundary neighbors return 0 without any explicit if-statement in the kernel.

---

## The MDH specification

The full spec that drives the entire GPU side is `src/poisson/poisson.cpp`:

```cpp
// stencil buffer: U with 5-point cross neighborhood, boundary = 0
auto U = md_hom::input_stencil_buffer(
    "U",
    {md_hom::L(1), md_hom::L(2)},
    md_hom::N(md_hom::N(0,1,0), md_hom::N(1,2,1), md_hom::N(0,1,0)),
    md_hom::oob::ZERO
);

auto SOURCE = md_hom::input_buffer("SOURCE", {md_hom::L(1), md_hom::L(2)});
auto h2     = md_hom::input_scalar("h2");

// f(): the Jacobi stencil update -- this becomes the GPU kernel body
auto f = md_hom::scalar_function(
    "return 0.25f * (U_val_l1_m1 + U_val_l1_p1 + U_val_l2_m1 + U_val_l2_p1 + SOURCE_val * h2_val);"
);

// md_hom<2,0>: 2 loop dimensions, 0 reduction dimensions (pure stencil)
auto md_hom_poisson = md_hom::md_hom<2, 0>(
    "poisson", md_hom::inputs(U, SOURCE, h2), f, g, result, false, false
);
```

**Neighborhood encoding** -- `N(N(0,1,0), N(1,2,1), N(0,1,0))`:
- Each outer `N(...)` entry is one row of the stencil window (top, center, bottom)
- Values: `0` = skip this point, `1` = include, `2` = origin (center of stencil)
- Top row `N(0,1,0)`: skip corners, include only center column -- gives point (-1, 0)
- Middle row `N(1,2,1)`: left, origin, right -- gives points (0,-1), (0,0), (0,+1)
- Bottom row `N(0,1,0)`: gives point (+1, 0)

**Variable names** auto-generated in `f()`:
| Point | MDH variable |
|---|---|
| (i-1, j) -- above | `U_val_l1_m1` |
| (i+1, j) -- below | `U_val_l1_p1` |
| (i, j-1) -- left | `U_val_l2_m1` |
| (i, j+1) -- right | `U_val_l2_p1` |
| (i, j) -- center | `U_val` |

---

## Framework fix

The MDH CUDA stencil wrapper (`include/cuda_input_stencil_buffer_wrapper.hpp`) was missing an implementation of the pure virtual method `result_input()` inherited from `input_wrapper`. This caused a compile error when first using stencil buffers on the CUDA backend:

```
error: invalid new-expression of abstract class type 'cuda_input_stencil_buffer_wrapper'
```

Fix -- added one method to the wrapper class:

```cpp
bool result_input() const {
    return false;
}
```

Stencil buffers are never result inputs, so the return value is always `false`. This fix enables stencil-based specs to compile and run on the CUDA backend for the first time.

---

## Repo structure

```
mdh-poisson-cuda/
|
|- CMakeLists.txt                         build config for the MDH generator
|- md_hom_generator.hpp                   top-level MDH include
|
|- include/                               MDH framework headers (21 files)
|   |- cuda_input_stencil_buffer_wrapper.hpp    <- fixed (added result_input())
|   |- cuda_generator.hpp
|   |- ...
|
|- src/
|   |- *.cpp                              MDH framework source files
|   |- poisson/
|       |- poisson.cpp                    OUR SPEC: the algebraic MDH specification
|
|- serial/
|   |- Poisoon_Sereial.cc                 hand-written serial CPU Jacobi baseline
|
|- generated/
|   |- poisson_1.cu                       auto-generated CUDA kernel (~540 KB)
|   |- poisson_2.cu                       auto-generated reduction kernel
|
|- tests/
    |- test_poisson.cu                    single-step correctness test
    |- test_poisson_converge.cu           full convergence + speedup comparison
    |- poisson_64x64_config.json          compile-time config for 64x64 grid
```

---

## Requirements

- CUDA Toolkit (tested with nvcc)
- C++14 or later
- CMake >= 2.8.11
- NVIDIA GPU (any Kepler or later)

---

## Build

### Step 1 -- build the MDH generator

```bash
git clone https://github.com/rahim-druba/mdh-poisson-cuda.git
cd mdh-poisson-cuda
mkdir build && cd build
cmake ..
make poisson
```

This produces the `./poisson` binary -- the MDH generator for the Poisson spec.

### Step 2 -- run the generator to produce CUDA kernels

```bash
cd build
./poisson
```

This writes two files: `poisson_1.cu` and `poisson_2.cu` (same as the ones already in `generated/`).

### Step 3 -- compile the convergence test

The config flags are in `tests/poisson_64x64_config.json`. Run from the `build/` directory:

```bash
nvcc ../tests/test_poisson_converge.cu poisson_1.cu -o test_poisson_converge \
  -DTYPE_T=double -DTYPE_TS=double \
  -DCACHE_L_CB=0 -DCACHE_P_CB=0 \
  -DG_CB_RES_DEST_LEVEL=2 \
  -DG_CB_SIZE_L_1=62 -DG_CB_SIZE_L_2=62 \
  -DL_CB_RES_DEST_LEVEL=1 -DL_CB_SIZE_L_1=16 -DL_CB_SIZE_L_2=16 \
  -DNUM_WG_L_1=4  -DNUM_WG_L_2=4 \
  -DNUM_WI_L_1=16 -DNUM_WI_L_2=16 \
  -DOCL_DIM_L_1=1 -DOCL_DIM_L_2=0 \
  -DP_CB_RES_DEST_LEVEL=0 -DP_CB_SIZE_L_1=1 -DP_CB_SIZE_L_2=1
```

Or compile the single-step test:

```bash
nvcc ../tests/test_poisson.cu poisson_1.cu -o test_poisson \
  -DTYPE_T=double -DTYPE_TS=double \
  -DCACHE_L_CB=0 -DCACHE_P_CB=0 \
  -DG_CB_RES_DEST_LEVEL=2 \
  -DG_CB_SIZE_L_1=62 -DG_CB_SIZE_L_2=62 \
  -DL_CB_RES_DEST_LEVEL=1 -DL_CB_SIZE_L_1=16 -DL_CB_SIZE_L_2=16 \
  -DNUM_WG_L_1=4  -DNUM_WG_L_2=4 \
  -DNUM_WI_L_1=16 -DNUM_WI_L_2=16 \
  -DOCL_DIM_L_1=1 -DOCL_DIM_L_2=0 \
  -DP_CB_RES_DEST_LEVEL=0 -DP_CB_SIZE_L_1=1 -DP_CB_SIZE_L_2=1
```

---

## Run

### Single-step correctness test

```bash
./test_poisson
```

Expected output:

```
=== MDH Poisson Jacobi 2D Test ===
Full grid  : 64 x 64
Interior   : 62 x 62 = 3844 points

Elements checked     : 3844
Max error vs serial  : 0.000e+00
Mismatches (>1e-10)  : 0
GPU time (kernel 1)  : 0.039648 ms

Poisson (MDH) Jacobi step is SUCCESSFUL!
```

### Full convergence + speedup test

```bash
./test_poisson_converge
```

Expected output:

```
=== MDH Poisson Convergence Test ===
Grid: 64x64  Interior: 62x62  EPS: 1e-04  MaxIter: 3000000

--- Serial Jacobi ---

Serial converged!
  Iterations        : 7700
  Final residual    : 9.093378e-05
  Time              : 0.113 seconds
  Max error vs exact: 4.607714e-06

--- GPU Jacobi (MDH-generated CUDA) ---

GPU converged!
  Iterations            : 7700
  Final residual        : 9.093378e-05
  GPU kernel time only  : 0.028 seconds  (27.554 ms)
  GPU total wall time   : 0.064 seconds
  Max error vs exact    : 4.607714e-06

=== Comparison ===
  Metric                            Serial CPU       MDH GPU
  Iterations to converge                  7700          7700
  Final residual                  9.093378e-05  9.093378e-05
  Compute time (seconds)                 0.113         0.028
  Max error vs exact              4.607714e-06  4.607714e-06
  Max diff GPU vs serial                   ---  0.000000e+00

  Speedup (serial / GPU kernel): 4.10x

Poisson (MDH) is SUCCESSFUL! Solutions match within 1e-6.
```

---

## Mathematical background

**Problem:** solve the 2D Poisson equation on the unit square [0,1] x [0,1]:

```
-( d^2u/dx^2 + d^2u/dy^2 ) = w(x,y)
```

with zero Dirichlet boundary conditions: u = 0 on all four edges.

**Source term:**

```
w(x,y) = 2 * ( x*(1-x) + y*(1-y) )
```

**Exact solution** (used to verify accuracy):

```
u(x,y) = x*(1-x) * y*(1-y)
```

**Discrete Jacobi update** on an NxN grid with spacing h = 1/(N-1):

```
u_new[i][j] = 0.25 * ( u[i-1][j] + u[i+1][j] + u[i][j-1] + u[i][j+1] + h^2 * w(x_j, y_i) )
```

**Residual** (used for convergence check every 100 iterations):

```
res[i][j] = | ( u[i-1][j] + u[i+1][j] + u[i][j-1] + u[i][j+1] - 4*u[i][j] ) / h^2 + w(x_j, y_i) |
```

Solver stops when `max(res) < 1e-4` or after 3,000,000 iterations.

---

## Serial baseline

`serial/Poisoon_Sereial.cc` is the original hand-written serial CPU solver. It uses standard C++ only (no CUDA), allocates memory on the host, runs a sequential do-while loop, and times with `clock()`. It was used as:

1. The mathematical reference to verify the MDH spec is correct
2. The timing baseline for the speedup measurement
3. The solution reference for the bit-identity check

The serial and GPU solvers were run from the same initial condition (u = 0 everywhere) with the same source term and the same convergence criterion.

---

## Platform tested

- OS: Linux (Ubuntu 20.04)
- GPU: NVIDIA (CUDA-capable)
- CUDA Toolkit: nvcc
- Compiler: g++ with C++14
- Grid: 64 x 64, interior 62 x 62 = 3844 points
- Precision: double

---

## References

- Ari Rasch, Richard Schulze, Sergei Gorlatch, "Generating Portable High-Performance Code via Multi-Dimensional Homomorphisms", PACT 2019
