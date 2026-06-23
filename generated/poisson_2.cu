// helper macros
#if   OCL_DIM_L_1 == 1
  #define CONCAT_IN_DESCENDING_OCL_ORDER_1(i, j) i

  #define CONCAT_IN_DESCENDING_OCL_ORDER_0(i, j) j
#elif OCL_DIM_L_2 == 1
  #define CONCAT_IN_DESCENDING_OCL_ORDER_1(i, j) j

  #define CONCAT_IN_DESCENDING_OCL_ORDER_0(i, j) i
#endif
#define CONCAT_IN_DESCENDING_OCL_ORDER(i, j) CONCAT_IN_DESCENDING_OCL_ORDER_1(i, j)CONCAT_IN_DESCENDING_OCL_ORDER_0(i, j)

#if   OCL_DIM_L_1 == 1
  #define FLAT_INDEX_IN_DESCENDING_OCL_ORDER_1(i_id, j_id, i_size, j_size) i_id

  #define FLAT_INDEX_IN_DESCENDING_OCL_ORDER_0(i_id, j_id, i_size, j_size) (FLAT_INDEX_IN_DESCENDING_OCL_ORDER_1(i_id, j_id, i_size, j_size)) * (j_size) + (j_id)
#elif OCL_DIM_L_2 == 1
  #define FLAT_INDEX_IN_DESCENDING_OCL_ORDER_1(i_id, j_id, i_size, j_size) j_id

  #define FLAT_INDEX_IN_DESCENDING_OCL_ORDER_0(i_id, j_id, i_size, j_size) (FLAT_INDEX_IN_DESCENDING_OCL_ORDER_1(i_id, j_id, i_size, j_size)) * (i_size) + (i_id)
#endif
#define FLAT_INDEX_IN_DESCENDING_OCL_ORDER(i_id, j_id, i_size, j_size) FLAT_INDEX_IN_DESCENDING_OCL_ORDER_0(i_id, j_id, i_size, j_size)

#if   OCL_DIM_L_1 == 1
  #define DESCENDING_L_DIMS_1(i, j) i

  #define DESCENDING_L_DIMS_0(i, j) j
#elif OCL_DIM_L_2 == 1
  #define DESCENDING_L_DIMS_1(i, j) j

  #define DESCENDING_L_DIMS_0(i, j) i
#endif

#define CEIL(x,y) (((x) + (y) - 1) / (y))


#if   OCL_DIM_L_1 == 0
#define GET_GLOBAL_ID_L_1   (blockIdx.x * blockDim.x + threadIdx.x)
#define GET_LOCAL_ID_L_1    (threadIdx.x)
#define GET_GROUP_ID_L_1    (blockIdx.x)
#define GET_GLOBAL_SIZE_L_1 (gridDim.x * blockDim.x)
#define GET_LOCAL_SIZE_L_1  (blockDim.x)
#elif OCL_DIM_L_1 == 1
#define GET_GLOBAL_ID_L_1   (blockIdx.y * blockDim.y + threadIdx.y)
#define GET_LOCAL_ID_L_1    (threadIdx.y)
#define GET_GROUP_ID_L_1    (blockIdx.y)
#define GET_GLOBAL_SIZE_L_1 (gridDim.y * blockDim.y)
#define GET_LOCAL_SIZE_L_1  (blockDim.y)
#elif OCL_DIM_L_1 == 2
#define GET_GLOBAL_ID_L_1   (blockIdx.z * blockDim.z + threadIdx.z)
#define GET_LOCAL_ID_L_1    (threadIdx.z)
#define GET_GROUP_ID_L_1    (blockIdx.z)
#define GET_GLOBAL_SIZE_L_1 (gridDim.z * blockDim.z)
#define GET_LOCAL_SIZE_L_1  (blockDim.z)
#endif
#if   OCL_DIM_L_2 == 0
#define GET_GLOBAL_ID_L_2   (blockIdx.x * blockDim.x + threadIdx.x)
#define GET_LOCAL_ID_L_2    (threadIdx.x)
#define GET_GROUP_ID_L_2    (blockIdx.x)
#define GET_GLOBAL_SIZE_L_2 (gridDim.x * blockDim.x)
#define GET_LOCAL_SIZE_L_2  (blockDim.x)
#elif OCL_DIM_L_2 == 1
#define GET_GLOBAL_ID_L_2   (blockIdx.y * blockDim.y + threadIdx.y)
#define GET_LOCAL_ID_L_2    (threadIdx.y)
#define GET_GROUP_ID_L_2    (blockIdx.y)
#define GET_GLOBAL_SIZE_L_2 (gridDim.y * blockDim.y)
#define GET_LOCAL_SIZE_L_2  (blockDim.y)
#elif OCL_DIM_L_2 == 2
#define GET_GLOBAL_ID_L_2   (blockIdx.z * blockDim.z + threadIdx.z)
#define GET_LOCAL_ID_L_2    (threadIdx.z)
#define GET_GROUP_ID_L_2    (blockIdx.z)
#define GET_GLOBAL_SIZE_L_2 (gridDim.z * blockDim.z)
#define GET_LOCAL_SIZE_L_2  (blockDim.z)
#endif

#define PRIVATE 0
#define LOCAL   1
#define GLOBAL  2

// =============== macro definitions per dimension ============================
// -------------------- L_1 --------------------

// cache block sizes
#define K2_G_CB_SIZE_L_1 G_CB_SIZE_L_1
#define K2_L_CB_SIZE_L_1 L_CB_SIZE_L_1
#define K2_P_CB_SIZE_L_1 P_CB_SIZE_L_1

// functional unit ids
#define K2_G_FU_ID_L_1 i_wg_l_1
#define K2_L_FU_ID_L_1 i_wi_l_1
#define K2_P_FU_ID_L_1 0

// number of functional units
#define K2_G_NUM_FU_L_1 NUM_WG_L_1
#define K2_L_NUM_FU_L_1 NUM_WI_L_1
#define K2_P_NUM_FU_L_1 1

// number of cache blocks per functional unit
#define K2_G_NUM_CB_L_1 1 // == (M_1 / K2_G_CB_SIZE_L_1 / 1)
#define K2_L_NUM_CB_L_1 (K2_G_CB_SIZE_L_1 / K2_L_CB_SIZE_L_1 / K2_G_NUM_FU_L_1)
#define K2_P_NUM_CB_L_1 (K2_L_CB_SIZE_L_1 / K2_P_CB_SIZE_L_1 / K2_L_NUM_FU_L_1)

// number of extra cache blocks
#define K2_G_NUM_EXTRA_CB_L_1 0 // == (M_1 / K2_G_CB_SIZE_L_1 % 1)
#define K2_L_NUM_EXTRA_CB_L_1 (K2_G_CB_SIZE_L_1 / K2_L_CB_SIZE_L_1 % K2_G_NUM_FU_L_1)
#define K2_P_NUM_EXTRA_CB_L_1 (K2_L_CB_SIZE_L_1 / K2_P_CB_SIZE_L_1 % K2_L_NUM_FU_L_1)

// number of extra elements
#define K2_G_NUM_EXTRA_ELEMS_L_1 0 // == (M_1 % K2_G_CB_SIZE_L_1)
#define K2_L_NUM_EXTRA_ELEMS_L_1 (K2_G_CB_SIZE_L_1 % K2_L_CB_SIZE_L_1)
#define K2_P_NUM_EXTRA_ELEMS_L_1 (K2_L_CB_SIZE_L_1 % K2_P_CB_SIZE_L_1)

// size of incomplete cache blocks
#define K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 (K2_L_CB_SIZE_L_1 % K2_P_CB_SIZE_L_1)
#define K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 (K2_G_CB_SIZE_L_1 % K2_L_CB_SIZE_L_1 % K2_P_CB_SIZE_L_1)
#define K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 (K2_G_CB_SIZE_L_1 % K2_L_CB_SIZE_L_1)

// number of cache blocks in incomplete parent cache block per functional unit
#define K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1 (K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 / K2_P_CB_SIZE_L_1 / K2_L_NUM_FU_L_1)

// number of extra cache blocks in incomplete parent cache block
#define K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1 ((K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 / K2_P_CB_SIZE_L_1) % K2_L_NUM_FU_L_1)

// number of extra elements in incomplete parent cache block
#define K2_P_NUM_EXTRA_ELEMS_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1 (K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 % K2_P_CB_SIZE_L_1)

// cache block offsets
#define K2_G_CB_OFFSET_L_1 0 // == (K2_G_CB_SIZE_L_1 * (0 + i_g_cb_L_1 * 1))
#define K2_L_CB_OFFSET_L_1 (K2_L_CB_SIZE_L_1 * (K2_G_FU_ID_L_1 + i_l_cb_l_1 * K2_G_NUM_FU_L_1))
#define K2_P_CB_OFFSET_L_1 (K2_P_CB_SIZE_L_1 * (K2_L_FU_ID_L_1 + i_p_cb_l_1 * K2_L_NUM_FU_L_1))


// -------------------- L_2 --------------------

// cache block sizes
#define K2_G_CB_SIZE_L_2 G_CB_SIZE_L_2
#define K2_L_CB_SIZE_L_2 L_CB_SIZE_L_2
#define K2_P_CB_SIZE_L_2 P_CB_SIZE_L_2

// functional unit ids
#define K2_G_FU_ID_L_2 i_wg_l_2
#define K2_L_FU_ID_L_2 i_wi_l_2
#define K2_P_FU_ID_L_2 0

// number of functional units
#define K2_G_NUM_FU_L_2 NUM_WG_L_2
#define K2_L_NUM_FU_L_2 NUM_WI_L_2
#define K2_P_NUM_FU_L_2 1

// number of cache blocks per functional unit
#define K2_G_NUM_CB_L_2 1 // == (M_2 / K2_G_CB_SIZE_L_2 / 1)
#define K2_L_NUM_CB_L_2 (K2_G_CB_SIZE_L_2 / K2_L_CB_SIZE_L_2 / K2_G_NUM_FU_L_2)
#define K2_P_NUM_CB_L_2 (K2_L_CB_SIZE_L_2 / K2_P_CB_SIZE_L_2 / K2_L_NUM_FU_L_2)

// number of extra cache blocks
#define K2_G_NUM_EXTRA_CB_L_2 0 // == (M_2 / K2_G_CB_SIZE_L_2 % 1)
#define K2_L_NUM_EXTRA_CB_L_2 (K2_G_CB_SIZE_L_2 / K2_L_CB_SIZE_L_2 % K2_G_NUM_FU_L_2)
#define K2_P_NUM_EXTRA_CB_L_2 (K2_L_CB_SIZE_L_2 / K2_P_CB_SIZE_L_2 % K2_L_NUM_FU_L_2)

// number of extra elements
#define K2_G_NUM_EXTRA_ELEMS_L_2 0 // == (M_2 % K2_G_CB_SIZE_L_2)
#define K2_L_NUM_EXTRA_ELEMS_L_2 (K2_G_CB_SIZE_L_2 % K2_L_CB_SIZE_L_2)
#define K2_P_NUM_EXTRA_ELEMS_L_2 (K2_L_CB_SIZE_L_2 % K2_P_CB_SIZE_L_2)

// size of incomplete cache blocks
#define K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2 (K2_L_CB_SIZE_L_2 % K2_P_CB_SIZE_L_2)
#define K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2 (K2_G_CB_SIZE_L_2 % K2_L_CB_SIZE_L_2 % K2_P_CB_SIZE_L_2)
#define K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2 (K2_G_CB_SIZE_L_2 % K2_L_CB_SIZE_L_2)

// number of cache blocks in incomplete parent cache block per functional unit
#define K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 (K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2 / K2_P_CB_SIZE_L_2 / K2_L_NUM_FU_L_2)

// number of extra cache blocks in incomplete parent cache block
#define K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 ((K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2 / K2_P_CB_SIZE_L_2) % K2_L_NUM_FU_L_2)

// number of extra elements in incomplete parent cache block
#define K2_P_NUM_EXTRA_ELEMS_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 (K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2 % K2_P_CB_SIZE_L_2)

// cache block offsets
#define K2_G_CB_OFFSET_L_2 0 // == (K2_G_CB_SIZE_L_2 * (0 + i_g_cb_L_2 * 1))
#define K2_L_CB_OFFSET_L_2 (K2_L_CB_SIZE_L_2 * (K2_G_FU_ID_L_2 + i_l_cb_l_2 * K2_G_NUM_FU_L_2))
#define K2_P_CB_OFFSET_L_2 (K2_P_CB_SIZE_L_2 * (K2_L_FU_ID_L_2 + i_p_cb_l_2 * K2_L_NUM_FU_L_2))


// -------------------- combined over dimensions --------------------

// flat WI ids
#define K2_G_FLAT_WI_ID (FLAT_INDEX_IN_DESCENDING_OCL_ORDER(GET_GLOBAL_ID_L_1, GET_GLOBAL_ID_L_2, GET_GLOBAL_SIZE_L_1, GET_GLOBAL_SIZE_L_2))
#define K2_L_FLAT_WI_ID (FLAT_INDEX_IN_DESCENDING_OCL_ORDER(GET_LOCAL_ID_L_1, GET_LOCAL_ID_L_2, GET_LOCAL_SIZE_L_1, GET_LOCAL_SIZE_L_2))
#define K2_P_FLAT_WI_ID (0)

