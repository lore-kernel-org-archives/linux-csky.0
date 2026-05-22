Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DEB3093B8
	for <linux-csky@vger.kernel.org>; Fri, 22 May 2026 03:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779419917; cv=none; b=H94CIvoXYCq+pzGRqSbQOKe5Wia6j4bFmSLY/TswAcTSXaUtLWuuzGmZ6ULzDivmwtQ9ClDjapBvlq8B1TsKGpRRht3sfDaknvEBQlr3XDI3umN9A3UbgXM7ytDifEluUt5cj0UGx+2U1LyQK+n79knrJq14FpSBSaVo15e9jTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779419917; c=relaxed/simple;
	bh=RHcrASUOn7BVoJt+yDpq8P6M8enx47c//4tLXYQfln0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kBdKt1wA8TvxnXIaRI4+1oCFJIDIhu3QedEffyZVnhU97dV6VUnWvNwcEuowpX81MUFXJ7QnIdvaanz96Jda7jSFBspJQ4FLODOihrNrUN3UlhJ/Pl6NPHDhrAMlF9st1xPmuk5SzJB3wYTPlQ3DSsYq8dxn/hZErBMXyyVhYJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CYIXtGq7; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYIXtGq7"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-366330b6751so5329557a91.1
        for <linux-csky@vger.kernel.org>; Thu, 21 May 2026 20:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779419916; x=1780024716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/T4BWblikkw6zSJAAAEguKwZNShD2P4z6u7X5YgfzeE=;
        b=CYIXtGq7RwjYwpKjQ7+y2agcBgAItZL+xA7yz84pjwWMP2CaWfFENomolJvMGM5wCs
         3GA6V7jG62+f/KoxwcClrSKN8+wANsUMKh6/a4GGCvBHyP05HTenBdPubewNLYMH/tw8
         mve7I2QrFFbQ5Pfx5cEir4u5EzMAoVWlDVxRBRk/zcO5jnogO2DxZ71929C++ImHNM2I
         JjCyS4B5lyXlEHlsWqGn8Pskuua5npK52mLSCd/gOprSV4Ofzf+hFWdMnFWtkg99EDif
         KZbq9FWE6aJuuIFDQh/Zun2Ki5Rr73P2Sk8oowmmV23d+N0RJSvlUSzAcbEffdVh7W8c
         as6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779419916; x=1780024716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/T4BWblikkw6zSJAAAEguKwZNShD2P4z6u7X5YgfzeE=;
        b=jrgg9vsdckIfrU73Il6jhGipS9cqBfmInH0cBMGffp20U1FTnaq2NKkJUkpGCUA7in
         pMN2n0ozsqztWa1vT7jcrGozl1xUwJGGUcWS0qa0ZRSRA5T9DZ8Hm2EZsFDArtDIhtzz
         /VXkz1hK8VACw0gmN21D6fWBzXXidkAK0kWBjRaBXKTs92cMGcQcvFH05LAGJ5yRv8qO
         NqMRR7hjAFCPnttrQl8eYBZbV+4l6fen6azESLv4J/lwWuhQnxWFNzwQrqpSch0bnpss
         DMZcwFtoH7B6M171mwE21wBGy6gRb6P2m4dard+Oy5ps1HGBSGQQCCS5hQasx4qQi+O2
         VQ4A==
X-Gm-Message-State: AOJu0Yx9VTfYRrSeYIUf8SmDpXrhz0UI/jL8OHGUJzcoYTZPPko1CqvJ
	oE1Deyy2/fcU+lssHcJC6R0bMe9hz1oyjUDBFOzzMt2Tyu029ucI/6p9
X-Gm-Gg: Acq92OEd2dPw+XwaTxzplbS2/GjosJvcGPn2xRS9Ya/+r3/OOGw5E7dBD36CpI688PN
	3eCn5B7lzXtIpikB6uc34W1yYOJ23e+0sVo1GyDhDFK/EHVCEeLovgyvxIaEuWGvTG5zujsvgnA
	rGT+FaHo7Hof4nWFRI5iVmaJUbXrjtg6f0ErTWlx+cGmiCRT74INJy5Aw1ON6Y/Ypxcfs5FtRJm
	djbZhtpiVqRSRBOk7eZ+Q+Wl8w62AkyGujx0irdH3JFU6yhBYCCHH92GGSNkNmwzgBTbgVwuVqL
	xAn8w+SuamyT5t7uQluQmdGU1dplL+DZXF9cwOrzuAPx7KT7zWGD6jmqaQl4pf8o6AKDo4/FfGE
	L3F5RrYR83ImMBYDUkZs9BNFuBFoK8oboa5yOw85oJDa9g/8MG3rRhnQcl2CQdRuK6qJii2TenZ
	VRtpj3mO24bPiA37nJ58EFSTp+LaenDX3x9BAHpZWFHAutJkcYfH89d/qrYR9fCl00cOzexuND7
	xEpmRQD
X-Received: by 2002:a17:90b:2b88:b0:367:db13:aca6 with SMTP id 98e67ed59e1d1-36a6785aedcmr1835344a91.26.1779419915891;
        Thu, 21 May 2026 20:18:35 -0700 (PDT)
Received: from gmail.com (42-200-231-193.static.imsbiz.com. [42.200.231.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721c7b92sm393706a91.12.2026.05.21.20.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 20:18:35 -0700 (PDT)
From: Hanlin Song <pgeorge8929@gmail.com>
To: Guo Ren <guoren@kernel.org>
Cc: linux-csky@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hanlin Song <pgeorge8929@gmail.com>
Subject: [PATCH v3] csky: Fix a4/a5 restoration in syscall trace path
Date: Fri, 22 May 2026 11:18:24 +0800
Message-Id: <20260522031824.22834-1-pgeorge8929@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAJF2gTT1LwmR=b+_-8M9Q4iZ5V=GYM0P7qbLSRWgsvajCtJ0kA@mail.gmail.com>
References: <CAJF2gTT1LwmR=b+_-8M9Q4iZ5V=GYM0P7qbLSRWgsvajCtJ0kA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Fix the trace path by loading a4/a5 from pt_regs before changing sp.

Tested on: ck860f, linux-4.19.15, C-SKY abiv2

Suggested-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Hanlin Song <pgeorge8929@gmail.com>
---
Changes in v3:
- Use full real name for the author and Signed-off-by.

Changes in v2:
- Use Guo Ren's suggested approach to handle the ABIv2 stack arguments.
- Tested with the ptrace+mmap reproducer.

 arch/csky/kernel/entry.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/csky/kernel/entry.S b/arch/csky/kernel/entry.S
index c68cdcc76..3261f46f2 100644
--- a/arch/csky/kernel/entry.S
+++ b/arch/csky/kernel/entry.S
@@ -93,11 +93,11 @@ csky_syscall_trace:
 	ldw	a2, (sp, LSAVE_A2)
 	ldw	a3, (sp, LSAVE_A3)
 #if defined(__CSKYABIV2__)
-	subi	sp, 8
 	ldw	r9, (sp, LSAVE_A4)
+	ldw	r10, (sp, LSAVE_A5)
+	subi	sp, 8
 	stw	r9, (sp, 0x0)
-	ldw	r9, (sp, LSAVE_A5)
-	stw	r9, (sp, 0x4)
+	stw	r10, (sp, 0x4)
 	jsr	syscallid                     /* Do system call */
 	addi	sp, 8
 #else

base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
-- 
2.25.1

