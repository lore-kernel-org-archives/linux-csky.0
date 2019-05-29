Return-Path: <SRS0=K7zh=T5=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A8E7C07542
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 07:19:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2668E21734
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 07:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559114346;
	bh=pnwwzko4v5z6BKuTLAMn0vFEq5UzphcQap7qMaK7S7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=uEHHfvOgXhXoFV9aNOYbLbo3ljG6j4GRHrmYt2XCU7flqauQ7mTxcQMnkXU/JduR7
	 pYLad27lFzkRNLAX46VJODoClzZhwsuXg9NFDj+WSU8jn2jlXGD8ZrrMJR63LLKgNE
	 NiQTUx8Pe7l/DjClFsRigaR6wL4WC3CU945aCGFM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbfE2HTF (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Wed, 29 May 2019 03:19:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:49020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726543AbfE2HTE (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Wed, 29 May 2019 03:19:04 -0400
Received: from localhost.localdomain (unknown [223.93.147.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2E4052075C;
        Wed, 29 May 2019 07:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559114344;
        bh=pnwwzko4v5z6BKuTLAMn0vFEq5UzphcQap7qMaK7S7I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M6xGxZT2ceMccAFDBbqZAgMdLRvG79Us4jlPv5xo+CeWQ6bnu9B8ThTMSR5eRa6Nu
         BKSuoSNfR63aQ0UoHfMJoKqCcoMtFSpIURhFbQrY9S8qktztSGSX/+4jh0I1aO5rmn
         VsOjRILCxuh9+ebRhxcaHbSzydE9sPPsFGmwMyCw=
From:   guoren@kernel.org
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be
Cc:     linux-csky@vger.kernel.org, buildroot@buildroot.org,
        Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH V3 01/10] arch/csky: Use VDSP instead of DSP
Date:   Wed, 29 May 2019 15:18:39 +0800
Message-Id: <1559114328-23357-2-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559114328-23357-1-git-send-email-guoren@kernel.org>
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

From: Guo Ren <ren_guo@c-sky.com>

Use VDSP enhanced instructions Co-processor instead of DSP.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 arch/Config.in.csky | 17 +++--------------
 arch/arch.mk.csky   | 24 ++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 14 deletions(-)
 create mode 100644 arch/arch.mk.csky

diff --git a/arch/Config.in.csky b/arch/Config.in.csky
index e88e4e2..3817a2d 100644
--- a/arch/Config.in.csky
+++ b/arch/Config.in.csky
@@ -23,9 +23,9 @@ config BR2_CSKY_FPU
 	  Floating-Point Coprocessor or if you don't need FPU support
 	  for your user-space programs.
 
-config BR2_CSKY_DSP
-	bool "Enable DSP enhanced instructions"
-	depends on BR2_ck810 || BR2_ck807
+config BR2_CSKY_VDSP
+	bool "Enable VDSP enhanced instructions Co-processor"
+	depends on BR2_CSKY_FPU
 
 config BR2_ARCH
 	default "csky"
@@ -33,16 +33,5 @@ config BR2_ARCH
 config BR2_ENDIAN
 	default "LITTLE"
 
-config BR2_GCC_TARGET_CPU
-	default "ck610"		if (BR2_ck610 && !BR2_CSKY_FPU && !BR2_CSKY_DSP)
-	default "ck807"		if (BR2_ck807 && !BR2_CSKY_FPU && !BR2_CSKY_DSP)
-	default "ck807e"	if (BR2_ck807 && !BR2_CSKY_FPU &&  BR2_CSKY_DSP)
-	default "ck807f"	if (BR2_ck807 &&  BR2_CSKY_FPU && !BR2_CSKY_DSP)
-	default "ck807ef"	if (BR2_ck807 &&  BR2_CSKY_FPU &&  BR2_CSKY_DSP)
-	default "ck810"		if (BR2_ck810 && !BR2_CSKY_FPU && !BR2_CSKY_DSP)
-	default "ck810e"	if (BR2_ck810 && !BR2_CSKY_FPU &&  BR2_CSKY_DSP)
-	default "ck810f"	if (BR2_ck810 &&  BR2_CSKY_FPU && !BR2_CSKY_DSP)
-	default "ck810ef"	if (BR2_ck810 &&  BR2_CSKY_FPU &&  BR2_CSKY_DSP)
-
 config BR2_READELF_ARCH_NAME
 	default "CSKY"
diff --git a/arch/arch.mk.csky b/arch/arch.mk.csky
new file mode 100644
index 0000000..f2c90eb
--- /dev/null
+++ b/arch/arch.mk.csky
@@ -0,0 +1,24 @@
+#
+# Configure the GCC_TARGET_ARCH variable and append the
+# appropriate C-SKY ISA extensions.
+#
+
+ifeq ($(BR2_csky),y)
+
+ifeq ($(BR2_ck610),y)
+GCC_TARGET_CPU := ck610
+else ifeq ($(BR2_ck807),y)
+GCC_TARGET_CPU := ck807
+else ifeq ($(BR2_ck810),y)
+GCC_TARGET_CPU := ck810
+endif
+
+ifeq ($(BR2_CSKY_FPU),y)
+GCC_TARGET_CPU := $(GCC_TARGET_CPU)f
+endif
+
+ifeq ($(BR2_CSKY_VDSP),y)
+GCC_TARGET_CPU := $(GCC_TARGET_CPU)v
+endif
+
+endif
-- 
2.7.4

