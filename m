Return-Path: <SRS0=K7zh=T5=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD9E9C04AB3
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 07:19:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 97BCC21019
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 07:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559114355;
	bh=qLPIsNugCDXHRbL4518fpyTBEbuzLr9juiED2ZCPJN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ZEO4vFSVwXSPFu/cYMkzhBoPLhsFMnUk6Ak50V8muuZfDGlrrfZ5ay5tiWENTgrOG
	 aD12MsWudUL/dBF7XhJFb4nUWNwGH/tCSX0CZ6ycJ9IN8m2BZM21SQXZmc+naHK5IQ
	 kjjFPsB1lLpRnhyIb1pkJpCy3DWaVJ8dvHxeluTU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbfE2HTP (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Wed, 29 May 2019 03:19:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:49196 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726683AbfE2HTP (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Wed, 29 May 2019 03:19:15 -0400
Received: from localhost.localdomain (unknown [223.93.147.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 602152075C;
        Wed, 29 May 2019 07:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559114354;
        bh=qLPIsNugCDXHRbL4518fpyTBEbuzLr9juiED2ZCPJN4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=beaHUlx02QiRetlpMgjpsPLJu4WjxgOc42um3gob90dXOyvw42ILhyCZ6q05p/UPE
         aHXU58sSOXRBwmGNF1T+FefeTgc9Twm6IHd5FQB4uX4uipjjmW3CtZmvZ6ecV7zQaI
         tVFmb7EXnVo3sKEHDT5adTvtJ/fzRrcBCYVdl68g=
From:   guoren@kernel.org
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be
Cc:     linux-csky@vger.kernel.org, buildroot@buildroot.org,
        Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH V3 04/10] arch/csky: Add ABI variable for toolchain build
Date:   Wed, 29 May 2019 15:18:42 +0800
Message-Id: <1559114328-23357-5-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559114328-23357-1-git-send-email-guoren@kernel.org>
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

From: Guo Ren <ren_guo@c-sky.com>

C-SKY toolchain build need it to seperate abiv1 & abiv2.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 package/Makefile.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index dc818a2..f05b9cc 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -70,6 +70,15 @@ ABI := $(ABI)hf
 endif
 endif
 
+# For C-SKY abiv1 & abiv2
+ifeq ($(BR2_csky),y)
+ifeq ($(BR2_ck610),y)
+ABI = abiv1
+else
+ABI = abiv2
+endif
+endif
+
 # For FSL PowerPC there's SPE
 ifeq ($(BR2_powerpc_SPE),y)
 ABI = spe
-- 
2.7.4