// flat number of WIs
#define K2_G_FLAT_NUM_WI (K2_G_NUM_FU_L_1 * K2_L_NUM_FU_L_1 * K2_G_NUM_FU_L_2 * K2_L_NUM_FU_L_2)
#define K2_L_FLAT_NUM_WI (K2_L_NUM_FU_L_1 * K2_L_NUM_FU_L_2)
#define K2_P_FLAT_NUM_WI (1)
// =============== end of macro definitions per dimension =====================

// =============== macro definitions per buffer ===============================
// -------------------- buffer INT_RES --------------------

// buffer abstraction
#if   OCL_DIM_L_1 == 1
  #define BUFFER_INT_RES_INDEX_1(i, j) i
  #define BUFFER_INT_RES_G_SIZE_1 K2_G_CB_SIZE_L_1
  #define BUFFER_INT_RES_L_SIZE_1 K2_L_CB_SIZE_L_1
  #define BUFFER_INT_RES_P_SIZE_1 K2_P_CB_SIZE_L_1

  #define BUFFER_INT_RES_INDEX_0(i, j) j
  #define BUFFER_INT_RES_G_SIZE_0 K2_G_CB_SIZE_L_2
  #define BUFFER_INT_RES_L_SIZE_0 K2_L_CB_SIZE_L_2
  #define BUFFER_INT_RES_P_SIZE_0 K2_P_CB_SIZE_L_2
#elif OCL_DIM_L_2 == 1
  #define BUFFER_INT_RES_INDEX_1(i, j) j
  #define BUFFER_INT_RES_G_SIZE_1 K2_G_CB_SIZE_L_2
  #define BUFFER_INT_RES_L_SIZE_1 K2_L_CB_SIZE_L_2
  #define BUFFER_INT_RES_P_SIZE_1 K2_P_CB_SIZE_L_2

  #define BUFFER_INT_RES_INDEX_0(i, j) i
  #define BUFFER_INT_RES_G_SIZE_0 K2_G_CB_SIZE_L_1
  #define BUFFER_INT_RES_L_SIZE_0 K2_L_CB_SIZE_L_1
  #define BUFFER_INT_RES_P_SIZE_0 K2_P_CB_SIZE_L_1
#endif
#define K2_G_BUFFER_INT_RES(i, j) int_res[(BUFFER_INT_RES_INDEX_1(i, j)) * BUFFER_INT_RES_G_SIZE_0 + (BUFFER_INT_RES_INDEX_0(i, j))]
#define K2_L_BUFFER_INT_RES(i, j) cb_l_int_res[(BUFFER_INT_RES_INDEX_1(i, j))][(BUFFER_INT_RES_INDEX_0(i, j))]
#define K2_P_BUFFER_INT_RES(i, j) cb_p_int_res[(BUFFER_INT_RES_INDEX_1(i, j))][(BUFFER_INT_RES_INDEX_0(i, j))]

// partitioning and cache usage
#define K2_G_MEM_INT_RES(i, j) K2_G_BUFFER_INT_RES(i, j)
#if CACHE_L_CB != 0
#define K2_L_MEM_INT_RES(i, j) K2_L_BUFFER_INT_RES(i, j)
#else
#define K2_L_MEM_INT_RES(i, j) K2_G_MEM_INT_RES(K2_L_CB_OFFSET_L_1 + (i), K2_L_CB_OFFSET_L_2 + (j))
#endif
#if CACHE_P_CB != 0
#define K2_P_MEM_INT_RES(i, j) K2_P_BUFFER_INT_RES(i, j)
#else
#define K2_P_MEM_INT_RES(i, j) K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + (i), K2_P_CB_OFFSET_L_2 + (j))
#endif

// cache block sizes
#define K2_G_CB_SIZE_INT_RES (K2_G_CB_SIZE_L_1 * K2_G_CB_SIZE_L_2)
#define K2_L_CB_SIZE_INT_RES (K2_L_CB_SIZE_L_1 * K2_L_CB_SIZE_L_2)
#define K2_P_CB_SIZE_INT_RES (K2_P_CB_SIZE_L_1 * K2_P_CB_SIZE_L_2)


// -------------------- result buffer --------------------

// check which levels are used
#if G_CB_RES_DEST_LEVEL == PRIVATE || L_CB_RES_DEST_LEVEL == PRIVATE || P_CB_RES_DEST_LEVEL == PRIVATE
#define K2_P_LEVEL_HAS_RESULTS
#endif
#if G_CB_RES_DEST_LEVEL == LOCAL || L_CB_RES_DEST_LEVEL == LOCAL || P_CB_RES_DEST_LEVEL == LOCAL
#define K2_L_LEVEL_HAS_RESULTS
#endif
#if G_CB_RES_DEST_LEVEL == GLOBAL || L_CB_RES_DEST_LEVEL == GLOBAL || P_CB_RES_DEST_LEVEL == GLOBAL
#define K2_G_LEVEL_HAS_RESULTS
#endif

// ------ PRIVATE ------
#ifdef K2_P_LEVEL_HAS_RESULTS
// construct prefix for res_p
#if G_CB_RES_DEST_LEVEL == PRIVATE
#define K2_RES_P_BUFFER_G_PREFIX_L_1() [i_l_cb_l_1]
#define K2_RES_P_BUFFER_G_PREFIX_L_2() [i_l_cb_l_2]
#define K2_RES_P_BUFFER_DEF_G_PREFIX_L_1() [K2_L_NUM_CB_L_1 + ((K2_L_NUM_EXTRA_CB_L_1 + K2_L_NUM_EXTRA_ELEMS_L_1) > 0)]
#define K2_RES_P_BUFFER_DEF_G_PREFIX_L_2() [K2_L_NUM_CB_L_2 + ((K2_L_NUM_EXTRA_CB_L_2 + K2_L_NUM_EXTRA_ELEMS_L_2) > 0)]
#else
#define K2_RES_P_BUFFER_G_PREFIX_L_1()
#define K2_RES_P_BUFFER_G_PREFIX_L_2()
#define K2_RES_P_BUFFER_DEF_G_PREFIX_L_1()
#define K2_RES_P_BUFFER_DEF_G_PREFIX_L_2()
#endif
#if L_CB_RES_DEST_LEVEL == PRIVATE
#define K2_RES_P_BUFFER_L_PREFIX_L_1() [i_p_cb_l_1]
#define K2_RES_P_BUFFER_L_PREFIX_L_2() [i_p_cb_l_2]
#define K2_RES_P_BUFFER_DEF_L_PREFIX_L_1() [K2_P_NUM_CB_L_1 + ((K2_P_NUM_EXTRA_CB_L_1 + K2_P_NUM_EXTRA_ELEMS_L_1) > 0)]
#define K2_RES_P_BUFFER_DEF_L_PREFIX_L_2() [K2_P_NUM_CB_L_2 + ((K2_P_NUM_EXTRA_CB_L_2 + K2_P_NUM_EXTRA_ELEMS_L_2) > 0)]
#else
#define K2_RES_P_BUFFER_L_PREFIX_L_1()
#define K2_RES_P_BUFFER_L_PREFIX_L_2()
#define K2_RES_P_BUFFER_DEF_L_PREFIX_L_1()
#define K2_RES_P_BUFFER_DEF_L_PREFIX_L_2()
#endif
// buffer abstraction for res_p
#define K2_RES_P_BUFFER_NAME() res_p
#define K2_RES_P_BUFFER_DEF K2_RES_P_BUFFER_NAME()CONCAT_IN_DESCENDING_OCL_ORDER(K2_RES_P_BUFFER_DEF_G_PREFIX_L_1()K2_RES_P_BUFFER_DEF_L_PREFIX_L_1()[K2_P_CB_SIZE_L_1], K2_RES_P_BUFFER_DEF_G_PREFIX_L_2()K2_RES_P_BUFFER_DEF_L_PREFIX_L_2()[K2_P_CB_SIZE_L_2])
#define K2_RES_P_BUFFER(i, j) K2_RES_P_BUFFER_NAME()CONCAT_IN_DESCENDING_OCL_ORDER(K2_RES_P_BUFFER_G_PREFIX_L_1()K2_RES_P_BUFFER_L_PREFIX_L_1()[i], K2_RES_P_BUFFER_G_PREFIX_L_2()K2_RES_P_BUFFER_L_PREFIX_L_2()[j])
#endif

// ------ LOCAL ------
#ifdef K2_L_LEVEL_HAS_RESULTS
// construct prefix for res_l
#if G_CB_RES_DEST_LEVEL == LOCAL
#define K2_RES_L_BUFFER_G_PREFIX_L_1() [i_l_cb_l_1]
#define K2_RES_L_BUFFER_G_PREFIX_L_2() [i_l_cb_l_2]
#define K2_RES_L_BUFFER_DEF_G_PREFIX_L_1() [K2_L_NUM_CB_L_1 + ((K2_L_NUM_EXTRA_CB_L_1 + K2_L_NUM_EXTRA_ELEMS_L_1) > 0)]
#define K2_RES_L_BUFFER_DEF_G_PREFIX_L_2() [K2_L_NUM_CB_L_2 + ((K2_L_NUM_EXTRA_CB_L_2 + K2_L_NUM_EXTRA_ELEMS_L_2) > 0)]
#else
#define K2_RES_L_BUFFER_G_PREFIX_L_1()
#define K2_RES_L_BUFFER_G_PREFIX_L_2()
#define K2_RES_L_BUFFER_DEF_G_PREFIX_L_1()
#define K2_RES_L_BUFFER_DEF_G_PREFIX_L_2()
#endif
// buffer abstraction for res_l
#define K2_RES_L_BUFFER_NAME() res_l
#define K2_RES_L_BUFFER_DEF K2_RES_L_BUFFER_NAME()CONCAT_IN_DESCENDING_OCL_ORDER(K2_RES_L_BUFFER_DEF_G_PREFIX_L_1()[K2_L_CB_SIZE_L_1], K2_RES_L_BUFFER_DEF_G_PREFIX_L_2()[K2_L_CB_SIZE_L_2])
#define K2_RES_L_BUFFER(i, j) K2_RES_L_BUFFER_NAME()CONCAT_IN_DESCENDING_OCL_ORDER(K2_RES_L_BUFFER_G_PREFIX_L_1()[i], K2_RES_L_BUFFER_G_PREFIX_L_2()[j])
#endif

// ------ GLOBAL ------
#ifdef K2_G_LEVEL_HAS_RESULTS
// buffer abstraction for res_g
#define K2_RES_G_BUFFER_NAME() U_new
#define K2_RES_G_BUFFER(i, j) K2_RES_G_BUFFER_NAME()[(i) * K2_G_CB_SIZE_L_2 + (j)]
#endif

// determine memory destination for results
#if   P_CB_RES_DEST_LEVEL == PRIVATE
#define K2_P_CB_RES_DEST(i, j) K2_RES_P_BUFFER(i, j)
#elif P_CB_RES_DEST_LEVEL == LOCAL
#define K2_P_CB_RES_DEST(i, j) K2_RES_L_BUFFER(K2_P_CB_OFFSET_L_1 + (i), K2_P_CB_OFFSET_L_2 + (j))
#elif P_CB_RES_DEST_LEVEL == GLOBAL
#define K2_P_CB_RES_DEST(i, j) K2_RES_G_BUFFER(K2_P_CB_OFFSET_L_1 + (K2_L_CB_OFFSET_L_1 + (i)), K2_P_CB_OFFSET_L_2 + (K2_L_CB_OFFSET_L_2 + (j)))
#endif

#if   L_CB_RES_DEST_LEVEL == PRIVATE
#define K2_L_CB_RES_DEST(i, j) K2_RES_P_BUFFER(i, j)
#elif L_CB_RES_DEST_LEVEL == LOCAL
#define K2_L_CB_RES_DEST(i, j) K2_RES_L_BUFFER(K2_P_CB_OFFSET_L_1 + (i), K2_P_CB_OFFSET_L_2 + (j))
#elif L_CB_RES_DEST_LEVEL == GLOBAL
#define K2_L_CB_RES_DEST(i, j) K2_RES_G_BUFFER(K2_P_CB_OFFSET_L_1 + (K2_L_CB_OFFSET_L_1 + (i)), K2_P_CB_OFFSET_L_2 + (K2_L_CB_OFFSET_L_2 + (j)))
#endif

#if   G_CB_RES_DEST_LEVEL == PRIVATE
#define K2_G_CB_RES_DEST(i, j) K2_RES_P_BUFFER(i, j)
#elif G_CB_RES_DEST_LEVEL == LOCAL
#define K2_G_CB_RES_DEST(i, j) K2_RES_L_BUFFER(K2_P_CB_OFFSET_L_1 + (i), K2_P_CB_OFFSET_L_2 + (j))
#elif G_CB_RES_DEST_LEVEL == GLOBAL
#define K2_G_CB_RES_DEST(i, j) K2_RES_G_BUFFER(K2_P_CB_OFFSET_L_1 + (K2_L_CB_OFFSET_L_1 + (i)), K2_P_CB_OFFSET_L_2 + (K2_L_CB_OFFSET_L_2 + (j)))
#endif


// buffer abstraction for kernel_res buffer
#define K2_KERNEL_RES_BUFFER(i, j) U_new[(i) * K2_G_CB_SIZE_L_2 + (j)]

