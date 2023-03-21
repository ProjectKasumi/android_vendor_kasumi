PRODUCT_VERSION_MAJOR = 2
PRODUCT_VERSION_MINOR = 0
PRODUCT_VERSION_MAINTENANCE = 0

ifeq ($(KASUMI_VERSION_APPEND_TIME_OF_DAY),true)
    KASUMI_BUILD_DATE := $(shell date -u +%Y%m%d_%H%M%S)
else
    KASUMI_BUILD_DATE := $(shell date -u +%Y%m%d)
endif

# Set KASUMI_BUILDTYPE from the env RELEASE_TYPE, for jenkins compat

ifndef KASUMI_BUILDTYPE
    ifdef RELEASE_TYPE
        # Starting with "KASUMI_" is optional
        RELEASE_TYPE := $(shell echo $(RELEASE_TYPE) | sed -e 's|^KASUMI_||g')
        KASUMI_BUILDTYPE := $(RELEASE_TYPE)
    endif
endif

# Filter out random types, so it'll reset to UNOFFICIAL
ifeq ($(filter RELEASE NIGHTLY SNAPSHOT EXPERIMENTAL OFFICIAL,$(KASUMI_BUILDTYPE)),)
    KASUMI_BUILDTYPE := UNOFFICIAL
    KASUMI_EXTRAVERSION :=
endif

ifneq ($(filter OFFICIAL RELEASE,$(LINEAGE_BUILDTYPE)),)
    ifeq (,$(wildcard ./vendor/priv/releasekey.pk8))
        $(error Build type is offical, yet vendor/priv does not exist)
    endif
endif

ifeq ($(KASUMI_BUILDTYPE), UNOFFICIAL)
    ifneq ($(TARGET_UNOFFICIAL_BUILD_ID),)
        KASUMI_EXTRAVERSION := -$(TARGET_UNOFFICIAL_BUILD_ID)
    endif
endif

KASUMI_VARIANT :=
ifeq ($(KASUMI_BUILD_TYPE),gapps)
    KASUMI_VARIANT := -GApps
endif

ifeq ($(KASUMI_BUILD_TYPE),auroraoss)
    KASUMI_VARIANT := -AuroraOSS
endif

KASUMI_VERSION_SUFFIX := $(KASUMI_BUILD_DATE)-$(KASUMI_BUILDTYPE)$(KASUMI_VARIANT)$(KASUMI_EXTRAVERSION)-$(KASUMI_BUILD)

# Internal version
ifeq ($(PRODUCT_VERSION_MAINTENANCE), 0)
    KASUMI_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(KASUMI_VERSION_SUFFIX)
else
    KASUMI_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(KASUMI_VERSION_SUFFIX)
endif

# Display version
KASUMI_DISPLAY_VERSION := $(PRODUCT_VERSION_MAJOR)-$(KASUMI_VERSION_SUFFIX)
