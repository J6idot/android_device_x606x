cmd_testing/include/video/.install := /bin/bash scripts/headers_install.sh testing/include/video ./include/uapi/video edid.h sisfb.h uvesafb.h; /bin/bash scripts/headers_install.sh testing/include/video ./include/video ; /bin/bash scripts/headers_install.sh testing/include/video ./include/generated/uapi/video ; for F in ; do echo "$(pound)include <asm-generic/$$F>" > testing/include/video/$$F; done; touch testing/include/video/.install
