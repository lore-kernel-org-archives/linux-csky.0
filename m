Return-Path: <SRS0=wqK1=T7=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB35C28CC3
	for <linux-csky@archiver.kernel.org>; Fri, 31 May 2019 06:40:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7B21426474
	for <linux-csky@archiver.kernel.org>; Fri, 31 May 2019 06:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559284803;
	bh=GaQEbGwqGytdxZMVruSly3IEX0Wlo2Da0CsNByni+Tg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=sXRh6vrjRQVpI/v22cNyuX4PNXuTy6O2PB1Z43lQJ9U9OgIgzeUIrswYEfWVUEflU
	 RLlzwpptHTtyOG/Q3v3Dyzgy/WmSiU/amkFf9Iss6EmkG2mcHZb0F4Vo5ZbH6f+uKg
	 +K3g5t/B/9RAX0gEbJT2WBxyXcmJFVQJBVKPdGzI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbfEaGkD (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Fri, 31 May 2019 02:40:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:47870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726386AbfEaGkD (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Fri, 31 May 2019 02:40:03 -0400
Received: from localhost.localdomain (unknown [223.93.147.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 402212649F;
        Fri, 31 May 2019 06:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559284802;
        bh=GaQEbGwqGytdxZMVruSly3IEX0Wlo2Da0CsNByni+Tg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=toUx7QGvdhbTkdGxWmuTHomEphEf0I9Hty6xwEZU9oafa2OiqrubJ5Zw+ivYq4gkY
         NtzmzjvLBA11tmj9p1VswVYHX+jFv8vmaP313tlT2o0KxgWVg/JEUdTC4ogvLgf+qq
         8Ou2ioZCDHuLgmULK5/PAM6yIGg6P+7jO1OGrzj4=
From:   guoren@kernel.org
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be
Cc:     linux-csky@vger.kernel.org, buildroot@buildroot.org,
        Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH V4 03/11] arch/csky: Add ck860 supported
Date:   Fri, 31 May 2019 14:39:00 +0800
Message-Id: <1559284748-32011-4-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559284748-32011-1-git-send-email-guoren@kernel.org>
References: <1559284748-32011-1-git-send-email-guoren@kernel.org>
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

From: Guo Ren <ren_guo@c-sky.com>

ck860 is newest CPU core of C-SKY with high performance &
SMP supported.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.csky | 5 ++++-
 arch/arch.mk.csky   | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.csky b/arch/Config.in.csky
index 3817a2d..af9bbd5 100644
--- a/arch/Config.in.csky
+++ b/arch/Config.in.csky
@@ -13,11 +13,14 @@ config BR2_ck807
 config BR2_ck810
 	bool "ck810"
 
+config BR2_ck860
+	bool "ck860"
+
 endchoice
 
 config BR2_CSKY_FPU
 	bool "Enable FPU coprocessor"
-	depends on BR2_ck810 || BR2_ck807
+	depends on BR2_ck810 || BR2_ck807 || BR2_ck860
 	help
 	  You can say N here if your C-SKY CPU doesn't have a
 	  Floating-Point Coprocessor or if you don't need FPU support
diff --git a/arch/arch.mk.csky b/arch/arch.mk.csky
index f2c90eb..fb59ae2 100644
--- a/arch/arch.mk.csky
+++ b/arch/arch.mk.csky
@@ -11,6 +11,8 @@ else ifeq ($(BR2_ck807),y)
 GCC_TARGET_CPU := ck807
 else ifeq ($(BR2_ck810),y)
 GCC_TARGET_CPU := ck810
+else ifeq ($(BR2_ck860),y)
+GCC_TARGET_CPU := ck860
 endif
 
 ifeq ($(BR2_CSKY_FPU),y)
-- 
2.7.4

