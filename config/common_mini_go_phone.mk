# Set Lineage specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit mini common Kasumi stuff
$(call inherit-product, vendor/kasumi/config/common_mini_phone.mk)
