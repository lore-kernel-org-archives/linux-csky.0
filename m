Return-Path: <SRS0=cdmM=UB=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE00AC282DC
	for <linux-csky@archiver.kernel.org>; Sun,  2 Jun 2019 09:42:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B4256278AE
	for <linux-csky@archiver.kernel.org>; Sun,  2 Jun 2019 09:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559468535;
	bh=T4CCmq0ZrEFjSUeWiZvqjMD0NfR4SgsghhvcUoLdkk0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=KVPc3vfyk3xMIVe/USNokIV5MgI8L3ZjbgN2S3y973T+64R0WKiM7BSpdiz4xRvUe
	 Y0xznF6DcbQhn/Uf1tMpRzmsoK06VZDt+9AXdZLIzQTaTWFG+4k+ji6eIBWrNnfjGF
	 E2tBvAACcLq6Yo4lYWLcnmr060Z61gGhxS9FCaqc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbfFBJmP (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Sun, 2 Jun 2019 05:42:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:46014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725977AbfFBJmP (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Sun, 2 Jun 2019 05:42:15 -0400
Received: from localhost.localdomain (unknown [223.93.147.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 41ACE278AC;
        Sun,  2 Jun 2019 09:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559468534;
        bh=T4CCmq0ZrEFjSUeWiZvqjMD0NfR4SgsghhvcUoLdkk0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DHicq/oBKdG9bqv6JbWCN0NaZAvp4NyFtoO08r2Bs9awW+7Q+vFLVexlC4YT4fqa9
         4uOGbG6AwEmsOuRsFw8l1syzw8ZSKAYnU7Sc4tlADZg7JrrOGJTEdjPDr2nuZoBccd
         OzVQ+lw/fJUcUJV013WZTeEMjAipICw+OoPwRf8E=
From:   guoren@kernel.org
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be
Cc:     linux-csky@vger.kernel.org, buildroot@buildroot.org,
        zhiwei_liu@c-sky.com, Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH V5 2/2] board/qemu/csky/readme.txt: Add C-SKY Qemu run Documentation
Date:   Sun,  2 Jun 2019 17:41:50 +0800
Message-Id: <1559468510-22085-2-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559468510-22085-1-git-send-email-guoren@kernel.org>
References: <1559468510-22085-1-git-send-email-guoren@kernel.org>
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

From: Guo Ren <ren_guo@c-sky.com>

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Cc: Liu Zhiwei <zhiwei_liu@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/csky/readme.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 board/qemu/csky/readme.txt

diff --git a/board/qemu/csky/readme.txt b/board/qemu/csky/readme.txt
new file mode 100644
index 0000000..c36c755d
--- /dev/null
+++ b/board/qemu/csky/readme.txt
@@ -0,0 +1,16 @@
+Run with qemu:
+
+ wget https://gitlab.com/c-sky/buildroot/-/jobs/197192514/artifacts/raw/output/images/csky_toolchain_csky_860_fpga_4.9_glibc_br_defconfig_56683a5a67ecf1dd0e67b05b9541de74530d0047.tar.xz;
+ mkdir tools;
+ tar -Jxf csky_toolchain_csky_860_fpga_4.9_glibc_br_defconfig_56683a5a67ecf1dd0e67b05b9541de74530d0047.tar.xz -C tools;
+ LD_LIBRARY_PATH=./tools/lib ./tools/csky-qemu/bin/qemu-system-cskyv2 -M virt -cpu ck860 -smp 2 -kernel output/images/vmlinux -nographic;
+
+For ck810/ck807:
+ LD_LIBRARY_PATH=./tools/lib ./tools/csky-qemu/bin/qemu-system-cskyv2 -M virt -kernel output/images/vmlinux -nographic;
+
+For ck610:
+ LD_LIBRARY_PATH=./tools/lib ./tools/csky-qemu/bin/qemu-system-cskyv1 -M virt -kernel output/images/vmlinux -nographic;
+
+The login prompt will appear in the terminal that started Qemu. Username is root and no password.
+
+Tested with QEMU 3.0 in https://gitlab.com/guoren83/qemu, C-SKY qemu upstream is on its way.
-- 
2.7.4

