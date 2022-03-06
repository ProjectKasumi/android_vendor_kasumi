# Inherit full common Lineage stuff
$(call inherit-product, $(CUSTOM_VENDOR_DIR)/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME \
    NavigationBarMode2ButtonOverlay

# Include Lineage LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += $(CUSTOM_VENDOR_DIR)/overlay/dictionaries

# Enable support of one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode=true

$(call inherit-product, $(CUSTOM_VENDOR_DIR)/config/telephony.mk)
