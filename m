Return-Path: <linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8814C433ED
	for <linux-csky@archiver.kernel.org>; Sun, 11 Apr 2021 16:41:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5576601FC
	for <linux-csky@archiver.kernel.org>; Sun, 11 Apr 2021 16:41:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236429AbhDKQl2 (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Sun, 11 Apr 2021 12:41:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236406AbhDKQl2 (ORCPT
        <rfc822;linux-csky@vger.kernel.org>); Sun, 11 Apr 2021 12:41:28 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25EC1C061574;
        Sun, 11 Apr 2021 09:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=gVsa5DQdp2KIeDNPN1E3eqd2kzQvlm6ylEd1hrI+nwk=; b=pyRcA5RMMvRb9iFR0j8Q8J8ybR
        8nJ8YGC++fuvDZro4tJeUGJ4UyZI2HgZ1Y19Bkyz8f4AgbRUzepU86W5D+39dzCiDYvY2IfKEwYcD
        7ZcLlDuwxiNcDAUCUXheo3xM+OnyMeobxCcpaRA39XLTr/fkSWGmB/px2TU8q8GQhPFdbRiZNgk8K
        zmbp8ZfxdjO9b70rvxFpHU/tLEIxdUOpApz8WNRYUOTbxdctOSL4vMyeRTB86cgDdCpIsF0CXzU49
        5fmLXGgJRsOgSKcK+TO9uHO2t8CBbirY4E2imVg06MEVznkTXvCbsKvn8mXaJ+MGQRSRBI3ZFKtkH
        9TQRIV/g==;
Received: from [2601:1c0:6280:3f0::e0e1] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lVd91-003Boz-0m; Sun, 11 Apr 2021 16:41:08 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>, Guo Ren <guoren@kernel.org>,
        linux-csky@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] csky: fix syscache.c fallthrough warning
Date:   Sun, 11 Apr 2021 09:41:04 -0700
Message-Id: <20210411164104.5734-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

This case of the switch statement falls through to the following case.
This appears to be on purpose, so declare it as OK.

../arch/csky/mm/syscache.c: In function '__do_sys_cacheflush':
../arch/csky/mm/syscache.c:17:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
   17 |   flush_icache_mm_range(current->mm,
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   18 |     (unsigned long)addr,
      |     ~~~~~~~~~~~~~~~~~~~~
   19 |     (unsigned long)addr + bytes);
      |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../arch/csky/mm/syscache.c:20:2: note: here
   20 |  case DCACHE:
      |  ^~~~

Fixes: 997153b9a75c ("csky: Add flush_icache_mm to defer flush icache all")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Guo Ren <guoren@kernel.org>
Cc: linux-csky@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>
---
@Guo, should this be a "break" instead of fallthrough?

 arch/csky/mm/syscache.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20210409.orig/arch/csky/mm/syscache.c
+++ linux-next-20210409/arch/csky/mm/syscache.c
@@ -17,6 +17,7 @@ SYSCALL_DEFINE3(cacheflush,
 		flush_icache_mm_range(current->mm,
 				(unsigned long)addr,
 				(unsigned long)addr + bytes);
+		fallthrough;
 	case DCACHE:
 		dcache_wb_range((unsigned long)addr,
 				(unsigned long)addr + bytes);
