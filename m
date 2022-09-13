Return-Path: <linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F7B0C54EE9
	for <linux-csky@archiver.kernel.org>; Tue, 13 Sep 2022 03:38:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiIMDig (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Mon, 12 Sep 2022 23:38:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbiIMDib (ORCPT
        <rfc822;linux-csky@vger.kernel.org>); Mon, 12 Sep 2022 23:38:31 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD2B05464C;
        Mon, 12 Sep 2022 20:38:27 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MRTbm7199zkWpS;
        Tue, 13 Sep 2022 11:34:28 +0800 (CST)
Received: from huawei.com (10.67.174.53) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 13 Sep
 2022 11:38:24 +0800
From:   Liao Chang <liaochang1@huawei.com>
To:     <catalin.marinas@arm.com>, <will@kernel.org>, <guoren@kernel.org>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <rostedt@goodmis.org>,
        <mhiramat@kernel.org>, <liaochang1@huawei.com>, <maz@kernel.org>,
        <alexandru.elisei@arm.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-csky@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>
Subject: [PATCH V2 0/3] kprobe: Optimize the performance of patching ss
Date:   Tue, 13 Sep 2022 11:34:51 +0800
Message-ID: <20220913033454.104519-1-liaochang1@huawei.com>
X-Mailer: git-send-email 2.17.1
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

v2:
Backport riscv patch to cksy and arm64.

Liao Chang (3):
  riscv/kprobe: Optimize the performance of patching single-step slot
  csky/kprobe: Optimize the performance of patching single-step slot
  arm64/kprobe: Optimize the performance of patching single-step slot

 arch/arm64/kernel/probes/kprobes.c | 5 ++---
 arch/csky/kernel/probes/kprobes.c  | 6 +++++-
 arch/riscv/kernel/probes/kprobes.c | 8 +++++---
 3 files changed, 12 insertions(+), 7 deletions(-)

-- 
2.17.1

