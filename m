Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DFF46D558;
	Mon,  5 Oct 2026 12:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202111; cv=none; b=fXTtnkP2Oj1R1sYpIS7fyUvNGai8RO89w+mqZG7rF5ZmxRnRX8dzu5vIk50+UD3M3Ipaeq4nhArS+SV/Y/4C+8bmcKrZZ9ui9/JznSyaMh3a6n5PwT3oUozpvGXeKGJ4Wb0J6y7+63/kDX37RzQfn/L09M11fsYBljttLdO3+7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202111; c=relaxed/simple;
	bh=7sHpLf5OzmhnQe9x7QcP7rPw5cIvI+1X90Fnd+u0hQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=igs9vduWQdplEioWPO1bbObnWQ6KoXQxckHDWIK/KipjRQazt7oiaainqeEWvjIn+FUD15veA1hplSc9b/ueZgaA+nS+GyJe6S7tSXIRSN009NR7BxD1t8iI1mmdZff5BPBO2gbrcsVuFQkYK2YKW3XSC8TxL78e4jL3BMqxC7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=rTybJzBU; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ydMVKTSt; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="rTybJzBU";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ydMVKTSt"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791201960; bh=HiRgD7EY7NmvfK/82CFeu7w
	UXdgvuZi6ox8j1Ha0It0=; b=rTybJzBU2gPbUAfqfWo6L+S9Q4jkUqWIQTUQdZPXLoX7LTxAWn
	2skDwXfaXxUfMNhywzrd3KqkuDylPCNecxIEiqlTAVYWRESIIHI0yoSRU8B72UnyaMDz0noqmqy
	8zvF46jqxJ8dS+P62oepN2d/fiVj5CUOfKqfWwqhpod2t3srkKl6p2vnVXMCF85fYhZUc8DzpIo
	eaGR7fW3MgZACn1NPhNp/QxfuYBs56LH+5C4hxxgjoqYW2NS8o78yFR2Ae/1SpRPTOnWFNxQTgm
	xM8OOFsjluB2HBjEJzquEn6I4bl/pFih0jLnC0lGy17w8ehY9e43ZqLW62vT7LL1X4w==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791201960; bh=HiRgD7EY7NmvfK/82CFeu7w
	UXdgvuZi6ox8j1Ha0It0=; b=ydMVKTStqaqwDQ4UbyD+Uhroe63hrA8giwoVOCJzVwSR1NdOCB
	WM50HFYiUMXa9Fwku7HGMsarwFzOMHT0OmCQ==;
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
Date: Mon,  5 Oct 2026 12:05:54 +0000
Message-ID: <20261005120556.383004-2-brads@mainlining.org>
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

