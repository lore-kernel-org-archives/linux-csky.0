Return-Path: <SRS0=wqK1=T7=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22830C04AB6
	for <linux-csky@archiver.kernel.org>; Fri, 31 May 2019 06:40:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EAFBB2647B
	for <linux-csky@archiver.kernel.org>; Fri, 31 May 2019 06:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559284813;
	bh=qLPIsNugCDXHRbL4518fpyTBEbuzLr9juiED2ZCPJN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=dikvyjZXU2W7w4p2JnzqI74+Z2ereqrTQh8/0nN6rkPbmkdPBFrBdHUyFNuolGRFq
	 ziaIaGy1Sg4zjGgxvt+6442cyz2VWUZnqL+ytbeHzvUPkx7JfdnH23fkVtY8brvTTF
	 e4MsUHoOs7DHSPbBZrFd7MwX+1aPxqjlsMOCldnM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbfEaGkM (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Fri, 31 May 2019 02:40:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:48020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726386AbfEaGkM (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Fri, 31 May 2019 02:40:12 -0400
Received: from localhost.localdomain (unknown [223.93.147.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 41AE226474;
        Fri, 31 May 2019 06:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559284812;
        bh=qLPIsNugCDXHRbL4518fpyTBEbuzLr9juiED2ZCPJN4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rAo/HhpBf4Jofnww3dhBo+wZM4AN+qM7HBFSRCGRxINwuTntyYACqc/V93IRcn+ht
         cFA2VNQANl/h0Shjs302c+XDKpIRsH4OQjtg+iuETeI/HvSPpVBHibyaLp4Bt/6S2J
         N6TIGNAXWeLF7l2K8D/C/juX+1yN+254IiwM5+PI=
From:   guoren@kernel.org
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be
Cc:     linux-csky@vger.kernel.org, buildroot@buildroot.org,
        Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH V4 05/11] arch/csky: Add ABI variable for toolchain build
Date:   Fri, 31 May 2019 14:39:02 +0800
Message-Id: <1559284748-32011-6-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559284748-32011-1-git-send-email-guoren@kernel.org>
References: <1559284748-32011-1-git-send-email-guoren@kernel.org>
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