#define K2_G_KERNEL_RES(i, j) K2_KERNEL_RES_BUFFER(K2_G_CB_OFFSET_L_1 + (i), K2_G_CB_OFFSET_L_2 + (j))
#define K2_L_KERNEL_RES(i, j) K2_G_KERNEL_RES(K2_L_CB_OFFSET_L_1 + (i), K2_L_CB_OFFSET_L_2 + (j))
#define K2_P_KERNEL_RES(i, j) K2_L_KERNEL_RES(K2_P_CB_OFFSET_L_1 + (i), K2_P_CB_OFFSET_L_2 + (j))
// =============== end of macro definitions per buffer ========================

// =============== result function ============================================
__device__ inline TYPE_TS g(const TYPE_T res) {
  return res;
}
// =============== end of result function =====================================

// =============== kernel 2 ===================================================
__global__ void poisson_2(TYPE_T const * const __restrict__ int_res, TYPE_TS * const __restrict__ res_g, TYPE_TS * const __restrict__ U_new) {
  // map md_hom dimensions to CUDA dimensions
  const size_t i_wg_l_1 = GET_GROUP_ID_L_1;
  const size_t i_wi_l_1 = GET_LOCAL_ID_L_1;
  
  const size_t i_wg_l_2 = GET_GROUP_ID_L_2;
  const size_t i_wi_l_2 = GET_LOCAL_ID_L_2;
  
  // declare variables for caching inputs
  #if CACHE_L_CB != 0
  __shared__ TYPE_T cb_l_int_res[BUFFER_INT_RES_L_SIZE_1][BUFFER_INT_RES_L_SIZE_0];
  #endif
  #if CACHE_P_CB != 0
   TYPE_T cb_p_int_res[BUFFER_INT_RES_P_SIZE_1][BUFFER_INT_RES_P_SIZE_0];
  #endif

  // declare variables for result memory
  // ------ LOCAL ------
  #ifdef K2_L_LEVEL_HAS_RESULTS
  __shared__ TYPE_TS K2_RES_L_BUFFER_DEF;
  #endif
  // ------ PRIVATE ------
  #ifdef K2_P_LEVEL_HAS_RESULTS
   TYPE_TS K2_RES_P_BUFFER_DEF;
  #endif

  #if K2_L_NUM_CB_L_1 > 0
  for (size_t i_l_cb_l_1 = 0; i_l_cb_l_1 < K2_L_NUM_CB_L_1; ++i_l_cb_l_1) {
    #if K2_L_NUM_CB_L_2 > 0
    for (size_t i_l_cb_l_2 = 0; i_l_cb_l_2 < K2_L_NUM_CB_L_2; ++i_l_cb_l_2) {
      // ---------- L caching --------------------
      #if CACHE_L_CB != 0
      #if K2_L_CB_SIZE_INT_RES / K2_L_FLAT_NUM_WI > 0
      for (size_t step = 0; step < K2_L_CB_SIZE_INT_RES / K2_L_FLAT_NUM_WI; ++step) {
        const size_t index = K2_L_FLAT_WI_ID + step * K2_L_FLAT_NUM_WI;
        const size_t i_l_elem_l_1 = index / (K2_L_CB_SIZE_L_2);
        const size_t i_l_elem_l_2 = index % K2_L_CB_SIZE_L_2;
        K2_L_MEM_INT_RES(i_l_elem_l_1, i_l_elem_l_2) = K2_G_MEM_INT_RES(K2_L_CB_OFFSET_L_1 + i_l_elem_l_1, K2_L_CB_OFFSET_L_2 + i_l_elem_l_2);
      }
      #endif
      #if K2_L_CB_SIZE_INT_RES % K2_L_FLAT_NUM_WI > 0
      if (K2_L_FLAT_WI_ID < K2_L_CB_SIZE_INT_RES % K2_L_FLAT_NUM_WI) {
        const size_t index = K2_L_FLAT_WI_ID + (K2_L_CB_SIZE_INT_RES / K2_L_FLAT_NUM_WI) * K2_L_FLAT_NUM_WI;
        const size_t i_l_elem_l_1 = index / (K2_L_CB_SIZE_L_2);
        const size_t i_l_elem_l_2 = index % K2_L_CB_SIZE_L_2;
        K2_L_MEM_INT_RES(i_l_elem_l_1, i_l_elem_l_2) = K2_G_MEM_INT_RES(K2_L_CB_OFFSET_L_1 + i_l_elem_l_1, K2_L_CB_OFFSET_L_2 + i_l_elem_l_2);
      }
      #endif
      __syncthreads();
      #endif
      // ---------- end of L caching -------------
      
      #if K2_P_NUM_CB_L_1 > 0
      for (size_t i_p_cb_l_1 = 0; i_p_cb_l_1 < K2_P_NUM_CB_L_1; ++i_p_cb_l_1) {
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of "i_p_cb_l_1"-loop
      #endif
      // post process whole extra cache blocks in dimension L_1
      #if K2_P_NUM_EXTRA_CB_L_1 > 0
      if (K2_L_FU_ID_L_1 < K2_P_NUM_EXTRA_CB_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_L_1;
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of post processing whole extra cache blocks in dimension L_1
      #endif
      // post process single extra incomplete cache block in dimension L_1
      #if K2_P_NUM_EXTRA_ELEMS_L_1 > 0
      if (K2_L_FU_ID_L_1 == K2_P_NUM_EXTRA_CB_L_1 % K2_L_NUM_FU_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_L_1;
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      }// end of post process single extra incomplete cache block in dimension L_1
      #endif
      
      // wait for all threads to finish computation on shared cache block
      #if CACHE_L_CB != 0
      __syncthreads();
      #endif
      
      // move results upwards in memory hierarchy
      #if G_CB_RES_DEST_LEVEL > L_CB_RES_DEST_LEVEL
      #if L_CB_RES_DEST_LEVEL < LOCAL
      #if K2_P_NUM_CB_L_1 > 0
      for (size_t i_p_cb_l_1 = 0; i_p_cb_l_1 < K2_P_NUM_CB_L_1; ++i_p_cb_l_1) {
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of "i_p_cb_l_1"-loop
      #endif
      // post process whole extra cache blocks in dimension L_1
      #if K2_P_NUM_EXTRA_CB_L_1 > 0
      if (K2_L_FU_ID_L_1 < K2_P_NUM_EXTRA_CB_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_L_1;
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of post processing whole extra cache blocks in dimension L_1
      #endif
      // post process single extra incomplete cache block in dimension L_1
      #if K2_P_NUM_EXTRA_ELEMS_L_1 > 0
      if (K2_L_FU_ID_L_1 == K2_P_NUM_EXTRA_CB_L_1 % K2_L_NUM_FU_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_L_1;
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      }// end of post process single extra incomplete cache block in dimension L_1
      #endif
      #else
      #if L_CB_RES_DEST_LEVEL <= LOCAL && CACHE_L_CB == 0
      __syncthreads();
      #elif L_CB_RES_DEST_LEVEL == GLOBAL
      __threadfence();
      #endif
      #if (K2_L_CB_SIZE_L_1 * K2_L_CB_SIZE_L_2) / K2_L_FLAT_NUM_WI > 0
      for (size_t step = 0; step < (K2_L_CB_SIZE_L_1 * K2_L_CB_SIZE_L_2) / K2_L_FLAT_NUM_WI; ++step) {
        const size_t flat_index = K2_L_FLAT_WI_ID + step * K2_L_FLAT_NUM_WI;
        #if K1_P_NUM_CB_L_1 == 1
        const size_t l_index_l_1 = flat_index / (K2_L_CB_SIZE_L_2);
        const size_t l_index_l_2 = flat_index % K2_L_CB_SIZE_L_2;
        #else
        const size_t DESCENDING_L_DIMS_1(l_index_l_1, l_index_l_2) = flat_index / (DESCENDING_L_DIMS_0(K2_L_CB_SIZE_L_1, K2_L_CB_SIZE_L_2));
        const size_t DESCENDING_L_DIMS_0(l_index_l_1, l_index_l_2) = flat_index % DESCENDING_L_DIMS_0(K2_L_CB_SIZE_L_1, K2_L_CB_SIZE_L_2);
        #endif
        K2_L_KERNEL_RES(l_index_l_1, l_index_l_2) =
        #if L_CB_RES_DEST_LEVEL < LOCAL
          K2_L_REDUCTION_MEM(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == LOCAL
          K2_RES_L_BUFFER(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == GLOBAL
          K2_RES_G_BUFFER(K2_L_CB_OFFSET_L_1 + l_index_l_1, K2_L_CB_OFFSET_L_2 + l_index_l_2);
        #endif
      }
      #endif
      #if (K2_L_CB_SIZE_L_1 * K2_L_CB_SIZE_L_2) % K2_L_FLAT_NUM_WI > 0
      if (K2_L_FLAT_WI_ID < (K2_L_CB_SIZE_L_1 * K2_L_CB_SIZE_L_2) % K2_L_FLAT_NUM_WI) {
        const size_t flat_index = K2_L_FLAT_WI_ID + ((K2_L_CB_SIZE_L_1 * K2_L_CB_SIZE_L_2) / K2_L_FLAT_NUM_WI) * K2_L_FLAT_NUM_WI;
        #if K1_P_NUM_CB_L_1 == 1
        const size_t l_index_l_1 = flat_index / (K2_L_CB_SIZE_L_2);
        const size_t l_index_l_2 = flat_index % K2_L_CB_SIZE_L_2;
        #else
        const size_t DESCENDING_L_DIMS_1(l_index_l_1, l_index_l_2) = flat_index / (DESCENDING_L_DIMS_0(K2_L_CB_SIZE_L_1, K2_L_CB_SIZE_L_2));
        const size_t DESCENDING_L_DIMS_0(l_index_l_1, l_index_l_2) = flat_index % DESCENDING_L_DIMS_0(K2_L_CB_SIZE_L_1, K2_L_CB_SIZE_L_2);
        #endif
        K2_L_KERNEL_RES(l_index_l_1, l_index_l_2) =
        #if L_CB_RES_DEST_LEVEL < LOCAL
          K2_L_REDUCTION_MEM(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == LOCAL
          K2_RES_L_BUFFER(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == GLOBAL
          K2_RES_G_BUFFER(K2_L_CB_OFFSET_L_1 + l_index_l_1, K2_L_CB_OFFSET_L_2 + l_index_l_2);
        #endif
      }
      #endif
      #if L_CB_RES_DEST_LEVEL <= LOCAL
      __syncthreads();
      #elif L_CB_RES_DEST_LEVEL == GLOBAL
      __threadfence();
      #endif
      #endif
      #endif
    } // end of "i_l_cb_l_2"-loop
    #endif
    // post process whole extra cache blocks in dimension L_2
    #if K2_L_NUM_EXTRA_CB_L_2 > 0
    if (K2_G_FU_ID_L_2 < K2_L_NUM_EXTRA_CB_L_2) {  
      const size_t i_l_cb_l_2 = K2_L_NUM_CB_L_2;
      // ---------- L caching --------------------
      #if CACHE_L_CB != 0
      #if K2_L_CB_SIZE_INT_RES / K2_L_FLAT_NUM_WI > 0
      for (size_t step = 0; step < K2_L_CB_SIZE_INT_RES / K2_L_FLAT_NUM_WI; ++step) {
        const size_t index = K2_L_FLAT_WI_ID + step * K2_L_FLAT_NUM_WI;
        const size_t i_l_elem_l_1 = index / (K2_L_CB_SIZE_L_2);
        const size_t i_l_elem_l_2 = index % K2_L_CB_SIZE_L_2;
        K2_L_MEM_INT_RES(i_l_elem_l_1, i_l_elem_l_2) = K2_G_MEM_INT_RES(K2_L_CB_OFFSET_L_1 + i_l_elem_l_1, K2_L_CB_OFFSET_L_2 + i_l_elem_l_2);
      }
      #endif
      #if K2_L_CB_SIZE_INT_RES % K2_L_FLAT_NUM_WI > 0
      if (K2_L_FLAT_WI_ID < K2_L_CB_SIZE_INT_RES % K2_L_FLAT_NUM_WI) {
        const size_t index = K2_L_FLAT_WI_ID + (K2_L_CB_SIZE_INT_RES / K2_L_FLAT_NUM_WI) * K2_L_FLAT_NUM_WI;
        const size_t i_l_elem_l_1 = index / (K2_L_CB_SIZE_L_2);
        const size_t i_l_elem_l_2 = index % K2_L_CB_SIZE_L_2;
        K2_L_MEM_INT_RES(i_l_elem_l_1, i_l_elem_l_2) = K2_G_MEM_INT_RES(K2_L_CB_OFFSET_L_1 + i_l_elem_l_1, K2_L_CB_OFFSET_L_2 + i_l_elem_l_2);
      }
      #endif
      __syncthreads();
      #endif
      // ---------- end of L caching -------------
      
      #if K2_P_NUM_CB_L_1 > 0
      for (size_t i_p_cb_l_1 = 0; i_p_cb_l_1 < K2_P_NUM_CB_L_1; ++i_p_cb_l_1) {
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of "i_p_cb_l_1"-loop
      #endif
      // post process whole extra cache blocks in dimension L_1
      #if K2_P_NUM_EXTRA_CB_L_1 > 0
      if (K2_L_FU_ID_L_1 < K2_P_NUM_EXTRA_CB_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_L_1;
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of post processing whole extra cache blocks in dimension L_1
      #endif
      // post process single extra incomplete cache block in dimension L_1
      #if K2_P_NUM_EXTRA_ELEMS_L_1 > 0
      if (K2_L_FU_ID_L_1 == K2_P_NUM_EXTRA_CB_L_1 % K2_L_NUM_FU_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_L_1;
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      }// end of post process single extra incomplete cache block in dimension L_1
      #endif
      
      // wait for all threads to finish computation on shared cache block
      #if CACHE_L_CB != 0
      __syncthreads();
      #endif
      
      // move results upwards in memory hierarchy
      #if G_CB_RES_DEST_LEVEL > L_CB_RES_DEST_LEVEL
      #if L_CB_RES_DEST_LEVEL < LOCAL
      #if K2_P_NUM_CB_L_1 > 0
      for (size_t i_p_cb_l_1 = 0; i_p_cb_l_1 < K2_P_NUM_CB_L_1; ++i_p_cb_l_1) {
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of "i_p_cb_l_1"-loop
      #endif
      // post process whole extra cache blocks in dimension L_1
      #if K2_P_NUM_EXTRA_CB_L_1 > 0
      if (K2_L_FU_ID_L_1 < K2_P_NUM_EXTRA_CB_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_L_1;
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of post processing whole extra cache blocks in dimension L_1
      #endif
      // post process single extra incomplete cache block in dimension L_1
      #if K2_P_NUM_EXTRA_ELEMS_L_1 > 0
      if (K2_L_FU_ID_L_1 == K2_P_NUM_EXTRA_CB_L_1 % K2_L_NUM_FU_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_L_1;
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      }// end of post process single extra incomplete cache block in dimension L_1
      #endif
      #else
      #if L_CB_RES_DEST_LEVEL <= LOCAL && CACHE_L_CB == 0
      __syncthreads();
      #elif L_CB_RES_DEST_LEVEL == GLOBAL
      __threadfence();
      #endif
      #if (K2_L_CB_SIZE_L_1 * K2_L_CB_SIZE_L_2) / K2_L_FLAT_NUM_WI > 0
      for (size_t step = 0; step < (K2_L_CB_SIZE_L_1 * K2_L_CB_SIZE_L_2) / K2_L_FLAT_NUM_WI; ++step) {
        const size_t flat_index = K2_L_FLAT_WI_ID + step * K2_L_FLAT_NUM_WI;
        #if K1_P_NUM_CB_L_1 == 1
        const size_t l_index_l_1 = flat_index / (K2_L_CB_SIZE_L_2);
        const size_t l_index_l_2 = flat_index % K2_L_CB_SIZE_L_2;
        #else
        const size_t DESCENDING_L_DIMS_1(l_index_l_1, l_index_l_2) = flat_index / (DESCENDING_L_DIMS_0(K2_L_CB_SIZE_L_1, K2_L_CB_SIZE_L_2));
        const size_t DESCENDING_L_DIMS_0(l_index_l_1, l_index_l_2) = flat_index % DESCENDING_L_DIMS_0(K2_L_CB_SIZE_L_1, K2_L_CB_SIZE_L_2);
        #endif
        K2_L_KERNEL_RES(l_index_l_1, l_index_l_2) =
        #if L_CB_RES_DEST_LEVEL < LOCAL
          K2_L_REDUCTION_MEM(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == LOCAL
          K2_RES_L_BUFFER(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == GLOBAL
          K2_RES_G_BUFFER(K2_L_CB_OFFSET_L_1 + l_index_l_1, K2_L_CB_OFFSET_L_2 + l_index_l_2);
        #endif
      }
      #endif
      #if (K2_L_CB_SIZE_L_1 * K2_L_CB_SIZE_L_2) % K2_L_FLAT_NUM_WI > 0
      if (K2_L_FLAT_WI_ID < (K2_L_CB_SIZE_L_1 * K2_L_CB_SIZE_L_2) % K2_L_FLAT_NUM_WI) {
        const size_t flat_index = K2_L_FLAT_WI_ID + ((K2_L_CB_SIZE_L_1 * K2_L_CB_SIZE_L_2) / K2_L_FLAT_NUM_WI) * K2_L_FLAT_NUM_WI;
        #if K1_P_NUM_CB_L_1 == 1
        const size_t l_index_l_1 = flat_index / (K2_L_CB_SIZE_L_2);
        const size_t l_index_l_2 = flat_index % K2_L_CB_SIZE_L_2;
        #else
        const size_t DESCENDING_L_DIMS_1(l_index_l_1, l_index_l_2) = flat_index / (DESCENDING_L_DIMS_0(K2_L_CB_SIZE_L_1, K2_L_CB_SIZE_L_2));
        const size_t DESCENDING_L_DIMS_0(l_index_l_1, l_index_l_2) = flat_index % DESCENDING_L_DIMS_0(K2_L_CB_SIZE_L_1, K2_L_CB_SIZE_L_2);
        #endif
        K2_L_KERNEL_RES(l_index_l_1, l_index_l_2) =
        #if L_CB_RES_DEST_LEVEL < LOCAL
          K2_L_REDUCTION_MEM(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == LOCAL
          K2_RES_L_BUFFER(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == GLOBAL
          K2_RES_G_BUFFER(K2_L_CB_OFFSET_L_1 + l_index_l_1, K2_L_CB_OFFSET_L_2 + l_index_l_2);
        #endif
      }
      #endif
      #if L_CB_RES_DEST_LEVEL <= LOCAL
      __syncthreads();
      #elif L_CB_RES_DEST_LEVEL == GLOBAL
      __threadfence();
      #endif
      #endif
      #endif
    } // end of post processing whole extra cache blocks in dimension L_2
    #endif
    // post process single extra incomplete cache block in dimension L_2
    #if K2_L_NUM_EXTRA_ELEMS_L_2 > 0
    if (K2_G_FU_ID_L_2 == K2_L_NUM_EXTRA_CB_L_2 % K2_G_NUM_FU_L_2) {  
      const size_t i_l_cb_l_2 = K2_L_NUM_CB_L_2;
      // ---------- L caching --------------------
      #if CACHE_L_CB != 0
      #if (K2_L_CB_SIZE_INT_RES / K2_L_CB_SIZE_L_2 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_L_FLAT_NUM_WI > 0
      for (size_t step = 0; step < (K2_L_CB_SIZE_INT_RES / K2_L_CB_SIZE_L_2 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_L_FLAT_NUM_WI; ++step) {
        const size_t index = K2_L_FLAT_WI_ID + step * K2_L_FLAT_NUM_WI;
        const size_t i_l_elem_l_1 = index / (K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
        const size_t i_l_elem_l_2 = index % K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2;
        K2_L_MEM_INT_RES(i_l_elem_l_1, i_l_elem_l_2) = K2_G_MEM_INT_RES(K2_L_CB_OFFSET_L_1 + i_l_elem_l_1, K2_L_CB_OFFSET_L_2 + i_l_elem_l_2);
      }
      #endif
      #if (K2_L_CB_SIZE_INT_RES / K2_L_CB_SIZE_L_2 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) % K2_L_FLAT_NUM_WI > 0
      if (K2_L_FLAT_WI_ID < (K2_L_CB_SIZE_INT_RES / K2_L_CB_SIZE_L_2 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) % K2_L_FLAT_NUM_WI) {
        const size_t index = K2_L_FLAT_WI_ID + ((K2_L_CB_SIZE_INT_RES / K2_L_CB_SIZE_L_2 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_L_FLAT_NUM_WI) * K2_L_FLAT_NUM_WI;
        const size_t i_l_elem_l_1 = index / (K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
        const size_t i_l_elem_l_2 = index % K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2;
        K2_L_MEM_INT_RES(i_l_elem_l_1, i_l_elem_l_2) = K2_G_MEM_INT_RES(K2_L_CB_OFFSET_L_1 + i_l_elem_l_1, K2_L_CB_OFFSET_L_2 + i_l_elem_l_2);
      }
      #endif
      __syncthreads();
      #endif
      // ---------- end of L caching -------------
      
      #if K2_P_NUM_CB_L_1 > 0
      for (size_t i_p_cb_l_1 = 0; i_p_cb_l_1 < K2_P_NUM_CB_L_1; ++i_p_cb_l_1) {
        #if K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2; ++i_p_cb_l_2) {
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of "i_p_cb_l_1"-loop
      #endif
      // post process whole extra cache blocks in dimension L_1
      #if K2_P_NUM_EXTRA_CB_L_1 > 0
      if (K2_L_FU_ID_L_1 < K2_P_NUM_EXTRA_CB_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_L_1;
        #if K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2; ++i_p_cb_l_2) {
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of post processing whole extra cache blocks in dimension L_1
      #endif
      // post process single extra incomplete cache block in dimension L_1
      #if K2_P_NUM_EXTRA_ELEMS_L_1 > 0
      if (K2_L_FU_ID_L_1 == K2_P_NUM_EXTRA_CB_L_1 % K2_L_NUM_FU_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_L_1;
        #if K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2; ++i_p_cb_l_2) {
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      }// end of post process single extra incomplete cache block in dimension L_1
      #endif
      
      // wait for all threads to finish computation on shared cache block
      #if CACHE_L_CB != 0
      __syncthreads();
      #endif
      
      // move results upwards in memory hierarchy
      #if G_CB_RES_DEST_LEVEL > L_CB_RES_DEST_LEVEL
      #if L_CB_RES_DEST_LEVEL < LOCAL
      #if K2_P_NUM_CB_L_1 > 0
      for (size_t i_p_cb_l_1 = 0; i_p_cb_l_1 < K2_P_NUM_CB_L_1; ++i_p_cb_l_1) {
        #if K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2; ++i_p_cb_l_2) {
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of "i_p_cb_l_1"-loop
      #endif
      // post process whole extra cache blocks in dimension L_1
      #if K2_P_NUM_EXTRA_CB_L_1 > 0
      if (K2_L_FU_ID_L_1 < K2_P_NUM_EXTRA_CB_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_L_1;
        #if K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2; ++i_p_cb_l_2) {
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of post processing whole extra cache blocks in dimension L_1
      #endif
      // post process single extra incomplete cache block in dimension L_1
      #if K2_P_NUM_EXTRA_ELEMS_L_1 > 0
      if (K2_L_FU_ID_L_1 == K2_P_NUM_EXTRA_CB_L_1 % K2_L_NUM_FU_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_L_1;
        #if K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2; ++i_p_cb_l_2) {
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      }// end of post process single extra incomplete cache block in dimension L_1
      #endif
      #else
      #if L_CB_RES_DEST_LEVEL <= LOCAL && CACHE_L_CB == 0
      __syncthreads();
      #elif L_CB_RES_DEST_LEVEL == GLOBAL
      __threadfence();
      #endif
      #if (K2_L_CB_SIZE_L_1 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_L_FLAT_NUM_WI > 0
      for (size_t step = 0; step < (K2_L_CB_SIZE_L_1 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_L_FLAT_NUM_WI; ++step) {
        const size_t flat_index = K2_L_FLAT_WI_ID + step * K2_L_FLAT_NUM_WI;
        #if K1_P_NUM_CB_L_1 == 1
        const size_t l_index_l_1 = flat_index / (K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
        const size_t l_index_l_2 = flat_index % K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2;
        #else
        const size_t DESCENDING_L_DIMS_1(l_index_l_1, l_index_l_2) = flat_index / (DESCENDING_L_DIMS_0(K2_L_CB_SIZE_L_1, K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2));
        const size_t DESCENDING_L_DIMS_0(l_index_l_1, l_index_l_2) = flat_index % DESCENDING_L_DIMS_0(K2_L_CB_SIZE_L_1, K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
        #endif
        K2_L_KERNEL_RES(l_index_l_1, l_index_l_2) =
        #if L_CB_RES_DEST_LEVEL < LOCAL
          K2_L_REDUCTION_MEM(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == LOCAL
          K2_RES_L_BUFFER(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == GLOBAL
          K2_RES_G_BUFFER(K2_L_CB_OFFSET_L_1 + l_index_l_1, K2_L_CB_OFFSET_L_2 + l_index_l_2);
        #endif
      }
      #endif
      #if (K2_L_CB_SIZE_L_1 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) % K2_L_FLAT_NUM_WI > 0
      if (K2_L_FLAT_WI_ID < (K2_L_CB_SIZE_L_1 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) % K2_L_FLAT_NUM_WI) {
        const size_t flat_index = K2_L_FLAT_WI_ID + ((K2_L_CB_SIZE_L_1 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_L_FLAT_NUM_WI) * K2_L_FLAT_NUM_WI;
        #if K1_P_NUM_CB_L_1 == 1
        const size_t l_index_l_1 = flat_index / (K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
        const size_t l_index_l_2 = flat_index % K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2;
        #else
        const size_t DESCENDING_L_DIMS_1(l_index_l_1, l_index_l_2) = flat_index / (DESCENDING_L_DIMS_0(K2_L_CB_SIZE_L_1, K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2));
        const size_t DESCENDING_L_DIMS_0(l_index_l_1, l_index_l_2) = flat_index % DESCENDING_L_DIMS_0(K2_L_CB_SIZE_L_1, K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
        #endif
        K2_L_KERNEL_RES(l_index_l_1, l_index_l_2) =
        #if L_CB_RES_DEST_LEVEL < LOCAL
          K2_L_REDUCTION_MEM(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == LOCAL
          K2_RES_L_BUFFER(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == GLOBAL
          K2_RES_G_BUFFER(K2_L_CB_OFFSET_L_1 + l_index_l_1, K2_L_CB_OFFSET_L_2 + l_index_l_2);
        #endif
      }
      #endif
      #if L_CB_RES_DEST_LEVEL <= LOCAL
      __syncthreads();
      #elif L_CB_RES_DEST_LEVEL == GLOBAL
      __threadfence();
      #endif
      #endif
      #endif
    }// end of post process single extra incomplete cache block in dimension L_2
    #endif
  } // end of "i_l_cb_l_1"-loop
  #endif
  // post process whole extra cache blocks in dimension L_1
  #if K2_L_NUM_EXTRA_CB_L_1 > 0
  if (K2_G_FU_ID_L_1 < K2_L_NUM_EXTRA_CB_L_1) {  
    const size_t i_l_cb_l_1 = K2_L_NUM_CB_L_1;
    #if K2_L_NUM_CB_L_2 > 0
    for (size_t i_l_cb_l_2 = 0; i_l_cb_l_2 < K2_L_NUM_CB_L_2; ++i_l_cb_l_2) {
      // ---------- L caching --------------------
      #if CACHE_L_CB != 0
      #if K2_L_CB_SIZE_INT_RES / K2_L_FLAT_NUM_WI > 0
      for (size_t step = 0; step < K2_L_CB_SIZE_INT_RES / K2_L_FLAT_NUM_WI; ++step) {
        const size_t index = K2_L_FLAT_WI_ID + step * K2_L_FLAT_NUM_WI;
        const size_t i_l_elem_l_1 = index / (K2_L_CB_SIZE_L_2);
        const size_t i_l_elem_l_2 = index % K2_L_CB_SIZE_L_2;
        K2_L_MEM_INT_RES(i_l_elem_l_1, i_l_elem_l_2) = K2_G_MEM_INT_RES(K2_L_CB_OFFSET_L_1 + i_l_elem_l_1, K2_L_CB_OFFSET_L_2 + i_l_elem_l_2);
      }
      #endif
      #if K2_L_CB_SIZE_INT_RES % K2_L_FLAT_NUM_WI > 0
      if (K2_L_FLAT_WI_ID < K2_L_CB_SIZE_INT_RES % K2_L_FLAT_NUM_WI) {
        const size_t index = K2_L_FLAT_WI_ID + (K2_L_CB_SIZE_INT_RES / K2_L_FLAT_NUM_WI) * K2_L_FLAT_NUM_WI;
        const size_t i_l_elem_l_1 = index / (K2_L_CB_SIZE_L_2);
        const size_t i_l_elem_l_2 = index % K2_L_CB_SIZE_L_2;
        K2_L_MEM_INT_RES(i_l_elem_l_1, i_l_elem_l_2) = K2_G_MEM_INT_RES(K2_L_CB_OFFSET_L_1 + i_l_elem_l_1, K2_L_CB_OFFSET_L_2 + i_l_elem_l_2);
      }
      #endif
      __syncthreads();
      #endif
      // ---------- end of L caching -------------
      
      #if K2_P_NUM_CB_L_1 > 0
      for (size_t i_p_cb_l_1 = 0; i_p_cb_l_1 < K2_P_NUM_CB_L_1; ++i_p_cb_l_1) {
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of "i_p_cb_l_1"-loop
      #endif
      // post process whole extra cache blocks in dimension L_1
      #if K2_P_NUM_EXTRA_CB_L_1 > 0
      if (K2_L_FU_ID_L_1 < K2_P_NUM_EXTRA_CB_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_L_1;
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of post processing whole extra cache blocks in dimension L_1
      #endif
      // post process single extra incomplete cache block in dimension L_1
      #if K2_P_NUM_EXTRA_ELEMS_L_1 > 0
      if (K2_L_FU_ID_L_1 == K2_P_NUM_EXTRA_CB_L_1 % K2_L_NUM_FU_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_L_1;
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      }// end of post process single extra incomplete cache block in dimension L_1
      #endif
      
      // wait for all threads to finish computation on shared cache block
      #if CACHE_L_CB != 0
      __syncthreads();
      #endif
      
      // move results upwards in memory hierarchy
      #if G_CB_RES_DEST_LEVEL > L_CB_RES_DEST_LEVEL
      #if L_CB_RES_DEST_LEVEL < LOCAL
      #if K2_P_NUM_CB_L_1 > 0
      for (size_t i_p_cb_l_1 = 0; i_p_cb_l_1 < K2_P_NUM_CB_L_1; ++i_p_cb_l_1) {
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of "i_p_cb_l_1"-loop
      #endif
      // post process whole extra cache blocks in dimension L_1
      #if K2_P_NUM_EXTRA_CB_L_1 > 0
      if (K2_L_FU_ID_L_1 < K2_P_NUM_EXTRA_CB_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_L_1;
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of post processing whole extra cache blocks in dimension L_1
      #endif
      // post process single extra incomplete cache block in dimension L_1
      #if K2_P_NUM_EXTRA_ELEMS_L_1 > 0
      if (K2_L_FU_ID_L_1 == K2_P_NUM_EXTRA_CB_L_1 % K2_L_NUM_FU_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_L_1;
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      }// end of post process single extra incomplete cache block in dimension L_1
      #endif
      #else
      #if L_CB_RES_DEST_LEVEL <= LOCAL && CACHE_L_CB == 0
      __syncthreads();
      #elif L_CB_RES_DEST_LEVEL == GLOBAL
      __threadfence();
      #endif
      #if (K2_L_CB_SIZE_L_1 * K2_L_CB_SIZE_L_2) / K2_L_FLAT_NUM_WI > 0
      for (size_t step = 0; step < (K2_L_CB_SIZE_L_1 * K2_L_CB_SIZE_L_2) / K2_L_FLAT_NUM_WI; ++step) {
        const size_t flat_index = K2_L_FLAT_WI_ID + step * K2_L_FLAT_NUM_WI;
        #if K1_P_NUM_CB_L_1 == 1
        const size_t l_index_l_1 = flat_index / (K2_L_CB_SIZE_L_2);
        const size_t l_index_l_2 = flat_index % K2_L_CB_SIZE_L_2;
        #else
        const size_t DESCENDING_L_DIMS_1(l_index_l_1, l_index_l_2) = flat_index / (DESCENDING_L_DIMS_0(K2_L_CB_SIZE_L_1, K2_L_CB_SIZE_L_2));
        const size_t DESCENDING_L_DIMS_0(l_index_l_1, l_index_l_2) = flat_index % DESCENDING_L_DIMS_0(K2_L_CB_SIZE_L_1, K2_L_CB_SIZE_L_2);
        #endif
        K2_L_KERNEL_RES(l_index_l_1, l_index_l_2) =
        #if L_CB_RES_DEST_LEVEL < LOCAL
          K2_L_REDUCTION_MEM(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == LOCAL
          K2_RES_L_BUFFER(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == GLOBAL
          K2_RES_G_BUFFER(K2_L_CB_OFFSET_L_1 + l_index_l_1, K2_L_CB_OFFSET_L_2 + l_index_l_2);
        #endif
      }
      #endif
      #if (K2_L_CB_SIZE_L_1 * K2_L_CB_SIZE_L_2) % K2_L_FLAT_NUM_WI > 0
      if (K2_L_FLAT_WI_ID < (K2_L_CB_SIZE_L_1 * K2_L_CB_SIZE_L_2) % K2_L_FLAT_NUM_WI) {
        const size_t flat_index = K2_L_FLAT_WI_ID + ((K2_L_CB_SIZE_L_1 * K2_L_CB_SIZE_L_2) / K2_L_FLAT_NUM_WI) * K2_L_FLAT_NUM_WI;
        #if K1_P_NUM_CB_L_1 == 1
        const size_t l_index_l_1 = flat_index / (K2_L_CB_SIZE_L_2);
        const size_t l_index_l_2 = flat_index % K2_L_CB_SIZE_L_2;
        #else
        const size_t DESCENDING_L_DIMS_1(l_index_l_1, l_index_l_2) = flat_index / (DESCENDING_L_DIMS_0(K2_L_CB_SIZE_L_1, K2_L_CB_SIZE_L_2));
        const size_t DESCENDING_L_DIMS_0(l_index_l_1, l_index_l_2) = flat_index % DESCENDING_L_DIMS_0(K2_L_CB_SIZE_L_1, K2_L_CB_SIZE_L_2);
        #endif
        K2_L_KERNEL_RES(l_index_l_1, l_index_l_2) =
        #if L_CB_RES_DEST_LEVEL < LOCAL
          K2_L_REDUCTION_MEM(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == LOCAL
          K2_RES_L_BUFFER(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == GLOBAL
          K2_RES_G_BUFFER(K2_L_CB_OFFSET_L_1 + l_index_l_1, K2_L_CB_OFFSET_L_2 + l_index_l_2);
        #endif
      }
      #endif
      #if L_CB_RES_DEST_LEVEL <= LOCAL
      __syncthreads();
      #elif L_CB_RES_DEST_LEVEL == GLOBAL
      __threadfence();
      #endif
      #endif
      #endif
    } // end of "i_l_cb_l_2"-loop
    #endif
    // post process whole extra cache blocks in dimension L_2
    #if K2_L_NUM_EXTRA_CB_L_2 > 0
    if (K2_G_FU_ID_L_2 < K2_L_NUM_EXTRA_CB_L_2) {  
      const size_t i_l_cb_l_2 = K2_L_NUM_CB_L_2;
      // ---------- L caching --------------------
      #if CACHE_L_CB != 0
      #if K2_L_CB_SIZE_INT_RES / K2_L_FLAT_NUM_WI > 0
      for (size_t step = 0; step < K2_L_CB_SIZE_INT_RES / K2_L_FLAT_NUM_WI; ++step) {
        const size_t index = K2_L_FLAT_WI_ID + step * K2_L_FLAT_NUM_WI;
        const size_t i_l_elem_l_1 = index / (K2_L_CB_SIZE_L_2);
        const size_t i_l_elem_l_2 = index % K2_L_CB_SIZE_L_2;
        K2_L_MEM_INT_RES(i_l_elem_l_1, i_l_elem_l_2) = K2_G_MEM_INT_RES(K2_L_CB_OFFSET_L_1 + i_l_elem_l_1, K2_L_CB_OFFSET_L_2 + i_l_elem_l_2);
      }
      #endif
      #if K2_L_CB_SIZE_INT_RES % K2_L_FLAT_NUM_WI > 0
      if (K2_L_FLAT_WI_ID < K2_L_CB_SIZE_INT_RES % K2_L_FLAT_NUM_WI) {
        const size_t index = K2_L_FLAT_WI_ID + (K2_L_CB_SIZE_INT_RES / K2_L_FLAT_NUM_WI) * K2_L_FLAT_NUM_WI;
        const size_t i_l_elem_l_1 = index / (K2_L_CB_SIZE_L_2);
        const size_t i_l_elem_l_2 = index % K2_L_CB_SIZE_L_2;
        K2_L_MEM_INT_RES(i_l_elem_l_1, i_l_elem_l_2) = K2_G_MEM_INT_RES(K2_L_CB_OFFSET_L_1 + i_l_elem_l_1, K2_L_CB_OFFSET_L_2 + i_l_elem_l_2);
      }
      #endif
      __syncthreads();
      #endif
      // ---------- end of L caching -------------
      
      #if K2_P_NUM_CB_L_1 > 0
      for (size_t i_p_cb_l_1 = 0; i_p_cb_l_1 < K2_P_NUM_CB_L_1; ++i_p_cb_l_1) {
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of "i_p_cb_l_1"-loop
      #endif
      // post process whole extra cache blocks in dimension L_1
      #if K2_P_NUM_EXTRA_CB_L_1 > 0
      if (K2_L_FU_ID_L_1 < K2_P_NUM_EXTRA_CB_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_L_1;
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of post processing whole extra cache blocks in dimension L_1
      #endif
      // post process single extra incomplete cache block in dimension L_1
      #if K2_P_NUM_EXTRA_ELEMS_L_1 > 0
      if (K2_L_FU_ID_L_1 == K2_P_NUM_EXTRA_CB_L_1 % K2_L_NUM_FU_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_L_1;
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      }// end of post process single extra incomplete cache block in dimension L_1
      #endif
      
      // wait for all threads to finish computation on shared cache block
      #if CACHE_L_CB != 0
      __syncthreads();
      #endif
      
      // move results upwards in memory hierarchy
      #if G_CB_RES_DEST_LEVEL > L_CB_RES_DEST_LEVEL
      #if L_CB_RES_DEST_LEVEL < LOCAL
      #if K2_P_NUM_CB_L_1 > 0
      for (size_t i_p_cb_l_1 = 0; i_p_cb_l_1 < K2_P_NUM_CB_L_1; ++i_p_cb_l_1) {
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of "i_p_cb_l_1"-loop
      #endif
      // post process whole extra cache blocks in dimension L_1
      #if K2_P_NUM_EXTRA_CB_L_1 > 0
      if (K2_L_FU_ID_L_1 < K2_P_NUM_EXTRA_CB_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_L_1;
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of post processing whole extra cache blocks in dimension L_1
      #endif
      // post process single extra incomplete cache block in dimension L_1
      #if K2_P_NUM_EXTRA_ELEMS_L_1 > 0
      if (K2_L_FU_ID_L_1 == K2_P_NUM_EXTRA_CB_L_1 % K2_L_NUM_FU_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_L_1;
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      }// end of post process single extra incomplete cache block in dimension L_1
      #endif
      #else
      #if L_CB_RES_DEST_LEVEL <= LOCAL && CACHE_L_CB == 0
      __syncthreads();
      #elif L_CB_RES_DEST_LEVEL == GLOBAL
      __threadfence();
      #endif
      #if (K2_L_CB_SIZE_L_1 * K2_L_CB_SIZE_L_2) / K2_L_FLAT_NUM_WI > 0
      for (size_t step = 0; step < (K2_L_CB_SIZE_L_1 * K2_L_CB_SIZE_L_2) / K2_L_FLAT_NUM_WI; ++step) {
        const size_t flat_index = K2_L_FLAT_WI_ID + step * K2_L_FLAT_NUM_WI;
        #if K1_P_NUM_CB_L_1 == 1
        const size_t l_index_l_1 = flat_index / (K2_L_CB_SIZE_L_2);
        const size_t l_index_l_2 = flat_index % K2_L_CB_SIZE_L_2;
        #else
        const size_t DESCENDING_L_DIMS_1(l_index_l_1, l_index_l_2) = flat_index / (DESCENDING_L_DIMS_0(K2_L_CB_SIZE_L_1, K2_L_CB_SIZE_L_2));
        const size_t DESCENDING_L_DIMS_0(l_index_l_1, l_index_l_2) = flat_index % DESCENDING_L_DIMS_0(K2_L_CB_SIZE_L_1, K2_L_CB_SIZE_L_2);
        #endif
        K2_L_KERNEL_RES(l_index_l_1, l_index_l_2) =
        #if L_CB_RES_DEST_LEVEL < LOCAL
          K2_L_REDUCTION_MEM(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == LOCAL
          K2_RES_L_BUFFER(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == GLOBAL
          K2_RES_G_BUFFER(K2_L_CB_OFFSET_L_1 + l_index_l_1, K2_L_CB_OFFSET_L_2 + l_index_l_2);
        #endif
      }
      #endif
      #if (K2_L_CB_SIZE_L_1 * K2_L_CB_SIZE_L_2) % K2_L_FLAT_NUM_WI > 0
      if (K2_L_FLAT_WI_ID < (K2_L_CB_SIZE_L_1 * K2_L_CB_SIZE_L_2) % K2_L_FLAT_NUM_WI) {
        const size_t flat_index = K2_L_FLAT_WI_ID + ((K2_L_CB_SIZE_L_1 * K2_L_CB_SIZE_L_2) / K2_L_FLAT_NUM_WI) * K2_L_FLAT_NUM_WI;
        #if K1_P_NUM_CB_L_1 == 1
        const size_t l_index_l_1 = flat_index / (K2_L_CB_SIZE_L_2);
        const size_t l_index_l_2 = flat_index % K2_L_CB_SIZE_L_2;
        #else
        const size_t DESCENDING_L_DIMS_1(l_index_l_1, l_index_l_2) = flat_index / (DESCENDING_L_DIMS_0(K2_L_CB_SIZE_L_1, K2_L_CB_SIZE_L_2));
        const size_t DESCENDING_L_DIMS_0(l_index_l_1, l_index_l_2) = flat_index % DESCENDING_L_DIMS_0(K2_L_CB_SIZE_L_1, K2_L_CB_SIZE_L_2);
        #endif
        K2_L_KERNEL_RES(l_index_l_1, l_index_l_2) =
        #if L_CB_RES_DEST_LEVEL < LOCAL
          K2_L_REDUCTION_MEM(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == LOCAL
          K2_RES_L_BUFFER(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == GLOBAL
          K2_RES_G_BUFFER(K2_L_CB_OFFSET_L_1 + l_index_l_1, K2_L_CB_OFFSET_L_2 + l_index_l_2);
        #endif
      }
      #endif
      #if L_CB_RES_DEST_LEVEL <= LOCAL
      __syncthreads();
      #elif L_CB_RES_DEST_LEVEL == GLOBAL
      __threadfence();
      #endif
      #endif
      #endif
    } // end of post processing whole extra cache blocks in dimension L_2
    #endif
    // post process single extra incomplete cache block in dimension L_2
    #if K2_L_NUM_EXTRA_ELEMS_L_2 > 0
    if (K2_G_FU_ID_L_2 == K2_L_NUM_EXTRA_CB_L_2 % K2_G_NUM_FU_L_2) {  
      const size_t i_l_cb_l_2 = K2_L_NUM_CB_L_2;
      // ---------- L caching --------------------
      #if CACHE_L_CB != 0
      #if (K2_L_CB_SIZE_INT_RES / K2_L_CB_SIZE_L_2 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_L_FLAT_NUM_WI > 0
      for (size_t step = 0; step < (K2_L_CB_SIZE_INT_RES / K2_L_CB_SIZE_L_2 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_L_FLAT_NUM_WI; ++step) {
        const size_t index = K2_L_FLAT_WI_ID + step * K2_L_FLAT_NUM_WI;
        const size_t i_l_elem_l_1 = index / (K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
        const size_t i_l_elem_l_2 = index % K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2;
        K2_L_MEM_INT_RES(i_l_elem_l_1, i_l_elem_l_2) = K2_G_MEM_INT_RES(K2_L_CB_OFFSET_L_1 + i_l_elem_l_1, K2_L_CB_OFFSET_L_2 + i_l_elem_l_2);
      }
      #endif
      #if (K2_L_CB_SIZE_INT_RES / K2_L_CB_SIZE_L_2 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) % K2_L_FLAT_NUM_WI > 0
      if (K2_L_FLAT_WI_ID < (K2_L_CB_SIZE_INT_RES / K2_L_CB_SIZE_L_2 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) % K2_L_FLAT_NUM_WI) {
        const size_t index = K2_L_FLAT_WI_ID + ((K2_L_CB_SIZE_INT_RES / K2_L_CB_SIZE_L_2 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_L_FLAT_NUM_WI) * K2_L_FLAT_NUM_WI;
        const size_t i_l_elem_l_1 = index / (K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
        const size_t i_l_elem_l_2 = index % K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2;
        K2_L_MEM_INT_RES(i_l_elem_l_1, i_l_elem_l_2) = K2_G_MEM_INT_RES(K2_L_CB_OFFSET_L_1 + i_l_elem_l_1, K2_L_CB_OFFSET_L_2 + i_l_elem_l_2);
      }
      #endif
      __syncthreads();
      #endif
      // ---------- end of L caching -------------
      
      #if K2_P_NUM_CB_L_1 > 0
      for (size_t i_p_cb_l_1 = 0; i_p_cb_l_1 < K2_P_NUM_CB_L_1; ++i_p_cb_l_1) {
        #if K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2; ++i_p_cb_l_2) {
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of "i_p_cb_l_1"-loop
      #endif
      // post process whole extra cache blocks in dimension L_1
      #if K2_P_NUM_EXTRA_CB_L_1 > 0
      if (K2_L_FU_ID_L_1 < K2_P_NUM_EXTRA_CB_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_L_1;
        #if K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2; ++i_p_cb_l_2) {
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of post processing whole extra cache blocks in dimension L_1
      #endif
      // post process single extra incomplete cache block in dimension L_1
      #if K2_P_NUM_EXTRA_ELEMS_L_1 > 0
      if (K2_L_FU_ID_L_1 == K2_P_NUM_EXTRA_CB_L_1 % K2_L_NUM_FU_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_L_1;
        #if K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2; ++i_p_cb_l_2) {
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      }// end of post process single extra incomplete cache block in dimension L_1
      #endif
      
      // wait for all threads to finish computation on shared cache block
      #if CACHE_L_CB != 0
      __syncthreads();
      #endif
      
      // move results upwards in memory hierarchy
      #if G_CB_RES_DEST_LEVEL > L_CB_RES_DEST_LEVEL
      #if L_CB_RES_DEST_LEVEL < LOCAL
      #if K2_P_NUM_CB_L_1 > 0
      for (size_t i_p_cb_l_1 = 0; i_p_cb_l_1 < K2_P_NUM_CB_L_1; ++i_p_cb_l_1) {
        #if K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2; ++i_p_cb_l_2) {
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of "i_p_cb_l_1"-loop
      #endif
      // post process whole extra cache blocks in dimension L_1
      #if K2_P_NUM_EXTRA_CB_L_1 > 0
      if (K2_L_FU_ID_L_1 < K2_P_NUM_EXTRA_CB_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_L_1;
        #if K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2; ++i_p_cb_l_2) {
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of post processing whole extra cache blocks in dimension L_1
      #endif
      // post process single extra incomplete cache block in dimension L_1
      #if K2_P_NUM_EXTRA_ELEMS_L_1 > 0
      if (K2_L_FU_ID_L_1 == K2_P_NUM_EXTRA_CB_L_1 % K2_L_NUM_FU_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_L_1;
        #if K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2; ++i_p_cb_l_2) {
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      }// end of post process single extra incomplete cache block in dimension L_1
      #endif
      #else
      #if L_CB_RES_DEST_LEVEL <= LOCAL && CACHE_L_CB == 0
      __syncthreads();
      #elif L_CB_RES_DEST_LEVEL == GLOBAL
      __threadfence();
      #endif
      #if (K2_L_CB_SIZE_L_1 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_L_FLAT_NUM_WI > 0
      for (size_t step = 0; step < (K2_L_CB_SIZE_L_1 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_L_FLAT_NUM_WI; ++step) {
        const size_t flat_index = K2_L_FLAT_WI_ID + step * K2_L_FLAT_NUM_WI;
        #if K1_P_NUM_CB_L_1 == 1
        const size_t l_index_l_1 = flat_index / (K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
        const size_t l_index_l_2 = flat_index % K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2;
        #else
        const size_t DESCENDING_L_DIMS_1(l_index_l_1, l_index_l_2) = flat_index / (DESCENDING_L_DIMS_0(K2_L_CB_SIZE_L_1, K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2));
        const size_t DESCENDING_L_DIMS_0(l_index_l_1, l_index_l_2) = flat_index % DESCENDING_L_DIMS_0(K2_L_CB_SIZE_L_1, K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
        #endif
        K2_L_KERNEL_RES(l_index_l_1, l_index_l_2) =
        #if L_CB_RES_DEST_LEVEL < LOCAL
          K2_L_REDUCTION_MEM(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == LOCAL
          K2_RES_L_BUFFER(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == GLOBAL
          K2_RES_G_BUFFER(K2_L_CB_OFFSET_L_1 + l_index_l_1, K2_L_CB_OFFSET_L_2 + l_index_l_2);
        #endif
      }
      #endif
      #if (K2_L_CB_SIZE_L_1 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) % K2_L_FLAT_NUM_WI > 0
      if (K2_L_FLAT_WI_ID < (K2_L_CB_SIZE_L_1 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) % K2_L_FLAT_NUM_WI) {
        const size_t flat_index = K2_L_FLAT_WI_ID + ((K2_L_CB_SIZE_L_1 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_L_FLAT_NUM_WI) * K2_L_FLAT_NUM_WI;
        #if K1_P_NUM_CB_L_1 == 1
        const size_t l_index_l_1 = flat_index / (K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
        const size_t l_index_l_2 = flat_index % K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2;
        #else
        const size_t DESCENDING_L_DIMS_1(l_index_l_1, l_index_l_2) = flat_index / (DESCENDING_L_DIMS_0(K2_L_CB_SIZE_L_1, K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2));
        const size_t DESCENDING_L_DIMS_0(l_index_l_1, l_index_l_2) = flat_index % DESCENDING_L_DIMS_0(K2_L_CB_SIZE_L_1, K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
        #endif
        K2_L_KERNEL_RES(l_index_l_1, l_index_l_2) =
        #if L_CB_RES_DEST_LEVEL < LOCAL
          K2_L_REDUCTION_MEM(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == LOCAL
          K2_RES_L_BUFFER(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == GLOBAL
          K2_RES_G_BUFFER(K2_L_CB_OFFSET_L_1 + l_index_l_1, K2_L_CB_OFFSET_L_2 + l_index_l_2);
        #endif
      }
      #endif
      #if L_CB_RES_DEST_LEVEL <= LOCAL
      __syncthreads();
      #elif L_CB_RES_DEST_LEVEL == GLOBAL
      __threadfence();
      #endif
      #endif
      #endif
    }// end of post process single extra incomplete cache block in dimension L_2
    #endif
  } // end of post processing whole extra cache blocks in dimension L_1
  #endif
  // post process single extra incomplete cache block in dimension L_1
  #if K2_L_NUM_EXTRA_ELEMS_L_1 > 0
  if (K2_G_FU_ID_L_1 == K2_L_NUM_EXTRA_CB_L_1 % K2_G_NUM_FU_L_1) {  
    const size_t i_l_cb_l_1 = K2_L_NUM_CB_L_1;
    #if K2_L_NUM_CB_L_2 > 0
    for (size_t i_l_cb_l_2 = 0; i_l_cb_l_2 < K2_L_NUM_CB_L_2; ++i_l_cb_l_2) {
      // ---------- L caching --------------------
      #if CACHE_L_CB != 0
      #if (K2_L_CB_SIZE_INT_RES / K2_L_CB_SIZE_L_1 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) / K2_L_FLAT_NUM_WI > 0
      for (size_t step = 0; step < (K2_L_CB_SIZE_INT_RES / K2_L_CB_SIZE_L_1 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) / K2_L_FLAT_NUM_WI; ++step) {
        const size_t index = K2_L_FLAT_WI_ID + step * K2_L_FLAT_NUM_WI;
        const size_t i_l_elem_l_1 = index / (K2_L_CB_SIZE_L_2);
        const size_t i_l_elem_l_2 = index % K2_L_CB_SIZE_L_2;
        K2_L_MEM_INT_RES(i_l_elem_l_1, i_l_elem_l_2) = K2_G_MEM_INT_RES(K2_L_CB_OFFSET_L_1 + i_l_elem_l_1, K2_L_CB_OFFSET_L_2 + i_l_elem_l_2);
      }
      #endif
      #if (K2_L_CB_SIZE_INT_RES / K2_L_CB_SIZE_L_1 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) % K2_L_FLAT_NUM_WI > 0
      if (K2_L_FLAT_WI_ID < (K2_L_CB_SIZE_INT_RES / K2_L_CB_SIZE_L_1 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) % K2_L_FLAT_NUM_WI) {
        const size_t index = K2_L_FLAT_WI_ID + ((K2_L_CB_SIZE_INT_RES / K2_L_CB_SIZE_L_1 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) / K2_L_FLAT_NUM_WI) * K2_L_FLAT_NUM_WI;
        const size_t i_l_elem_l_1 = index / (K2_L_CB_SIZE_L_2);
        const size_t i_l_elem_l_2 = index % K2_L_CB_SIZE_L_2;
        K2_L_MEM_INT_RES(i_l_elem_l_1, i_l_elem_l_2) = K2_G_MEM_INT_RES(K2_L_CB_OFFSET_L_1 + i_l_elem_l_1, K2_L_CB_OFFSET_L_2 + i_l_elem_l_2);
      }
      #endif
      __syncthreads();
      #endif
      // ---------- end of L caching -------------
      
      #if K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1 > 0
      for (size_t i_p_cb_l_1 = 0; i_p_cb_l_1 < K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1; ++i_p_cb_l_1) {
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of "i_p_cb_l_1"-loop
      #endif
      // post process whole extra cache blocks in dimension L_1
      #if K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1 > 0
      if (K2_L_FU_ID_L_1 < K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1;
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of post processing whole extra cache blocks in dimension L_1
      #endif
      // post process single extra incomplete cache block in dimension L_1
      #if K2_P_NUM_EXTRA_ELEMS_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1 > 0
      if (K2_L_FU_ID_L_1 == K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1 % K2_L_NUM_FU_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1;
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      }// end of post process single extra incomplete cache block in dimension L_1
      #endif
      
      // wait for all threads to finish computation on shared cache block
      #if CACHE_L_CB != 0
      __syncthreads();
      #endif
      
      // move results upwards in memory hierarchy
      #if G_CB_RES_DEST_LEVEL > L_CB_RES_DEST_LEVEL
      #if L_CB_RES_DEST_LEVEL < LOCAL
      #if K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1 > 0
      for (size_t i_p_cb_l_1 = 0; i_p_cb_l_1 < K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1; ++i_p_cb_l_1) {
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of "i_p_cb_l_1"-loop
      #endif
      // post process whole extra cache blocks in dimension L_1
      #if K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1 > 0
      if (K2_L_FU_ID_L_1 < K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1;
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of post processing whole extra cache blocks in dimension L_1
      #endif
      // post process single extra incomplete cache block in dimension L_1
      #if K2_P_NUM_EXTRA_ELEMS_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1 > 0
      if (K2_L_FU_ID_L_1 == K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1 % K2_L_NUM_FU_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1;
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      }// end of post process single extra incomplete cache block in dimension L_1
      #endif
      #else
      #if L_CB_RES_DEST_LEVEL <= LOCAL && CACHE_L_CB == 0
      __syncthreads();
      #elif L_CB_RES_DEST_LEVEL == GLOBAL
      __threadfence();
      #endif
      #if (K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 * K2_L_CB_SIZE_L_2) / K2_L_FLAT_NUM_WI > 0
      for (size_t step = 0; step < (K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 * K2_L_CB_SIZE_L_2) / K2_L_FLAT_NUM_WI; ++step) {
        const size_t flat_index = K2_L_FLAT_WI_ID + step * K2_L_FLAT_NUM_WI;
        #if K1_P_NUM_CB_L_1 == 1
        const size_t l_index_l_1 = flat_index / (K2_L_CB_SIZE_L_2);
        const size_t l_index_l_2 = flat_index % K2_L_CB_SIZE_L_2;
        #else
        const size_t DESCENDING_L_DIMS_1(l_index_l_1, l_index_l_2) = flat_index / (DESCENDING_L_DIMS_0(K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1, K2_L_CB_SIZE_L_2));
        const size_t DESCENDING_L_DIMS_0(l_index_l_1, l_index_l_2) = flat_index % DESCENDING_L_DIMS_0(K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1, K2_L_CB_SIZE_L_2);
        #endif
        K2_L_KERNEL_RES(l_index_l_1, l_index_l_2) =
        #if L_CB_RES_DEST_LEVEL < LOCAL
          K2_L_REDUCTION_MEM(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == LOCAL
          K2_RES_L_BUFFER(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == GLOBAL
          K2_RES_G_BUFFER(K2_L_CB_OFFSET_L_1 + l_index_l_1, K2_L_CB_OFFSET_L_2 + l_index_l_2);
        #endif
      }
      #endif
      #if (K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 * K2_L_CB_SIZE_L_2) % K2_L_FLAT_NUM_WI > 0
      if (K2_L_FLAT_WI_ID < (K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 * K2_L_CB_SIZE_L_2) % K2_L_FLAT_NUM_WI) {
        const size_t flat_index = K2_L_FLAT_WI_ID + ((K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 * K2_L_CB_SIZE_L_2) / K2_L_FLAT_NUM_WI) * K2_L_FLAT_NUM_WI;
        #if K1_P_NUM_CB_L_1 == 1
        const size_t l_index_l_1 = flat_index / (K2_L_CB_SIZE_L_2);
        const size_t l_index_l_2 = flat_index % K2_L_CB_SIZE_L_2;
        #else
        const size_t DESCENDING_L_DIMS_1(l_index_l_1, l_index_l_2) = flat_index / (DESCENDING_L_DIMS_0(K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1, K2_L_CB_SIZE_L_2));
        const size_t DESCENDING_L_DIMS_0(l_index_l_1, l_index_l_2) = flat_index % DESCENDING_L_DIMS_0(K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1, K2_L_CB_SIZE_L_2);
        #endif
        K2_L_KERNEL_RES(l_index_l_1, l_index_l_2) =
        #if L_CB_RES_DEST_LEVEL < LOCAL
          K2_L_REDUCTION_MEM(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == LOCAL
          K2_RES_L_BUFFER(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == GLOBAL
          K2_RES_G_BUFFER(K2_L_CB_OFFSET_L_1 + l_index_l_1, K2_L_CB_OFFSET_L_2 + l_index_l_2);
        #endif
      }
      #endif
      #if L_CB_RES_DEST_LEVEL <= LOCAL
      __syncthreads();
      #elif L_CB_RES_DEST_LEVEL == GLOBAL
      __threadfence();
      #endif
      #endif
      #endif
    } // end of "i_l_cb_l_2"-loop
    #endif
    // post process whole extra cache blocks in dimension L_2
    #if K2_L_NUM_EXTRA_CB_L_2 > 0
    if (K2_G_FU_ID_L_2 < K2_L_NUM_EXTRA_CB_L_2) {  
      const size_t i_l_cb_l_2 = K2_L_NUM_CB_L_2;
      // ---------- L caching --------------------
      #if CACHE_L_CB != 0
      #if (K2_L_CB_SIZE_INT_RES / K2_L_CB_SIZE_L_1 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) / K2_L_FLAT_NUM_WI > 0
      for (size_t step = 0; step < (K2_L_CB_SIZE_INT_RES / K2_L_CB_SIZE_L_1 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) / K2_L_FLAT_NUM_WI; ++step) {
        const size_t index = K2_L_FLAT_WI_ID + step * K2_L_FLAT_NUM_WI;
        const size_t i_l_elem_l_1 = index / (K2_L_CB_SIZE_L_2);
        const size_t i_l_elem_l_2 = index % K2_L_CB_SIZE_L_2;
        K2_L_MEM_INT_RES(i_l_elem_l_1, i_l_elem_l_2) = K2_G_MEM_INT_RES(K2_L_CB_OFFSET_L_1 + i_l_elem_l_1, K2_L_CB_OFFSET_L_2 + i_l_elem_l_2);
      }
      #endif
      #if (K2_L_CB_SIZE_INT_RES / K2_L_CB_SIZE_L_1 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) % K2_L_FLAT_NUM_WI > 0
      if (K2_L_FLAT_WI_ID < (K2_L_CB_SIZE_INT_RES / K2_L_CB_SIZE_L_1 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) % K2_L_FLAT_NUM_WI) {
        const size_t index = K2_L_FLAT_WI_ID + ((K2_L_CB_SIZE_INT_RES / K2_L_CB_SIZE_L_1 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) / K2_L_FLAT_NUM_WI) * K2_L_FLAT_NUM_WI;
        const size_t i_l_elem_l_1 = index / (K2_L_CB_SIZE_L_2);
        const size_t i_l_elem_l_2 = index % K2_L_CB_SIZE_L_2;
        K2_L_MEM_INT_RES(i_l_elem_l_1, i_l_elem_l_2) = K2_G_MEM_INT_RES(K2_L_CB_OFFSET_L_1 + i_l_elem_l_1, K2_L_CB_OFFSET_L_2 + i_l_elem_l_2);
      }
      #endif
      __syncthreads();
      #endif
      // ---------- end of L caching -------------
      
      #if K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1 > 0
      for (size_t i_p_cb_l_1 = 0; i_p_cb_l_1 < K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1; ++i_p_cb_l_1) {
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of "i_p_cb_l_1"-loop
      #endif
      // post process whole extra cache blocks in dimension L_1
      #if K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1 > 0
      if (K2_L_FU_ID_L_1 < K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1;
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of post processing whole extra cache blocks in dimension L_1
      #endif
      // post process single extra incomplete cache block in dimension L_1
      #if K2_P_NUM_EXTRA_ELEMS_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1 > 0
      if (K2_L_FU_ID_L_1 == K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1 % K2_L_NUM_FU_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1;
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      }// end of post process single extra incomplete cache block in dimension L_1
      #endif
      
      // wait for all threads to finish computation on shared cache block
      #if CACHE_L_CB != 0
      __syncthreads();
      #endif
      
      // move results upwards in memory hierarchy
      #if G_CB_RES_DEST_LEVEL > L_CB_RES_DEST_LEVEL
      #if L_CB_RES_DEST_LEVEL < LOCAL
      #if K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1 > 0
      for (size_t i_p_cb_l_1 = 0; i_p_cb_l_1 < K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1; ++i_p_cb_l_1) {
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of "i_p_cb_l_1"-loop
      #endif
      // post process whole extra cache blocks in dimension L_1
      #if K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1 > 0
      if (K2_L_FU_ID_L_1 < K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1;
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of post processing whole extra cache blocks in dimension L_1
      #endif
      // post process single extra incomplete cache block in dimension L_1
      #if K2_P_NUM_EXTRA_ELEMS_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1 > 0
      if (K2_L_FU_ID_L_1 == K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1 % K2_L_NUM_FU_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1;
        #if K2_P_NUM_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_L_2; ++i_p_cb_l_2) {
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_L_CB_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      }// end of post process single extra incomplete cache block in dimension L_1
      #endif
      #else
      #if L_CB_RES_DEST_LEVEL <= LOCAL && CACHE_L_CB == 0
      __syncthreads();
      #elif L_CB_RES_DEST_LEVEL == GLOBAL
      __threadfence();
      #endif
      #if (K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 * K2_L_CB_SIZE_L_2) / K2_L_FLAT_NUM_WI > 0
      for (size_t step = 0; step < (K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 * K2_L_CB_SIZE_L_2) / K2_L_FLAT_NUM_WI; ++step) {
        const size_t flat_index = K2_L_FLAT_WI_ID + step * K2_L_FLAT_NUM_WI;
        #if K1_P_NUM_CB_L_1 == 1
        const size_t l_index_l_1 = flat_index / (K2_L_CB_SIZE_L_2);
        const size_t l_index_l_2 = flat_index % K2_L_CB_SIZE_L_2;
        #else
        const size_t DESCENDING_L_DIMS_1(l_index_l_1, l_index_l_2) = flat_index / (DESCENDING_L_DIMS_0(K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1, K2_L_CB_SIZE_L_2));
        const size_t DESCENDING_L_DIMS_0(l_index_l_1, l_index_l_2) = flat_index % DESCENDING_L_DIMS_0(K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1, K2_L_CB_SIZE_L_2);
        #endif
        K2_L_KERNEL_RES(l_index_l_1, l_index_l_2) =
        #if L_CB_RES_DEST_LEVEL < LOCAL
          K2_L_REDUCTION_MEM(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == LOCAL
          K2_RES_L_BUFFER(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == GLOBAL
          K2_RES_G_BUFFER(K2_L_CB_OFFSET_L_1 + l_index_l_1, K2_L_CB_OFFSET_L_2 + l_index_l_2);
        #endif
      }
      #endif
      #if (K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 * K2_L_CB_SIZE_L_2) % K2_L_FLAT_NUM_WI > 0
      if (K2_L_FLAT_WI_ID < (K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 * K2_L_CB_SIZE_L_2) % K2_L_FLAT_NUM_WI) {
        const size_t flat_index = K2_L_FLAT_WI_ID + ((K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 * K2_L_CB_SIZE_L_2) / K2_L_FLAT_NUM_WI) * K2_L_FLAT_NUM_WI;
        #if K1_P_NUM_CB_L_1 == 1
        const size_t l_index_l_1 = flat_index / (K2_L_CB_SIZE_L_2);
        const size_t l_index_l_2 = flat_index % K2_L_CB_SIZE_L_2;
        #else
        const size_t DESCENDING_L_DIMS_1(l_index_l_1, l_index_l_2) = flat_index / (DESCENDING_L_DIMS_0(K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1, K2_L_CB_SIZE_L_2));
        const size_t DESCENDING_L_DIMS_0(l_index_l_1, l_index_l_2) = flat_index % DESCENDING_L_DIMS_0(K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1, K2_L_CB_SIZE_L_2);
        #endif
        K2_L_KERNEL_RES(l_index_l_1, l_index_l_2) =
        #if L_CB_RES_DEST_LEVEL < LOCAL
          K2_L_REDUCTION_MEM(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == LOCAL
          K2_RES_L_BUFFER(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == GLOBAL
          K2_RES_G_BUFFER(K2_L_CB_OFFSET_L_1 + l_index_l_1, K2_L_CB_OFFSET_L_2 + l_index_l_2);
        #endif
      }
      #endif
      #if L_CB_RES_DEST_LEVEL <= LOCAL
      __syncthreads();
      #elif L_CB_RES_DEST_LEVEL == GLOBAL
      __threadfence();
      #endif
      #endif
      #endif
    } // end of post processing whole extra cache blocks in dimension L_2
    #endif
    // post process single extra incomplete cache block in dimension L_2
    #if K2_L_NUM_EXTRA_ELEMS_L_2 > 0
    if (K2_G_FU_ID_L_2 == K2_L_NUM_EXTRA_CB_L_2 % K2_G_NUM_FU_L_2) {  
      const size_t i_l_cb_l_2 = K2_L_NUM_CB_L_2;
      // ---------- L caching --------------------
      #if CACHE_L_CB != 0
      #if (K2_L_CB_SIZE_INT_RES / K2_L_CB_SIZE_L_1 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 / K2_L_CB_SIZE_L_2 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_L_FLAT_NUM_WI > 0
      for (size_t step = 0; step < (K2_L_CB_SIZE_INT_RES / K2_L_CB_SIZE_L_1 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 / K2_L_CB_SIZE_L_2 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_L_FLAT_NUM_WI; ++step) {
        const size_t index = K2_L_FLAT_WI_ID + step * K2_L_FLAT_NUM_WI;
        const size_t i_l_elem_l_1 = index / (K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
        const size_t i_l_elem_l_2 = index % K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2;
        K2_L_MEM_INT_RES(i_l_elem_l_1, i_l_elem_l_2) = K2_G_MEM_INT_RES(K2_L_CB_OFFSET_L_1 + i_l_elem_l_1, K2_L_CB_OFFSET_L_2 + i_l_elem_l_2);
      }
      #endif
      #if (K2_L_CB_SIZE_INT_RES / K2_L_CB_SIZE_L_1 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 / K2_L_CB_SIZE_L_2 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) % K2_L_FLAT_NUM_WI > 0
      if (K2_L_FLAT_WI_ID < (K2_L_CB_SIZE_INT_RES / K2_L_CB_SIZE_L_1 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 / K2_L_CB_SIZE_L_2 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) % K2_L_FLAT_NUM_WI) {
        const size_t index = K2_L_FLAT_WI_ID + ((K2_L_CB_SIZE_INT_RES / K2_L_CB_SIZE_L_1 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 / K2_L_CB_SIZE_L_2 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_L_FLAT_NUM_WI) * K2_L_FLAT_NUM_WI;
        const size_t i_l_elem_l_1 = index / (K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
        const size_t i_l_elem_l_2 = index % K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2;
        K2_L_MEM_INT_RES(i_l_elem_l_1, i_l_elem_l_2) = K2_G_MEM_INT_RES(K2_L_CB_OFFSET_L_1 + i_l_elem_l_1, K2_L_CB_OFFSET_L_2 + i_l_elem_l_2);
      }
      #endif
      __syncthreads();
      #endif
      // ---------- end of L caching -------------
      
      #if K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1 > 0
      for (size_t i_p_cb_l_1 = 0; i_p_cb_l_1 < K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1; ++i_p_cb_l_1) {
        #if K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2; ++i_p_cb_l_2) {
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of "i_p_cb_l_1"-loop
      #endif
      // post process whole extra cache blocks in dimension L_1
      #if K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1 > 0
      if (K2_L_FU_ID_L_1 < K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1;
        #if K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2; ++i_p_cb_l_2) {
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < K2_P_CB_SIZE_INT_RES % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + (K2_P_CB_SIZE_INT_RES / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of post processing whole extra cache blocks in dimension L_1
      #endif
      // post process single extra incomplete cache block in dimension L_1
      #if K2_P_NUM_EXTRA_ELEMS_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1 > 0
      if (K2_L_FU_ID_L_1 == K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1 % K2_L_NUM_FU_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1;
        #if K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2; ++i_p_cb_l_2) {
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_SIZE_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_SIZE_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          // ---------- P caching --------------------
          #if CACHE_P_CB != 0
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_P_FLAT_NUM_WI > 0
          for (size_t step = 0; step < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_P_FLAT_NUM_WI; ++step) {
            const size_t index = K2_P_FLAT_WI_ID + step * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #if (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) % K2_P_FLAT_NUM_WI > 0
          if (K2_P_FLAT_WI_ID < (K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) % K2_P_FLAT_NUM_WI) {
            const size_t index = K2_P_FLAT_WI_ID + ((K2_P_CB_SIZE_INT_RES / K2_P_CB_SIZE_L_1 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 / K2_P_CB_SIZE_L_2 * K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_P_FLAT_NUM_WI) * K2_P_FLAT_NUM_WI;
            #if CACHE_L_CB != 0
            const size_t BUFFER_INT_RES_INDEX_1(i_p_elem_l_1, i_p_elem_l_2) = index / (BUFFER_INT_RES_P_SIZE_0);
            const size_t BUFFER_INT_RES_INDEX_0(i_p_elem_l_1, i_p_elem_l_2) = index % BUFFER_INT_RES_P_SIZE_0;
            #else
            const size_t i_p_elem_l_1 = index / (K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
            const size_t i_p_elem_l_2 = index % K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2;
            #endif
            K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2) = K2_L_MEM_INT_RES(K2_P_CB_OFFSET_L_1 + i_p_elem_l_1, K2_P_CB_OFFSET_L_2 + i_p_elem_l_2);
          }
          #endif
          #endif
          // ---------- end of P caching -------------
          
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2; ++i_p_elem_l_2) {
              // process one mda element
              K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_MEM_INT_RES(i_p_elem_l_1, i_p_elem_l_2);
            
            }
          }
          
          // move results upwards in memory hierarchy
          #if L_CB_RES_DEST_LEVEL > P_CB_RES_DEST_LEVEL
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2; ++i_p_elem_l_2) {
              K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_P_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
          #endif
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      }// end of post process single extra incomplete cache block in dimension L_1
      #endif
      
      // wait for all threads to finish computation on shared cache block
      #if CACHE_L_CB != 0
      __syncthreads();
      #endif
      
      // move results upwards in memory hierarchy
      #if G_CB_RES_DEST_LEVEL > L_CB_RES_DEST_LEVEL
      #if L_CB_RES_DEST_LEVEL < LOCAL
      #if K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1 > 0
      for (size_t i_p_cb_l_1 = 0; i_p_cb_l_1 < K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1; ++i_p_cb_l_1) {
        #if K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2; ++i_p_cb_l_2) {
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of "i_p_cb_l_1"-loop
      #endif
      // post process whole extra cache blocks in dimension L_1
      #if K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1 > 0
      if (K2_L_FU_ID_L_1 < K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1;
        #if K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2; ++i_p_cb_l_2) {
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_SIZE_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      } // end of post processing whole extra cache blocks in dimension L_1
      #endif
      // post process single extra incomplete cache block in dimension L_1
      #if K2_P_NUM_EXTRA_ELEMS_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1 > 0
      if (K2_L_FU_ID_L_1 == K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1 % K2_L_NUM_FU_L_1) {  
        const size_t i_p_cb_l_1 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_1;
        #if K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        for (size_t i_p_cb_l_2 = 0; i_p_cb_l_2 < K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2; ++i_p_cb_l_2) {
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of "i_p_cb_l_2"-loop
        #endif
        // post process whole extra cache blocks in dimension L_2
        #if K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 < K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_SIZE_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        } // end of post processing whole extra cache blocks in dimension L_2
        #endif
        // post process single extra incomplete cache block in dimension L_2
        #if K2_P_NUM_EXTRA_ELEMS_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 > 0
        if (K2_L_FU_ID_L_2 == K2_P_NUM_EXTRA_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2 % K2_L_NUM_FU_L_2) {  
          const size_t i_p_cb_l_2 = K2_P_NUM_CB_IN_INCOMPLETE_L_CB_IN_COMPLETE_G_CB_L_2;
          for (size_t i_p_elem_l_1 = 0; i_p_elem_l_1 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1; ++i_p_elem_l_1) {
            for (size_t i_p_elem_l_2 = 0; i_p_elem_l_2 < K2_P_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2; ++i_p_elem_l_2) {
              K2_G_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2) = K2_L_CB_RES_DEST(i_p_elem_l_1, i_p_elem_l_2);
            }
          }
        }// end of post process single extra incomplete cache block in dimension L_2
        #endif
      }// end of post process single extra incomplete cache block in dimension L_1
      #endif
      #else
      #if L_CB_RES_DEST_LEVEL <= LOCAL && CACHE_L_CB == 0
      __syncthreads();
      #elif L_CB_RES_DEST_LEVEL == GLOBAL
      __threadfence();
      #endif
      #if (K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_L_FLAT_NUM_WI > 0
      for (size_t step = 0; step < (K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_L_FLAT_NUM_WI; ++step) {
        const size_t flat_index = K2_L_FLAT_WI_ID + step * K2_L_FLAT_NUM_WI;
        #if K1_P_NUM_CB_L_1 == 1
        const size_t l_index_l_1 = flat_index / (K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
        const size_t l_index_l_2 = flat_index % K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2;
        #else
        const size_t DESCENDING_L_DIMS_1(l_index_l_1, l_index_l_2) = flat_index / (DESCENDING_L_DIMS_0(K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1, K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2));
        const size_t DESCENDING_L_DIMS_0(l_index_l_1, l_index_l_2) = flat_index % DESCENDING_L_DIMS_0(K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1, K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
        #endif
        K2_L_KERNEL_RES(l_index_l_1, l_index_l_2) =
        #if L_CB_RES_DEST_LEVEL < LOCAL
          K2_L_REDUCTION_MEM(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == LOCAL
          K2_RES_L_BUFFER(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == GLOBAL
          K2_RES_G_BUFFER(K2_L_CB_OFFSET_L_1 + l_index_l_1, K2_L_CB_OFFSET_L_2 + l_index_l_2);
        #endif
      }
      #endif
      #if (K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) % K2_L_FLAT_NUM_WI > 0
      if (K2_L_FLAT_WI_ID < (K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) % K2_L_FLAT_NUM_WI) {
        const size_t flat_index = K2_L_FLAT_WI_ID + ((K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1 * K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2) / K2_L_FLAT_NUM_WI) * K2_L_FLAT_NUM_WI;
        #if K1_P_NUM_CB_L_1 == 1
        const size_t l_index_l_1 = flat_index / (K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
        const size_t l_index_l_2 = flat_index % K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2;
        #else
        const size_t DESCENDING_L_DIMS_1(l_index_l_1, l_index_l_2) = flat_index / (DESCENDING_L_DIMS_0(K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1, K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2));
        const size_t DESCENDING_L_DIMS_0(l_index_l_1, l_index_l_2) = flat_index % DESCENDING_L_DIMS_0(K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_1, K2_L_CB_REDUCED_SIZE_IN_COMPLETE_G_CB_L_2);
        #endif
        K2_L_KERNEL_RES(l_index_l_1, l_index_l_2) =
        #if L_CB_RES_DEST_LEVEL < LOCAL
          K2_L_REDUCTION_MEM(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == LOCAL
          K2_RES_L_BUFFER(l_index_l_1, l_index_l_2);
        #elif L_CB_RES_DEST_LEVEL == GLOBAL
          K2_RES_G_BUFFER(K2_L_CB_OFFSET_L_1 + l_index_l_1, K2_L_CB_OFFSET_L_2 + l_index_l_2);
        #endif
      }
      #endif
      #if L_CB_RES_DEST_LEVEL <= LOCAL
      __syncthreads();
      #elif L_CB_RES_DEST_LEVEL == GLOBAL
      __threadfence();
      #endif
      #endif
      #endif
    }// end of post process single extra incomplete cache block in dimension L_2
    #endif
  }// end of post process single extra incomplete cache block in dimension L_1
  #endif
}
// =============== end of kernel 2 ============================================