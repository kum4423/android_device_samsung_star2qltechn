#
# Copyright (C) 2023 The LineageOS Project
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
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)

# Product API level
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o.mk)

# Inherit from star2lte device
$(call inherit-product, device/samsung/star2qltechn/device.mk)

# Boot Animation
TARGET_SCREEN_HEIGHT := 2960
TARGET_SCREEN_WIDTH := 1440

# Inherit some common Evolution X stuff.
$(call inherit-product, vendor/evolution/config/common_full_phone.mk)
EVO_BUILD_TYPE := OFFICIAL
TARGET_BOOT_ANIMATION_RES := 1440
TARGET_SUPPORTS_GOOGLE_RECORDER := true
TARGET_INCLUDE_LIVE_WALLPAPERS := false
TARGET_SUPPORTS_QUICK_TAP := true


## Device identifier, this must come after all inclusions
PRODUCT_NAME := evolution_star2qltechn
PRODUCT_DEVICE := star2qltechn
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-G965F
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung

# ArrowOS Properties
DEVICE_MAINTAINER := Kum4423

BUILD_FINGERPRINT := "samsung/star2qltechn/star2qltechn:10/QP1A.190711.020/G965FXXUHFVK1:user/release-keys"

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=star2qltechn \
    PRIVATE_BUILD_DESC="star2qltechn-user 10 QP1A.190711.020 G965FXXUHFVK1 release-keys"

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.PDA=G965FXXUHFVK1 \
    ro.build.fingerprint=samsung/star2qltechn/star2qltechn:10/QP1A.190711.020/G965FXXUHFVK1:user/release-keys
