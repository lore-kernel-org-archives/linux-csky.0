Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC90386435
	for <linux-csky@vger.kernel.org>; Sun, 19 Jul 2026 11:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784460348; cv=pass; b=PRJ1NS8l/NWYnyHlu+OecPTMFeF+y5u2QE5MHnxiuYSqZ0CE6nswUpy++Yhp8K2RSxE8JC3Gjusvb/5U3uuNyTQ42lktgJdpsRKdH3ZBrAr2Nyk0dAZSSA4qzxKPQuCaFC0xH5/S+ywDPZwuHbGoImLH4KTwYRaXOhmV77Q7D+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784460348; c=relaxed/simple;
	bh=rgcqbxa6lEmJgPeR85dLIKFK2p9ERX+2iKovNt7jIVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p42pLyVXVmc2VsgK9DaKXMYbx08500bb/HwkWc8RFe6X71+eQ64C10FjC1VzUMLy4SEOcEtGkHR+qCOnav4VGv+yp/tgf7Tdow9wJrhfnFEt5lFUgYmYR1Q7pALgH9Y71nmFKfeeXQqlT2JMf+oKUoxPEFolCu0WR82hYojQkvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D9Eg2uDU; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9Eg2uDU"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-69e08ad526cso5780790a12.1
        for <linux-csky@vger.kernel.org>; Sun, 19 Jul 2026 04:25:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784460345; cv=none;
        d=google.com; s=arc-20260327;
        b=BuAcL6hZ+R7rnVEsqU9h8hHD6uxMHd1peCK1HKxw13P2A6spbQvy903da8qzaYLuOS
         /XYoJVsZab1PaidLo2byzh3INr3DhcN8iVjmftBZRuxjsFZmWZCqF9Hf+T3SR40xiJee
         jJ5SXw+7mPbv46AMA8n/BpeBLldFO0pYawb0QQt6r+zyJULGmoThXOLjdjSuLBKdmOJG
         HzZQ7uuy30FOi0lz2qj0Luq3NGYVxp8jbi3FzEwKggAQb7ngBzlYb0WTL0FawkEO7M7y
         5g3xx0QP9Yx5YhIimYk1yLM6ebqxw8phLSMBEoCcoh70iZAKVa4SZIH4L80FY5wkylJ1
         6xpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HjwBEg56Cr9vHNVIU01sUWrlM5gmQ+vCUXpN04JdIto=;
        fh=9WKc+83DUgVFeP5oRmpHwGwpbiaKjurDTRksCH2pbSU=;
        b=RZT7U+uIJmAK8DRst4Lk+uXyMWI6rqVnLhxnDVI1SSkW+uRaQvXzFDca57mTA9LopU
         kYDhGIBsAM2Tu3MUaTTY5eOlcrWsrOuh5AbreWYkwNmCdHQ+luzDQE5LBEttlUpP/6KP
         45T+MMUWGGLj3kZNjsRyBxg6ff7wylqtNOMTAfnjmmu39nn6xtpiDaOq5AebVRsHQtxR
         Uvya8x9NCC87HHl0fW966UXTcTTvyGo7A3bCF8IsuEKrx5X/K+MQPJdpaHzzti0vI0K0
         JQ3lLtjh+P8KmQl+UM2js0DYcB7ywOLgCsxAZ9Jiy9hMgIOzW1J0bbdTrDAQS4rdB/Hf
         C5DQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784460345; x=1785065145; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HjwBEg56Cr9vHNVIU01sUWrlM5gmQ+vCUXpN04JdIto=;
        b=D9Eg2uDUSi1x0Y0zg7fYRwtO/ea3ND5A/4nTPUeApKtSEYiUynlMiE59GblVd3IOrl
         oWFLcCJp25Ys4PA6xy84FzRAl40+EnzjzRCpSvwGo7RHBsGsYMluu61eRFOFojQND+uf
         lNJOO3g5JejU7GJi6tHzDEvpZzKFqs8qHKpdvXxbKlewQ6qiZ+CA5RKcpH/KLcFJLheA
         g2ExVRjhJfMz7jIq0+v0kblCXJOFmPxGPhyEutQjLJ+4HNvh68qQ5hZaqeUXlD5xjERu
         lUwCLdeswboAyC7uRJFB1Xc36fvUf6TDNx+P0LVWtrX9LSsJKKKRbJx1t2fLrOwcBBgd
         7OEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784460345; x=1785065145;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HjwBEg56Cr9vHNVIU01sUWrlM5gmQ+vCUXpN04JdIto=;
        b=mQNObBIvkUaV2wVbQ+unfMaYjhaYB04hIBR553H9TGdxFzQsjTyRPm34cT+yhZjjHj
         967Y7ncjLWsB4AQTnD0t+Vr5jSIzLtpJbkfvepM0kAjnq6K53qyLiJC/VBEth7qDZePw
         +2+KPQOSCjRUqo0awK7DWepkuv+4RNKOKnv3d4qhC3Xf/2yk7IE4qDM9V4gj6LhC7wRJ
         yE6ChaoUeIDu64cAkq+kAfe8/0brEpmhnlHneWCo+/dkfiJkAIjp8tLRRxX1b5U4h/pz
         gkcsGl9TXytUriGc0v4n/lck749QiyF2Mm6roXKnCkBQ6XeBUK69bnaAXa3aV31fkPiD
         8KZA==
