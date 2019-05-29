Return-Path: <SRS0=K7zh=T5=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3967DC04AB3
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 07:19:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 13E4E217D4
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 07:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559114367;
	bh=r6rVZKQ0h8BidCKP4jubLx7SvUdyZh36sv+Qyu5rZLw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=j1pPld5xWd4JnyLCUFhDwty+E8K5fVCLDKmb2qcr8Rr2A30DQ3ly18atgNzKXJXBV
	 4r7ip6JS53AhBVhafbRF5KDItVazQLxOgXldRXNLV+oScXUg09NhCAmNNGgDe26NEZ
	 7YjibIjznKCMCIwMGTH5wxiDLOFwN13FV+k5QlU0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbfE2HT1 (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Wed, 29 May 2019 03:19:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:49406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726683AbfE2HT0 (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Wed, 29 May 2019 03:19:26 -0400
Received: from localhost.localdomain (unknown [223.93.147.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 674162075C;
        Wed, 29 May 2019 07:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559114366;
        bh=r6rVZKQ0h8BidCKP4jubLx7SvUdyZh36sv+Qyu5rZLw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jB7G6XpohMsu7ly8yH8OqmJRpBTy06+xutuFKfQbstMkvrhpnyqEXnMfSSCCRuyWF
         UgqsQmzqFFJEX++hq1ABwabriuWFHCJoLDDAOCOgAMPf9yjRmaaVYsFUxe02//c7NO
         cbUl5fymGhrTBxbBGslprmPWx5N16T//ZyXtOpP0=
From:   guoren@kernel.org
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be
Cc:     linux-csky@vger.kernel.org, buildroot@buildroot.org,
        Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH V3 08/10] package/glibc: Add C-SKY support
Date:   Wed, 29 May 2019 15:18:46 +0800
Message-Id: <1559114328-23357-9-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559114328-23357-1-git-send-email-guoren@kernel.org>
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

From: Guo Ren <ren_guo@c-sky.com>

Add glibc build for C-SKY Architecture.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 package/glibc/7630ed2fa60caea98f500e4a7a51b88f9bf1e176/glibc.hash | 2 ++
 package/glibc/glibc.mk                                            | 3 +++
 toolchain/toolchain-buildroot/Config.in                           | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)
 create mode 100644 package/glibc/7630ed2fa60caea98f500e4a7a51b88f9bf1e176/glibc.hash

diff --git a/package/glibc/7630ed2fa60caea98f500e4a7a51b88f9bf1e176/glibc.hash b/package/glibc/7630ed2fa60caea98f500e4a7a51b88f9bf1e176/glibc.hash
new file mode 100644
index 0000000..a61bd65
--- /dev/null
+++ b/package/glibc/7630ed2fa60caea98f500e4a7a51b88f9bf1e176/glibc.hash
@@ -0,0 +1,2 @@
+# Locally calculated (fetched from https://github.com/c-sky/glibc)
+sha512 9deb2deceefe347d72de13510a5baa3de00f94c684f3b25e136ca3660f61e65a69f2115abb488c2ab0fa93cda8535853ce1e13e186efcc8434ecc4049efd82b5  glibc-7630ed2fa60caea98f500e4a7a51b88f9bf1e176.tar.gz
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 0345f1f..c4ddf8b 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -10,6 +10,9 @@ GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VE
 else ifeq ($(BR2_RISCV_32),y)
 GLIBC_VERSION = 06983fe52cfe8e4779035c27e8cc5d2caab31531
 GLIBC_SITE = $(call github,riscv,riscv-glibc,$(GLIBC_VERSION))
+else ifeq ($(BR2_csky),y)
+GLIBC_VERSION = 7630ed2fa60caea98f500e4a7a51b88f9bf1e176
+GLIBC_SITE = $(call github,c-sky,glibc,$(GLIBC_VERSION))
 else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index beb17a2..d9f16e2 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -48,7 +48,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
 		   BR2_riscv       || BR2_sh         || BR2_sparc64     || \
 		   BR2_x86_64      || BR2_microblaze || BR2_nios2       || \
-		   (BR2_arcle && BR2_ARC_ATOMIC_EXT)
+		   (BR2_arcle && BR2_ARC_ATOMIC_EXT) || BR2_csky
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
-- 
2.7.4

