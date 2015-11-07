MAKEFLAGS:=--silent

ROOT_DIR:=$(CURDIR)
BLD_DIR:=$(ROOT_DIR)/bld

all: clean build

clean:
	rm -rf $(BLD_DIR)

-include qfbuilds.mk 

# Supported QPC builds.
$(eval $(call QF_BUILD_TARGETS_FCN,qpc,5.5.1,posix,qk))
$(eval $(call QF_BUILD_TARGETS_FCN,qpc,5.5.1,posix,qv))
