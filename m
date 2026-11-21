Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795252931;
	b=4dnFFY4hgWH5OhVnhFhZ/Wt2RidUBzwVtlpp4DoTYyRzUaE/bX2iRcV5c6Qyb0d03OtN
	 TXtJXvDX3mal2xH7XCQ0fnfbuzUu0CHG2J7Y11rMhtqyK2WOys3QZfcOl2jDrzZ4lVkXJ
	 oZ/5rJlCIriFV+rt3KHayuR96oek9G/sO4gqkuPmSTUjy9zbcMtY2WTvHrFicONXuc7Sq
	 rJxjraEqTeZf04TvRBAKDS72bXg9m0u4luFUvWcDclZe8y7LpdF7UH8sYxOI/068TtW8A
	 9wSAxEyXmnEQjsz4h6T9maPbcnjbtWfMRld6mk9Y4cKq/ZjpCdrCxxGBJTsPtuqBGGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795252931;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=A/8txYhE9SwBXhSWCZPslA1aqXg+qlZSECA9EvEz1/k=;
	b=p7rtL6AlfpPRmdNlVDrBpcwnhXkdIE1BoZqGXitRWmx9FNlJbOYA4lYOAMhDyHeFP0+l
	 he49MmDVFTM7TSDRip2a9fohGwnpv6HVC4FrdR7Blmi4iyS21BYxsXg5UNVSkrs00sG1S
	 Zp6VvOdKVmJEoRPryj3YprYbDMN6YaesdVZ+KYxDPvjAHL0B1vaHbfW0glXWK3nhT56BU
	 MtEUmnup1jH57GBObJaglqujvlMLi9N/kC7bC3nj0viMiHbaSnt4dmkpUS/iV+lIv52fw
	 fYaQXuuVQmn80gPD0UbcCf5gtH9h6fXUrenejf3s9eNk4CJIFIEd7HwEW/dU8i4oYGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ECRZOLLP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD25606A320
	for <linux-csky@vger.kernel.org>; Sat, 21 Nov 2026 09:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ECRZOLLP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C4E81F000C0
	for <linux-csky@vger.kernel.org>; Sat, 21 Nov 2026 09:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795252931;
	bh=A/8txYhE9SwBXhSWCZPslA1aqXg+qlZSECA9EvEz1/k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ECRZOLLPXuUEq98KBWOX7h3mYcPK/3UOw48jC/bINAfbOzW1Y+3rB03tG1APk+A5T
	 83OiGn8M40a4/Gqg2ABKshc703kDcKS3x6SNd0N6wAzxB1BLqlvCvJcF0pPWkgKWO3
	 laaZ6tyG2KN/ws65CMemfFYB4liIzOvzDG7duW7HwYgrKc7xOkUd2YtcJPMsN/I6Zf
	 bfSoYT+k2IR6JOPlps5HKLpIH+4avtTrN1ZvKGWk2BsWYpk5TAE/sXNGa7VPJNRBtd
	 rIVyK0pXZaQCYBcOZlrvtCrgeZRsOxYQFEZqvqyBIPQeVZHMVCVFirMMlceYK/IXvk
	 HsnoZmBlQFucw==
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so20523955e9.1
        for <linux-csky@vger.kernel.org>; Sat, 21 Nov 2026 01:22:11 -0800 (PST)
X-Gm-Message-State: APuU4Z9Aptr1JrRvRlva7Ql8esJmb+MtKe9eLL2S1fTcz0irJrOW1/Kv
	Hj7Q3wDVBaKI90qSsvJUv205Ni9qFdVHgaMxJBvLJ1qfyW45hJYra7hjMOjosG6Ag1dmbq+2YX3
	6e10kZPOkGzhANv+aXsJrrbeKv+TTwjo=
X-Received: by 2002:a05:600c:3547:b0:4a3:5991:718 with SMTP id
 5b1f17b1804b1-4bb88809795mr123402545e9.16.1795252929814; Sat, 21 Nov 2026
 01:22:09 -0800 (PST)
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Post: <mailto:linux-csky@vger.kernel.org>
List-Help: <mailto:linux-csky+help@vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-csky+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260921194036.4157985-2-Jeremy.Jean@oss.cyber.gouv.fr>
 <CAJF2gTTRw6tD4dMSvLQwWnEyHNo5pUjxLa7iiDADZtRzTgoERQ@mail.gmail.com> <25e38ed23152466a816842cae33195e0@oss.cyber.gouv.fr>
