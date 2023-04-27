# SPDX-License-Identifier: GPL-2.0-only

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/image.mk


define Build/Compile
	$(CP) $(LINUX_DIR)/COPYING $(KDIR)/COPYING.linux
endef

### Image scripts ###
define Build/aboot-img
	mkbootimg \
		--kernel $@ \
		--ramdisk /dev/null \
		--cmdline $(CMDLINE) \
		-o $@.new
	mv $@.new $@
endef

define Build/sparse-img
	img2simg  $@ $@.new
	mv $@.new $@
endef

### Devices ###
define Device/Default
	PROFILES := Default
	# KERNEL_DEPENDS = $$(wildcard $(DTS_DIR)/$$(DEVICE_DTS).dts)
	KERNEL = kernel-bin | gzip | append-dtb
	IMAGES := boot.img system.img
	IMAGE/boot.img := append-kernel | aboot-img | append-metadata
	IMAGE/system.img := append-rootfs | sparse-img | append-metadata
	DEVICE_DTS_DIR := ../dts
	DEVICE_DTS = $$(SOC)_$(1)
	CMDLINE := "earlycon console=ttyMSM0,115200 rw"
endef

include $(SUBTARGET).mk

$(eval $(call BuildImage))