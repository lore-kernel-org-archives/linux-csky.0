Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FE0443E3B;
	Mon,  5 Oct 2026 12:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202900; cv=none; b=ml6MyCPLlEITLhiYemdTYp2lHbucAqkGJ3yPTM3JUpChSa10z2YQ4ZViCyBYmFaMkE93J7jvjMHVUDQutplQcvo0wyumNeB6CqrmEivD28LWPzWC4LbRHJM+/95gcMzBx4OwIeYa1s9K2ql8m9CYT20BvvJ81FT/wfIIVo9l6Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202900; c=relaxed/simple;
	bh=NQ5NAOcHsP+nG5Woxl1conVQwD6nJytoSD29ZXNoKW0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=pmThNuNrU7YuLxM8f5w6ZTSGaQGTa3CBSgO10ldv64uSx6CWUsPq/gzmW1NNTdgm87ECmvf7nFETxG6AZAf9ARnFvCbfuPsTS2Q7EsgnPvxK3hf0C3KmyQT2s9w5mzQGMMlzJHUnrIVfUkUGLGhPww/mr8eIVojC2iadl9vlTeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=MqavCb9c; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=OHqw8qAJ; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="MqavCb9c";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="OHqw8qAJ"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791202747; bh=gjBaaZLSSG7xkXSEyV4DZHC
	mPVituVtcP387dc9XRps=; b=MqavCb9c+9xQwvCc1C3z4RiEAH/FsQkjjN9sRvzy7ticlZZCr7
	zXEfJSN6i802CylmCxVw8UaByF3pquu4N7juuhXk/+HEOGrERDltxvXAeibfOqn7wk6DNHwEEOj
	5vfkdSP16ZRfe824de5lFqVfWuZI2KgVWF1MffUj2L1jSUgFHKneuEaBW4yt80YxWY2MVCD/cv/
	7gSS+rnn0LR1V8T5Uku+ATJwZyhD6rQ2ZmyZ/cB1CkN5y9NHypI78xneVhhuOsVZ9wgs8p/hOSi
	bdhzTj4QXYe8WyBzJh81Z/42fc5KGrZm7BDnSR4p5RDJJOZ2kFU7lo0YtPggrSJOW+A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791202747; bh=gjBaaZLSSG7xkXSEyV4DZHC
	mPVituVtcP387dc9XRps=; b=OHqw8qAJ55BGP9vJEcsuFYWZJYPm2LAxtDjEhqYAeKUmwaXuZK
	LQYOpJt5BNxVH3RiRD3a9rh2FM9y7ICdO7Cw==;
Date: Mon, 05 Oct 2026 13:19:08 +0100
From: Bradley Morgan <brads@mainlining.org>
To: akpm@linux-foundation.org, vgupta@kernel.org, guoren@kernel.org,
 chris@zankel.net, jcmvbkbc@gmail.com
CC: arnd@arndb.de, paulmck@kernel.org, david.laight.linux@gmail.com,
 glaubitz@physik.fu-berlin.de, ysato@users.sourceforge.jp, dalias@libc.org,
 linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_0/3=5D_Add_two-byte_cmpxchg_em?=
 =?US-ASCII?Q?ulation_and_wire_it_into_the_architectures?=
In-Reply-To: <20261005120700.383058-1-brads@mainlining.org>
References: <20261005120700.383058-1-brads@mainlining.org>
Message-ID: <CE38C7E3-371B-4E73-A0B5-81C009E4FF8C@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 5 October 2026 13:06:57 BST, Bradley Morgan <brads@mainlining.org>
wrote:
>This is v5 of the two-byte cmpxchg emulation series, reduced to the
>three architectures still missing after Paul McKenney queued the lib
>and sh patches, ARC, csky and xtensa.
>
>The v4 attempt at these folded in a type checking idiom,
>(unsigned long)(0 ? *ptr : old), meant to make cmpxchg(&p, 4, 5) fail
>to compile. The kernel test robot and Vineet Gupta showed that idiom
>breaks real callers, fs/crypto/hooks.c passes a char * and an
>unsigned char * to cmpxchg_release(), and the conditional expression
>then has incompatible pointer types, which is a hard error on gcc 14
>and newer. So this version only adds the case 2 dispatch, the
>declarations the architectures already have are kept as is.
>
>The ARC sizeof bug that v4 fixed along the way is in mainline
>separately through Vineet's f050c3e61d2a ("ARC: arch_cmpxchg_relaxed
>to use size of pointed type not pointer"), so the ARC patch here is
>only the case 2 wiring on top of that.

Sashiko took a hitch at it, all the "bugs" are bogus, most are just cuz
"u16 is undefined oh no error", but they didn't see Paul's tree, where it
is defined.

whatever

>
>On the why, RCU previously used single-byte cmpxchg(), which is what
>motivated cmpxchg_emu_u8() in the first place, and Paul has now
>queued cmpxchg_emu_u16(). Unused new code is frowned upon, so wiring
>it into the architectures that need it is the missing half, and
>there are existing workarounds for the missing two-byte cmpxchg() in
>the tree, _Q_PENDING_BITS for one, that can make use of it.
>
>Per Paul's suggestion each patch is standalone and can go in
>independently, they only depend on the lib patch already queued.
>Each one was build tested with the real cross toolchain, ARC with
>arc-linux-gnu-gcc and csky and xtensa with the gcc 16.2 crosstool
>builds Vineet pointed at, W=1, with the macro instantiated on
>u8, u16, u32 and pointer types, confirming the new dispatch is
>reached and no new warnings appear. The pointer instantiation
>covers the fs/crypto/hooks.c case that broke v4.
>
>Bradley Morgan (3):
>  ARC: Emulate two-byte cmpxchg
>  csky: Emulate two-byte cmpxchg
>  xtensa: Emulate two-byte cmpxchg
>
> arch/arc/include/asm/cmpxchg.h    | 3 +++
> arch/csky/include/asm/cmpxchg.h   | 9 +++++++++
> arch/xtensa/include/asm/cmpxchg.h | 1 +
> 3 files changed, 13 insertions(+)
>
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
