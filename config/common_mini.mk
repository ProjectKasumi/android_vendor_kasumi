# Inherit mini common Lineage stuff
CUSTOM_VENDOR_DIR ?= vendor/kasumi
$(call inherit-product, $(CUSTOM_VENDOR_DIR)/config/common_mobile.mk)

PRODUCT_SIZE := mini
