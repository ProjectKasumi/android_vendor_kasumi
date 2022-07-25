# Inherit common Lineage stuff
CUSTOM_VENDOR_DIR ?= vendor/kasumi
$(call inherit-product, $(CUSTOM_VENDOR_DIR)/config/common_mobile.mk)

PRODUCT_SIZE := full

# Include {Lato,Rubik} fonts
$(call inherit-product-if-exists, external/google-fonts/lato/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/rubik/fonts.mk)

# Fonts
PRODUCT_PACKAGES += \
    fonts_customization.xml \
    FontLatoOverlay \
    FontRubikOverlay

# Recorder
PRODUCT_PACKAGES += \
    Recorder
