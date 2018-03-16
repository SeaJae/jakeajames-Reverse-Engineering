include $(THEOS)/makefiles/common.mk

TWEAK_NAME = fortintejb
fortintejb_FILES = Tweak.xm
CFLAGS += -Wno-everything
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 FortniteHelper"
