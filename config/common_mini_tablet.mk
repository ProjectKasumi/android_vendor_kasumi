# Inherit mini common Lineage stuff
$(call inherit-product, $(CUSTOM_VENDOR_DIR)/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    androidx.window.extensions \
    LatinIME

$(call inherit-product, $(CUSTOM_VENDOR_DIR)/config/telephony.mk)
