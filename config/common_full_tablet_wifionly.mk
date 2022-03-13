# Inherit full common Lineage stuff
$(call inherit-product, vendor/materium/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    androidx.window.extensions \
    LatinIME

# Include Lineage LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/materium/overlay/dictionaries
