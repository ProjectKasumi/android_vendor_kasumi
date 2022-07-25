ifeq ($(TARGET_NEEDS_LINEAGE_ISFP_PERM), true)
PRODUCT_COPY_FILES += \
    vendor/kasumi/config/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml
endif

PRODUCT_KASUMI_VARIANT :=
ifeq ($(KASUMI_BUILD_TYPE),gapps)
ifeq ($(TARGET_GAPPS_ARCH),)
$(warning TARGET_GAPPS_ARCH is not set, attempting to detect arm64 app support)
ifeq ($(TARGET_SUPPORTS_64_BIT_APPS), true)
$(warning arm64 support is present, setting TARGET_GAPPS_ARCH to arm64)
TARGET_GAPPS_ARCH := arm64
else
$(warning arm64 app support is unavailable, setting TARGET_GAPPS_ARCH to arm)
TARGET_GAPPS_ARCH := arm
endif
endif
PRODUCT_KASUMI_VARIANT := -GApps
$(call inherit-product, vendor/gapps/$(TARGET_GAPPS_ARCH)/$(TARGET_GAPPS_ARCH)-vendor.mk)
endif

ifeq ($(KASUMI_BUILD_TYPE),auroraoss)
PRODUCT_KASUMI_VARIANT := -AuroraOSS
endif

# Different if-else statement to simplify setting OTA URL
ifneq ($(filter gapps auroraoss,$(KASUMI_BUILD_TYPE)),)
PRODUCT_PROPERTY_OVERRIDES += lineage.updater.uri=https://raw.github.com/ProjectKasumi/vendor_kasumiota/kasumi-v2/$(KASUMI_BUILD_TYPE)/{device}.json
endif
