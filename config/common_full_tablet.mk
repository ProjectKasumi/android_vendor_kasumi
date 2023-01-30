# Inherit full common Kasumi stuff
$(call inherit-product, vendor/kasumi/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    androidx.window.extensions \
    LatinIME

# Include Kasumi LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/kasumi/overlay/dictionaries
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/kasumi/overlay/dictionaries

$(call inherit-product, vendor/kasumi/config/telephony.mk)
