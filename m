Return-Path: <SRS0=wqK1=T7=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3342CC04AB6
	for <linux-csky@archiver.kernel.org>; Fri, 31 May 2019 06:39:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 00C6C2649E
	for <linux-csky@archiver.kernel.org>; Fri, 31 May 2019 06:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559284794;
	bh=fd+TyrND1lu+PjOWjy+tOyuHqbjHXHWBnZ+XsZG+tMw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Bb9kkmXYMw4DxT3P+5xW6BdLUBnVDtMWT3hpOes4l5r4jTCWwXk40CaCwGF6bKGzK
	 2uhCpOOp18u+qTLzQ9+96yKtVm5C+5AWkM/VSH2v7wMqv4jOwjPMwbvFbp2xrf79Z1
	 7VK/dyUI+GU7A/nuCOD0rFOR+jeCdQgopEAAPEV0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbfEaGjx (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Fri, 31 May 2019 02:39:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:47738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726386AbfEaGjx (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Fri, 31 May 2019 02:39:53 -0400
Received: from localhost.localdomain (unknown [223.93.147.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 36FD526474;
        Fri, 31 May 2019 06:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559284792;
        bh=fd+TyrND1lu+PjOWjy+tOyuHqbjHXHWBnZ+XsZG+tMw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Sr8WsgDhtjnzKM4IY3XtIUqXXiBpnr8WbNd2FgAXraqJn82EYWmuFJFnmHOY6Ic3f
         356VZOsFbJLuxQQ+WzOu6+mw9x8vzD0tWSrAGsJ1jTiiKgPfV+W39C2/CfJDBNJ8PE
         xRux16P1R/wBKrKv2dn7M6xjgW8M4hLDyMkh+6W8=
From:   guoren@kernel.org
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be
Cc:     linux-csky@vger.kernel.org, buildroot@buildroot.org,
        Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH V4 01/11] arch/csky: Add arch.mk.csky for -mcpu=xxx
Date:   Fri, 31 May 2019 14:38:58 +0800
Message-Id: <1559284748-32011-2-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559284748-32011-1-git-send-email-guoren@kernel.org>
References: <1559284748-32011-1-git-send-email-guoren@kernel.org>
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

From: Guo Ren <ren_guo@c-sky.com>

Add arch.mk.csky for -mcpu=xxx setting and it's clearer.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.csky | 11 -----------
 arch/arch.mk.csky   | 24 ++++++++++++++++++++++++
 2 files changed, 24 insertions(+), 11 deletions(-)
 create mode 100644 arch/arch.mk.csky

diff --git a/arch/Config.in.csky b/arch/Config.in.csky
index e88e4e2..6d87681 100644
--- a/arch/Config.in.csky
+++ b/arch/Config.in.csky
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
index 0000000..a39fbd4
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
+ifeq ($(BR2_CSKY_DSP),y)
+GCC_TARGET_CPU := $(GCC_TARGET_CPU)e
+endif
+
+ifeq ($(BR2_CSKY_FPU),y)
+GCC_TARGET_CPU := $(GCC_TARGET_CPU)f
+endif
+
+endif
-- 
2.7.4

