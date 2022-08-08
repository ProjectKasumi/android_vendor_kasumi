# Inherit full common Lineage stuff
CUSTOM_VENDOR_DIR ?= vendor/kasumi
$(call inherit-product, $(CUSTOM_VENDOR_DIR)/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    androidx.window.extensions \
    LatinIME

# Include Lineage LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += $(CUSTOM_VENDOR_DIR)/overlay/dictionaries
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += $(CUSTOM_VENDOR_DIR)/overlay/dictionaries

$(call inherit-product, $(CUSTOM_VENDOR_DIR)/config/telephony.mk)
