Return-Path: <SRS0=z0i5=VH=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B587FC73C6D
	for <linux-csky@archiver.kernel.org>; Wed, 10 Jul 2019 06:28:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9386120693
	for <linux-csky@archiver.kernel.org>; Wed, 10 Jul 2019 06:28:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbfGJG2M (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Wed, 10 Jul 2019 02:28:12 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:51773 "EHLO
        smtp2200-217.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725844AbfGJG2M (ORCPT
        <rfc822;linux-csky@vger.kernel.org>);
        Wed, 10 Jul 2019 02:28:12 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.156616|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.12626-0.0242319-0.849508;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03300;MF=han_mao@c-sky.com;NM=1;PH=DS;RN=3;RT=3;SR=0;TI=SMTPD_---.EvUy.L-_1562740089;
Received: from localhost(mailfrom:han_mao@c-sky.com fp:SMTPD_---.EvUy.L-_1562740089)
          by smtp.aliyun-inc.com(10.147.40.26);
          Wed, 10 Jul 2019 14:28:09 +0800
From:   Mao Han <han_mao@c-sky.com>
To:     libc-alpha@sourceware.org
Cc:     linux-csky@vger.kernel.org, Mao Han <han_mao@c-sky.com>
Subject: [PATCH 1/1] locale/tst-locale-locpath: Fix arguments passing
Date:   Wed, 10 Jul 2019 14:26:34 +0800
Message-Id: <7901d4ee7ba91c963a9a7c9365267552edad32f3.1562739903.git.han_mao@c-sky.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

The arguments passed by Makefile are missing match with the arguments
taken by locale/tst-locale-locpath.sh. Without this patch
cross-test-ssh.sh will be called twice in a single command while
doing the make check test wish ssh test wrapper.

	* locale/Makefile: Fix tst-locale-locpath arguments passing.
---
 ChangeLog       | 4 ++++
 locale/Makefile | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/ChangeLog b/ChangeLog
index 158337a..632e180 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -1,3 +1,7 @@
+2019-07-10  Mao Han  <han_mao@c-sky.com>
+
+	* locale/Makefile: Fix tst-locale-locpath arguments passing.
+
 2019-07-09  Paul A. Clarke  <pc@us.ibm.com>
     
 	* sysdeps/powerpc/fpu/fenv_libc.h (_FPU_GET_RC): Protect use of
diff --git a/locale/Makefile b/locale/Makefile
index 0ad99ec..d78cf9b 100644
--- a/locale/Makefile
+++ b/locale/Makefile
@@ -113,5 +113,5 @@ lib := locale-programs
 include $(patsubst %,$(..)libof-iterator.mk,$(cpp-srcs-left))
 
 $(objpfx)tst-locale-locpath.out : tst-locale-locpath.sh $(objpfx)locale
-	$(SHELL) $< '$(common-objpfx)' '$(test-wrapper)' '$(test-wrapper-env)' > $@; \
+	$(SHELL) $< '$(common-objpfx)' '$(test-wrapper-env)' '$(run-program-env)' > $@; \
 	$(evaluate-test)
-- 
2.7.4

