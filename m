Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F68138228F
	for <linux-csky@vger.kernel.org>; Thu, 21 May 2026 10:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779357618; cv=none; b=MM5ZRA6wxxTzYwXPcOgb845d8H0c2jGPt0UO3acWU5aMacyi+ACD79KjhhyPRHd370YzvrU/zInRJjnLvQQnHjWNUozpyDTVVG+JoPK99zHzpx9qajS32dPfdDn1GVBXFE/BbtU3d3WmXlkS7WTwg+3dvtF4rFzsQf2Bg01kZUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779357618; c=relaxed/simple;
	bh=C2RVFkRflNNWVpwy3bzTkXkqKQmsPqWZ0B4Xb2BKlt0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ShOt/FG/+XIdrg9T4pEH2jMWMvUUv8AaPBIuU+AD8IlUgHbIPnquQXjhdHoQpL0SfVdcXKZb84YnBpimmCSyXj3hjqJ+BKc1IOmEgtdL1xr/zfzsBy6zNL2AiM7bmm6Aci5EdYcsr93rKENUT2sFl5dO15ePjGgy6sa6f5lmKpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EVI4DyBS; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EVI4DyBS"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b9fcf7c91bso62440685ad.0
        for <linux-csky@vger.kernel.org>; Thu, 21 May 2026 03:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779357616; x=1779962416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yVOsPLBQPlP1hoWnahX+LhIqlKbd5jGX8t7OujcN3pg=;
        b=EVI4DyBSsHLQQ4+kzPY5QAWWRrkMxsioEH0WrgApkC13VWAK0K7/sqtZhj+3oXYDsN
         2jVUoZOs/FFrlCqsooRxFHwIbg/QYduMUF08rzvBoyNvdBX2e1xJHXGpkQwwPr3n6ych
         e+NHztIBcbtbOO2mdsKfua0Xpynrf43k3t6hUpyEmpQD/M0velyGwsiJ1u8rzwK+vhIr
         PPe7Sf3prTPvf6zpRNMSH21eEhhxF3cNHL9X4QMxTolgDtZa56w2IrAgZAQWhbsIRpLO
         ON65H6uL9ECSqb8409HdArfs2VyLrvHiOkay2Vk68PA5ODx+0pCT6307rTf7Zsb5pDeC
         nCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779357616; x=1779962416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVOsPLBQPlP1hoWnahX+LhIqlKbd5jGX8t7OujcN3pg=;
        b=mcAAxLuuFlr8sTLqnnVCF7+KzKKoIjUHqY/quEv+O+fQscChM/dQdw0JkjC+MS9TMx
         uVfypAG2CyMcv+G7ItrN8YH6vqIstGeM7YoenkTMgtlYe4KMFmNkgKDZ7ZvvcOn4Bfer
         h9WCpLQ8qNDNwA2VCr3pTnAeZI0VwdaK5jCKz9JUy+A2gQ6tJC8HKJ36l27i8yKlJNKq
         Wue6pjR2+ZM2Ub493PlmoUjBQChWrMf6UplSwyTFNbXZ1TPx7LIwRKzI/CgpwQuutPsg
         NoRNRMFac3CNdZDgKIIy/4rsauyo4rfEyZ5aXJSJ/NLHmd0MCxayHum+QPWyU6jOv8YA
         nMyQ==
X-Gm-Message-State: AOJu0YzjWTO4PeVJKonVbjOcIoblqYbrkOFq+sflEuf/zL+uLL/HNlZA
	X7sAn6XAFs+9muAMroqk5bk7YzzT/+t9aALUWEqS4SORRlTnnE8/m5JB
