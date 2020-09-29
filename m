Return-Path: <SRS0=GsFV=DG=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57112C2D0A8
	for <linux-csky@archiver.kernel.org>; Tue, 29 Sep 2020 01:30:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1361B208FE
	for <linux-csky@archiver.kernel.org>; Tue, 29 Sep 2020 01:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601343030;
	bh=lX9O4hxvxd90v1IeDiyJoQVpOMMiA7ft8aBH2MqUH60=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=AsNWc9n909R1AIxiVrzrKVTDiDPsDVllKlKDf/cVGv5WD4Q5UpK4Fhhv2VYyb8Z5r
	 igGCQm3N8u+XzqBMTFo9c/bz4Z9TJn35U+gvquxJAzrvbjWnI9t8CEGHzaM4D6xznx
	 n52rvJA9L4DDeKm4nngGryTDVRXXf0EUwQXtWRXI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727177AbgI2Ba3 (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Mon, 28 Sep 2020 21:30:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:39272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726379AbgI2Ba3 (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Mon, 28 Sep 2020 21:30:29 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6280A2083B;
        Tue, 29 Sep 2020 01:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601343029;
        bh=lX9O4hxvxd90v1IeDiyJoQVpOMMiA7ft8aBH2MqUH60=;
        h=From:To:Cc:Subject:Date:From;
        b=a7sj9sdi5WSXc7BXNnKs3zrdZZWUN7ZDB7O+wsrc6ij6zA7NbLruJ49HlyWGMTaV2
         tIk/sNCid6tedj0tnl8CXlu0ouPBzEEBQjZmF/FxiMtqmnJuNLZtBJIFtlEj5rn5yI
         dNMSgPz+Wa32hjzL7vGVh0ZUDidga5lJghHhhMFo=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Guo Ren <guoren@linux.alibaba.com>,
        Xu Kai <xukai@nationalchip.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sasha Levin <sashal@kernel.org>, linux-csky@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 01/29] clocksource/drivers/timer-gx6605s: Fixup counter reload
Date:   Mon, 28 Sep 2020 21:29:58 -0400
Message-Id: <20200929013027.2406344-1-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

From: Guo Ren <guoren@linux.alibaba.com>

[ Upstream commit bc6717d55d07110d8f3c6d31ec2af50c11b07091 ]

When the timer counts to the upper limit, an overflow interrupt is
generated, and the count is reset with the value in the TIME_INI
register. But the software expects to start counting from 0 when
the count overflows, so it forces TIME_INI to 0 to solve the
potential interrupt storm problem.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Tested-by: Xu Kai <xukai@nationalchip.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Link: https://lore.kernel.org/r/1597735877-71115-1-git-send-email-guoren@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clocksource/timer-gx6605s.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-gx6605s.c b/drivers/clocksource/timer-gx6605s.c
index 80d0939d040b5..8d386adbe8009 100644
--- a/drivers/clocksource/timer-gx6605s.c
+++ b/drivers/clocksource/timer-gx6605s.c
@@ -28,6 +28,7 @@ static irqreturn_t gx6605s_timer_interrupt(int irq, void *dev)
 	void __iomem *base = timer_of_base(to_timer_of(ce));
 
 	writel_relaxed(GX6605S_STATUS_CLR, base + TIMER_STATUS);
+	writel_relaxed(0, base + TIMER_INI);
 
 	ce->event_handler(ce);
 
-- 
2.25.1

