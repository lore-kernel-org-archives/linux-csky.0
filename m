Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFE947F3A2;
	Mon,  5 Oct 2026 12:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202228; cv=none; b=MZC5LltKz0esD7SUe3NQg5FA9IhZVkiS8E2lcgdZfYxgZ+gaurudB9M9sMcRprngeI+NlnGHmehnEy7uzoyaC7fdNRur+5+Z9MeXkHcKu0G1nVivrjIZsivMonYH2oEgwtFKfcXnPJvmA9ZKrXmN+oR8ij9AokTj5PD3xJn9TI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202228; c=relaxed/simple;
	bh=1ZU2HGvW/qHhlSDRb+S6ynyl6gwYxOPBMdLafetnF8M=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=hrOrC4MGRFvB/Bz7NtpIy9XfX/O30sZnn8fTFfdbOYRR0xQ5yzhXDjpuczJg8dAhXchl7FrMd8SsDw2+7HCtl4SW1ZsVx7lhpID/nHWE9MxQDgQKgR14fkSFAm379newGDOTUaKK+dOiIdgI+lKNT7IQ84TqxzvRbprgIyQ6ltw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ChSIBjgC; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=61+Af8PJ; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ChSIBjgC";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="61+Af8PJ"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791202084; bh=c8blceBjpnicYTX0j9XL6TT
	+wvS5GLIS98CfSPeQ2So=; b=ChSIBjgC7DJbuoj/hq7PaoY2Khp4WzR5BqDkJa6jmQg/jjXsl+
	VmcjNTSVigwDsUo6NRJbhYBilUXRgjMICH4pDmHGTvx9spdUnOj/Cz9YyUQ3fX/GMu8CHoJg1tY
	BtZiCtrnWdAd5VukqFHdMyVo54B2s/YqToJtCdMjY/jNMQ9yz6Mxg6iuGo+uUJlW5SlYOhdfQID
	f63H8AKR/KuaSHBqHImS+JoZtAj1+0qWDMfIPrHL1AAOfxdQGQHK1e/7AxIuWHm1EtdvESl1tNR
	XCUNunKXIX7pwWkk3ldyqQUmgcEPcGpOgmYGrJSq2QY5JVtWnxF6CKycRL3IAUVZNtw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791202084; bh=c8blceBjpnicYTX0j9XL6TT
	+wvS5GLIS98CfSPeQ2So=; b=61+Af8PJELF/8wkGVGMZLlzU/KpTjAlFsFmdjLYcCJKFG7YYOj
	MQ0Gh/Lq6D1KBGlISidzf8IttNb8Uvr+FIAg==;
Date: Mon, 05 Oct 2026 13:08:05 +0100
From: Bradley Morgan <brads@mainlining.org>
To: akpm@linux-foundation.org, vgupta@kernel.org, guoren@kernel.org,
 chris@zankel.net, jcmvbkbc@gmail.com
CC: arnd@arndb.de, paulmck@kernel.org, david.laight.linux@gmail.com,
 glaubitz@physik.fu-berlin.de, ysato@users.sourceforge.jp, dalias@libc.org,
 linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] ARC: Emulate two-byte cmpxchg
In-Reply-To: <20261005120556.383004-2-brads@mainlining.org>
References: <20261005120556.383004-1-brads@mainlining.org> <20261005120556.383004-2-brads@mainlining.org>
Message-ID: <DFEBDABC-BF95-4AF7-863C-7C25F1443B28@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 5 October 2026 13:05:54 BST, Bradley Morgan <brads@mainlining.org>
wrote:
>ARC has no two-byte atomic compare and swap, so the
>arch_cmpxchg_relaxed() macro switch lets case 2 fall through to
>BUILD_BUG() via default, and a two-byte cmpxchg() fails the build.
>
>Route case 2 through the new cmpxchg_emu_u16(), which narrows the
>old and new values itself, so the dispatch keeps the (uintptr_t)
>casts the case 1 path already uses.
>
>The sizeof(*(_p_)) fix that v4 folded in here landed separately
>through Vineet's f050c3e61d2a, so this patch is now only the
>case 2 wiring.
>
>Signed-off-by: Bradley Morgan <brads@mainlining.org>
>---
> arch/arc/include/asm/cmpxchg.h | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
>index 66b3743c9400..b30b20933f32 100644
>--- a/arch/arc/include/asm/cmpxchg.h
>+++ b/arch/arc/include/asm/cmpxchg.h
>@@ -50,6 +50,9 @@
> 	case 1:								\
> 		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *__force)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
> 		break;							\
>+	case 2:								\
>+		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *__force)_p_, (unsigned long)_o_, (unsigned long)_n_);	\
>+		break;							\
> 	case 4:								\
> 		_prev_ = __cmpxchg(_p_, _o_, _n_);			\
> 		break;							\
>
Sorry, resent email, internet went out ;(
--- Thanks!
"I'm not a very positive person" - Linus torvalds
