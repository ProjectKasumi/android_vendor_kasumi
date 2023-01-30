# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017,2020 The LineageOS Project
# Copyright (C) 2021,2022 Beru Kobayashi (On behalf of Project Kasumi)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# -----------------------------------------------------------------
# Lineage OTA update package

KASUMI_TARGET_PACKAGE := $(PRODUCT_OUT)/Kasumi-$(KASUMI_VERSION).zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

.PHONY: bandori
ifeq ($(KASUMI_BUILDTYPE),OFFICIAL)
ifneq ($(TARGET_NO_ENFORCE_SIGNING),true)
# This build is marked as official and requires signing. Some official devices might
# not have a partition built so we're not enforcing signing for now.
# TODO: Unify the process inside a separate makefile/shell script and call it instead.
bandori: $(INTERNAL_OTA_PACKAGE_TARGET) otatools target-files-package
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(KASUMI_TARGET_PACKAGE)
	$(hide) mv $(KASUMI_TARGET_PACKAGE) $(KASUMI_TARGET_PACKAGE).unsigned
	$(hide) $(HOST_OUT)/bin/sign_target_files_apks -o -d vendor/priv $(PRODUCT_OUT)/obj/PACKAGING/target_files_intermediates/*-target_files-*.zip $(PRODUCT_OUT)/signed-target_files.zip >&2
	$(hide) $(HOST_OUT)/bin/ota_from_target_files -k vendor/priv/releasekey --block --backup=true $(PRODUCT_OUT)/signed-target_files.zip $(KASUMI_TARGET_PACKAGE) >&2
	$(hide) $(SHA256) $(KASUMI_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(KASUMI_TARGET_PACKAGE).sha256sum
	@echo "// Project Kasumi //" >&2
	@echo "// Same as always //" >&2
	@echo "" >&2
	@echo "Package Complete: $(KASUMI_TARGET_PACKAGE)" >&2
	@echo "" >&2
	@echo "To get started, get your custom recovery up and slap this ROM in!" >&2
	@echo "Based on LineageOS, brought to you by Yuki (@yukiqt) and Beru Kobayashi (@WindowZ414)." >&2
else
# Builds that can't be signed must have signature enforcement disabled using the flag above.
bandori: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(KASUMI_TARGET_PACKAGE)
	$(hide) $(SHA256) $(KASUMI_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(KASUMI_TARGET_PACKAGE).sha256sum
	@echo "// Project Kasumi //" >&2
	@echo "// Same as always //" >&2
	@echo "" >&2
	@echo "Package Complete: $(KASUMI_TARGET_PACKAGE)" >&2
	@echo "" >&2
	@echo "To get started, get your custom recovery up and slap this ROM in!" >&2
	@echo "Based on LineageOS, brought to you by Yuki (@yukiqt) and Beru Kobayashi (@WindowZ414)." >&2
endif
else
# Builds that aren't marked as official aren't required to be signed.
bandori: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(KASUMI_TARGET_PACKAGE)
	$(hide) $(SHA256) $(KASUMI_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(KASUMI_TARGET_PACKAGE).sha256sum
	@echo "// Project Kasumi //" >&2
	@echo "// Same as always //" >&2
	@echo "" >&2
	@echo "Package Complete: $(KASUMI_TARGET_PACKAGE)" >&2
	@echo "" >&2
	@echo "To get started, get your custom recovery up and slap this ROM in!" >&2
	@echo "Based on LineageOS, brought to you by Yuki (@yukiqt) and Beru Kobayashi (@WindowZ414)." >&2
endif
