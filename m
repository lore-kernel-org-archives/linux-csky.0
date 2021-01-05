Return-Path: <linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A529C433E0
	for <linux-csky@archiver.kernel.org>; Tue,  5 Jan 2021 15:25:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DAAB22B4B
	for <linux-csky@archiver.kernel.org>; Tue,  5 Jan 2021 15:25:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725792AbhAEPZh (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Tue, 5 Jan 2021 10:25:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33274 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726246AbhAEPZg (ORCPT
        <rfc822;linux-csky@vger.kernel.org>); Tue, 5 Jan 2021 10:25:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609860250;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=MI8fegNbRAndf7BvHodZgFSvrYR87JXw3Wc2/p2jog8=;
        b=G3LYZXfHiHD1muINPKTN3l3ZTuQLkXXe5Q3xRIQpKGz9UJY01/XelufYLcBHjSt9/jIdoI
        i4rlatMj+FlzJ+PhepMpg8Fmq5Jz/MNPrtev23Vr07+22YAluAVbssoKOMYTmoLAbKYyi8
        QZORC0HQMu5TBWqOUz+II9RdbC92dhs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-Oe3VHKXVNJSvws48sKhIgQ-1; Tue, 05 Jan 2021 10:24:08 -0500
X-MC-Unique: Oe3VHKXVNJSvws48sKhIgQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB514801817;
        Tue,  5 Jan 2021 15:24:07 +0000 (UTC)
Received: from prarit.bos.redhat.com (prarit-guest.7a2m.lab.eng.bos.redhat.com [10.16.222.26])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 572F519713;
        Tue,  5 Jan 2021 15:24:07 +0000 (UTC)
From:   Prarit Bhargava <prarit@redhat.com>
To:     linux-csky@vger.kernel.org
Cc:     Prarit Bhargava <prarit@redhat.com>, Guo Ren <guoren@kernel.org>
Subject: [PATCH] csky: Send stop IPI to send to online CPUs
Date:   Tue,  5 Jan 2021 10:24:04 -0500
Message-Id: <20210105152404.579730-1-prarit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

Unfortunately I do not have any HW to test this patch.  Hopefully someone on
the cc list can help me out?

P.

---8<---

This issue was noticed while debugging a shutdown issue where some
secondary CPUs are not being shutdown correctly.  A fix for that [1] requires
that secondary cpus be offlined using the cpu_online_mask so that the
stop operation is a no-op if CPU HOTPLUG is disabled.  I, like the author in
[1] looked at the architectures and found that csky is one of two
architectures that executes smp_send_stop() on all possible CPUs.

On csky, smp_send_stop() sends an IPI to all possible CPUs but only needs
to send them to online CPUs.

Send the stop IPI to only the online CPUs.

Signed-off-by: Prarit Bhargava <prarit@redhat.com>
Cc: Guo Ren <guoren@kernel.org>
---
 arch/csky/kernel/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/csky/kernel/smp.c b/arch/csky/kernel/smp.c
index 041d0de6a1b6..ee37586ba919 100644
--- a/arch/csky/kernel/smp.c
+++ b/arch/csky/kernel/smp.c
@@ -137,7 +137,7 @@ static void ipi_stop(void *unused)
 
 void smp_send_stop(void)
 {
-	on_each_cpu(ipi_stop, NULL, 1);
+	on_each_cpu_mask(cpu_online_mask, ipi_stop, NULL, 1);
 }
 
 void smp_send_reschedule(int cpu)
-- 
2.29.2

