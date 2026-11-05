Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793840828;
	b=vB0w5q1rj6OCcFsv4zZtN4ECXlYdAu/+gHEAYVGyy9loq3+RnEkzHE75ZnxJwr6WbWLk
	 HHDyqjxLYp2rcKGtXHybIy4/pLaP2IGv/ivX8KRLWvQgKQ6kJOG3NHIvbLFtrGN//QbAO
	 u0xVydgTz+JyNZ1jpSEcrbYz/x8E2A1FWnSLf65sRyNh+u3hQOxcDjYlt3gmB1ppL3AT4
	 rTzGAjrmM7HzyWPISR6JGLO4l4mWIbG/tyVtyG5SXVNXo7I+XVAXTvlQPdN3XLAtA5mMe
	 TFt/WdlEPffB0z+P/N/50LtC0L3KFnq6kPcxFspS8ohxYJf6Fvf1wLf93y2pSHULDHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793840828;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Lp2S+yQqZ3KgNFALGN/5akP+pY43jVjOzdy7RwzHwBc=;
	b=cB3W4XGh6O2WtzN6OUaUgYn5up7Q9Khw+JbOU7nLpYEtuiuF5hZLE1TCChFMLG7HwFJL
	 IE1g8LNpJlROXKUDei6GrkXkxHnlajHXKGCyVzJxeS4agTC4iOeSlHNSmRB2EB+/WnMsI
	 zMH5a74ZFC5YZDDn+WK4c7AbqHZzEGOYDDTSjMLwSmigUzknHsoPzQa+z1+u/Ez8TKjdP
	 rhWB9jd4T019Izj8ilAyhXaz4H0sfiYwUfUoXB6uNF0J8d0P0IeWQBpiQM4JGSD4Z+KeS
	 KF768GknQSQ6zdjWgtNlRu6c/nKCJYdrG9dw0MjCwEgJgm+TBdAPeFUbKat+gASmKmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Di1Jhw4P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8A4606A31B
	for <linux-csky@vger.kernel.org>; Thu,  5 Nov 2026 01:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Di1Jhw4P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7181F000C1
	for <linux-csky@vger.kernel.org>; Thu,  5 Nov 2026 01:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793840828;
	bh=Lp2S+yQqZ3KgNFALGN/5akP+pY43jVjOzdy7RwzHwBc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Di1Jhw4PdgQKFAZxPT5ZnTffF92ZagDFLkzi7OrCGN23K8OKY2yNdCO8Mj7fBL7JA
	 JXfeilLPn3lKXS1fxj6j3AVjmJq8xEYOnxzkwTSjQIJJlaMEXYaklbnVBloHxwOX2Q
	 HITQYCxzPtZ6wQNmIT6neymONe3uWc6EiyrpWJ5iW4rTX9QYDsVUEBKLT8VwOwok82
	 xu+259MGnaYP0iml/0pbXhK10WR75C4EpvUSWCBbdcgl3hMpF7jhlzHGKB9vBfJJfQ
	 FqOKHeqiPNVMDzK2bbK0eT0uoRJejJsjf9YVAVYQPxZAm18eqa0zmpwVqEi13Bnce+
	 feFLqmadQYXMg==
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-491971ac844so1449f8f.2
        for <linux-csky@vger.kernel.org>; Wed, 04 Nov 2026 17:07:08 -0800 (PST)
X-Gm-Message-State: APuU4Z+i13k/uC8aDTUu94WuH452yH5i0hQn5LP4rs7OCGh7cPjOwPN1
	mJJzpzWRiBdcDTk8cYLqNlTMDYE1cgvNC2py4ga5CX8uV+ogmI+iH0VfCjmFZv6v/VQSNMr0cqK
	02D+6/bOAZ4kG81aMpam+8Oe0+2OEN/Q=
X-Received: by 2002:a05:6000:2403:b0:48b:59f:db9c with SMTP id
 ffacd0b85a97d-48e6e514746mr35884103f8f.53.1793840826819; Wed, 04 Nov 2026
 17:07:06 -0800 (PST)
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
In-Reply-To: <20260921194036.4157985-2-Jeremy.Jean@oss.cyber.gouv.fr>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 5 Nov 2026 09:06:54 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTRw6tD4dMSvLQwWnEyHNo5pUjxLa7iiDADZtRzTgoERQ@mail.gmail.com>
X-Gm-Features: AclHuK_FeWOSYLg1CYgclVbNmY5l3kn-LPoXN8QY1_L8kBWNc6vR-JbtPeoWmyQ
Message-ID: <CAJF2gTTRw6tD4dMSvLQwWnEyHNo5pUjxLa7iiDADZtRzTgoERQ@mail.gmail.com>
Subject: Re: [PATCH] csky: ptrace: reload syscall handler after trace entry
To: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>
Cc: linux-csky@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 3:43=E2=80=AFAM J=C3=A9r=C3=A9my Jean
<Jeremy.Jean@oss.cyber.gouv.fr> wrote:
>
> csky_systemcall looks up the syscall handler before entering the traced
> syscall path. Ptrace can then change the saved syscall number in pt_regs,
> and seccomp examines that rewritten number in syscall_trace_enter(), but
> the assembly still jumps through the stale pre-trace handler pointer.
>
> If a tracer changes the saved number from denied syscall A to allowed
> syscall B before seccomp runs, the seccomp check sees B in pt_regs and
> permits it. The later jsr syscallid still calls A because syscallid
> already contains A's function pointer.
>
> Reload the post-trace saved syscall number, repeat the bounds and table
> checks, and resolve the handler again before dispatch.
>
> Fixes: e95a4f8cb985 ("csky: Add SECCOMP_FILTER supported")
> Assisted-by: Codex:gpt-5
> Signed-off-by: J=C3=A9r=C3=A9my Jean <Jeremy.Jean@oss.cyber.gouv.fr>
> ---
>  arch/csky/kernel/entry.S | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/arch/csky/kernel/entry.S b/arch/csky/kernel/entry.S
> index 3261f46f2244..193ee3eb832c 100644
> --- a/arch/csky/kernel/entry.S
> +++ b/arch/csky/kernel/entry.S
> @@ -87,6 +87,23 @@ csky_syscall_trace:
>         jbsr    syscall_trace_enter
>         cmpnei  a0, 0
>         bt      1f
> +       /*
> +        * Ptrace can change the saved syscall number before seccomp sees=
 it.
How does Ptrace modify the saved syscall number?

> +        * Resolve the handler again so dispatch follows the number in pt=
_regs.
Resolving the handler again smells like a duplicate; how do other arches do=
 it?

> +        */
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
Em... Load handler from sys_call_table again...
Could we prevent the previous load or prohibit ptrace here?

> +       cmpnei  syscallid, 0
> +       bf      1f
>         /* Prepare args before do system call */
>         ldw     a0, (sp, LSAVE_A0)
>         ldw     a1, (sp, LSAVE_A1)
> --
> 2.47.3
>


--=20
Best Regards
 Guo Ren
