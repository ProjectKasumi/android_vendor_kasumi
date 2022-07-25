# Set Lineage specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit mini common Lineage stuff
CUSTOM_VENDOR_DIR ?= vendor/kasumi
$(call inherit-product, $(CUSTOM_VENDOR_DIR)/config/common_mini_phone.mk)
