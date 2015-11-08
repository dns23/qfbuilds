project(QF_BUILDS)

cmake_minimum_required(VERSION 2.8)

message("BUILD INFORMATION:")
message("   QF FRAMEWORK    : ${QFBUILD_FRAMEWORK}")
message("   QF VERSION      : ${QFBUILD_VERSION}")
message("   QF PORT         : ${QFBUILD_PORT}")
message("   QF KERNEL       : ${QFBUILD_KERNEL}")
message("   QF SOURCE DIR   : ${QFBUILD_SOURCE_DIR}")
message("   QF BUILD DIR    : ${QFBUILD_BINARY_DIR}")

add_subdirectory(lib)