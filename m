Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD3C3E44FE
	for <linux-csky@vger.kernel.org>; Tue,  9 Jun 2026 19:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781034219; cv=none; b=ma4Q7QhQqOO56EqVWy0VypDXsYNcjkq+Bi66CBJSpItGCcGUAQsNZL1Fmgx/l1SHylUTj6u5uDXukfLJuxgWRfMXpnNh2BlcgPhiiXQVJxJHudphe8CuMTc0A4gi8pqy5pN3S43myecOsRbLHKD7vHDy3SsuopbIy2ncfcIFIH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781034219; c=relaxed/simple;
	bh=vMGlLRP4NEY3+djFeT4uAcP7Y7C/klfNCHpJ/nN/ZHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KT7bGoV2+qWqYj4I0btoEmP4v/yZ9hpDUp5OXL2LQtdCyy/8UXlY2vGEOw2/1Deb6O/hmuqwFw/345vglXCk1q/jSPsD5Elch0Eyf0qXFS/ky/D6OkPOyqzEWpg2x9u9OFvFnV1yyhFeLshZcarGiu8kNJjBgXzyvxUZabA/AmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSXEx8eK; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSXEx8eK"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-304cf518c9dso7385857eec.1
        for <linux-csky@vger.kernel.org>; Tue, 09 Jun 2026 12:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781034217; x=1781639017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p7orgBeK4/tVaZ/XKCA619k6S3s+SaVaO6WE0ZjZ/lo=;
        b=DSXEx8eKh8ut2re/JYiige5/h20sTICR7USgUZOeBEn4A5+vlXfOeDMBp4OPNUm1AD
         uOSuctnRXGTo1uLwAlKxd60iaMkywMC2EbDmAJVCAwid/oucbHS9v5xbcp5+k6eKSei5
         iPaZFurIGKXGf5eqw0TcQuRVAaB5dRcpNZX6ka4PgJls3obVAQOxbGJheGS0frD8KPRw
         M0NfQF3GstxtavD6C4IWMEnecOCQPYwJq6xLGKmjG2lYv+G5KGPO45grcrd2MlxbQsAo
         7wRG+n9gbFZ4B9v7Tu4G+WsYCKx3K5bZVPUqJzmHPcThWsTTyELOTjC/Co2dStX9XYfw
         x1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781034217; x=1781639017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7orgBeK4/tVaZ/XKCA619k6S3s+SaVaO6WE0ZjZ/lo=;
        b=jOz+D/rKLcLAzROhiQw9dVg6psEDNKLHgRiPR/OJhLmoNcxQx9zrjjA2KCmtLY2PT7
         KUkEIHxxch+C11wTVtkWZar3hC6vZQaypyJFSIhgh2dRtz4OsilDVExhuhvUhCWnjN0m
         g+bnNP4CVXhxkCnWxgFXyQl0OS6xxODPpXIZVOLibwc8ocN/ARRAOml5rHsekFVJS//F
         G6px8cfuTxKM3dXj11j+FXs9RevcXgIvCpe3VHAfiPtFD14FDdsGffs3tenhB63rCdf6
         Aj9ie/4AfG7YcOSy4Xw0gGo6DEvrkwBEwC9fj33WG3hWwE9zYrWS8c+l2jVlOOWkzT8a
         BYdw==
X-Gm-Message-State: AOJu0Yx5+RMwO7+2R6IkHMn4w+3DVvAFU+SR/eRuNDzLVEqmLtbPb0IL
	WZevb8Qlezhx8VwYZCHPf1tl6iNIJCupSZXqivLar9NO5CaLJhDPrHJQ7fQKtPZa