In-Reply-To: <25e38ed23152466a816842cae33195e0@oss.cyber.gouv.fr>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 21 Nov 2026 17:21:57 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRhLTRCiHBp8+rYRJzERtfp3exnOE_kyBANMskm207xog@mail.gmail.com>
X-Gm-Features: Aa3M54oVdPqHinWcJduIKU32Cx8ZhxU_FquEXMjBLgT0apvENfVeOL_n3SVLUa8
Message-ID: <CAJF2gTRhLTRCiHBp8+rYRJzERtfp3exnOE_kyBANMskm207xog@mail.gmail.com>
Subject: Re: [PATCH] csky: ptrace: reload syscall handler after trace entry
To: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <jeremy.jean@oss.cyber.gouv.fr>
Cc: linux-csky@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 6:10=E2=80=AFAM J=C3=A9r=C3=A9my Jean
<jeremy.jean@oss.cyber.gouv.fr> wrote:
>
> On 2026-11-05 02:06, Guo Ren wrote:
> > On Tue, Sep 22, 2026 at 3:43=E2=80=AFAM J=C3=A9r=C3=A9my Jean
> > <Jeremy.Jean@oss.cyber.gouv.fr> wrote:
> >>
> >> csky_systemcall looks up the syscall handler before entering the
> >> traced
> >> syscall path. Ptrace can then change the saved syscall number in
> >> pt_regs,
> >> and seccomp examines that rewritten number in syscall_trace_enter(),
> >> but
> >> the assembly still jumps through the stale pre-trace handler pointer.
> >>
> >> If a tracer changes the saved number from denied syscall A to allowed
> >> syscall B before seccomp runs, the seccomp check sees B in pt_regs and
> >> permits it. The later jsr syscallid still calls A because syscallid
> >> already contains A's function pointer.
> >>
> >> Reload the post-trace saved syscall number, repeat the bounds and
> >> table
> >> checks, and resolve the handler again before dispatch.
> >>
> >> Fixes: e95a4f8cb985 ("csky: Add SECCOMP_FILTER supported")
> >> Assisted-by: Codex:gpt-5
> >> Signed-off-by: J=C3=A9r=C3=A9my Jean <Jeremy.Jean@oss.cyber.gouv.fr>
> >> ---
> >>  arch/csky/kernel/entry.S | 17 +++++++++++++++++
> >>  1 file changed, 17 insertions(+)
> >>
> >> diff --git a/arch/csky/kernel/entry.S b/arch/csky/kernel/entry.S
> >> index 3261f46f2244..193ee3eb832c 100644
> >> --- a/arch/csky/kernel/entry.S
> >> +++ b/arch/csky/kernel/entry.S
> >> @@ -87,6 +87,23 @@ csky_syscall_trace:
> >>         jbsr    syscall_trace_enter
> >>         cmpnei  a0, 0
> >>         bt      1f
> >> +       /*
> >> +        * Ptrace can change the saved syscall number before seccomp
> >> sees it.
> > How does Ptrace modify the saved syscall number?
>
> It can change the value using PTRACE_SETREGSET.
> I'm not sure what you mean otherwise?
>
> >> +        * Resolve the handler again so dispatch follows the number in
> >> pt_regs.
> > Resolving the handler again smells like a duplicate; how do other
> > arches do it?
> >
> >> +        */
> >> +#if defined(__CSKYABIV2__)
> >> +       ldw     syscallid, (sp, PT_REGS3)
> >> +#else
> >> +       ldw     syscallid, (sp, PT_REGS9)
> >> +#endif
> >> +       lrw     r9, __NR_syscalls
> >> +       cmphs   syscallid, r9
> >> +       bt      1f
> >> +       lrw     r9, sys_call_table
> >> +       ixw     r9, syscallid
> >> +       ldw     syscallid, (r9)
> > Em... Load handler from sys_call_table again...
> > Could we prevent the previous load or prohibit ptrace here?
>
> Indeed, it does not look so good.
> Here is an attempt to move the lookup below the
> _TIF_SYSCALL_WORK branch, which hopefully solves the problem.
> That version still fixes the issue with my reproducer.
> What do you think? I can send a v2 with this diff instead.
No, thx.

Please confirm:

https://github.com/c-sky/csky-linux/commit/0d7fa420485063231c72f20a9ef04ac8=
ac4122bf

>
>
> diff --git a/arch/csky/kernel/entry.S b/arch/csky/kernel/entry.S
> index 3261f46f22442..8e79ceda9456a 100644
> --- a/arch/csky/kernel/entry.S
> +++ b/arch/csky/kernel/entry.S
> @@ -56,12 +56,6 @@ ENTRY(csky_systemcall)
>          cmphs   syscallid, r9           /* Check nr of syscall */
>          bt      ret_from_exception
>
> -       lrw     r9, sys_call_table
> -       ixw     r9, syscallid
> -       ldw     syscallid, (r9)
> -       cmpnei  syscallid, 0
> -       bf      ret_from_exception
> -
>          mov     r9, sp
>          bmaski  r10, THREAD_SHIFT
>          andn    r9, r10
> @@ -70,6 +64,13 @@ ENTRY(csky_systemcall)
>          and     r10, r9
>          cmpnei  r10, 0
>          bt      csky_syscall_trace
> +
> +       lrw     r9, sys_call_table
> +       ixw     r9, syscallid
> +       ldw     syscallid, (r9)
> +       cmpnei  syscallid, 0
> +       bf      ret_from_exception
> +
>   #if defined(__CSKYABIV2__)
>          subi    sp, 8
>          stw     r5, (sp, 0x4)
> @@ -87,6 +88,19 @@ csky_syscall_trace:
>          jbsr    syscall_trace_enter
>          cmpnei  a0, 0
>          bt      1f
> +#if defined(__CSKYABIV2__)
> +       ldw     syscallid, (sp, PT_REGS3)
> +#else
> +       ldw     syscallid, (sp, PT_REGS9)
> +#endif
> +       lrw     r9, __NR_syscalls
> +       cmphs   syscallid, r9
> +       bt      1f
> +       lrw     r9, sys_call_table
> +       ixw     r9, syscallid
> +       ldw     syscallid, (r9)
> +       cmpnei  syscallid, 0
> +       bf      1f
>          /* Prepare args before do system call */
>          ldw     a0, (sp, LSAVE_A0)
>          ldw     a1, (sp, LSAVE_A1)
>
>
> Regards,
> J=C3=A9r=C3=A9my
>


--=20
Best Regards
 Guo Ren
