LOCAL_PATH := $(call my-dir)

sgdisk_src_files := \
    sgdisk.cc \
    gptcl.cc \
    crc32.cc \
    support.cc \
    guid.cc \
    gptpart.cc \
    mbrpart.cc \
    basicmbr.cc \
    mbr.cc \
    gpt.cc \
    bsd.cc \
    parttypes.cc \
    attributes.cc \
    diskio.cc \
    diskio-unix.cc \
    android_popt.cc \

include $(CLEAR_VARS)

LOCAL_CPP_EXTENSION := .cc

LOCAL_C_INCLUDES := $(LOCAL_PATH) external/e2fsprogs/lib
LOCAL_SRC_FILES := $(sgdisk_src_files)

LOCAL_SHARED_LIBRARIES := libext2_uuid

LOCAL_MODULE := sgdisk

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_CPP_EXTENSION := .cc
LOCAL_C_INCLUDES := $(LOCAL_PATH) external/e2fsprogs/lib
LOCAL_SRC_FILES := $(sgdisk_src_files)
LOCAL_STATIC_LIBRARIES := libc libc++_static libm libext2_uuid
LOCAL_MODULE := recovery_sgdisk
LOCAL_MODULE_STEM := sgdisk
LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/sbin
LOCAL_MODULE_TAGS := optional


LOCAL_FORCE_STATIC_EXECUTABLE := true

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_CPP_EXTENSION := .cc

ifeq ($(HOST_OS),darwin)
LOCAL_CFLAGS := -D_FILE_OFFSET_BITS=64 -Doff64_t=off_t
endif

LOCAL_C_INCLUDES := $(LOCAL_PATH) external/e2fsprogs/lib
LOCAL_SRC_FILES := $(sgdisk_src_files)

LOCAL_SHARED_LIBRARIES := libext2_uuid_host

LOCAL_MODULE := sgdisk_host
LOCAL_MODULE_STEM := sgdisk

include $(BUILD_HOST_EXECUTABLE)
