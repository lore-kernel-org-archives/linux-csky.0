Return-Path: <SRS0=8JPw=UC=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431F7C282CE
	for <linux-csky@archiver.kernel.org>; Mon,  3 Jun 2019 12:28:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1D12F2541D
	for <linux-csky@archiver.kernel.org>; Mon,  3 Jun 2019 12:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559564933;
	bh=KJqJpjKOFHNZ7eNHKLEOn3zSzdK7X57B/6WSvoGQGOQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=V/rTtjQMAzLzUTTy4z8hr4Vf3Xf44EAS2K8XwTMbaz4vaO31NGuNrfY9P5MXr/P+W
	 VIz9Vxpm2pa+6g5lLCA5hvO/iDunVYMqv9e+jOIOipoRmo+C9NwH4yyGeyw53s7hq+
	 Npy838zwDa1Aa/O9LN20I6/h+2CgoywT02HJ7BM4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbfFCM2w (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Mon, 3 Jun 2019 08:28:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:36946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726349AbfFCM2w (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Mon, 3 Jun 2019 08:28:52 -0400
Received: from localhost.localdomain (unknown [223.93.147.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9264C253BF;
        Mon,  3 Jun 2019 12:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559564932;
        bh=KJqJpjKOFHNZ7eNHKLEOn3zSzdK7X57B/6WSvoGQGOQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ps7KAUITIKbx9fpMCIMEquyxs0qUDBtZpzFMkHBuGEBkjZvVqDARIuZ5qsVFYgZVS
         MKf9RGapwH9bhPOG9LfPd5/1Skki2Nijl5Hqf77WcGrFo1iPrAhCbkvnGKF3Hk/ibi
         /6+zHsNhq7ehEAzC3TI6KGCSAphOSuPyvEu4pPZA=
From:   guoren@kernel.org
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be
Cc:     linux-csky@vger.kernel.org, buildroot@buildroot.org,
        zhiwei_liu@c-sky.com, Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH 2/2] package/qemu: Add C-SKY qemu support
Date:   Mon,  3 Jun 2019 20:28:07 +0800
Message-Id: <1559564887-4088-2-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559564887-4088-1-git-send-email-guoren@kernel.org>
References: <1559564887-4088-1-git-send-email-guoren@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

From: Guo Ren <ren_guo@c-sky.com>

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/Config.in.host |  1 +
 package/qemu/qemu.hash      |  1 +
 package/qemu/qemu.mk        | 12 ++++++++++++
 3 files changed, 14 insertions(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 8a0df38..effe58b 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -3,6 +3,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_arm
 	default y if BR2_armeb
 	default y if BR2_aarch64
+	default y if BR2_csky
 	default y if BR2_i386
 	default y if BR2_m68k
 	default y if BR2_microblazeel
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 338d2ae..9ee9833 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -2,3 +2,4 @@
 sha256 6a0508df079a0a33c2487ca936a56c12122f105b8a96a44374704bef6c69abfc  qemu-3.1.0.tar.xz
 sha256 6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256 48ffe9fc7f1d5462dbd19340bc4dd1d8a9e37c61ed535813e614cbe4a5f0d4df  COPYING.LIB
+sha256 61091767ffd16002e77f005155d096208094e69dee35e6d5ddcaa6c8a13b5e26  qemu-b517e1dc3125a57555d67a8deed9eac7b42288e2.tar.gz
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 19bcafa..012406e 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,9 +4,14 @@
 #
 ################################################################################
 
+ifeq ($(BR2_csky),y)
+QEMU_VERSION = b517e1dc3125a57555d67a8deed9eac7b42288e2
+QEMU_SITE = $(call github,c-sky,qemu,$(QEMU_VERSION))
+else
 QEMU_VERSION = 3.1.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = http://download.qemu.org
+endif
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
 QEMU_LICENSE_FILES = COPYING COPYING.LIB
 # NOTE: there is no top-level license file for non-(L)GPL licenses;
@@ -209,6 +214,13 @@ endif
 ifeq ($(HOST_QEMU_ARCH),sh4aeb)
 HOST_QEMU_ARCH = sh4eb
 endif
+ifeq ($(HOST_QEMU_ARCH),csky)
+ifeq ($(BR2_ck610),y)
+HOST_QEMU_ARCH = cskyv1
+else
+HOST_QEMU_ARCH = cskyv2
+endif
+endif
 HOST_QEMU_SYS_ARCH ?= $(HOST_QEMU_ARCH)
 
 ifeq ($(BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE),y)
-- 
2.7.4

