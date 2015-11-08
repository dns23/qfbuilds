project(QPC)

set(SRC_FILES_DIR ${QPC_SOURCE_DIR}/qpc/source)

if (${QFBUILD_PORT} STREQUAL "posix")
    set(PORT_SRC_FILES_DIR ${QPC_SOURCE_DIR}/qpc/ports/${QFBUILD_PORT})
else ()
    set(PORT_SRC_FILES_DIR ${QPC_SOURCE_DIR}/qpc/ports/${QFBUILD_PORT}/${QFBUILD_KERNEL})
endif ()

file(GLOB PORT_SRC_FILES "${PORT_SRC_FILES_DIR}/*.c" "${PORT_SRC_FILES_DIR}/*.s")

if (NOT ${QFBUILD_PORT} STREQUAL "posix")
    if (${QFBUILD_KERNEL} STREQUAL "qk")
        list(APPEND PORT_SRC_FILES 
            ${SRC_FILES_DIR}/qk_mutex.c
            ${SRC_FILES_DIR}/qk.c
        )
    elseif (${QFBUILD_KERNEL} STREQUAL "qv")
        list(APPEND PORT_SRC_FILES
            ${SRC_FILES_DIR}/qv.c
        )
    else ()
        message(FATAL_ERROR "Unsupported Kernel")
    endif ()
endif()

set(CMAKE_C_FLAGS "-DQ_SPY") 

include_directories(
    ${QPC_SOURCE_DIR}/qpc/include
    ${SRC_FILES_DIR}
    ${PORT_SRC_FILES_DIR}
)

#
# Build the library
add_library(qpc
    ${PORT_SRC_FILES}
    ${SRC_FILES_DIR}/qep_hsm.c
    ${SRC_FILES_DIR}/qep_msm.c
    ${SRC_FILES_DIR}/qf_act.c
    ${SRC_FILES_DIR}/qf_actq.c
    ${SRC_FILES_DIR}/qf_defer.c
    ${SRC_FILES_DIR}/qf_dyn.c
    ${SRC_FILES_DIR}/qf_mem.c
    ${SRC_FILES_DIR}/qf_ps.c
    ${SRC_FILES_DIR}/qf_qact.c
    ${SRC_FILES_DIR}/qf_qeq.c
    ${SRC_FILES_DIR}/qf_qmact.c
    ${SRC_FILES_DIR}/qf_time.c
    ${SRC_FILES_DIR}/qs.c
    ${SRC_FILES_DIR}/qs_fp.c
    ${SRC_FILES_DIR}/qs_rx.c
    ${SRC_FILES_DIR}/qs_64bit.c
)
