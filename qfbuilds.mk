#
# arg 1 is QF framework (QPC, QPCPP, etc)
# arg 2 is version of framework
# arg 3 is port that is being built (POSIX, armcm, etc)
# arg 4 is kernel that is being built
define QF_BUILD_TARGETS_FCN

.PHONY: build_$(1)_$(2)_$(3)_$(4)
build_$(1)_$(2)_$(3)_$(4): \
    $(BLD_DIR)/$(1)_$(2)_$(3)_$(4)/Makefile
	$(MAKE) -C $(BLD_DIR)/$(1)_$(2)_$(3)_$(4)


$(BLD_DIR)/$(1)_$(2)_$(3)_$(4)/Makefile:
	mkdir -p $(BLD_DIR)/$(1)_$(2)_$(3)_$(4)
	cd $(BLD_DIR)/$(1)_$(2)_$(3)_$(4) && cmake \
   -D CMAKE_TOOLCHAIN_FILE=$(SRC_DIR)/cmake/$(3)_toolchain.cmake \
   -D QFBUILD_SOURCE_DIR:STRING=$(SRC_DIR) \
   -D QFBUILD_BINARY_DIR:STRING=$(BLD_DIR) \
   -D QFBUILD_FRAMEWORK:STRING=$(1) \
   -D QFBUILD_VERSION:STRING=$(2) \
   -D QFBUILD_PORT:STRING=$(3) \
   -D QFBUILD_KERNEL:STRING=$(4) \
   -G "Unix Makefiles" \
    $(SRC_DIR)

# Link targets
build: build_$(1)_$(2)_$(3)_$(4)

endef