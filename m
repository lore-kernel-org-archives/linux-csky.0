Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99EA3793B8;
	Mon,  5 Oct 2026 12:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791201983; cv=none; b=EaK/zMdaEFQUnurFWOQTKNR610IbiTREkoBlOluXzn/dgunpIsqLQQBZXinlnrbochrLbWvFfuMTE0jiwc0J0qPGWtrxHfD/EFy5QzWyU7a2YvNHo7X0fZDrDgkD771qwQB2O3f6LURJLBDb50tOlNd9ElHJj7f6wPUIZHDqknI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791201983; c=relaxed/simple;
	bh=i0KnUM5v5QJil826Tj60TG6RtCKz0NN6pVnBO8O6ys0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OLKg2EV47QkrfKK40h4So6Sz8epPjMuKk9DdT9+cR0fwDJaKsTESvWcOXsXyTodrRjx8p1fbTihnYtgv/lOTUV0EKoDXywwAWBQDc6XC4zeJ/iicR+1jhvCuj2+/hxFDwHL3enK9i2i5bW9xflt9TZU5LqecQ5VhYgmsaRmiyYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=c6X/5p4p; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=3lAMB5Im; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="c6X/5p4p";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="3lAMB5Im"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791201964; bh=gQiGga2Z4THQxcURrzEPZFq
	KmnssVIT4dSdk9XOrkDQ=; b=c6X/5p4pcLqfTbYSOffQRTPj+yYzQ6Ar88g9TgYQZB6jVLFSPB
	Re/YsXzw5lMY+JuIiJ4qULks/AMP7ZTQL1+31EQ2x+cHhhgZyA/DkJyP9xtU+Xm7Ll6rZ5GCuex
	JStQRds7rzzZu0kxPJq4/l42l8Bplmh0HO+nAwJ1v42VKuqDSf9Fy62pDStY9pEPWClynoJNqZ4
	NvbUujIRW9W8mYXXfxcJnhAd7ogOPU12uBkLyi8nCjrHSJjzeao0F0WULN8HfK8ojke7WFGbF/b
	FZ3KiFDXv0OA+rIqfkD9X8iWSV0Xsvi8ilWQm3YrMbKfyfKbgJYGN8pYRFLMKjTRXxg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791201964; bh=gQiGga2Z4THQxcURrzEPZFq
	KmnssVIT4dSdk9XOrkDQ=; b=3lAMB5Imfg+jAz+v8/50fhFT1WYag9oorC2vpN0PebrW6zQJ1Z
	rk/V4FA+NFPEcL/zeD+EZaca5OD3DR6UKuDw==;
From: Bradley Morgan <brads@mainlining.org>
To: akpm@linux-foundation.org,
	vgupta@kernel.org,
	guoren@kernel.org,
	chris@zankel.net,
	jcmvbkbc@gmail.com
Cc: arnd@arndb.de,
	paulmck@kernel.org,
	david.laight.linux@gmail.com,
	glaubitz@physik.fu-berlin.de,
	ysato@users.sourceforge.jp,
	dalias@libc.org,
	linux-snps-arc@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	brads@mainlining.org
Subject: [PATCH v5 3/3] xtensa: Emulate two-byte cmpxchg
Date: Mon,  5 Oct 2026 12:05:56 +0000
Message-ID: <20261005120556.383004-4-brads@mainlining.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005120556.383004-1-brads@mainlining.org>
References: <20261005120556.383004-1-brads@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xtensa has no two-byte atomic compare and swap, so the __cmpxchg()
switch lets case 2 fall through to __cmpxchg_called_with_bad_pointer(),
which is declared but never defined, so a two-byte cmpxchg() fails
at link time.

Route case 2 through the new cmpxchg_emu_u16(), which takes the
old and new values as unsigned long and narrows them itself, so
the call needs no extra casts.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 arch/xtensa/include/asm/cmpxchg.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/xtensa/include/asm/cmpxchg.h b/arch/xtensa/include/asm/cmpxchg.h
index b6db4838b175..8dea8e357fc0 100644
--- a/arch/xtensa/include/asm/cmpxchg.h
+++ b/arch/xtensa/include/asm/cmpxchg.h
@@ -76,6 +76,7 @@ __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size)
 {
 	switch (size) {
 	case 1:  return cmpxchg_emu_u8(ptr, old, new);
+	case 2:  return cmpxchg_emu_u16(ptr, old, new);
 	case 4:  return __cmpxchg_u32(ptr, old, new);
 	default: __cmpxchg_called_with_bad_pointer();
 		 return old;
-- 
2.53.0

