Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0FE47C0E1;
	Mon,  5 Oct 2026 12:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202034; cv=none; b=kSrGin9qrpCeY5AicfnybyZDPBqqIJiK2/atvTzZgjvzGjXn/zSohn7N3NCwgPDV8sZ2bn1ONgWw1hYTWmD9ksQhzKmkKrXBYVTPotbioTVRZ52SieN0RudWKoSSMBvIukdg+IjHv42dSl/TJ+AcUXyNBH4MWLlbxU/LP8rPeBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202034; c=relaxed/simple;
	bh=7sHpLf5OzmhnQe9x7QcP7rPw5cIvI+1X90Fnd+u0hQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F5h8D/VA32+7zMzMmKndbxv7M7/us9bTnis2dCgj9pmTDz6yoXp+QaM+q4lACYk6tf5ljDkcfB2eZ7QbkVwHj1B7JF/AqX3GUwz8HG29nPMDGyV5cgB2fWnMdDeSaSW6dQ3gQytvu3vFC+DluYvV3dY9vlZCNH/Vmb19jYqruIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=BhAyQWJh; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=3tsHAkQ2; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="BhAyQWJh";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="3tsHAkQ2"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791202024; bh=HiRgD7EY7NmvfK/82CFeu7w
	UXdgvuZi6ox8j1Ha0It0=; b=BhAyQWJhytTA/d//tVlB/9X2/jX7uSo0JfcDHqNLgFuPTSvQxe
	621TS4ZeK9A65bdrGFtMLrx1S7oMHEZwFcsThBv4hSbaofdJp9yBGAdPfUBbhetlpP5a9K1gAlQ
	WK6uzv/AUQjKiL7xVuK7aASd+lPfcsFlIZkTHWtMh5s+d6joNXzS6T+sItmrw4ukC7BE1Lu7q+y
	iwlvzm9KOpHsGl+jQGax+9WEDGsxTuhWCwqW3Ls+a3T6s8zYw2Gdf8RG5j+8k7u7wA13wKpNtvN
	VzZcXc3Tnese24/JzGyY1zXEAHwzvFqxLtvMG/vwK+jcVKCbCuN96PxL6R/LvrPtWBQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791202024; bh=HiRgD7EY7NmvfK/82CFeu7w
	UXdgvuZi6ox8j1Ha0It0=; b=3tsHAkQ2uIYP1/tET8DZqIZw+x5YnbLN+BtJc7HAW+RDH8uJDM
	ABi/PVDkeDqTqmc0RuY/rFvmA6M5a1EZkdDA==;
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
Subject: [PATCH v5 1/3] ARC: Emulate two-byte cmpxchg
Date: Mon,  5 Oct 2026 12:06:58 +0000
Message-ID: <20261005120700.383058-2-brads@mainlining.org>
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

ARC has no two-byte atomic compare and swap, so the
arch_cmpxchg_relaxed() macro switch lets case 2 fall through to
BUILD_BUG() via default, and a two-byte cmpxchg() fails the build.

Route case 2 through the new cmpxchg_emu_u16(), which narrows the
old and new values itself, so the dispatch keeps the (uintptr_t)
casts the case 1 path already uses.

The sizeof(*(_p_)) fix that v4 folded in here landed separately
through Vineet's f050c3e61d2a, so this patch is now only the
case 2 wiring.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 arch/arc/include/asm/cmpxchg.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index 66b3743c9400..b30b20933f32 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -50,6 +50,9 @@
 	case 1:								\
 		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *__force)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
 		break;							\
+	case 2:								\
+		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *__force)_p_, (unsigned long)_o_, (unsigned long)_n_);	\
+		break;							\
 	case 4:								\
 		_prev_ = __cmpxchg(_p_, _o_, _n_);			\
 		break;							\
-- 
2.53.0

