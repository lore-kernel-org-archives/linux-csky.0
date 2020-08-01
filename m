Return-Path: <SRS0=7AHu=BL=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7A1C433DF
	for <linux-csky@archiver.kernel.org>; Sat,  1 Aug 2020 01:15:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D77822CB2
	for <linux-csky@archiver.kernel.org>; Sat,  1 Aug 2020 01:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596244535;
	bh=1RPRroc4ZnsJOWr6FwKVLudSa+TgPmHIWtBSgU3bATE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=gJMHep/T/Z8zhaC3LOnL11gHJ0uDb/VBfZhnSKpqcXsDfUQWkhSBdU22AvpeTFTX9
	 6+TFvFOoCFdf0erz4UN+ILPKSaf/9TQvVLn6GrAOgK87Y7EgqRtguIpYF8e/k+WiH0
	 nZqVfWgUwsRC+DJMNrR4diaC+LdJzfJLa0ywsQ4Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728167AbgHABOq (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Fri, 31 Jul 2020 21:14:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:43608 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728152AbgHABOp (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Fri, 31 Jul 2020 21:14:45 -0400
Received: from localhost.localdomain (unknown [89.208.247.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0729A20888;
        Sat,  1 Aug 2020 01:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596244485;
        bh=1RPRroc4ZnsJOWr6FwKVLudSa+TgPmHIWtBSgU3bATE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=z1GQn6Tm2vMVuAGzXkbU0pA3ZdIAbIe6Cp47yD5LeJuOlkvXOVAcQ0EyHM1z+uVJY
         xEAD7VtxgQA9DlKAftSg+cZAN9ZoaRB8yIXeSpKL+17IRdF6VNRn1TIG0CYLfFKxrW
         7JnWEvmz+5T2Q+q+T5LmmP4fzc9me6JkgJJyNnso=
From:   guoren@kernel.org
To:     guoren@kernel.org, arnd@arndb.de
Cc:     linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
        linux-arch@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 04/13] csky: Fixup duplicated restore sp in RESTORE_REGS_FTRACE
Date:   Sat,  1 Aug 2020 01:14:04 +0000
Message-Id: <1596244453-98575-5-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596244453-98575-1-git-send-email-guoren@kernel.org>
References: <1596244453-98575-1-git-send-email-guoren@kernel.org>
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

From: Guo Ren <guoren@linux.alibaba.com>

There is no user return for RESTORE_REGS_FTRACE, so it's no need to
save sp into ss0 as RESTORE_REGS_ALL.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/csky/abiv2/inc/abi/entry.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/csky/abiv2/inc/abi/entry.h b/arch/csky/abiv2/inc/abi/entry.h
index 4fdd6c1..bedcc6f 100644
--- a/arch/csky/abiv2/inc/abi/entry.h
+++ b/arch/csky/abiv2/inc/abi/entry.h
@@ -136,8 +136,6 @@
 
 .macro	RESTORE_REGS_FTRACE
 	ldw	tls, (sp, 0)
-	ldw	a0, (sp, 16)
-	mtcr	a0, ss0
 
 #ifdef CONFIG_CPU_HAS_HILO
 	ldw	a0, (sp, 140)
@@ -158,7 +156,6 @@
 	addi    sp, 40
 	ldm     r16-r30, (sp)
 	addi    sp, 72
-	mfcr	sp, ss0
 .endm
 
 .macro SAVE_SWITCH_STACK
-- 
2.7.4

