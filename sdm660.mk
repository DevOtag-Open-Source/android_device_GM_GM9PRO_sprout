#
# Copyright (C) 2017-2018 The LineageOS Project
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


# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 560dpi
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service \
    bootctrl.sdm660 \

PRODUCT_PACKAGES_DEBUG += \
    bootctl

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.sdm660 \
    libgptutils \
    libz

# Boot animation
TARGET_SCREEN_HEIGHT := 2160
TARGET_SCREEN_WIDTH := 1080

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    copybit.sdm660 \
    gralloc.sdm660 \
    hwcomposer.sdm660 \
    libdisplayconfig \
    liboverlay \
    libqdMetaData.system \
    libtinyxml \
    libvulkan \
    memtrack.sdm660

# IPACM
PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml \
    libipanat \
    liboffloadhal

# LED packages
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.sdm660-common

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.0-impl \
    android.hardware.nfc@1.0-service \
    com.android.nfc_extras \
    nfc_nci.sdm660 \
    NfcNci \
    nqnfcee_access.xml \
    nqnfcse_access.xml \
    Tag

PRODUCT_COPY_FILES += \
    device/bq/sdm660-common/configs/nfc/libnfc-brcm_NCI2_0.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-brcm_NCI2_0.conf \
    device/bq/sdm660-common/configs/nfc/libnfc-brcm.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-brcm.conf \
    device/bq/sdm660-common/configs/nfc/libnfc-mtp_default.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-mtp_default.conf \
    device/bq/sdm660-common/configs/nfc/libnfc-mtp_rf1.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-mtp_rf1.conf \
    device/bq/sdm660-common/configs/nfc/libnfc-mtp_rf2.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-mtp_rf2.conf \
    device/bq/sdm660-common/configs/nfc/libnfc-mtp-NQ3XX.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-mtp-NQ3XX.conf \
    device/bq/sdm660-common/configs/nfc/libnfc-mtp-NQ4XX.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-mtp-NQ4XX.conf \
    device/bq/sdm660-common/configs/nfc/libnfc-nxp_default.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp_default.conf \
    device/bq/sdm660-common/configs/nfc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf \
    device/bq/sdm660-common/configs/nfc/libnfc-qrd_default.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-qrd_default.conf \
    device/bq/sdm660-common/configs/nfc/libnfc-qrd_rf1.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-qrd_rf1.conf \
    device/bq/sdm660-common/configs/nfc/libnfc-qrd_rf2.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-qrd_rf2.conf \
    device/bq/sdm660-common/configs/nfc/libnfc-qrd-NQ3XX.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-qrd-NQ3XX.conf \
    device/bq/sdm660-common/configs/nfc/libnfc-qrd-NQ4XX.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-qrd-NQ4XX.conf

PRODUCT_COPY_FILES += \
    device/bq/sdm660-common/configs/powerhint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.xml

# Seccomp
PRODUCT_COPY_FILES += \
    device/bq/sdm660-common/seccomp/mediacodec-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    device/bq/sdm660-common/seccomp/mediaextractor-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

# Update engine
PRODUCT_PACKAGES += \
    brillo_update_payload \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.1-service.sdm660-common

# Wi-Fi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    hostapd \
    hostapd_cli \
    libqsap_sdk \
    libQWiFiSoftApCfg \
    libwifi-hal-qcom \
    wificond \
    wpa_supplicant \
    wpa_supplicant.conf
