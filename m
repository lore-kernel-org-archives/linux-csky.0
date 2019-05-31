Return-Path: <SRS0=wqK1=T7=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CFACC04AB6
	for <linux-csky@archiver.kernel.org>; Fri, 31 May 2019 06:40:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ED71526474
	for <linux-csky@archiver.kernel.org>; Fri, 31 May 2019 06:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559284808;
	bh=JHjtn1lSlkLMZuZE5Xd4sPcS+uZTDyhQjshDSw+9E9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=eGcKcMAhZATh7yY5J4bWfjWxBH7Lk8QsL9k7rYdwJcwT+jK7oIve10aCJ/bnb7fow
	 OD7ViVWipCds7HhW2z4NfejXVAZ9fJ5fLA40qu+oKEJHCWdoUOsrlsUsHXOLP/gwYk
	 cCue2pjwExZNSrfvL1eVqE/pktatuycEksmIWjmM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbfEaGkH (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Fri, 31 May 2019 02:40:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:47954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726825AbfEaGkH (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Fri, 31 May 2019 02:40:07 -0400
Received: from localhost.localdomain (unknown [223.93.147.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A1D2A2647B;
        Fri, 31 May 2019 06:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559284807;
        bh=JHjtn1lSlkLMZuZE5Xd4sPcS+uZTDyhQjshDSw+9E9g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UrR8ty+PQ5bkO1RN++srwys8YBzy1s/xMstsUdG50lov/kX5+H16CIrsMppLUs9rB
         PtzvI+BUSQ86d6j36EcLj0M84OqRfLa+etVibZQOOilckvO8oBdvsi71jS9Z5J8Fkx
         /1lJH1RW8wPtr42lnREmnVkyBNle8Im3gnMF6Qm4=
From:   guoren@kernel.org
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be
Cc:     linux-csky@vger.kernel.org, buildroot@buildroot.org,
        Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH V4 04/11] arch/csky: Add FLOAT_ABI compiler options
Date:   Fri, 31 May 2019 14:39:01 +0800
Message-Id: <1559284748-32011-5-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559284748-32011-1-git-send-email-guoren@kernel.org>
References: <1559284748-32011-1-git-send-email-guoren@kernel.org>
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

From: Guo Ren <ren_guo@c-sky.com>

C-SKY CPU is seperated into two ABIs:
 - abiv1: mcore based ISA with ELF_NUM:39 and do not support FPU & VDSP.
          (CPU: 610)
 - abiv2: C-SKY own ISA with ELF_NUM:252 and support FPU & VDSP.
          (CPU: 807, 810, 860)

BR2_GCC_TARGET_FLOAT_ABI will have a value for abiv1. Except the value
will always be "soft" because there's no FPU support in ck610, which is
the only core using abiv1.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

