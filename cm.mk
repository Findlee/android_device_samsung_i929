## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := i929

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/i929/device_i929.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := i929
PRODUCT_NAME := cm_i929
PRODUCT_BRAND := samsung
PRODUCT_MODEL := i929
PRODUCT_MANUFACTURER := samsung
