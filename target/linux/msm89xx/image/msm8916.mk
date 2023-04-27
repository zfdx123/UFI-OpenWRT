# SPDX-License-Identifier: GPL-2.0-only

define Device/hylab_ufi103s
	DEVICE_VENDOR := hylab
	DEVICE_MODEL := UFI103S
	SOC := msm8916
	CMDLINE := "earlycon console=ttyMSM0,115200 root=/dev/mmcblk0p31 rw rootwait"
endef
TARGET_DEVICES += hylab_ufi103s