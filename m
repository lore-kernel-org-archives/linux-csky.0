Return-Path: <SRS0=K7zh=T5=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B83FC04AB3
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 07:19:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 25637216FD
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 07:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559114362;
	bh=swASeo4oRV5zh0d9WQzFqXtOx4uX1r+GwpwM3YgzJiU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Y72/N9cvmAfLSv/AXX8oDXmrupmYyYEoMC72JfoQs3t3zzKzX6QQsps0bHZuOxZKx
	 lwZG0uWJpGzp1oV5ZZi7VLZnVitIZ7CGPVI81CW6xEiU8mdFmVW9GDNofoxAqv4Dbt
	 mqeoSMv9rWG14gDSadPVWdhv0v3e6t5+yCQiigVk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbfE2HTW (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Wed, 29 May 2019 03:19:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:49288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726683AbfE2HTV (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Wed, 29 May 2019 03:19:21 -0400
Received: from localhost.localdomain (unknown [223.93.147.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 731C021019;
        Wed, 29 May 2019 07:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559114360;
        bh=swASeo4oRV5zh0d9WQzFqXtOx4uX1r+GwpwM3YgzJiU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FLqAA2MyEKWivTxG/MvGhVl8Rz7N6wmI7CLwvjP2dxalb0VkDQ/sKrV4eN8G2Vfl/
         j+YIos8S015EVI1MkPJ/BCsw+pHLj536EueJMg8aLoLKOwINOManIV+kSRa5URIYWT
         Vyd5zfrGPPcz4pzhaAo9Y44V+8QyMguNQj3bAN8c=
From:   guoren@kernel.org
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be
Cc:     linux-csky@vger.kernel.org, buildroot@buildroot.org,
        Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH V3 06/10] package/gcc: Add C-SKY support
Date:   Wed, 29 May 2019 15:18:44 +0800
Message-Id: <1559114328-23357-7-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559114328-23357-1-git-send-email-guoren@kernel.org>
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

From: Guo Ren <ren_guo@c-sky.com>

Add gcc build for C-SKY Architecture.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 package/gcc/Config.in.host | 13 +++++++++++++
 package/gcc/gcc.hash       |  2 ++
 package/gcc/gcc.mk         |  3 +++
 3 files changed, 18 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 8e22a4c..c3aceff 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -3,6 +3,7 @@ comment "GCC Options"
 choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_ARC if BR2_arc
+	default BR2_GCC_VERSION_CSKY if BR2_csky
 	default BR2_GCC_VERSION_OR1K if BR2_or1k
 	default BR2_GCC_VERSION_7_X
 	help
@@ -14,6 +15,12 @@ config BR2_GCC_VERSION_ARC
 	depends on BR2_arc
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
+config BR2_GCC_VERSION_CSKY
+	bool "gcc csky"
+	# Only supported architecture
+	depends on BR2_csky
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
+
 config BR2_GCC_VERSION_OR1K
 	bool "gcc or1k (5.x)"
 	# Only supported architecture
@@ -25,6 +32,7 @@ config BR2_GCC_VERSION_4_9_X
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 	# Broken or unsupported architectures
 	depends on !BR2_arc
+	depends on !BR2_csky
 	depends on !BR2_or1k
 	# musl on microblaze, ppc64 and mips64 unsupported
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_microblazeel || BR2_microblazebe))
@@ -39,6 +47,7 @@ config BR2_GCC_VERSION_5_X
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 	# Broken or unsupported architectures
 	depends on !BR2_arc
+	depends on !BR2_csky
 	depends on !BR2_or1k
 	# musl on ppc64 and mips64 unsupported
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
@@ -52,6 +61,7 @@ config BR2_GCC_VERSION_6_X
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	# Broken or unsupported architectures
 	depends on !BR2_arc
+	depends on !BR2_csky
 	depends on !BR2_or1k
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
@@ -59,12 +69,14 @@ config BR2_GCC_VERSION_7_X
 	bool "gcc 7.x"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 	# Broken or unsupported architectures
+	depends on !BR2_csky
 	depends on !BR2_or1k
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
 config BR2_GCC_VERSION_8_X
 	bool "gcc 8.x"
 	# Broken or unsupported architectures
+	depends on !BR2_csky
 	depends on !BR2_or1k
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
@@ -85,6 +97,7 @@ config BR2_GCC_VERSION
 	default "8.3.0"     if BR2_GCC_VERSION_8_X
 	default "arc-2018.09-release" if BR2_GCC_VERSION_ARC
 	default "or1k-musl-5.4.0-20170218" if BR2_GCC_VERSION_OR1K
+	default "48152afb96c59733d5bc79e3399bb7b3d4b44266" if BR2_GCC_VERSION_CSKY
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 4f1e7f9..780484d 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -13,3 +13,5 @@ sha512  1811337ae3add9680cec64968a2509d085b6dc5b6783fc1e8c295e3e47416196fd1a3ad8
 sha512  4d12c3ac27b9de9c533be3b8964cf23d21bf6933b5073183e1affe714b0ff33f9d6169e3b55a5c505d7dae33c9bb4f8b0d110461e3a124182d8c8d51b66b8e45  gcc-arc-2018.09-release.tar.gz
 # Locally calculated (fetched from Github)
 sha512  2de7cf47333a4092b02d3bb98f4206f14966f1d139a724d09cf3b22f8a43ae0c704f33e6477d6367a03c29b265480dc900169e9d417006c5d46f0ae446b8c6f1  gcc-or1k-musl-5.4.0-20170218.tar.gz
+# Locally calculated (fetched from https://github.com/c-sky/gcc)
+sha512  1c3564fd6573dce13451a73015e7d88fecbb214dc1df96607976255b1d8b9e60318405333f4f218eea8d07e3675a802b66eff6df3921d505c4036481512792c2  gcc-48152afb96c59733d5bc79e3399bb7b3d4b44266.tar.gz
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 5901624..abc29c7 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -16,6 +16,9 @@ GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else ifeq ($(BR2_or1k),y)
 GCC_SITE = $(call github,openrisc,or1k-gcc,$(GCC_VERSION))
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
+else ifeq ($(BR2_csky),y)
+GCC_SITE = $(call github,c-sky,gcc,$(GCC_VERSION))
+GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else
 GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
 # From version 5.5.0, 6.4.0, 7.2.0 and 8.1.0 a bz2 release tarball is not
-- 
2.7.4

