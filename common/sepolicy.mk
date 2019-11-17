#
# This policy configuration will be used by all products
#

CUSTOM_DEVICE_SEPOLICY_PATH := device/custom/sepolicy

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

BOARD_PLAT_PUBLIC_SEPOLICY_DIR += \
    $(CUSTOM_DEVICE_SEPOLICY_PATH)/common/public

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    $(CUSTOM_DEVICE_SEPOLICY_PATH)/common/private

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    $(CUSTOM_DEVICE_SEPOLICY_PATH)/common/dynamic \
    $(CUSTOM_DEVICE_SEPOLICY_PATH)/common/system
else
BOARD_SEPOLICY_DIRS += \
    $(CUSTOM_DEVICE_SEPOLICY_PATH)/common/dynamic \
    $(CUSTOM_DEVICE_SEPOLICY_PATH)/common/vendor
endif
