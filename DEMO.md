# Live Demo -- MDH Poisson CUDA Generator

This file is a step-by-step guide to demonstrate the full pipeline live.
The key point to show: the CUDA kernel is **auto-generated** from a 15-line algebraic spec.
You will delete the kernel, regenerate it from scratch, compile it, and run the solver.

Each step has a short explanation followed by the exact command to copy-paste.

---

## Prerequisites

Make sure these are available on the machine before starting:

```bash
g++ --version
cmake --version
nvcc --version
nvidia-smi
```

You need: g++, cmake, nvcc (CUDA Toolkit), and an NVIDIA GPU.

---

## Step 0 -- clone the repo

```bash
git clone https://github.com/rahim-druba/mdh-poisson-cuda.git
cd mdh-poisson-cuda
```

---

## Step 1 -- look at the spec (the only file we write)

**What to say:** "This is the entire specification for the GPU solver. 15 lines of C++. No CUDA, no thread indexing, no memory management. The framework generates all of that automatically."

```bash
cat src/poisson/poisson.cpp
```

You will see the MDH spec: the stencil buffer, the source term, the scalar h2, and the one-line f() function that defines the Jacobi update. Nothing else.

---

## Step 2 -- build the MDH generator

**What to say:** "Now we compile the generator itself -- this is the MDH framework tool that reads the spec and produces CUDA code."

```bash
mkdir build && cd build
cmake ..
make poisson
```

This produces the `./poisson` binary. That binary is the generator.

---

## Step 3 -- delete the generated kernels

**What to say:** "The `generated/` folder already has the kernels from before. I am deleting them now so you can see them be produced from zero."

```bash
rm -f poisson_1.cu poisson_2.cu
ls *.cu 2>/dev/null || echo "no .cu files -- kernels are gone"
```

At this point there are no CUDA kernels. The solver cannot run yet.

---

## Step 4 -- run the generator

**What to say:** "Now I run the generator. It reads the spec and writes the CUDA kernel."

```bash
./poisson
```

Then check what appeared:

```bash
ls -lh poisson_1.cu poisson_2.cu
```

`poisson_1.cu` is around 540 KB. It was produced in under a second from the 15-line spec.
You can open it and show the generated kernel body -- it contains the full CUDA thread indexing,
boundary handling, shared memory tiling, and the Jacobi stencil -- all generated automatically.

---

## Step 5 -- compile the single-step correctness test

**What to say:** "Now we compile the generated kernel with nvcc and run a correctness check."

Run from the `build/` directory:

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

Run it:

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

**What to say:** "Max error vs serial is 0.000e+00 -- the generated kernel produces bit-identical results to the hand-written serial code. Zero mismatches out of 3844 points."

---

## Step 6 -- compile and run the full convergence test

**What to say:** "Now we run both solvers to convergence and compare timing."

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

Run it:

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
  Time              : 0.112 seconds
  Max error vs exact: 4.607714e-06

--- GPU Jacobi (MDH-generated CUDA) ---

GPU converged!
  Iterations            : 7700
  Final residual        : 9.093378e-05
  GPU kernel time only  : 0.028 seconds  (28.113 ms)
  GPU total wall time   : 0.066 seconds
  Max error vs exact    : 4.607714e-06

=== Comparison ===
  Metric                            Serial CPU       MDH GPU
  Iterations to converge                  7700          7700
  Final residual                  9.093378e-05  9.093378e-05
  Compute time (seconds)                 0.112         0.028
  Max error vs exact              4.607714e-06  4.607714e-06
  Max diff GPU vs serial                   ---  0.000000e+00

  Speedup (serial / GPU kernel): 3.98x

Poisson (MDH) is SUCCESSFUL! Solutions match within 1e-6.
```

---

## What the results mean

| Number | What it proves |
|---|---|
| Max diff GPU vs serial = 0.000e+00 | The auto-generated kernel is mathematically identical to hand-written serial code |
| Same iteration count (7700 = 7700) | The GPU solver converges exactly like the serial solver -- no algorithmic difference |
| Same residual (9.093e-05 = 9.093e-05) | Both solvers stopped at the same convergence point |
| Speedup 3.98x | The auto-generated CUDA kernel is 4x faster than serial CPU with no hand-tuning |
| Same error vs exact (4.608e-06 = 4.608e-06) | No accuracy lost going from serial to GPU |

---

## To repeat the demo from scratch

Just delete the build folder and start again from Step 2:

```bash
cd mdh-poisson-cuda
rm -rf build
mkdir build && cd build
cmake ..
make poisson
./poisson
```

The generated kernels will be exactly the same every time -- deterministic generation.

---

## Quick repeat (if already built, just regenerate the kernel)

If the generator binary already exists, skip cmake and make. Just delete and regenerate:

```bash
cd build
rm -f poisson_1.cu poisson_2.cu
./poisson
ls -lh poisson_1.cu
```

Then recompile and run as in Steps 5 and 6.
