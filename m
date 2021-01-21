Return-Path: <linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 426EEC433E6
	for <linux-csky@archiver.kernel.org>; Thu, 21 Jan 2021 07:02:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E86632396D
	for <linux-csky@archiver.kernel.org>; Thu, 21 Jan 2021 07:02:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbhAUHB6 (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Thu, 21 Jan 2021 02:01:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:37006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727074AbhAUHAL (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Thu, 21 Jan 2021 02:00:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99E6C239FE;
        Thu, 21 Jan 2021 06:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611212266;
        bh=X2ZbouhaD7Fh4Z4Fk+x6fXXUkQjlXINays174Qir0P0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dpZtFPbqLPIoFfy8sb30jz6gJLWAst64gKLcZGwLraTT0kJ0TZti0OZ3v4YJxmK1x
         3K4ilFl+cM5a5U14I2RZda4JvDrpgv9o/DLrWVeeOmc6UoD9juhDc/WQwH3UQen0NB
         PidVmihHiRp1XrqGt7qDOU0yHf7W8HP3APap+UMDbb6QgNnRMcs3LWcsux+KwxCcob
         T76YXPjVDpaI5pyQDCvDC9KyvhQMMjsrgTkeokHihUr8whzrsPHYAcJXuBG4vC6FGB
         aXgzKs1rfuBRraOsyT7D95w4t6T1LCa/Hjc/KF+uVgh23tQcZrqImGVhRsnyxUF/fP
         RxU+NDGsNPIXQ==
From:   guoren@kernel.org
To:     guoren@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
        Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 28/29] csky: Using set_max_mapnr api
Date:   Thu, 21 Jan 2021 14:53:48 +0800
Message-Id: <20210121065349.3188251-28-guoren@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210121065349.3188251-1-guoren@kernel.org>
References: <20210121065349.3188251-1-guoren@kernel.org>
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

From: Guo Ren <guoren@linux.alibaba.com>

Using set_max_mapnr API instead of setting the value directly.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 arch/csky/mm/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/csky/mm/init.c b/arch/csky/mm/init.c
index bc05a3be9d57..03970f4408f5 100644
--- a/arch/csky/mm/init.c
+++ b/arch/csky/mm/init.c
@@ -86,9 +86,9 @@ void __init mem_init(void)
 #ifdef CONFIG_HIGHMEM
 	unsigned long tmp;
 
-	max_mapnr = highend_pfn;
+	set_max_mapnr(highend_pfn);
 #else
-	max_mapnr = max_low_pfn;
+	set_max_mapnr(max_low_pfn);
 #endif
 	high_memory = (void *) __va(max_low_pfn << PAGE_SHIFT);
 
-- 
2.17.1

