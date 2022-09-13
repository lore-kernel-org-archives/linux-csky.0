Return-Path: <linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05CDEC6FA82
	for <linux-csky@archiver.kernel.org>; Tue, 13 Sep 2022 03:38:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbiIMDif (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Mon, 12 Sep 2022 23:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229830AbiIMDib (ORCPT
        <rfc822;linux-csky@vger.kernel.org>); Mon, 12 Sep 2022 23:38:31 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECB2E54651;
        Mon, 12 Sep 2022 20:38:27 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MRTb322LvzNmF7;
        Tue, 13 Sep 2022 11:33:51 +0800 (CST)
Received: from huawei.com (10.67.174.53) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 13 Sep
 2022 11:38:25 +0800
From:   Liao Chang <liaochang1@huawei.com>
To:     <catalin.marinas@arm.com>, <will@kernel.org>, <guoren@kernel.org>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <rostedt@goodmis.org>,
        <mhiramat@kernel.org>, <liaochang1@huawei.com>, <maz@kernel.org>,
        <alexandru.elisei@arm.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-csky@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>
Subject: [PATCH V2 1/3] riscv/kprobe: Optimize the performance of patching single-step slot
Date:   Tue, 13 Sep 2022 11:34:52 +0800
Message-ID: <20220913033454.104519-2-liaochang1@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220913033454.104519-1-liaochang1@huawei.com>
References: <20220913033454.104519-1-liaochang1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.53]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

Single-step slot would not be used until kprobe is enabled, that means
no race condition occurs on it under SMP, hence it is safe to pacth ss
slot without stopping machine.

Signed-off-by: Liao Chang <liaochang1@huawei.com>
---
 arch/riscv/kernel/probes/kprobes.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index e6e950b7cf32..bc1f39b96e41 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -24,12 +24,14 @@ post_kprobe_handler(struct kprobe *, struct kprobe_ctlblk *, struct pt_regs *);
 static void __kprobes arch_prepare_ss_slot(struct kprobe *p)
 {
 	unsigned long offset = GET_INSN_LENGTH(p->opcode);
+	kprobe_opcode_t slot[MAX_INSN_SIZE];
 
 	p->ainsn.api.restore = (unsigned long)p->addr + offset;
 
-	patch_text(p->ainsn.api.insn, p->opcode);
-	patch_text((void *)((unsigned long)(p->ainsn.api.insn) + offset),
-		   __BUG_INSN_32);
+	memcpy(slot, &p->opcode, offset);
+	*(kprobe_opcode_t *)((unsigned long)slot + offset) = __BUG_INSN_32;
+	patch_text_nosync(p->ainsn.api.insn, slot,
+			  offset + GET_INSN_LENGTH(__BUG_INSN_32));
 }
 
 static void __kprobes arch_prepare_simulate(struct kprobe *p)
-- 
2.17.1

