Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B89D468C06;
	Tue,  6 Oct 2026 18:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311496; cv=none; b=crlFCI9sD3d9gwZT61UG63pXQJZXgMfYzKlVzoStBGpFv1z61w6ef/Mc9HqJNVOEHoH18f1+r40+2dnL3sJ4GuJJGDRiwpu5yJ5ctSjKa2sVD6RiuFdqzzIIsnnaLV9IztXOPymXo7CV7xSfe03cK6rqg5hCitYtVo2G4IBD/+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311496; c=relaxed/simple;
	bh=0yhQO0gJvRx1+dTDejtrkJR1ex0k5dXTH2+JOepoKmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nL3KllQVVjIQXtp1uv2zgkFcifda/gn6xXvMIPo26bLSTJHNy5bHpe+26orhWSkw3+t2j7SRivS3kVDVvFFcDxFiXyzhvOXDIU9/N1E+bHBk8UuC8wcWApRMDyJAt9JvomlieWIdjQ1p4xtigIVMhuqJOWCeB+f40jkR0X3Enlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CM0UcrfL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CM0UcrfL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85AF1F0089B;
	Tue,  6 Oct 2026 18:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791311494;
	bh=L+CAyxMbNE0hdT9QbAIjobxPCVS61YUmS/QbI5hWDeA=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=CM0UcrfLZusPd377zOjzS+f364rvssPlo5XEF3IU7VZhMDJr74n3js/8abQ7hoSih
	 IP7LF/zvExfF2wVKMKFzIJHQQ8q7hoDwgs8a6gWWZNmm1CPlQA0Zh16UnbKB5mmvn0
	 uFF8HbLlApUlS+iODAdckeN8lQ8kGftAG4zykrdC9CnbJjbOWfkKx+jeJODGarqFVR
	 fzqfVQoIcTXqCayo6Vk4Y/dGJmdGxsaYLb3JI0nWyxfatqPXXgl91gswVhn0XRg+oc
	 Pn8U0rNz87Ez8Em7+ug3dpzCy5Lr0cRcOWt4LAc96DvB3UW9R3JjN2Q6tl+6MdAng4
	 EXOxROxFc6mcA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 92A59CE3A08; Tue,  6 Oct 2026 11:31:34 -0700 (PDT)
Date: Tue, 6 Oct 2026 11:31:34 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Bradley Morgan <brads@mainlining.org>
Cc: akpm@linux-foundation.org, vgupta@kernel.org, guoren@kernel.org,
	chris@zankel.net, jcmvbkbc@gmail.com, arnd@arndb.de,
	david.laight.linux@gmail.com, glaubitz@physik.fu-berlin.de,
	ysato@users.sourceforge.jp, dalias@libc.org,
	linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] Add two-byte cmpxchg emulation and wire it into
 the architectures
Message-ID: <01b489b9-f1e8-4079-b8de-9ab97ef61301@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20261005120700.383058-1-brads@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005120700.383058-1-brads@mainlining.org>

On Mon, Oct 05, 2026 at 12:06:57PM +0000, Bradley Morgan wrote:
> This is v5 of the two-byte cmpxchg emulation series, reduced to the
> three architectures still missing after Paul McKenney queued the lib
> and sh patches, ARC, csky and xtensa.
> 
> The v4 attempt at these folded in a type checking idiom,
> (unsigned long)(0 ? *ptr : old), meant to make cmpxchg(&p, 4, 5) fail
> to compile. The kernel test robot and Vineet Gupta showed that idiom
> breaks real callers, fs/crypto/hooks.c passes a char * and an
> unsigned char * to cmpxchg_release(), and the conditional expression
> then has incompatible pointer types, which is a hard error on gcc 14
> and newer. So this version only adds the case 2 dispatch, the
> declarations the architectures already have are kept as is.
> 
> The ARC sizeof bug that v4 fixed along the way is in mainline
> separately through Vineet's f050c3e61d2a ("ARC: arch_cmpxchg_relaxed
> to use size of pointed type not pointer"), so the ARC patch here is
> only the case 2 wiring on top of that.
> 
> On the why, RCU previously used single-byte cmpxchg(), which is what
> motivated cmpxchg_emu_u8() in the first place, and Paul has now
> queued cmpxchg_emu_u16(). Unused new code is frowned upon, so wiring
> it into the architectures that need it is the missing half, and
> there are existing workarounds for the missing two-byte cmpxchg() in
> the tree, _Q_PENDING_BITS for one, that can make use of it.
> 
> Per Paul's suggestion each patch is standalone and can go in
> independently, they only depend on the lib patch already queued.
> Each one was build tested with the real cross toolchain, ARC with
> arc-linux-gnu-gcc and csky and xtensa with the gcc 16.2 crosstool
> builds Vineet pointed at, W=1, with the macro instantiated on
> u8, u16, u32 and pointer types, confirming the new dispatch is
> reached and no new warnings appear. The pointer instantiation
> covers the fs/crypto/hooks.c case that broke v4.

Queued for review and testing, thank you!

							Thanx, Paul

> Bradley Morgan (3):
>   ARC: Emulate two-byte cmpxchg
>   csky: Emulate two-byte cmpxchg
>   xtensa: Emulate two-byte cmpxchg
> 
>  arch/arc/include/asm/cmpxchg.h    | 3 +++
>  arch/csky/include/asm/cmpxchg.h   | 9 +++++++++
>  arch/xtensa/include/asm/cmpxchg.h | 1 +
>  3 files changed, 13 insertions(+)
> 
> -- 
> 2.53.0
