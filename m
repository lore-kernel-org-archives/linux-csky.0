Return-Path: <SRS0=K7zh=T5=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D8CC04AB3
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 07:19:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7A98E21019
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 07:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559114352;
	bh=iHZhMJ8gAId8/gEtnSdbagiGwUU1j1eZOkdTE/2oEzQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=m5KGnv4EfdFZWcdLA57dvSZudPPTxfIhT+Sdi3Mcn/CXZ0mkgZCrbckATJUOqC4pK
	 3CEBNLT1/vCL2ZJm4PGoe7cSXBFGg+v2gC/jaSxj2hKDHpEsj3fIxMkuNa8/SG2BBz
	 bVtQW51VC+jELbN3YVidQ4sx5W9RCO1yxn2OuHVc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbfE2HTM (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Wed, 29 May 2019 03:19:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:49142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726543AbfE2HTM (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Wed, 29 May 2019 03:19:12 -0400
Received: from localhost.localdomain (unknown [223.93.147.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8D77D21734;
        Wed, 29 May 2019 07:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559114351;
        bh=iHZhMJ8gAId8/gEtnSdbagiGwUU1j1eZOkdTE/2oEzQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YEYtcQoUyCTah1Rkbii4uSZctKOtIONM+nyuY1OoxZ7UPW8r8mHZX455gImrMc7/T
         0D6PwGzdBNafgEQFwScolkSockNILNw9NOYRnvTxPJ6UssetrahLHuuvyegYLF4x9H
         m7T6OA8yUqVE2lYaHu+pvw3ha8w79acZxpwOAM/M=
From:   guoren@kernel.org
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be
Cc:     linux-csky@vger.kernel.org, buildroot@buildroot.org,
        Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH V3 03/10] arch/csky: Add FLOAT_ABI compiler options
Date:   Wed, 29 May 2019 15:18:41 +0800
Message-Id: <1559114328-23357-4-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559114328-23357-1-git-send-email-guoren@kernel.org>
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

From: Guo Ren <ren_guo@c-sky.com>

This is only for abiv2 and abiv1 don't support FPU.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 arch/Config.in.csky | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/Config.in.csky b/arch/Config.in.csky
index af9bbd5..a967d2f 100644
--- a/arch/Config.in.csky
+++ b/arch/Config.in.csky
@@ -30,6 +30,10 @@ config BR2_CSKY_VDSP
 	bool "Enable VDSP enhanced instructions Co-processor"
 	depends on BR2_CSKY_FPU
 
+config BR2_GCC_TARGET_FLOAT_ABI
+	default "soft"		if !BR2_CSKY_FPU
+	default "hard"		if BR2_CSKY_FPU
+
 config BR2_ARCH
 	default "csky"
 
-- 
2.7.4

