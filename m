Return-Path: <SRS0=K7zh=T5=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88849C04AB3
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 07:19:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 62647217D4
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 07:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559114359;
	bh=G2IpkGnp9i0b+EpA2hQCUf9YlJRFcuXejLFULeqEZds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=daJO0GUNwKXuw5pTdMhUT/pJth+0IajbUy28JN4jFFlueQiWqxWXcQyMDs5uprS8F
	 WOPIrgQJi0dm0QJBZYLvsNFXtEbbdhNDZiL2cVudM9/lKi5gDyxEGDm6Exwd+OY8QA
	 /0bjAr/fFr4joBOyz57Y4EwOLc81g0L1Ilriokx4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbfE2HTT (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Wed, 29 May 2019 03:19:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:49236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726683AbfE2HTT (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Wed, 29 May 2019 03:19:19 -0400
Received: from localhost.localdomain (unknown [223.93.147.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 66120217D9;
        Wed, 29 May 2019 07:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559114357;
        bh=G2IpkGnp9i0b+EpA2hQCUf9YlJRFcuXejLFULeqEZds=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=H/QNJ+jsMXpzgV1gNf2O+/PMY1GOLKCJjYAqfdjnXWlaFPHrZrCEPmAA+0z8OHRhG
         sE/kBsbHDtEY+7EAbTbOilG8MwKeTX7KLzpD4kTuJwYbl+bssREC5suMvNuXJiEeaE
         ql+3JJbDoXt2eAvzivodeTxxGnobfdyTyClQmAHI=
From:   guoren@kernel.org
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be
Cc:     linux-csky@vger.kernel.org, buildroot@buildroot.org,
        Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH V3 05/10] package/binutils: Add C-SKY support
Date:   Wed, 29 May 2019 15:18:43 +0800
Message-Id: <1559114328-23357-6-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559114328-23357-1-git-send-email-guoren@kernel.org>
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

From: Guo Ren <ren_guo@c-sky.com>

Add binutils build for C-SKY Architecture.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 package/binutils/Config.in.host | 11 ++++++++++-
 package/binutils/binutils.hash  |  2 ++
 package/binutils/binutils.mk    |  7 +++++++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index c3c3beb..d2ca8af 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -7,28 +7,37 @@ config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_31_X if !BR2_arc
+	default BR2_BINUTILS_VERSION_2_31_X if !BR2_arc && !BR2_csky
 	default BR2_BINUTILS_VERSION_ARC if BR2_arc
+	default BR2_BINUTILS_VERSION_CSKY if BR2_csky
 	help
 	  Select the version of binutils you wish to use.
 
 config BR2_BINUTILS_VERSION_2_30_X
 	bool "binutils 2.30"
+	depends on !BR2_csky
 
 config BR2_BINUTILS_VERSION_2_31_X
 	bool "binutils 2.31.1"
+	depends on !BR2_csky
 
 config BR2_BINUTILS_VERSION_2_32_X
 	bool "binutils 2.32"
+	depends on !BR2_csky
 
 config BR2_BINUTILS_VERSION_ARC
 	bool "binutils arc (2.31)"
 	depends on BR2_arc
+
+config BR2_BINUTILS_VERSION_CSKY
+	bool "binutils csky"
+	depends on BR2_csky
 endchoice
 
 config BR2_BINUTILS_VERSION
 	string
 	default "arc-2018.09-release"	if BR2_BINUTILS_VERSION_ARC
+	default "c66d8bbcebfddf713b2b436e1b135e6b125a55a5" if BR2_BINUTILS_VERSION_CSKY
 	default "2.30"		if BR2_BINUTILS_VERSION_2_30_X
 	default "2.31.1"	if BR2_BINUTILS_VERSION_2_31_X
 	default "2.32"		if BR2_BINUTILS_VERSION_2_32_X
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 039e368..9f8b419 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -5,3 +5,5 @@ sha512  d326408f12a03d9a61a9de56584c2af12f81c2e50d2d7e835d51565df8314df01575724a
 
 # Locally calculated (fetched from Github)
 sha512  a96dfcea6064fcd1aac1333ac0d631491bed8b0be9bdcf62f1447909c8f30d2cb8d9323ffeb7c9ad6b326ecddb72e3d28281684e73343189d0a4a37a11aef62f  binutils-gdb-arc-2018.09-release.tar.gz
+# Locally calculated (fetched from https://github.com/c-sky/binutils-gdb)
+sha512  979552d4b3a4f31e9f3b9a7027321bd4eb3ac6c2d8deac1720e94e54f81d736db09c53c5d87c301010e307b64127e14400a036c7a35e5d63a954a4edd9cc8e2c  binutils-c66d8bbcebfddf713b2b436e1b135e6b125a55a5.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index c70ba13..6d2b710 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -20,6 +20,13 @@ BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,
 BINUTILS_SOURCE = binutils-gdb-$(BINUTILS_VERSION).tar.gz
 BINUTILS_FROM_GIT = y
 endif
+
+ifeq ($(BR2_csky),y)
+BINUTILS_SITE = $(call github,c-sky,binutils-gdb,$(BINUTILS_VERSION))
+BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
+BINUTILS_FROM_GIT = y
+endif
+
 BINUTILS_SITE ?= $(BR2_GNU_MIRROR)/binutils
 BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.xz
 BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
-- 
2.7.4

