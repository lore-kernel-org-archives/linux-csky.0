Return-Path: <SRS0=wqK1=T7=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B99C04AB6
	for <linux-csky@archiver.kernel.org>; Fri, 31 May 2019 06:39:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 250502649E
	for <linux-csky@archiver.kernel.org>; Fri, 31 May 2019 06:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559284799;
	bh=pJKEloif3LoJw3exBfweJl1T5o8FAzxcRXRsPuD2ZkU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Ci2BgdhJeC9r9r9CKQkyyw1NmRPLWI49bUsGaPCoYz5nHTt1rdB9fYA2oZ+652HHc
	 41Ji57RzGeJTrz6XGfp/Us4D1eM4ZWtRkH6EesISLkLIVtzTGAOS3PN1v0Ny8t0tky
	 k7aTtieppAxv+tetEPV1c4Tl+BsxMHAiWlaoOAh4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbfEaGj7 (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Fri, 31 May 2019 02:39:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:47818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726693AbfEaGj6 (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Fri, 31 May 2019 02:39:58 -0400
Received: from localhost.localdomain (unknown [223.93.147.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C6B212647B;
        Fri, 31 May 2019 06:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559284798;
        bh=pJKEloif3LoJw3exBfweJl1T5o8FAzxcRXRsPuD2ZkU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BGjYCuDj4wX3omw/bx4HVU9EzvNUSVsycepbP38AN0foXYfapDE3sZ7Vbgx/XKMMU
         W4ec64uWiScpew8ns9XXiNNNddjfMgCGc177ahaowtPYgRfu2Qvzig1wRraCwjMNnS
         Ec8oCZyGlXmKnMd/0cTzGHQ3ibB4QFfua8XKAO/M=
From:   guoren@kernel.org
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be
Cc:     linux-csky@vger.kernel.org, buildroot@buildroot.org,
        Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH V4 02/11] arch/csky: Change DSP to VDSP for -mcpu
Date:   Fri, 31 May 2019 14:38:59 +0800
Message-Id: <1559284748-32011-3-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559284748-32011-1-git-send-email-guoren@kernel.org>
References: <1559284748-32011-1-git-send-email-guoren@kernel.org>
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

From: Guo Ren <ren_guo@c-sky.com>

DSP extention is no longer used for C-SKY gcc and use VDSP instead of
DSP.

VDSP is C-SKY enhanced extension instruction set for SIMD, AI and DSP
operation. It could be supported by abiv2 (ck807, ck810, ck860).

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.csky | 6 +++---
 arch/arch.mk.csky   | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/Config.in.csky b/arch/Config.in.csky
index 6d87681..3817a2d 100644
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
diff --git a/arch/arch.mk.csky b/arch/arch.mk.csky
index a39fbd4..f2c90eb 100644
--- a/arch/arch.mk.csky
+++ b/arch/arch.mk.csky
@@ -13,12 +13,12 @@ else ifeq ($(BR2_ck810),y)
 GCC_TARGET_CPU := ck810
 endif
 
-ifeq ($(BR2_CSKY_DSP),y)
-GCC_TARGET_CPU := $(GCC_TARGET_CPU)e
-endif
-
 ifeq ($(BR2_CSKY_FPU),y)
 GCC_TARGET_CPU := $(GCC_TARGET_CPU)f
 endif
 
+ifeq ($(BR2_CSKY_VDSP),y)
+GCC_TARGET_CPU := $(GCC_TARGET_CPU)v
+endif
+
 endif
-- 
2.7.4

