Return-Path: <SRS0=lVDe=6F=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19902C2BA19
	for <linux-csky@archiver.kernel.org>; Tue, 21 Apr 2020 07:56:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F089F2074B
	for <linux-csky@archiver.kernel.org>; Tue, 21 Apr 2020 07:56:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726052AbgDUH4g (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Tue, 21 Apr 2020 03:56:36 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:39464 "EHLO
        smtp2200-217.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726013AbgDUH4g (ORCPT
        <rfc822;linux-csky@vger.kernel.org>);
        Tue, 21 Apr 2020 03:56:36 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07163723|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0943366-0.0022681-0.903395;FP=0|0|0|0|0|-1|-1|-1;HT=e01l07381;MF=yibin_liu@c-sky.com;NM=1;PH=DS;RN=3;RT=3;SR=0;TI=SMTPD_---.HL.8E4A_1587455794;
Received: from localhost(mailfrom:yibin_liu@c-sky.com fp:SMTPD_---.HL.8E4A_1587455794)
          by smtp.aliyun-inc.com(10.147.41.231);
          Tue, 21 Apr 2020 15:56:34 +0800
From:   Liu Yibin <yibin_liu@c-sky.com>
To:     guoren@kernel.org, linux-csky@vger.kernel.org
Cc:     Liu Yibin <yibin_liu@c-sky.com>
Subject: [PATCH] Fix MSA register operation error
Date:   Tue, 21 Apr 2020 15:56:28 +0800
Message-Id: <1587455788-9450-1-git-send-email-yibin_liu@c-sky.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

MSA register should shift to the right 29 for bits,
rather than 28 bits.

Signed-off-by: Liu Yibin <yibin_liu@c-sky.com>
---
 arch/csky/abiv1/inc/abi/entry.h | 6 ++++--
 arch/csky/abiv2/inc/abi/entry.h | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/csky/abiv1/inc/abi/entry.h b/arch/csky/abiv1/inc/abi/entry.h
index 5056ebb..1dc5ed8 100644
--- a/arch/csky/abiv1/inc/abi/entry.h
+++ b/arch/csky/abiv1/inc/abi/entry.h
@@ -16,6 +16,8 @@
 #define LSAVE_A4	40
 #define LSAVE_A5	44
 
+#define MSA_SHIFT		29
+
 #define usp ss1
 
 .macro USPTOKSP
@@ -167,8 +169,8 @@
 	 *   BA     Reserved  C   D   V
 	 */
 	cprcr	r6, cpcr30
-	lsri	r6, 28
-	lsli	r6, 28
+	lsri	r6, MSA_SHIFT
+	lsli	r6, MSA_SHIFT
 	addi	r6, 0xe
 	cpwcr	r6, cpcr30
 
diff --git a/arch/csky/abiv2/inc/abi/entry.h b/arch/csky/abiv2/inc/abi/entry.h
index a99aff5..2507cbf 100644
--- a/arch/csky/abiv2/inc/abi/entry.h
+++ b/arch/csky/abiv2/inc/abi/entry.h
@@ -14,6 +14,8 @@
 #define LSAVE_A2	32
 #define LSAVE_A3	36
 
+#define MSA_SHIFT		29
+
 #define KSPTOUSP
 #define USPTOKSP
 
@@ -285,8 +287,8 @@
 	 */
 	mfcr	r6, cr<30, 15> /* Get MSA0 */
 2:
-	lsri	r6, 28
-	lsli	r6, 28
+	lsri	r6, MSA_SHIFT
+	lsli	r6, MSA_SHIFT
 	addi	r6, 0x1ce
 	mtcr	r6, cr<30, 15> /* Set MSA0 */
 
-- 
2.7.4

