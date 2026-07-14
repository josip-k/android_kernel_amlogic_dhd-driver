KERNEL_SRC ?= /lib/modules/$(shell uname -r)/build
M ?= $(shell pwd)

ifeq ($(O),)
out_dir := .
else
out_dir := $(O)
endif

BCMDHD_DIR := ../bcmdhd.101.10.591.x

# bcmdhd.101.10.591.x/Makefile's own build entry point is "all" (which
# chains to "bcmdhd_sdio"), not "modules" - remap just that one.
TARGET = $(if $(filter modules,$(@)),all,$(@))

modules modules_install clean:
	$(MAKE) -C $(KERNEL_SRC)/$(M)/$(BCMDHD_DIR) M=$(M)/$(BCMDHD_DIR) KERNEL_SRC=$(KERNEL_SRC) \
		CONFIG_BCMDHD_SDIO=y CONFIG_DHD_USE_STATIC_BUF=y CONFIG_ANDROID_14=y \
		KBUILD_EXTRA_SYMBOLS=$(abspath $(out_dir)/../common_drivers/Module.symvers) $(TARGET)
	if [ -e $(out_dir)/$(M)/$(BCMDHD_DIR)/Module.symvers ]; then \
		ln -sf $(out_dir)/$(M)/$(BCMDHD_DIR)/Module.symvers $(out_dir)/$(M)/Module.symvers; \
	fi
	if [ -e $(out_dir)/$(M)/$(BCMDHD_DIR)/dhd.ko ]; then \
		ln -sf $(out_dir)/$(M)/$(BCMDHD_DIR)/dhd.ko $(out_dir)/$(M)/dhd.ko; \
	fi
