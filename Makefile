MAKEFLAGS:=--silent

ROOT_DIR:=$(CURDIR)
SRC_DIR:=$(ROOT_DIR)
BLD_DIR:=$(ROOT_DIR)/bld

all: clean build

clean:
	rm -rf $(BLD_DIR)

-include qfbuilds.mk 

# Supported QPC builds.
$(eval $(call QF_BUILD_TARGETS_FCN,qpc,5.5.1,posix,))
$(eval $(call QF_BUILD_TARGETS_FCN,qpc,5.5.1,arm-cm,qk))
$(eval $(call QF_BUILD_TARGETS_FCN,qpc,5.5.1,arm-cm,qv))
