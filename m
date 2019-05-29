Return-Path: <SRS0=K7zh=T5=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFD0FC46470
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 07:19:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B9E1021019
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 07:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559114375;
	bh=PodOkBifXNwacCSeaJhs5Tf3N4vLYk6altcuHAorg2o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=bt3JSlynY2WTspskCnwXifZKgdiDnnJW48E5SkU1K/mEY9ZLcIpvfHr8w9RqCeMma
	 hSAxFia7PuMBHueOxqFLT0npwiHhGH33gRX7vdUxZPctzkFVX6vtfIGP42y6YenVMm
	 POUz8Xr5HcjvXVy3QwCB8ezIcpSpiycKK/zD8dto=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbfE2HTf (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Wed, 29 May 2019 03:19:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:49528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726683AbfE2HTf (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Wed, 29 May 2019 03:19:35 -0400
Received: from localhost.localdomain (unknown [223.93.147.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C4C96208C3;
        Wed, 29 May 2019 07:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559114375;
        bh=PodOkBifXNwacCSeaJhs5Tf3N4vLYk6altcuHAorg2o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Rjgj7xtIg8rwdW/wcMJSfmvROQRtTBYfCzz8+4h/2cM8RvHrVugtPki6bJomPs2/R
         qFl8dMYP44CYKuFdAqJxsc0LXck5QrEgEJUkuWJGFDZq0ilBa70OT5EnZRNdI2oQHh
         oBNzrg1WKf0vEWrwyirUyrFKFXRSggBpJ3FcX7y8=
From:   guoren@kernel.org
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be
Cc:     linux-csky@vger.kernel.org, buildroot@buildroot.org,
        Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH V3 10/10] arch/csky: Enable csky toolchain build
Date:   Wed, 29 May 2019 15:18:48 +0800
Message-Id: <1559114328-23357-11-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559114328-23357-1-git-send-email-guoren@kernel.org>
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
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

