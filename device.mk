#
# Copyright (C) 2020 Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# include board vendor blobs
$(call inherit-product-if-exists, vendor/lenovo/X606X/X606X-vendor.mk)

# API
PRODUCT_SHIPPING_API_LEVEL := 29

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1200

# Soong Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_configuration.xml

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0_system \
    android.hidl.manager@1.0_system \
    libhidltransport \
    libhwbinder

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.mt6765 \
    init.mt6765.rc \
    fstab.mt8768 \
    init.mt8768.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6765:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6765

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt8768:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt8768

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.mt6765.rc:$(TARGET_COPY_OUT_RAMDISK)/init.mt6765.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.mt8768.rc:$(TARGET_COPY_OUT_RAMDISK)/init.mt8768.rc

PRODUCT_COPY_FILES += \
    vendor/lenovo/X606X/proprietary/vendor/etc/fstab.mt6765:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.mt6765
    
# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.mapper@2.0-impl-2.1 \
    android.hardware.memtrack@1.0-service \
    android.hardware.memtrack@1.0-impl \
    gralloc.default \
    libhwc2on1adapter \
    libhwc2onfbadapter

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-service \
    android.hardware.health@2.0-impl

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service \
    android.hardware.drm@1.2-service.clearkey \
    android.hardware.drm@1.2-service.widevine

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service \
    android.hardware.gatekeeper@1.0-impl

# Keymaster
PRODUCT_PACKAGES += \
    libkeymaster4.vendor

