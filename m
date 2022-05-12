Return-Path: <linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65934C433F5
	for <linux-csky@archiver.kernel.org>; Thu, 12 May 2022 04:08:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346024AbiELEIi (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Thu, 12 May 2022 00:08:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237704AbiELEIe (ORCPT
        <rfc822;linux-csky@vger.kernel.org>); Thu, 12 May 2022 00:08:34 -0400
Received: from condef-06.nifty.com (condef-06.nifty.com [202.248.20.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5238F1E327A
        for <linux-csky@vger.kernel.org>; Wed, 11 May 2022 21:08:33 -0700 (PDT)
Received: from conuserg-07.nifty.com ([10.126.8.70])by condef-06.nifty.com with ESMTP id 24C41icn028682
        for <linux-csky@vger.kernel.org>; Thu, 12 May 2022 13:01:44 +0900
Received: from grover.jp (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 24C41CNN015198;
        Thu, 12 May 2022 13:01:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 24C41CNN015198
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1652328072;
        bh=KgGewnRxd6B9bmU83w0Z+PwveeUHvuXAra4qE2JWIyE=;
        h=From:To:Cc:Subject:Date:From;
        b=vlFosGTanmeZQaGvHFjlnLwijUmuhtuvzhn0MuXaJzUPI5GnBmdQ4VobdmXppvu0Q
         jH1FNp13pb1zvahqpm3VfETJZX/s2sDwRZP+Dktmdrsxu16YrOzd1cI1YnfXalfPvf
         sBWBKgwG54LigM3Uuv3/hjvlWrD5KPfUcbYHg4yx5qTca6UU8G/v57kWdmglKFzJln
         Xq95YLnJ/phGMgLypDrugil7G2/HiosRuvVsiL8avR5NHH5dHAB71P1vPS9jiLcbBf
         gLjg/zl1Lq3tFF+bEiqTIUL8HocTEMbAlaazRhlL93o8yN3HOuVq4XSOINptUCE/t6
         0Cq4MNsR94L2w==
X-Nifty-SrcIP: [133.32.177.133]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/4] csky: remove unused $(dtb-y) from arch/csky/boot/Makefile
Date:   Thu, 12 May 2022 12:59:00 +0900
Message-Id: <20220512035903.2779287-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

arch/csky/boot/Makefile does not build DTB.
arch/csky/boot/dts/Makefile does.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/csky/boot/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/csky/boot/Makefile b/arch/csky/boot/Makefile
index dbc9b1bd72f0..c3cfde28f8e6 100644
--- a/arch/csky/boot/Makefile
+++ b/arch/csky/boot/Makefile
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 targets := Image zImage uImage
-targets += $(dtb-y)
 
 $(obj)/Image: vmlinux FORCE
 	$(call if_changed,objcopy)
-- 
2.32.0

