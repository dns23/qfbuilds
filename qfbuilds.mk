#
# arg 1 is QF framework (QPC, QPCPP, etc)
# arg 2 is version of framework
# arg 3 is port that is being built (POSIX, armcm, etc)
# arg 4 is kernel that is being built
define QF_BUILD_TARGETS_FCN

.PHONY: _build_info_$(1)_$(2)_$(3)_$(4)
_build_info_$(1)_$(2)_$(3)_$(4):
	echo "INFO : QF FRAMEWORK    : $(1)"
	echo "INFO : QF VERSION      : $(2)"
	echo "INFO : QF PORT         : $(3)"
	echo "INFO : QF KERNEL       : $(4)"

.PHONY: build_$(1)_$(2)_$(3)_$(4)
build_$(1)_$(2)_$(3)_$(4): \
    _build_info_$(1)_$(2)_$(3)_$(4)

# Link targets
build: build_$(1)_$(2)_$(3)_$(4)

endef