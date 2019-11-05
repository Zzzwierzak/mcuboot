/*
 *  Copyright (C) 2006-2015, ARM Limited, All Rights Reserved
 *  Copyright (C) 2019 Cypress Semiconductor Corporation
 *  SPDX-License-Identifier: Apache-2.0
 *
 *  Licensed under the Apache License, Version 2.0 (the "License"); you may
 *  not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 *  WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

/**
 * \file fb_aes_alt.h
 * \ version 1.0
 *
 * \brief   This file contains AES definitions and functions.
 *
 *          The Advanced Encryption Standard (AES) specifies a FIPS-approved
 *          cryptographic algorithm that can be used to protect electronic
 *          data.
 *
 *          The AES algorithm is a symmetric block cipher that can
 *          encrypt and decrypt information. For more information, see
 *          <em>FIPS Publication 197: Advanced Encryption Standard</em> and
 *          <em>ISO/IEC 18033-2:2006: Information technology -- Security
 *          techniques -- Encryption algorithms -- Part 2: Asymmetric
 *          ciphers</em>.
 *
 *          The AES-XTS block mode is standardized by NIST SP 800-38E
 *          <https://nvlpubs.nist.gov/nistpubs/legacy/sp/nistspecialpublication800-38e.pdf>
 *          and described in detail by IEEE P1619
 *          <https://ieeexplore.ieee.org/servlet/opac?punumber=4375278>.
 */

#ifndef AES_ALT_H
#define AES_ALT_H

#if defined(FB_MBEDTLS_AES_ALT)
// Regular implementation

#define CY_CIPHER_MODE_CBC_ALT

#include <cy_crypto_common.h>
#include <cy_crypto_core_aes.h>
#include "cy_syslib.h"

#include "cy_crypto_common.h"

/**
 * \brief The AES context-type definition.
 */
typedef struct fb_mbedtls_aes_context
{
    fb_cy_hw_crypto_t obj;
    fb_cy_stc_crypto_aes_state_t aes_state;
    fb_cy_stc_crypto_aes_buffers_t aes_buffers;
}
fb_mbedtls_aes_context;

#endif /* MBEDTLS_AES_ALT */

#endif /* aes_alt.h */