X-Gm-Gg: Acq92OFAHEstmWRjX4M23RBHygchkmgo/6sJ5WINUNRhybnvMCMk9RdEn1QKvqfNuC9
	Mh19jKRuqhghATnFDtjiHq/q9VRNyWkvXgm9up4m9NweF1L+7bG3S2cXOPew6Wfh9VxK3Uh2Ayc
	bjFDBV4XCJJekLXkn69zhvpb1d+OjKfdBQut/qULi3XSLkSY+isDXPg0rK1B2Bk3iVYngABYA5x
	Yd8hxjNkdnXeFwCoh+uvigGqICScEGoqrGDpdhf6nr2LctQvBOnWzU+H33PHai8sduszCSxF0tS
	AJIVkSIU1UTPo1NyR4MDCDb0fqteQxGE4/eF5uhJBuCFBzwiMZnId2FmOCBJyG9Vu5N6j6zLpgw
	Pjsojp//b7Xx2FG7nbkOzkZefYzqjDmRIL6LoGKA4Zw9d30dwMtMKrPTneX7KV41Z03VaPnJuph
	okjDFSbn84ZEvmZtZ2tTKhuqpI9/XlY2lJgT3c3zBS+gjUINa/hah22wN+mEa9BQN5atBrtrj2A
	3sI3rrMtLxzNyqfBHnvx5LelYV7IQ4GaCwnrET5JrBR3tKjhobwDDVGXBBo6ClyPXQqkYNUUfwQ
	l7tgvSQrf0ld3/Bxn/g8sCB64DiS
X-Received: by 2002:a05:7300:7313:b0:2be:7fc2:fc38 with SMTP id 5a478bee46e88-3077ae89f68mr13472671eec.5.1781034217033;
        Tue, 09 Jun 2026 12:43:37 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db85f60sm27811598eec.8.2026.06.09.12.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 12:43:36 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-csky@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH] csky: abiv2: remove references to nonexistent CONFIG_OPEN_FPU_* options
Date: Tue,  9 Jun 2026 12:43:28 -0700
Message-ID: <20260609194331.147233-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CONFIG_OPEN_FPU_* options have never been defined by the kernel, but
are referred to by arch/csky/abiv2/inc/abi/fpu.h. The *_STAT macros
depending on them are also unused. Remove these references to eliminate
dead code.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/csky/abiv2/inc/abi/fpu.h | 36 -----------------------------------
 1 file changed, 36 deletions(-)

diff --git a/arch/csky/abiv2/inc/abi/fpu.h b/arch/csky/abiv2/inc/abi/fpu.h
index aabb79355013..52c640ef797c 100644
--- a/arch/csky/abiv2/inc/abi/fpu.h
+++ b/arch/csky/abiv2/inc/abi/fpu.h
@@ -27,40 +27,4 @@ void restore_from_user_fp(struct user_fp *user_fp);
 #define  FPE_IOC   (1 << 0)     /* Invalid operation exception */
 #define  FPE_REGULAR_EXCEPTION (FPE_IXC | FPE_UFC | FPE_OFC | FPE_DZC | FPE_IOC)
 
-#ifdef CONFIG_OPEN_FPU_IDE
-#define IDE_STAT   (1 << 5)
-#else
-#define IDE_STAT   0
-#endif
-
-#ifdef CONFIG_OPEN_FPU_IXE
-#define IXE_STAT   (1 << 4)
-#else
-#define IXE_STAT   0
-#endif
-
-#ifdef CONFIG_OPEN_FPU_UFE
-#define UFE_STAT   (1 << 3)
-#else
-#define UFE_STAT   0
-#endif
-
-#ifdef CONFIG_OPEN_FPU_OFE
-#define OFE_STAT   (1 << 2)
-#else
-#define OFE_STAT   0
-#endif
-
-#ifdef CONFIG_OPEN_FPU_DZE
-#define DZE_STAT   (1 << 1)
-#else
-#define DZE_STAT   0
-#endif
-
-#ifdef CONFIG_OPEN_FPU_IOE
-#define IOE_STAT   (1 << 0)
-#else
-#define IOE_STAT   0
-#endif
-
 #endif /* __ASM_CSKY_FPU_H */
-- 
2.43.0

