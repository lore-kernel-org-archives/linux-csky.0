Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5871447ECEE;
	Mon,  5 Oct 2026 12:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202181; cv=none; b=E8Gluzbgl0DDSkpkg61VHnERY7VXtfnjvFyYuO8KYDUCIDlmp6mTEYanVcM+weJBxxSbFPirCQJ6FHjUdhmzIk36KFmmF0ta+g7JXMnQBJ1IKQeu0k4uQV1nBej4UxFKwoaICzjYH1fxG4JlHKKZdTenDRhfqPJzNP1vB8KIimc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202181; c=relaxed/simple;
	bh=i0KnUM5v5QJil826Tj60TG6RtCKz0NN6pVnBO8O6ys0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sP6UpufqbHVTiCIswHxfwDKWIInkmiKgr5KxSvFeKrXQyZRBihETysuHItTUVoA5LpgjfbK8dS8azDG5/LXZbkc1Q7IxDgqMloV5/uj1GHuj2JHSF2aKur5U3x6jeVc1H44GmdqeI2FUYFnGioJvj5mHAAtgyzwcffmqKng/Y5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=QHNr5c5q; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=mcknjMa6; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="QHNr5c5q";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="mcknjMa6"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791202029; bh=gQiGga2Z4THQxcURrzEPZFq
	KmnssVIT4dSdk9XOrkDQ=; b=QHNr5c5qIAmqgf0Jg4cLlc4G7QeEf399sVt4/klQd6SKIIvkK6
	nyi6UmrLViMTLLyOaSFa7rcHgFEJ+f7F3k5E90pCchPRP2fAlRKUsj+SA9lAtABNtav+1c1ePE5
	mCfM/+bKOXgiLIMojUNiFd5+SAcJ+aTcAXrKEHTOnG/CXFD/gt/QOy0v/atGSx88o2I8ziXh0KH
	cTbREZhenoWllakpzaPpU82kjdMTwIuV2EclJjGtCkaScwIM5MzeNQqkKMHhC5lhNo5q5PGUK7A
	b8RalTwd0nKAOcDFFz6GQZdb2ZYZb5k4LdK4i/o5BYuej8VxI7IB+VEYRbevoZyWJ/A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791202029; bh=gQiGga2Z4THQxcURrzEPZFq
	KmnssVIT4dSdk9XOrkDQ=; b=mcknjMa6g1qXxOX73WK05b9KC15T1QWLZINnCB5eQt1XWW1xm8
	KC+7pqBXNuSHPNb6uewCj1iwVwfP8YV0rqAA==;
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
Date: Mon,  5 Oct 2026 12:07:00 +0000
Message-ID: <20261005120700.383058-4-brads@mainlining.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005120700.383058-1-brads@mainlining.org>
References: <20261005120700.383058-1-brads@mainlining.org>
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

