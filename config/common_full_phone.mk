# Inherit full common Kasumi stuff
$(call inherit-product, vendor/kasumi/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Kasumi LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/kasumi/overlay/dictionaries
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/kasumi/overlay/dictionaries

# Enable support of one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode=true

$(call inherit-product, vendor/kasumi/config/telephony.mk)
