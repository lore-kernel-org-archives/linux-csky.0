Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF65125A0
	for <linux-csky@vger.kernel.org>; Thu, 21 May 2026 11:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779363265; cv=none; b=Ku3ETeUupPFaev5aLKlx1NLr28LJlIJnJy3IC6bXaT9fvI6oLvcSRBb3uCmSLlyKoQ2XZa9nf9Lxs5u59IShkoNB+LJlj0lNre5I3fe6rOfyXlRiWqsqoxGTNRUSxjK4caR8Z+5hfn2UOYcc/SmxUtvf9dLo14TJE0yv7UUGPwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779363265; c=relaxed/simple;
	bh=rzT/dBLoa0GG8EcIF0iNv2ScA4Vdm7Z9GhGYqWbVfdU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TAd7EZOmWy0KI2mztLxREzXfYwflhDoGLIYgtcb1aKt7doGs4JvnUuyynYPuZnVCrzwKaOeRQdQJ1gpdiSVjeM1lK299dx5Xv5y/vOMQ1aofEZd9VCC9z5q3c8H3kOk2wcP1EE3q7xZl/boJuqcfzewQund47Awp4N2eiElW4cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NEWsKjfp; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NEWsKjfp"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ba17c8cfacso57013815ad.2
        for <linux-csky@vger.kernel.org>; Thu, 21 May 2026 04:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779363264; x=1779968064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzmWF/hlXwUiSZ7NxihUHfM0DXYIRom+DE+saGOZMlA=;
        b=NEWsKjfpUD3/EvNSiX9akXmraOQejBv+BT4UuVcLipL+HhYyg8SFdiGGp7y/KJySqL
         rAEp4LrlY0MbaPWCR/bEuVr94g2AR0mV5iR84RhKAvXIFpUPNtAZx4Lh6jntXyEVy62x
         l6pFG0sz2FQskMea++oKnlpwUyt6xzGXEfT9N3oN9lWUg49JRGN9Wfo2LL6mkprTlfpd
         dVfMXhc0WZ7VPuq5oaa5OXzc7PWqzEnRhtB7bqo1HPaHwKe9476Wjp4Gd/y5NdmJOy7w
         MM1Goqv9Vz+Ep6SoSNkRnXPa2Jnb93TD1o2jaksIySMq1cc0JRGpWxbonNXFKK5YYdt2
         wxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779363264; x=1779968064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jzmWF/hlXwUiSZ7NxihUHfM0DXYIRom+DE+saGOZMlA=;
        b=L/iuy2eljdhs57QFi/NrHQjqvta8FfOpovyracrm9bi/jsO0YL9xBtw+kYwFl0y3Ck
         heSSzHH0US/7dTdpEfpB3QBZ/6lQoAVPenBe1UlI4FwRuqIg7DXvgUnI7yNfSVqwQdKx
         7JOWGbbSFwbVA/Y8NFkjfvrCSQtpUrLPsHaZF6PJFOK/fB/Bb0ZjrDb9v6hFhSo91OWx
         4HOVvGQH3TYZWAXDMRoKwcqn8Ibwtc7qyVDY+e2dzsFfODaYSkf/dcc3wpDaPO99jZ3Q
         lpRLwPnJ3DnYEJN6utQPbJKj16dUnWDO43BquBuxt/RzxDx012XSdQuhXab0Q4pfE/kt
         EH8g==
X-Gm-Message-State: AOJu0Ywid6ncEw5luWLYVjPO759JFVbKjgPtKP8PJUTNy1rtyk2Tv024
	yE5S/wyLitLCEuH5WGyMbgjX5Trd3OLIWCCt2qAKrwDCpfoE/7/bEwsm
X-Gm-Gg: Acq92OEl3/qwT0+ifjOv1qHhiE/hmINaFVQ84aRtYGoLgjOa9eG84eUaCzOphATrXne
	NuEPTo1vVL5zAfs8oMerrHt52f9XB4nTUFrXO7k/4uLVriO855SjD6gSud2tCZaw8R/WeKMcPNc
	I+aLQwASdeWJo+9pumhlPOUqgazasROxdNV6EnJdhGiuti491pjlALHQjH0P72kOMty91T1ZiZv
	zw5SaowHUe1VUhj0D6NIV/+/Pt9IMfDZrzMp0C4EJUWRFX7yglhkZEkzDFdGYYPLKmE6QfOuzyc
	3e5eX9lAXrFOFV/7gqBq/SQmT2M5PZu7y5t598mYbsfuXMep1I9WO53GlPpGaSC+yrwUhvkHZGS
	khJCwRfqoeqImu+db0mTiwx8ZCwULDwEIuTmH0/Omce+tPnp+X8FGNt6m5dPmD6p5PpZGnAHYpE
	5Tezwbm2Ncngdn9YXm3ZPVGcguT4U1L+Q/Qfv4HlOgktxD0MSrtA==
X-Received: by 2002:a17:903:32c9:b0:2bd:4d9e:ab27 with SMTP id d9443c01a7336-2bea33437d4mr27519405ad.17.1779363263764;
        Thu, 21 May 2026 04:34:23 -0700 (PDT)
Received: from gmail.com (42-200-231-193.static.imsbiz.com. [42.200.231.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea9a38c0csm9228495ad.77.2026.05.21.04.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 04:34:23 -0700 (PDT)
From: hlsong <pgeorge8929@gmail.com>
To: Guo Ren <guoren@kernel.org>
Cc: linux-csky@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hlsong89 <pgeorge8929@gmail.com>
Subject: [PATCH v2] csky: Fix a4/a5 restoration in syscall trace path
Date: Thu, 21 May 2026 19:33:56 +0800
Message-Id: <20260521113356.58513-1-pgeorge8929@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAJF2gTRumJwDi19nCmKZa+6KvvNvRSo=Jhyd7f6=5pe9J5Q0nQ@mail.gmail.com>
References: <CAJF2gTRumJwDi19nCmKZa+6KvvNvRSo=Jhyd7f6=5pe9J5Q0nQ@mail.gmail.com>
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

Fix the trace path by loading a4/a5 from pt_regs before changing sp.

Tested on: ck860f, linux-4.19.15, C-SKY abiv2

Suggested-by: Guo Ren <guoren@kernel.org>
Signed-off-by: hlsong89 <pgeorge8929@gmail.com>
---
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

