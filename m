Return-Path: <SRS0=Fx5Z=UM=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2297DC31E4A
	for <linux-csky@archiver.kernel.org>; Thu, 13 Jun 2019 15:14:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E5F5920449
	for <linux-csky@archiver.kernel.org>; Thu, 13 Jun 2019 15:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1560438896;
	bh=ulOEfF6VH1XAOFFWF/8Q4aZCQB0EohtP9GJw243LuBY=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=CqmYJQVjDtQ960UlVbU64UIkE9ViqL+G1B5f87aP39a3DoR9V//eV5vo9D5T2JsO0
	 bx79vq+kBY+XEkVdwZGh12Hhlrl6ZojrQkyfVTn07DQWK6/PZ3fptVfBmaCgCdWXUP
	 ycRhBU2UIakkAbh87fLJVY6YqBXL7kNqbupdbs44=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732758AbfFMPOt (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Thu, 13 Jun 2019 11:14:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:47542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732958AbfFMPOp (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Thu, 13 Jun 2019 11:14:45 -0400
Received: from guoren-Inspiron-7460.lan (89.208.247.74.16clouds.com [89.208.247.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 08EA921473;
        Thu, 13 Jun 2019 15:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560438885;
        bh=ulOEfF6VH1XAOFFWF/8Q4aZCQB0EohtP9GJw243LuBY=;
        h=From:To:Cc:Subject:Date:From;
        b=V30ILB3s80VEnpwkzxD7E5ARm1rMDy9mTclTMIjMmkXm2d9NgTgST1lORbTTMkFqZ
         cbzejgHxeGRwOF+u3LUnSlSHsClaj6Sn0fk0NHZvc6W6e+WEL8GAcTcv4ku/1G9CI1
         Tr7OCjjYFAALne/Uw9l9UcQ4CWy44nEmY+I4KY5M=
From:   guoren@kernel.org
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc:     linux-csky@vger.kernel.org, buildroot@buildroot.org,
        zhiwei_liu@c-sky.com, Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH V7] configs/qemu_cskyXXX_virt: new defconfig
Date:   Thu, 13 Jun 2019 23:14:30 +0800
Message-Id: <1560438870-25124-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

From: Guo Ren <ren_guo@c-sky.com>

Add C-SKY defconfig for QEMU virt machine.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---

Changes in V7:
 - Fixup compile error without LINUX_HEADERS_CUSTOM_5_0 

---
 .gitlab-ci.yml                              |  4 ++++
 DEVELOPERS                                  |  2 ++
 board/qemu/csky/linux-ck610.config.fragment |  5 +++++
 board/qemu/csky/linux-ck807.config.fragment |  5 +++++
 board/qemu/csky/linux-ck810.config.fragment |  5 +++++
 board/qemu/csky/linux-ck860.config.fragment |  9 +++++++++
 board/qemu/csky/readme.txt                  | 12 ++++++++++++
 configs/qemu_csky610_virt_defconfig         | 17 +++++++++++++++++
 configs/qemu_csky807_virt_defconfig         | 17 +++++++++++++++++
 configs/qemu_csky810_virt_defconfig         | 17 +++++++++++++++++
 configs/qemu_csky860_virt_defconfig         | 17 +++++++++++++++++
 11 files changed, 110 insertions(+)
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
index 2557ce1..bdaf8ad 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -249,6 +249,10 @@ qemu_aarch64_virt_defconfig: { extends: .defconfig }
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
index b64f8b8..207eca8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -973,7 +973,9 @@ F:	package/reaver/
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
index 0000000..6433c5e
--- /dev/null
+++ b/configs/qemu_csky610_virt_defconfig
@@ -0,0 +1,17 @@
+# Architecture
+BR2_csky=y
+BR2_ck610=y
+
+# System
+BR2_ROOTFS_DEVICE_CREATION_STATIC=y
+BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# linux kernel header, the same version with linux kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck610.config.fragment"
diff --git a/configs/qemu_csky807_virt_defconfig b/configs/qemu_csky807_virt_defconfig
new file mode 100644
index 0000000..fbbf9b3
--- /dev/null
+++ b/configs/qemu_csky807_virt_defconfig
@@ -0,0 +1,17 @@
+# Architecture
+BR2_csky=y
+BR2_ck807=y
+
+# System
+BR2_ROOTFS_DEVICE_CREATION_STATIC=y
+BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# linux kernel header, the same version with linux kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck807.config.fragment"
diff --git a/configs/qemu_csky810_virt_defconfig b/configs/qemu_csky810_virt_defconfig
new file mode 100644
index 0000000..df8b4be
--- /dev/null
+++ b/configs/qemu_csky810_virt_defconfig
@@ -0,0 +1,17 @@
+# Architecture
+BR2_csky=y
+BR2_ck810=y
+
+# System
+BR2_ROOTFS_DEVICE_CREATION_STATIC=y
+BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# linux kernel header, the same version with linux kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck810.config.fragment"
diff --git a/configs/qemu_csky860_virt_defconfig b/configs/qemu_csky860_virt_defconfig
new file mode 100644
index 0000000..b8d6ac2
--- /dev/null
+++ b/configs/qemu_csky860_virt_defconfig
@@ -0,0 +1,17 @@
+# Architecture
+BR2_csky=y
+BR2_ck860=y
+
+# System
+BR2_ROOTFS_DEVICE_CREATION_STATIC=y
+BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# linux kernel header, the same version with linux kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck860.config.fragment"
-- 
2.7.4

