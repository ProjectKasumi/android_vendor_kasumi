# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# LineageOS System Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.kasumi.version=$(KASUMI_VERSION) \
    ro.kasumi.releasetype=$(KASUMI_BUILDTYPE) \
    ro.kasumi.build.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.modversion=$(KASUMI_VERSION) \
    ro.lineagelegal.url=https://lineageos.org/legal

# LineageOS Platform Display Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.kasumi.display.version=$(KASUMI_DISPLAY_VERSION)

# LineageOS Platform SDK Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.lineage.build.version.plat.sdk=$(LINEAGE_PLATFORM_SDK_VERSION)

# LineageOS Platform Internal Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.lineage.build.version.plat.rev=$(LINEAGE_PLATFORM_REV)
