cmd_testing/include/rdma/hfi/.install := /bin/bash scripts/headers_install.sh testing/include/rdma/hfi ./include/uapi/rdma/hfi hfi1_user.h; /bin/bash scripts/headers_install.sh testing/include/rdma/hfi ./include/rdma/hfi ; /bin/bash scripts/headers_install.sh testing/include/rdma/hfi ./include/generated/uapi/rdma/hfi ; for F in ; do echo "$(pound)include <asm-generic/$$F>" > testing/include/rdma/hfi/$$F; done; touch testing/include/rdma/hfi/.install
