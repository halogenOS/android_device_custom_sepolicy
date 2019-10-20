#
# This policy configuration will be used by all qcom products
#

CUSTOM_QCOM_DEVICE_SEPOLICY_PATH := device/custom/sepolicy/qcom

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    $(CUSTOM_QCOM_DEVICE_SEPOLICY_PATH)/private

ifneq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
BOARD_SEPOLICY_DIRS += \
    $(CUSTOM_QCOM_DEVICE_SEPOLICY_PATH)/qcom/vendor
endif