X-Gm-Gg: Acq92OFzDjdWP+spHJwG3HI8NPpDu+AerD9h9WievXNxvuuP5EswcSbHZcnZFZ6KzdK
	JcOnKAp8oXdrgdXbQxfP1OqxDB2ur9dTmkAPsjcAZnsTpxwC4I2jF1ncSTuPiml5WhWT83Q7K+m
	JI0WeYDh8loI79WbEulwyykx69+izTcW8AzX5Ve2K/yfOneVbc6xNo4HL7LmdC2nKciruq7rOQ4
	WoXJ1sOtdprFUIyOCZ/+jSFRK+evyo8Kr5pEbjnAgGa5RXd6t4kTaNMf59nZ8NdLb+m/GQDx5Ml
	3V1SrmjkhdKgS+8ajDK3+1/F8HWg0MAhw+6npleYwFzJLu2L8XZv+zDHDa2cfV5l3I9o17l5dWP
	Gi2wLvHvpsks7nEsu920OkAiMcGfUY8qNJL+d3v+Jt2ZkeNoF+8yaANDBjPY1aHQfsFa0Kh1mKd
	HJD3COiE8NVYrfTLgD/OH17JKog5YR/j81NoTk6HTfOGrwqNK1OVeikeahJOazaTjg4cSeS3U=
X-Received: by 2002:a17:902:e849:b0:2bd:49ce:d240 with SMTP id d9443c01a7336-2bea31c7662mr25049845ad.5.1779357612371;
        Thu, 21 May 2026 03:00:12 -0700 (PDT)
Received: from gmail.com (42-200-172-209.static.imsbiz.com. [42.200.172.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea990e08csm5499005ad.63.2026.05.21.03.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 03:00:11 -0700 (PDT)
From: hlsong <pgeorge8929@gmail.com>
To: Guo Ren <guoren@kernel.org>
Cc: linux-csky@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hlsong89 <pgeorge8929@gmail.com>
Subject: [PATCH] csky: Fix a4/a5 restoration in syscall trace path
Date: Thu, 21 May 2026 17:59:46 +0800
Message-Id: <20260521095946.37876-1-pgeorge8929@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: hlsong89 <pgeorge8929@gmail.com>

The syscall trace path reloads syscall arguments from pt_regs before
calling the syscall handler. On C-SKY ABIv2, the 5th and 6th syscall
arguments are prepared as stack arguments before invoking syscallid.

The current code adjusts sp before loading LSAVE_A4 and LSAVE_A5. Since
those offsets are relative to the original pt_regs base, loading them
after changing sp fetches the wrong slots. As a result, traced syscalls
that use the 5th or 6th argument may receive corrupted arguments.

This is visible with mmap2(), which takes six arguments. A small
PTRACE_SYSCALL reproducer opens a file and maps one page with:

  mmap(NULL, 4096, PROT_READ | PROT_EXEC, MAP_PRIVATE, fd, 0)

Before the fix, the traced child fails the mmap and exits with 12.
After the fix, the mapping succeeds and the child exits with 0.

Fix the trace path by using the correct pt_regs offsets after adjusting sp.

Tested on: ck860f, linux-4.19.15, C-SKY abiv2

Signed-off-by: hlsong89 <pgeorge8929@gmail.com>
---
 arch/csky/kernel/entry.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/csky/kernel/entry.S b/arch/csky/kernel/entry.S
index c68cdcc76..98692fc78 100644
--- a/arch/csky/kernel/entry.S
+++ b/arch/csky/kernel/entry.S
@@ -94,9 +94,9 @@ csky_syscall_trace:
 	ldw	a3, (sp, LSAVE_A3)
 #if defined(__CSKYABIV2__)
 	subi	sp, 8
-	ldw	r9, (sp, LSAVE_A4)
+	ldw	r9, (sp, LSAVE_A4 + 8)
 	stw	r9, (sp, 0x0)
-	ldw	r9, (sp, LSAVE_A5)
+	ldw	r9, (sp, LSAVE_A5 + 8)
 	stw	r9, (sp, 0x4)
 	jsr	syscallid                     /* Do system call */
 	addi	sp, 8
-- 
2.25.1

