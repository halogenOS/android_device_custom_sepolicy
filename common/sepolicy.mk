#
# SPDX-FileCopyrightText: 2026 The halogenOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Custom sepolicy configuration

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += \
    device/custom/sepolicy/common/public

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/custom/sepolicy/common/private

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/custom/sepolicy/common/dynamic
else
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/custom/sepolicy/common/dynamic \
    device/custom/sepolicy/common/vendor
endif
