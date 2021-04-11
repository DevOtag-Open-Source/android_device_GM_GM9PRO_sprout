# Inherit some common RevengeOS stuff.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, vendor/revengeos/config/common.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Vendor blobs
$(call inherit-product-if-exists, vendor/GM/GM9PRO_sprout/GM9PRO_sprout-vendor.mk)

# Device
$(call inherit-product, device/GM/GM9PRO_sprout/device.mk)

# Boot Animation
TARGET_BOOT_ANIMATION_RES := 1080

# Device identifiers
PRODUCT_DEVICE := GM9PRO_sprout
PRODUCT_NAME := revengeos_GM9PRO_sprout
PRODUCT_BRAND := GM
PRODUCT_MODEL := GM 9 Pro
PRODUCT_MANUFACTURER := GM
PRODUCT_RELEASE_NAME := GM9PRO_sprout

PRODUCT_BUILD_PROP_OVERRIDES += \
        PRIVATE_BUILD_DESC="gm9pro-user 9 PKQ1.180904.001 254 release-keys" \
        PRODUCT_NAME="GM" \
        TARGET_DEVICE="GM9PRO_sprout"

BUILD_FINGERPRINT := essential/mata/mata:8.1.0/OPM1.180104.092/224:user/release-keys

PRODUCT_GMS_CLIENTID_BASE := android-GM
