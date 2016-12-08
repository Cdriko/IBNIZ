LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)



SDL_PATH :=../SDL


LOCAL_C_INCLUDES := $(LOCAL_PATH)/$(SDL_PATH)/include
LOCAL_C_INCLUDES += $(LOCAL_PATH)
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)

########################
# prepare vm_slow.a
#include $(CLEAR_VARS)
#LOCAL_MODULE    := pre_vm_slow
#LOCAL_MODULE_FILENAME := vm_slow
#LOCAL_SRC_FILES := vm_slow.c
#LOCAL_MODULE_CLASS := STATIC_LIBRARIES
#LOCAL_MODULE_SUFFIX := .c

# $(BUILD_PREBUILT)
#include $(BUILD_STATIC_LIBRARY)
#include $(BUILD_STATIC_LIBRARY)
########################
#LOCAL_MODULE := inner
#LOCAL_MODULE_FILENAME := libinner
#LOCAL_SRC_FILES := inner-module.c

#include $(BUILD_SHARED_LIBRARY)

########################
# prepare lib1
#include $(CLEAR_VARS)
#LOCAL_MODULE    := pre_compiler
#LOCAL_SRC_FILES := compiler.so
#include $(PREBUILT_SHARED_LIBRARY)
########################

########################
# prepare lib2
#include $(CLEAR_VARS)
#LOCAL_MODULE    := pre_clipboard
#LOCAL_SRC_FILES := clipboard.so
#include $(PREBUILT_SHARED_LIBRARY)
########################
########################
# prepare lib3
#include $(CLEAR_VARS)
#LOCAL_MODULE    := pre_ibniz
#LOCAL_SRC_FILES := ibniztotal.a
#include $(PREBUILT_SHARED_LIBRARY)
########################

include $(CLEAR_VARS)

LOCAL_MODULE := main

# Add your application source files here...
LOCAL_SRC_FILES := $(SDL_PATH)/src/main/android/SDL_android_main.c \
	ui_sdl.c\
	vm_slow.c\
	compiler.c\
	clipboard.c\
	

#LOCAL_STATIC_LIBRARIES += pre_vm_slow
#include $(BUILD_STATIC_LIBRARY)
#LOCAL_STATIC_LIBS:=ibniztotal.a

#LOCAL_SHARED_LIBRARIES := pre_compiler	
#LOCAL_SHARED_LIBRARIES := pre_clipboard
#LOCAL_SHARED_LIBRARIES := pre_ui_sdl

LOCAL_SHARED_LIBRARIES := SDL2

LOCAL_LDLIBS := -lGLESv1_CM -lGLESv2 -llog

include $(BUILD_SHARED_LIBRARY)
