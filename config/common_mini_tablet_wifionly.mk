# Inherit mini common Kasumi stuff
$(call inherit-product, vendor/kasumi/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    androidx.window.extensions \
    LatinIME
