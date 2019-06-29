ifeq ($(PACKAGE_SET),vm)
    ifneq ($(filter $(DISTRIBUTION), debian qubuntu),)
      DEBIAN_BUILD_DIRS := debian
    endif

    RPM_SPEC_FILES := rpm_spec/qubes-core-agent-linux-bridge-device.spec
endif

# vim: ft=make
