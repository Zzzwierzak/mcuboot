################################################################################
# \file libs.mk
# \version 1.0
#
# \brief
# Makefile to describe libraries needed for Cypress MCUBoot-based applications.
#
################################################################################
# \copyright
# Copyright 2018-2019 Cypress Semiconductor Corporation
# SPDX-License-Identifier: Apache-2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
################################################################################

################################################################################
# PDL library
################################################################################
PDL_VERSION = 121
#
CUR_LIBS_PATH = $(CURDIR)/libs

# Collect source files for PDL
SOURCES_PDL := $(wildcard $(CUR_LIBS_PATH)/pdl/psoc6pdl/drivers/source/*.c)

# Collect source files for Retarget-io
SOURCES_RETARGET_IO := $(wildcard $(CUR_LIBS_PATH)/retarget-io/*.c)

# Collect source files for HAL
SOURCES_HAL := $(wildcard $(CUR_LIBS_PATH)/psoc6hal/COMPONENT_PSOC6HAL/source/*.c)
SOURCES_HAL += $(wildcard $(CUR_LIBS_PATH)/psoc6hal/COMPONENT_PSOC6HAL/source/pin_packages/*.c)
SOURCES_HAL += $(wildcard $(CUR_LIBS_PATH)/psoc6hal/COMPONENT_PSOC6HAL/source/triggers/*.c)

# Cy secureboot utils
SOURCES_SECBOOT_UTILS := $(wildcard $(CUR_LIBS_PATH)/cy_secureboot_utils/cy_jwt/*.c)
SOURCES_SECBOOT_UTILS += $(wildcard $(CUR_LIBS_PATH)/cy_secureboot_utils/cy_secure_utils/*.c)
SOURCES_SECBOOT_UTILS += $(wildcard $(CUR_LIBS_PATH)/cy_secureboot_utils/cy_base64/base64/*.c)
SOURCES_SECBOOT_UTILS += $(wildcard $(CUR_LIBS_PATH)/cy_secureboot_utils/cy_cjson/cJSON/*.c)
SOURCES_SECBOOT_UTILS += $(wildcard $(CUR_LIBS_PATH)/cy_secureboot_utils/protections/*.c)

# PDL related include directories
INCLUDE_DIRS_PDL := $(CUR_LIBS_PATH)/pdl/psoc6pdl/drivers/include
INCLUDE_DIRS_PDL += $(CUR_LIBS_PATH)/pdl/psoc6pdl/devices/include/ip
INCLUDE_DIRS_PDL += $(CUR_LIBS_PATH)/pdl/psoc6pdl/devices/include
INCLUDE_DIRS_PDL += $(CUR_LIBS_PATH)/pdl/psoc6pdl/cmsis/include

# Retarget-io related include directories
INCLUDE_DIRS_RETARGET_IO := $(CUR_LIBS_PATH)/retarget-io

# Collect source files for MbedTLS
INCLUDE_DIRS_MBEDTLS := $(CUR_LIBS_PATH)/mbedtls/crypto/include

# core-libs related include directories
INCLUDE_DIRS_CORE_LIB := $(CUR_LIBS_PATH)/core-lib/include

# Include secure bootloader utility dependencies
INCLUDE_DIRS_SECBOOT_UTILS := $(CUR_LIBS_PATH)/cy_secureboot_utils/cy_secure_utils
INCLUDE_DIRS_SECBOOT_UTILS += $(CUR_LIBS_PATH)/cy_secureboot_utils/cy_jwt
INCLUDE_DIRS_SECBOOT_UTILS += $(CUR_LIBS_PATH)/cy_secureboot_utils/cy_cjson/cJSON
INCLUDE_DIRS_SECBOOT_UTILS += $(CUR_LIBS_PATH)/cy_secureboot_utils/cy_base64
INCLUDE_DIRS_SECBOOT_UTILS += $(CUR_LIBS_PATH)/cy_secureboot_utils/protections
INCLUDE_DIRS_SECBOOT_UTILS += $(CUR_LIBS_PATH)/cy_secureboot_utils/protections/protections_config

# core-libs related include directories
INCLUDE_DIRS_HAL := $(CUR_LIBS_PATH)/psoc6hal/include
INCLUDE_DIRS_HAL += $(CUR_LIBS_PATH)/psoc6hal/COMPONENT_PSOC6HAL/include
INCLUDE_DIRS_HAL += $(CUR_LIBS_PATH)/psoc6hal/COMPONENT_PSOC6HAL/include/pin_packages
INCLUDE_DIRS_HAL += $(CUR_LIBS_PATH)/psoc6hal/COMPONENT_PSOC6HAL/include/triggers

# Collected source files for libraries
SOURCES_LIBS := $(SOURCES_PDL)
SOURCES_LIBS += $(SOURCES_RETARGET_IO)
SOURCES_LIBS += $(SOURCES_HAL)
SOURCES_LIBS += $(SOURCES_SECBOOT_UTILS)

# Collected include directories for libraries
INCLUDE_DIRS_LIBS := $(addprefix -I,$(INCLUDE_DIRS_PDL))
INCLUDE_DIRS_LIBS += $(addprefix -I,$(INCLUDE_DIRS_RETARGET_IO))
INCLUDE_DIRS_LIBS += $(addprefix -I,$(INCLUDE_DIRS_MBEDTLS))
INCLUDE_DIRS_LIBS += $(addprefix -I,$(INCLUDE_DIRS_CORE_LIB))
INCLUDE_DIRS_LIBS += $(addprefix -I,$(INCLUDE_DIRS_HAL))
INCLUDE_DIRS_LIBS += $(addprefix -I,$(INCLUDE_DIRS_SECBOOT_UTILS))

ASM_FILES_PDL :=
ifeq ($(COMPILER), GCC_ARM)
ASM_FILES_PDL += $(CUR_LIBS_PATH)/pdl/psoc6pdl/drivers/source/TOOLCHAIN_GCC_ARM/cy_syslib_gcc.S
else
$(error Only GCC ARM is supported at this moment)
endif

ASM_FILES_LIBS := $(ASM_FILES_PDL)

# Add define for PDL version
DEFINES_PDL += -DPDL_VERSION=$(PDL_VERSION)

DEFINES_LIBS := $(DEFINES_PLATFORM)
DEFINES_LIBS += $(DEFINES_PDL)
