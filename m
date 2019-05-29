Return-Path: <SRS0=K7zh=T5=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6FC7C07542
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 07:19:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 90D50216FD
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 07:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559114364;
	bh=75jQLMPLRveo2p3NLsyJQR4gRtMd643joXMZQEtZlkI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=zxSHM+zCMzSZITtxNcoOCRMy20emmPz5QyUDnZ7kxY1HS99F9Xpm4xIC9op0kB5q/
	 vzH+n0B3deRmGG3LVHmEeywTQQSu6zh47cO9PNkLlCm9eC2jFJi83uGQNewkOjg3O/
	 apHfDSLdzTjxZ9BSUnMzYCGm5ld8m5Dld+DT2JsE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbfE2HTY (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Wed, 29 May 2019 03:19:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:49358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726683AbfE2HTY (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Wed, 29 May 2019 03:19:24 -0400
Received: from localhost.localdomain (unknown [223.93.147.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 85A02217D4;
        Wed, 29 May 2019 07:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559114363;
        bh=75jQLMPLRveo2p3NLsyJQR4gRtMd643joXMZQEtZlkI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nnCLyc3OcDoulcN+c22esQjEhII/g4KuZFqSM85DgDpmPOxqGmf2m2orwtwJltWfe
         xhnkYE/koxPToKuLxTcmb7TUHHa5qL61bhaLYJqetmvwvCiGr+lYVzcZWSciszsfiA
         XMOxJyVWfUoHf5bc8PzY9ftY5Wo2XMoxm28F9i/k=
From:   guoren@kernel.org
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be
Cc:     linux-csky@vger.kernel.org, buildroot@buildroot.org,
        Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH V3 07/10] package/gdb: Add C-SKY support
Date:   Wed, 29 May 2019 15:18:45 +0800
Message-Id: <1559114328-23357-8-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559114328-23357-1-git-send-email-guoren@kernel.org>
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

From: Guo Ren <ren_guo@c-sky.com>

Add gdb build for C-SKY Architecture:

 - Support host-gdb
 - Support gdbserver for target

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 package/gdb/Config.in.host | 2 ++
 package/gdb/gdb.hash       | 2 ++
 package/gdb/gdb.mk         | 6 ++++++
 3 files changed, 10 insertions(+)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 969168f..76a0eca 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -48,6 +48,7 @@ choice
 	prompt "GDB debugger Version"
 	default BR2_GDB_VERSION_8_1
 	depends on !BR2_arc
+	depends on !BR2_csky
 	help
 	  Select the version of gdb you wish to use.
 
@@ -95,6 +96,7 @@ config BR2_PACKAGE_GDB_NEEDS_CXX11
 config BR2_GDB_VERSION
 	string
 	default "arc-2018.09-release-gdb" if BR2_arc
+	default "4ecb98fbc2f94dbe01b69384afbc515107de73df" if BR2_csky
 	default "7.12.1"   if BR2_GDB_VERSION_7_12
 	default "8.0.1"    if BR2_GDB_VERSION_8_0
 	default "8.1.1"    if BR2_GDB_VERSION_8_1 || !BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 1104da5..90a60b0 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -6,3 +6,5 @@ sha512  2aa81cfd389bb48c35d7d9f95cc10e88b4f7ad4597bdde0f8f1fd312f60f10d9fb2cc6e5
 
 # Locally calculated (fetched from Github)
 sha512  8303e399e396f5c15dc976e48503fc7d45a720dd1a470443f755c5f2458d092b4392e7ae582abc251bc4b43a778ad784f764286a2a05abfc1649cbeeeb6e7d15 	gdb-arc-2018.09-release-gdb.tar.gz
+# Locally calculated (fetched from https://github.com/c-sky/binutils-gdb)
+sha512  c421e1f3c0d6cfb3c04544573c0c4b0075c8d8e3d563c6c234fcc1e4c2167ab203d1e57aec3b58abd348dc46f8cf9b47b753d3a43dba3ea970c9c9a6bd78c07b	gdb-4ecb98fbc2f94dbe01b69384afbc515107de73df.tar.gz
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index a926961..46d745a 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -14,6 +14,12 @@ GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
 GDB_FROM_GIT = y
 endif
 
+ifeq ($(BR2_csky),y)
+GDB_SITE = $(call github,c-sky,binutils-gdb,$(GDB_VERSION))
+GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
+GDB_FROM_GIT = y
+endif
+
 GDB_LICENSE = GPL-2.0+, LGPL-2.0+, GPL-3.0+, LGPL-3.0+
 GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
 
-- 
2.7.4

