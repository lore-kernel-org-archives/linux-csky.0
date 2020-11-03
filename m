Return-Path: <SRS0=iQBs=EJ=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC49C2D0A3
	for <linux-csky@archiver.kernel.org>; Tue,  3 Nov 2020 13:48:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2651121D91
	for <linux-csky@archiver.kernel.org>; Tue,  3 Nov 2020 13:48:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4PJS/xa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729311AbgKCNqv (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Tue, 3 Nov 2020 08:46:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729242AbgKCNpT (ORCPT
        <rfc822;linux-csky@vger.kernel.org>); Tue, 3 Nov 2020 08:45:19 -0500
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3422C0613D1;
        Tue,  3 Nov 2020 05:45:19 -0800 (PST)
Received: by mail-qk1-x744.google.com with SMTP id x20so14628239qkn.1;
        Tue, 03 Nov 2020 05:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KyUFBIsp7WG/ZlJY7JJxE8NR9eUIpLAxO9Zr6R0PBAI=;
        b=b4PJS/xarNSgluAWCDQQJdu5ZZO0VU1I/CVu92i5vqJojdmesNzdpHU7yArgmVQ/E0
         ssbV0IRGKePz0hLGbtulnwYnTx5COwyQyc9m5w6wHYmkYcfAi0KMHRRx7s4bial5QlHm
         FvgIq+A4dw+gBa8aET875i6MrhNYYoEziVxW0mYaQlwHJjIC17MKQQffriRcRcrqbvIZ
         E0DUUKInWpAcW0rkp9bF5XrHmo61/Wt1H/vsEPSTiCc6yDtBv1y+2E2shnOXWuZJykAv
         qixeNSrBN1O663ndDaowUg7ftIsFgDEFacIeZyHTHWsjCEpnDR4tkoP+lBgPM5gFOtbX
         RUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KyUFBIsp7WG/ZlJY7JJxE8NR9eUIpLAxO9Zr6R0PBAI=;
        b=KYzWSDYo5+d4+t2Ti1LTXBmCC8pJohP47Izm1wxrpb1nge9/+xt8vNhwNqw3deeCrG
         GhoMThMmiyzKg14mqgc9Z2/yst54Gm83xdWX4x4D7BRMEIl7JiRoi/QacFS5eHTbA9M1
         ANWOhSXx484Y8HPHsANZics2wNQVdcKg8m6d4ylaxx4RNGflkr0aezSoULlFTdSdvI+z
         zIMoYERP3kzWHjYybwtvFfD0LcxSIawWYUSUWD+8ECYWbljofgVwstelJIVVUbe32pkw
         B/o9zA4DxGEUENFCH4EpouVZHqkYLZNUZdC/bKS9mMkC+Tp3OhQcBFPTNGI/jxIrA48A
         Zxmg==
X-Gm-Message-State: AOAM531Ymm2npH7/k1RYsZfJ1kkeT/tqYuMsHo78b6lQ2SDoXSC0dF2B
        SZ/WoeW248P7F/Uq942dRA8=
X-Google-Smtp-Source: ABdhPJxjlZ3tKnk2e7vxZIf8aOb5eHzCPcpqw48aBWIjBaLIjY56iC7mD5NkhJDWu4rwTzCntUVI8A==
X-Received: by 2002:a05:620a:62b:: with SMTP id 11mr20584746qkv.229.1604411118944;
        Tue, 03 Nov 2020 05:45:18 -0800 (PST)
Received: from zhuyifei1999-ThinkPad-T480.gw.illinois.edu ([2620:0:e00:400f::31])
        by smtp.gmail.com with ESMTPSA id a206sm7356568qkb.64.2020.11.03.05.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 05:45:18 -0800 (PST)
From:   YiFei Zhu <zhuyifei1999@gmail.com>
To:     containers@lists.linux-foundation.org
Cc:     YiFei Zhu <yifeifz2@illinois.edu>, linux-csky@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-kernel@vger.kernel.org, Aleksa Sarai <cyphar@cyphar.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Andy Lutomirski <luto@amacapital.net>,
        David Laight <David.Laight@aculab.com>,
        Dimitrios Skarlatos <dskarlat@cs.cmu.edu>,
        Giuseppe Scrivano <gscrivan@redhat.com>,
        Hubertus Franke <frankeh@us.ibm.com>,
        Jack Chen <jianyan2@illinois.edu>,
        Jann Horn <jannh@google.com>,
        Josep Torrellas <torrella@illinois.edu>,
        Kees Cook <keescook@chromium.org>,
        Tianyin Xu <tyxu@illinois.edu>,
        Tobin Feldman-Fitzthum <tobin@ibm.com>,
        Tycho Andersen <tycho@tycho.pizza>,
        Valentin Rothberg <vrothber@redhat.com>,
        Will Drewry <wad@chromium.org>
Subject: [PATCH seccomp 7/8] xtensa: Enable seccomp architecture tracking
Date:   Tue,  3 Nov 2020 07:43:03 -0600
Message-Id: <eab25a03fbf296e65e5292c7a25d15285e93e6de.1604410035.git.yifeifz2@illinois.edu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1604410035.git.yifeifz2@illinois.edu>
References: <cover.1604410035.git.yifeifz2@illinois.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

From: YiFei Zhu <yifeifz2@illinois.edu>

To enable seccomp constant action bitmaps, we need to have a static
mapping to the audit architecture and system call table size. Add these
for xtensa.

Signed-off-by: YiFei Zhu <yifeifz2@illinois.edu>
---
 arch/xtensa/include/asm/Kbuild    |  1 -
 arch/xtensa/include/asm/seccomp.h | 11 +++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)
 create mode 100644 arch/xtensa/include/asm/seccomp.h

diff --git a/arch/xtensa/include/asm/Kbuild b/arch/xtensa/include/asm/Kbuild
index c59c42a1221a..9718e9593564 100644
--- a/arch/xtensa/include/asm/Kbuild
+++ b/arch/xtensa/include/asm/Kbuild
@@ -7,5 +7,4 @@ generic-y += mcs_spinlock.h
 generic-y += param.h
 generic-y += qrwlock.h
 generic-y += qspinlock.h
-generic-y += seccomp.h
 generic-y += user.h
diff --git a/arch/xtensa/include/asm/seccomp.h b/arch/xtensa/include/asm/seccomp.h
new file mode 100644
index 000000000000..f1cb6b0a9e1f
--- /dev/null
+++ b/arch/xtensa/include/asm/seccomp.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_SECCOMP_H
+#define _ASM_SECCOMP_H
+
+#include <asm-generic/seccomp.h>
+
+#define SECCOMP_ARCH_NATIVE		AUDIT_ARCH_XTENSA
+#define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
+#define SECCOMP_ARCH_NATIVE_NAME	"xtensa"
+
+#endif /* _ASM_SECCOMP_H */
-- 
2.29.2

