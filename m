Return-Path: <SRS0=8JPw=UC=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B6C3C04AB5
	for <linux-csky@archiver.kernel.org>; Mon,  3 Jun 2019 12:28:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CB98F254C3
	for <linux-csky@archiver.kernel.org>; Mon,  3 Jun 2019 12:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559564930;
	bh=DGiZVUG7fCVtJmewJp9u5pp1IYc3KUnI9ZUKKWM7csY=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=jVC0kfuVboCR8mRqxSYIDW0tOZOGdyZedvts8iOYo0OzViHw+KUsAU7u2VtDnG1z1
	 7y9cRoonkAOKozGqrW0U30n4Q92tYvVw8cwSy+zYmdnTFaetgUF1KQ0iGa4K03znKH
	 sjPCViYs5aUv+p21iHAUKbRoZBjAqG47xDGGu7ko=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbfFCM2u (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Mon, 3 Jun 2019 08:28:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:36904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726349AbfFCM2u (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Mon, 3 Jun 2019 08:28:50 -0400
Received: from localhost.localdomain (unknown [223.93.147.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 502FD2541D;
        Mon,  3 Jun 2019 12:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559564928;
        bh=DGiZVUG7fCVtJmewJp9u5pp1IYc3KUnI9ZUKKWM7csY=;
        h=From:To:Cc:Subject:Date:From;
        b=yn9sqRT27La0Xcy+9InyMH6LC7I91lF7Gf2aFFOddjVKryUTeEBsxhRBexCgZLpnH
         f29St/jKGLF+BbBqGmpXB7IC4bNHPx4LUrKFlXYC31+zJkGJKMxGlIyw7S6Mvgx13g
         qxfYko9EoknCesb2ywHmX1IIMnP4JR5j8w0N3qDI=
From:   guoren@kernel.org
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be
Cc:     linux-csky@vger.kernel.org, buildroot@buildroot.org,
        zhiwei_liu@c-sky.com, Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH 1/2] package/qemu: Move patches to version directory
Date:   Mon,  3 Jun 2019 20:28:06 +0800
Message-Id: <1559564887-4088-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

From: Guo Ren <ren_guo@c-sky.com>

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ix-usage-of-mcontext-structure-on-ARM-uCl.patch | 35 -------------
 .../qemu/0002-configure-improve-usbfs-check.patch  | 60 ----------------------
 ...ix-usage-of-mcontext-structure-on-ARM-uCl.patch | 35 +++++++++++++
 .../3.1.0/0002-configure-improve-usbfs-check.patch | 60 ++++++++++++++++++++++
 4 files changed, 95 insertions(+), 95 deletions(-)
 delete mode 100644 package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
 delete mode 100644 package/qemu/0002-configure-improve-usbfs-check.patch
 create mode 100644 package/qemu/3.1.0/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
 create mode 100644 package/qemu/3.1.0/0002-configure-improve-usbfs-check.patch

diff --git a/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch b/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
deleted file mode 100644
index a0c4a62..0000000
--- a/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From d3f1e7e9ff9aae3f770b0bcb9aa3c2f787f76a1b Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Fri, 5 May 2017 09:07:15 +0200
-Subject: [PATCH] user-exec: fix usage of mcontext structure on ARM/uClibc
-
-user-exec.c has some conditional code to decide how to use the
-mcontext structure. Unfortunately, since uClibc defines __GLIBC__, but
-with old versions of __GLIBC__ and __GLIBC_MINOR__, an old code path
-gets used, which doesn't apply to uClibc.
-
-Fix this by excluding __UCLIBC__, which ensures we fall back to the
-general case of using uc_mcontext.arm_pc, which works fine with
-uClibc.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- user-exec.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
-index 6db0758..2b3d116 100644
---- a/accel/tcg/user-exec.c
-+++ b/accel/tcg/user-exec.c
-@@ -463,7 +463,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
- 
- #if defined(__NetBSD__)
-     pc = uc->uc_mcontext.__gregs[_REG_R15];
--#elif defined(__GLIBC__) && (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
-+#elif defined(__GLIBC__) && !defined(__UCLIBC__) && (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
-     pc = uc->uc_mcontext.gregs[R15];
- #else
-     pc = uc->uc_mcontext.arm_pc;
--- 
-2.7.4
-
diff --git a/package/qemu/0002-configure-improve-usbfs-check.patch b/package/qemu/0002-configure-improve-usbfs-check.patch
deleted file mode 100644
index d693b5d..0000000
--- a/package/qemu/0002-configure-improve-usbfs-check.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 9672cccd64c446369b5649fe23d575917638be46 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Tue, 5 Feb 2019 15:07:43 +0100
-Subject: [PATCH] configure: improve usbfs check
-
-The current check to test if usbfs support should be compiled or not
-solely relies on the presence of <linux/usbdevice_fs.h>, without
-actually checking that all definition used by Qemu are provided by
-this header file.
-
-With sufficiently old kernel headers, <linux/usbdevice_fs.h> may be
-present, but some of the definitions needed by Qemu may not be
-available.
-
-This commit improves the check by building a small program that
-actually tests whether the necessary definitions are available.
-
-In addition, it fixes a bug where have_usbfs was set to "yes"
-regardless of the result of the test.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- configure | 19 +++++++++++++++++--
- 1 file changed, 17 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index 3d89870d99..799c8e3b08 100755
---- a/configure
-+++ b/configure
-@@ -4266,10 +4266,25 @@ fi
- # check for usbfs
- have_usbfs=no
- if test "$linux_user" = "yes"; then
--  if check_include linux/usbdevice_fs.h; then
-+  cat > $TMPC << EOF
-+#include <linux/usbdevice_fs.h>
-+
-+#ifndef USBDEVFS_GET_CAPABILITIES
-+#error "USBDEVFS_GET_CAPABILITIES undefined"
-+#endif
-+
-+#ifndef USBDEVFS_DISCONNECT_CLAIM
-+#error "USBDEVFS_DISCONNECT_CLAIM undefined"
-+#endif
-+
-+int main(void)
-+{
-+    return 0;
-+}
-+EOF
-+  if compile_prog "" ""; then
-     have_usbfs=yes
-   fi
--  have_usbfs=yes
- fi
- 
- # check for fallocate
--- 
-2.20.1
-
diff --git a/package/qemu/3.1.0/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch b/package/qemu/3.1.0/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
new file mode 100644
index 0000000..a0c4a62
--- /dev/null
+++ b/package/qemu/3.1.0/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
@@ -0,0 +1,35 @@
+From d3f1e7e9ff9aae3f770b0bcb9aa3c2f787f76a1b Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Fri, 5 May 2017 09:07:15 +0200
+Subject: [PATCH] user-exec: fix usage of mcontext structure on ARM/uClibc
+
+user-exec.c has some conditional code to decide how to use the
+mcontext structure. Unfortunately, since uClibc defines __GLIBC__, but
+with old versions of __GLIBC__ and __GLIBC_MINOR__, an old code path
+gets used, which doesn't apply to uClibc.
+
+Fix this by excluding __UCLIBC__, which ensures we fall back to the
+general case of using uc_mcontext.arm_pc, which works fine with
+uClibc.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ user-exec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
+index 6db0758..2b3d116 100644
+--- a/accel/tcg/user-exec.c
++++ b/accel/tcg/user-exec.c
+@@ -463,7 +463,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
+ 
+ #if defined(__NetBSD__)
+     pc = uc->uc_mcontext.__gregs[_REG_R15];
+-#elif defined(__GLIBC__) && (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
++#elif defined(__GLIBC__) && !defined(__UCLIBC__) && (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
+     pc = uc->uc_mcontext.gregs[R15];
+ #else
+     pc = uc->uc_mcontext.arm_pc;
+-- 
+2.7.4
+
diff --git a/package/qemu/3.1.0/0002-configure-improve-usbfs-check.patch b/package/qemu/3.1.0/0002-configure-improve-usbfs-check.patch
new file mode 100644
index 0000000..d693b5d
--- /dev/null
+++ b/package/qemu/3.1.0/0002-configure-improve-usbfs-check.patch
@@ -0,0 +1,60 @@
+From 9672cccd64c446369b5649fe23d575917638be46 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 5 Feb 2019 15:07:43 +0100
+Subject: [PATCH] configure: improve usbfs check
+
+The current check to test if usbfs support should be compiled or not
+solely relies on the presence of <linux/usbdevice_fs.h>, without
+actually checking that all definition used by Qemu are provided by
+this header file.
+
+With sufficiently old kernel headers, <linux/usbdevice_fs.h> may be
+present, but some of the definitions needed by Qemu may not be
+available.
+
+This commit improves the check by building a small program that
+actually tests whether the necessary definitions are available.
+
+In addition, it fixes a bug where have_usbfs was set to "yes"
+regardless of the result of the test.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ configure | 19 +++++++++++++++++--
+ 1 file changed, 17 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 3d89870d99..799c8e3b08 100755
+--- a/configure
++++ b/configure
+@@ -4266,10 +4266,25 @@ fi
+ # check for usbfs
+ have_usbfs=no
+ if test "$linux_user" = "yes"; then
+-  if check_include linux/usbdevice_fs.h; then
++  cat > $TMPC << EOF
++#include <linux/usbdevice_fs.h>
++
++#ifndef USBDEVFS_GET_CAPABILITIES
++#error "USBDEVFS_GET_CAPABILITIES undefined"
++#endif
++
++#ifndef USBDEVFS_DISCONNECT_CLAIM
++#error "USBDEVFS_DISCONNECT_CLAIM undefined"
++#endif
++
++int main(void)
++{
++    return 0;
++}
++EOF
++  if compile_prog "" ""; then
+     have_usbfs=yes
+   fi
+-  have_usbfs=yes
+ fi
+ 
+ # check for fallocate
+-- 
+2.20.1
+
-- 
2.7.4

