$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/i929/i929-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/i929/overlay

LOCAL_PATH := device/samsung/i929
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel
      
# Init scripts
PRODUCT_PACKAGES += \
    init.qcom.post_boot.sh \
    init.qcom.efs.sync.sh \
    init.qcom.class_core.sh \
    init.qcom.class_main.sh \
    init.qcom.early_boot.sh \
    init.qcom.usb.sh \
    lpm.rc \
    init.qcom.lpm_boot.sh \
    init.qcom.thermald_conf.sh
   	
# Charger
PRODUCT_PACKAGES += charger charger_res_images

# Needed to reset bootmode when leaving recovery
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh 
    
PRODUCT_PACKAGES += \
    static_busybox \
    make_ext4fs \
    setup_fs

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_i929
PRODUCT_DEVICE := i929