X-Forwarded-Encrypted: i=1; AHgh+RpRfKqcmMVPfoVPRguQwdOnT8cokzVsBK8siVd6nLFdT72uqd74D9VMd+6rA7iXN4IkX/grEUhJX6Vg@vger.kernel.org
X-Gm-Message-State: AOJu0YyDaW1Uumyyrg5ogmdYVecQsj+K3r7C7FbFMUn1aTJ6NRsB1cR3
	gJp1dnMdjI73vZHpqrJxM8gbA0srpSuPZ/eIlK0uqfyu0FTpORdudC3CN2HM8De3IqHIVvCuNdN
	oTWuejnnlG7w1HqttR61SmV6M6Hg3Pik=
X-Gm-Gg: AfdE7clCD6KbrW8f5en7b23P0dal+eE2dVFaZ1KgZu83fkJlFo3GleB9JX0dS5uAY+L
	FQL5Y1Y/2XKXdTQbjGuivEbvT658HAgL0kkXeN+90FQ5rkLtzP5V7/ZOAw9+OrvHCpJjGosLHoa
	5Z/eM4EznulXkXW2mVQfVCKGXmQey54mrta995EeyPVfW05jwZHy5xRYuV9wupnBCXiqhOtXeIK
	LZ2tHSxccIz7Z5MDm3hld8+gzDgFl3yZWsmuO1DM9kYNHadETmzyz9a61vLMNrDNaav51H4W2oi
	OppepaKKVsDqPsz7EWIDG6iLf7zY+FgQBw85wJ4v9w==
X-Received: by 2002:a05:6402:34d5:b0:698:3b7b:e48a with SMTP id
 4fb4d7f45d1cf-69e652f908dmr3652615a12.32.1784460344585; Sun, 19 Jul 2026
 04:25:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707181957.433213175@kernel.org>
In-Reply-To: <20260707181957.433213175@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 19 Jul 2026 13:25:32 +0200
X-Gm-Features: AUfX_mzTzrHRlu_CZJHA0P1GUw_Z2tfq0CbfsG-DFTqsEJDFIQx7LWbdfB3YWqk
Message-ID: <CA+=Fv5TDNH8+JAojV9_W36kUkEE68uiA00FQ7i0vJunebqs1sA@mail.gmail.com>
Subject: Re: [patch 00/18] entry: Consolidate and rework syscall entry handling
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>, linux-arm-kernel@lists.infradead.org, 
	linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-arch@vger.kernel.org, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> With that all architectures using the generic syscall entry code follow the
> same scheme, apply stack randomization at the correct and earliest possible
> place and skip syscall processing depending on the boolean return value of
> syscall_enter_from_user_mode[_work]().
>
> There should be no functional changes, at least there are none intended.
>
> The resulting text size for the syscall entry code on x8664 is slightly
> smaller than before these changes.
>
> Testing syscall heavy workloads and micro benchmarks shows a small
> performance gain for the general rework, but the last patch, which changes
> the logic to be more understandable has no measurable impact in either
> direction.
>
> The series applies on Linus tree and is also available from git:
>
>         git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git entry-rework-v1
>

Hi Thomas,

I did another round of testing of this series on Alpha, this time with my
Alpha GENERIC_ENTRY conversion rebased on top of this series.

For this test I also manually applied the seccomp fixup discussed earlier in
this thread, i.e. fixing the recheck-after-trace logic in
__seccomp_filter() along the lines suggested by Jinjie/Oleg.

With that in place, the kernel boots on Alpha and I do not see any
regressions in the seccomp_bpf kernel selftest or in the strace testsuite.

One note: the seccomp_bpf selftest run on Alpha uses this not-yet-upstream
Alpha selftest enablement patch:

https://lore.kernel.org/linux-alpha/20260203063357.14320-1-linmag7@gmail.com/

One Alpha-specific wrinkle I hit while rebasing the GENERIC_ENTRY patch is
that Alpha cannot unconditionally pre-seed the normal -ENOSYS return state
before calling into the generic entry code: syscall_set_return_value() also
updates r19/a3, which is still syscall argument 4 on the normal entry path.
Doing that too early broke early userspace mmap() during boot.

The Alpha conversion therefore handles this on the no-dispatch path instead:
after the generic entry helper returns, if the syscall is not to be invoked
or the resulting syscall number is invalid, Alpha skips the call, preserves
any ptrace/seccomp/BPF-provided return value, and only synthesizes -ENOSYS if
the return state was otherwise unchanged. That was needed for the
TRACE_syscall.ptrace.syscall_faked and syscall_errno seccomp_bpf cases to
pass.

So from the Alpha side, with the seccomp fixup applied:

Tested-by: Magnus Lindholm linmag7@gmail.com

Are you planning to send a v2 with the seccomp recheck fix and any other
review fixups folded in? Is the intention to route this upstream
during the next merge window?

Thanks,
Magnus
