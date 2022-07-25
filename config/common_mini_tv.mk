# This config is for legacy purposes, there are no atv product size variants

# Inherit common atv Lineage stuff
CUSTOM_VENDOR_DIR ?= vendor/kasumi
$(call inherit-product, $(CUSTOM_VENDOR_DIR)/config/common_tv.mk)
