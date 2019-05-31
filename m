Return-Path: <SRS0=wqK1=T7=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D7CC04AB6
	for <linux-csky@archiver.kernel.org>; Fri, 31 May 2019 06:40:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CF6EB2647B
	for <linux-csky@archiver.kernel.org>; Fri, 31 May 2019 06:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559284848;
	bh=PodOkBifXNwacCSeaJhs5Tf3N4vLYk6altcuHAorg2o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=KGhShx7kFMvkO7nO7lU5WaBCXdx0qpoIBjOwZ6PmiIemhsjyjuxcQd/1/hDglguNT
	 UiIsJMB6ondPcJEWPY3CyKUZZ/ztNR+sa5w1FeGQCgNaWHvrGLBzMBsm3MFEQQwm1g
	 qqwJEjuLrju88zPaJOqsxMfU4FUwcIduiUNHw7bs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbfEaGks (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Fri, 31 May 2019 02:40:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:48548 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726716AbfEaGks (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Fri, 31 May 2019 02:40:48 -0400
Received: from localhost.localdomain (unknown [223.93.147.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4CF002649F;
        Fri, 31 May 2019 06:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559284848;
        bh=PodOkBifXNwacCSeaJhs5Tf3N4vLYk6altcuHAorg2o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CSfDAlQc6ko7NhbwxMG/kE8R1wYfFyVfTICbcvk0ozyS5ZwaFd20T9MUYea1Yxbhj
         6SxmT8Sd2O9RHUL/vSn3Vbs4UdWkyk7TCXCp93RpofBxdd81vX2yIDo5wk0lyjbRZ/
         0tr3JFi7H6Vhd++t42TPZD1TMzmn1XN3qel+ophg=
From:   guoren@kernel.org
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be
Cc:     linux-csky@vger.kernel.org, buildroot@buildroot.org,
        Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH V4 11/11] arch/csky: Enable csky toolchain build
Date:   Fri, 31 May 2019 14:39:08 +0800
Message-Id: <1559284748-32011-12-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559284748-32011-1-git-send-email-guoren@kernel.org>
References: <1559284748-32011-1-git-send-email-guoren@kernel.org>
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

From: Guo Ren <ren_guo@c-sky.com>

Now csky toolchain could be built in buildroot.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 arch/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/Config.in b/arch/Config.in
index d82803c..db1199c 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -77,7 +77,6 @@ config BR2_aarch64_be
 
 config BR2_csky
 	bool "csky"
-	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  csky is processor IP from china.
-- 
2.7.4

