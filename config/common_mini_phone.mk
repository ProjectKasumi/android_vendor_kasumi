# Inherit mini common Lineage stuff
CUSTOM_VENDOR_DIR ?= vendor/kasumi
$(call inherit-product, $(CUSTOM_VENDOR_DIR)/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

$(call inherit-product, $(CUSTOM_VENDOR_DIR)/config/telephony.mk)
