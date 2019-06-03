Return-Path: <SRS0=8JPw=UC=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 754B1C04AB6
	for <linux-csky@archiver.kernel.org>; Mon,  3 Jun 2019 08:51:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3E01627DCA
	for <linux-csky@archiver.kernel.org>; Mon,  3 Jun 2019 08:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559551897;
	bh=T6G/8lz0HCW6qT4GIRCTy9wphJAqz+wcAF6aqRF3FJE=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=EQ1e/3v9bFBw9+CNpXqmrXJ70oBA0fZPRu7vxD8i75S3Jb+dg2YFkRGGu2c/mU3aa
	 ZuG2Rmv1d+S/CMoQ9IX8VwIreR1qdAQ2oFVjfz8NGdeEAi3HSJJc3NydvhGclC82zi
	 WC0/jdgJB0q1KNYbDqXZiGeI+KzFdSuBVnBqEBZ4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbfFCIvh (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Mon, 3 Jun 2019 04:51:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:53784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726055AbfFCIvg (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Mon, 3 Jun 2019 04:51:36 -0400
Received: from localhost.localdomain (unknown [223.93.147.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 930BF26852;
        Mon,  3 Jun 2019 08:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559551895;
        bh=T6G/8lz0HCW6qT4GIRCTy9wphJAqz+wcAF6aqRF3FJE=;
        h=From:To:Cc:Subject:Date:From;
        b=kMUEcse1xDepo32ky2jHmCAZwuXU4YxS8VMsjX4kweTpPNGm/VTm0kexjyuyNJTJn
         wk2Ku5j/MBu157LYmwgCMx1JkT5sQ6xoUtXGmj2Gr6ANMM7mwwrWrrnhkxYGE1nHtU
         zgnOZhJfq2oklt0keBQhdTs8NjSx6M9PlOrw/fjw=
From:   guoren@kernel.org
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be
Cc:     linux-csky@vger.kernel.org, buildroot@buildroot.org,
        zhiwei_liu@c-sky.com, Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH V6] configs/qemu_cskyXXX_virt: new defconfig
Date:   Mon,  3 Jun 2019 16:51:05 +0800
Message-Id: <1559551865-8662-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

From: Guo Ren <ren_guo@c-sky.com>

Add C-SKY defconfig for QEMU virt machine.

Tested with https://gitlab.com/c-sky/buildroot/pipelines

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                              |  4 ++++
 DEVELOPERS                                  |  2 ++
 board/qemu/csky/linux-ck610.config.fragment |  5 +++++
 board/qemu/csky/linux-ck807.config.fragment |  5 +++++
 board/qemu/csky/linux-ck810.config.fragment |  5 +++++
 board/qemu/csky/linux-ck860.config.fragment |  9 +++++++++
 board/qemu/csky/readme.txt                  | 12 ++++++++++++
 configs/qemu_csky610_virt_defconfig         | 14 ++++++++++++++
 configs/qemu_csky807_virt_defconfig         | 14 ++++++++++++++
 configs/qemu_csky810_virt_defconfig         | 14 ++++++++++++++
 configs/qemu_csky860_virt_defconfig         | 14 ++++++++++++++
 11 files changed, 98 insertions(+)
 create mode 100644 board/qemu/csky/linux-ck610.config.fragment
 create mode 100644 board/qemu/csky/linux-ck807.config.fragment
 create mode 100644 board/qemu/csky/linux-ck810.config.fragment
 create mode 100644 board/qemu/csky/linux-ck860.config.fragment
 create mode 100644 board/qemu/csky/readme.txt
 create mode 100644 configs/qemu_csky610_virt_defconfig
 create mode 100644 configs/qemu_csky807_virt_defconfig
 create mode 100644 configs/qemu_csky810_virt_defconfig
 create mode 100644 configs/qemu_csky860_virt_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 374dbfe..4fa3473 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -248,6 +248,10 @@ qemu_aarch64_virt_defconfig: { extends: .defconfig }
 qemu_arm_versatile_defconfig: { extends: .defconfig }
 qemu_arm_versatile_nommu_defconfig: { extends: .defconfig }
 qemu_arm_vexpress_defconfig: { extends: .defconfig }
+qemu_csky610_virt_defconfig: { extends: .defconfig }
+qemu_csky807_virt_defconfig: { extends: .defconfig }
+qemu_csky810_virt_defconfig: { extends: .defconfig }
+qemu_csky860_virt_defconfig: { extends: .defconfig }
 qemu_m68k_mcf5208_defconfig: { extends: .defconfig }
 qemu_m68k_q800_defconfig: { extends: .defconfig }
 qemu_microblazebe_mmu_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index 5bfc456..edb372e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -976,7 +976,9 @@ F:	package/reaver/
 N:	Guo Ren <ren_guo@c-sky.com>
 F:	arch/Config.in.csky
 F:	board/csky/
+F:	board/qemu/csky
 F:	configs/csky_*
+F:	configs/qemu_csky*
 
 N:	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
 F:	configs/arm_juno_defconfig
diff --git a/board/qemu/csky/linux-ck610.config.fragment b/board/qemu/csky/linux-ck610.config.fragment
new file mode 100644
index 0000000..d80d0ee
--- /dev/null
+++ b/board/qemu/csky/linux-ck610.config.fragment
@@ -0,0 +1,5 @@
+CONFIG_COMPILE_TEST=y
+CONFIG_CPU_CK610=y
+CONFIG_CPU_PM_WAIT=y
+CONFIG_CSKY_APB_INTC=y
+CONFIG_GX6605S_TIMER=y
diff --git a/board/qemu/csky/linux-ck807.config.fragment b/board/qemu/csky/linux-ck807.config.fragment
new file mode 100644
index 0000000..b6974f0
--- /dev/null
+++ b/board/qemu/csky/linux-ck807.config.fragment
@@ -0,0 +1,5 @@
+CONFIG_COMPILE_TEST=y
+CONFIG_CPU_CK807=y
+# CONFIG_CPU_HAS_FPU is not set
+CONFIG_CPU_PM_WAIT=y
+CONFIG_CSKY_APB_INTC=y
diff --git a/board/qemu/csky/linux-ck810.config.fragment b/board/qemu/csky/linux-ck810.config.fragment
new file mode 100644
index 0000000..50fa1f4
--- /dev/null
+++ b/board/qemu/csky/linux-ck810.config.fragment
@@ -0,0 +1,5 @@
+CONFIG_COMPILE_TEST=y
+CONFIG_CPU_CK810=y
+# CONFIG_CPU_HAS_FPU is not set
+CONFIG_CPU_PM_WAIT=y
+CONFIG_CSKY_APB_INTC=y
diff --git a/board/qemu/csky/linux-ck860.config.fragment b/board/qemu/csky/linux-ck860.config.fragment
new file mode 100644
index 0000000..e8f6af1
--- /dev/null
+++ b/board/qemu/csky/linux-ck860.config.fragment
@@ -0,0 +1,9 @@
+CONFIG_COMPILE_TEST=y
+CONFIG_CPU_CK860=y
+# CONFIG_CPU_HAS_FPU is not set
+CONFIG_CPU_PM_WAIT=y
+CONFIG_SMP=y
+CONFIG_HOTPLUG_CPU=y
+CONFIG_CSKY_APB_INTC=y
+CONFIG_CSKY_MPINTC=y
+CONFIG_CSKY_MP_TIMER=y
diff --git a/board/qemu/csky/readme.txt b/board/qemu/csky/readme.txt
new file mode 100644
index 0000000..89d68aa
--- /dev/null
+++ b/board/qemu/csky/readme.txt
@@ -0,0 +1,12 @@
+Run with qemu:
+
+For ck860 smp:
+ qemu-system-cskyv2 -M virt -cpu ck860 -smp 2 -nographic -kernel vmlinux
+
+For ck810/ck807:
+ qemu-system-cskyv2 -M virt -nographic -kernel vmlinux
+
+For ck610:
+ qemu-system-cskyv1 -M virt -nographic -kernel vmlinux
+
+The login prompt will appear in the terminal that started Qemu. Username is root and no password.
diff --git a/configs/qemu_csky610_virt_defconfig b/configs/qemu_csky610_virt_defconfig
new file mode 100644
index 0000000..b75a5b8
--- /dev/null
+++ b/configs/qemu_csky610_virt_defconfig
@@ -0,0 +1,14 @@
+# Architecture
+BR2_csky=y
+BR2_ck610=y
+
+# System
+BR2_ROOTFS_DEVICE_CREATION_STATIC=y
+BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck610.config.fragment"
diff --git a/configs/qemu_csky807_virt_defconfig b/configs/qemu_csky807_virt_defconfig
new file mode 100644
index 0000000..035bf66
--- /dev/null
+++ b/configs/qemu_csky807_virt_defconfig
@@ -0,0 +1,14 @@
+# Architecture
+BR2_csky=y
+BR2_ck807=y
+
+# System
+BR2_ROOTFS_DEVICE_CREATION_STATIC=y
+BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck807.config.fragment"
diff --git a/configs/qemu_csky810_virt_defconfig b/configs/qemu_csky810_virt_defconfig
new file mode 100644
index 0000000..9ce2aa9
--- /dev/null
+++ b/configs/qemu_csky810_virt_defconfig
@@ -0,0 +1,14 @@
+# Architecture
+BR2_csky=y
+BR2_ck810=y
+
+# System
+BR2_ROOTFS_DEVICE_CREATION_STATIC=y
+BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck810.config.fragment"
diff --git a/configs/qemu_csky860_virt_defconfig b/configs/qemu_csky860_virt_defconfig
new file mode 100644
index 0000000..d86c1e6
--- /dev/null
+++ b/configs/qemu_csky860_virt_defconfig
@@ -0,0 +1,14 @@
+# Architecture
+BR2_csky=y
+BR2_ck860=y
+
+# System
+BR2_ROOTFS_DEVICE_CREATION_STATIC=y
+BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck860.config.fragment"
-- 
2.7.4

