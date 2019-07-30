Return-Path: <SRS0=fLiT=V3=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41AB1C433FF
	for <linux-csky@archiver.kernel.org>; Tue, 30 Jul 2019 12:16:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 15C4F2087F
	for <linux-csky@archiver.kernel.org>; Tue, 30 Jul 2019 12:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1564488969;
	bh=n6148DPPmXmgCl+qAHkW3wVYf7lZJ8nj73IyTN6CmlI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=XV96FDjHQBGJnaDk9/mTbIGXbHdEI/5ciOC7zkhFwywWSSZr51fo1P7tbPKqIJKJ3
	 bXNtAoB7CvfAL9yEY43w6WQDt7os95sZjDuOITViBMCTL1Vc6AAbuA8Twj0a500ZG3
	 u4tf0EsJMg65cf0B2eiXGXkDcEdipzNlwkAfc/Jo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729374AbfG3MQF (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Tue, 30 Jul 2019 08:16:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:52378 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729518AbfG3MQC (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Tue, 30 Jul 2019 08:16:02 -0400
Received: from guoren-Inspiron-7460.lan (unknown [60.186.223.164])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D824C2087F;
        Tue, 30 Jul 2019 12:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564488961;
        bh=n6148DPPmXmgCl+qAHkW3wVYf7lZJ8nj73IyTN6CmlI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hEDFoXcJTEPIF29sYkGKx7WUH+7prwTzXAu3Oj50LEjxgzunjmkxqWhvRoycKh3+A
         U7zz4iFg1WkzjinLK+R8vJ17BB6v/sT7dQozj4oF6l+efcGxwYqToR5xH2aeEdWKV2
         wit0Nxe+Ttsl20y5W8v/maeIWscXZ0Sq/scveoFk=
From:   guoren@kernel.org
To:     arnd@arndb.de
Cc:     linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-csky@vger.kernel.org, feng_shizhu@dahuatech.com,
        zhang_jian5@dahuatech.com, zheng_xingjian@dahuatech.com,
        zhu_peng@dahuatech.com, Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH 4/4] csky: Add dma_inv_range for DMA_FROM_DEVICE
Date:   Tue, 30 Jul 2019 20:15:45 +0800
Message-Id: <1564488945-20149-4-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564488945-20149-1-git-send-email-guoren@kernel.org>
References: <1564488945-20149-1-git-send-email-guoren@kernel.org>
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

From: Guo Ren <ren_guo@c-sky.com>

DMA_FROM_DEVICE only need to read dma data of memory into CPU cache,
so there is no need to clear cache before. Also clear + inv for
DMA_FROM_DEVICE won't cause problem, because the memory range for dma
won't be touched by software during dma working.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 arch/csky/include/asm/cache.h |  1 +
 arch/csky/mm/cachev1.c        |  7 ++++++-
 arch/csky/mm/cachev2.c        | 11 ++++++++++-
 arch/csky/mm/dma-mapping.c    |  4 ++++
 4 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/csky/include/asm/cache.h b/arch/csky/include/asm/cache.h
index d683734..1d5fc2f 100644
--- a/arch/csky/include/asm/cache.h
+++ b/arch/csky/include/asm/cache.h
@@ -24,6 +24,7 @@ void cache_wbinv_range(unsigned long start, unsigned long end);
 void cache_wbinv_all(void);
 
 void dma_wbinv_range(unsigned long start, unsigned long end);
+void dma_inv_range(unsigned long start, unsigned long end);
 void dma_wb_range(unsigned long start, unsigned long end);
 
 #endif
diff --git a/arch/csky/mm/cachev1.c b/arch/csky/mm/cachev1.c
index b8a75cc..494ec91 100644
--- a/arch/csky/mm/cachev1.c
+++ b/arch/csky/mm/cachev1.c
@@ -120,7 +120,12 @@ void dma_wbinv_range(unsigned long start, unsigned long end)
 	cache_op_range(start, end, DATA_CACHE|CACHE_CLR|CACHE_INV, 1);
 }
 
+void dma_inv_range(unsigned long start, unsigned long end)
+{
+	cache_op_range(start, end, DATA_CACHE|CACHE_CLR|CACHE_INV, 1);
+}
+
 void dma_wb_range(unsigned long start, unsigned long end)
 {
-	cache_op_range(start, end, DATA_CACHE|CACHE_INV, 1);
+	cache_op_range(start, end, DATA_CACHE|CACHE_CLR|CACHE_INV, 1);
 }
diff --git a/arch/csky/mm/cachev2.c b/arch/csky/mm/cachev2.c
index baaf05d..b61be65 100644
--- a/arch/csky/mm/cachev2.c
+++ b/arch/csky/mm/cachev2.c
@@ -69,11 +69,20 @@ void dma_wbinv_range(unsigned long start, unsigned long end)
 	sync_is();
 }
 
+void dma_inv_range(unsigned long start, unsigned long end)
+{
+	unsigned long i = start & ~(L1_CACHE_BYTES - 1);
+
+	for (; i < end; i += L1_CACHE_BYTES)
+		asm volatile("dcache.iva %0\n"::"r"(i):"memory");
+	sync_is();
+}
+
 void dma_wb_range(unsigned long start, unsigned long end)
 {
 	unsigned long i = start & ~(L1_CACHE_BYTES - 1);
 
 	for (; i < end; i += L1_CACHE_BYTES)
-		asm volatile("dcache.civa %0\n"::"r"(i):"memory");
+		asm volatile("dcache.cva %0\n"::"r"(i):"memory");
 	sync_is();
 }
diff --git a/arch/csky/mm/dma-mapping.c b/arch/csky/mm/dma-mapping.c
index 3f1ff9d..d8f0f81 100644
--- a/arch/csky/mm/dma-mapping.c
+++ b/arch/csky/mm/dma-mapping.c
@@ -72,6 +72,8 @@ void arch_sync_dma_for_device(struct device *dev, phys_addr_t paddr,
 		cache_op(paddr, size, dma_wb_range);
 		break;
 	case DMA_FROM_DEVICE:
+		cache_op(paddr, size, dma_inv_range);
+		break;
 	case DMA_BIDIRECTIONAL:
 		cache_op(paddr, size, dma_wbinv_range);
 		break;
@@ -88,6 +90,8 @@ void arch_sync_dma_for_cpu(struct device *dev, phys_addr_t paddr,
 		cache_op(paddr, size, dma_wb_range);
 		break;
 	case DMA_FROM_DEVICE:
+		cache_op(paddr, size, dma_inv_range);
+		break;
 	case DMA_BIDIRECTIONAL:
 		cache_op(paddr, size, dma_wbinv_range);
 		break;
-- 
2.7.4

