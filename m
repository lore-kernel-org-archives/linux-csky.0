Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120E3368D5B
	for <linux-csky@vger.kernel.org>; Thu, 21 May 2026 15:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779378314; cv=none; b=nMQSj90U/wdKBQotJn/kcNcMaMa/hrmAZDeFjMyn8DDHiqRUUs5oUiu7MkoIULQLAS06BqT3+mRLoLEmqpVWlhO9oqtAmPJKVn6hsZDgRcMNxP2Bou6+Nz/ioUxxjUV71owp9d2PHf8KfD7EeY8d3oANTJw6b9UXo8tL7goOoV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779378314; c=relaxed/simple;
	bh=uHMjSSydPv2pZ0OCkLlothW0ZVg+nhdqb/twUabsmSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WWOqfADBmr/lg9R6regMEjDBsqMEVOHjrwIU7/l4Z2csZGFdgPdrWjXEyq5mZIt+12f/r0fm7T21M9o5ZXA4YnPdphXdKcmp5uwhNFbykUx7x6H6cRORA+MeInyK8vGrEkOEh1ahIZD+cJQHC/AA1LbjY589wbj+qFWSW6q1SaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKauUZkg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKauUZkg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57EE1F000E9
	for <linux-csky@vger.kernel.org>; Thu, 21 May 2026 15:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779378312;
	bh=resREKKUfwzzwkY5+tA0ah2bUCHoDBBIVA7O/ZR/wxY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mKauUZkgmNAmC2LQttaB6MSOZqgLZrIN3S54TtMT0czeG7VEZHIQ2fx/1pRcQ8B8N
	 AHz2cK4r2lhPovVHmVVeYmaxsvko/FpNVlsqf6dW2hOzezaDtrif431JHvsC31PCjN
	 8JIeZJrgseY4Nd7g1UkaNBznl9GvBgb8R6EKi57dPBQc8nljlmkIroquqLj38B9uZh
	 cswVuqiaItbCLg+ZdghoxeLzeuS1drZwxH8lhgJun7ObbYPI8eQ0uM9bMxdIYfCAcX
	 /0DiZnMR8F2vG1wSID8PW2NZWp3aEhcQ2FZLyxABHuKj/0jX5z2aIH/QyO3Vn5LsUN
	 /mJaKmoNz1CcQ==
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45e8a834cc2so2804374f8f.1
        for <linux-csky@vger.kernel.org>; Thu, 21 May 2026 08:45:12 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw5etiUFOdJzHK5OTix7PFZk/SlpNZEgVqsNcUx5kuUnpMK+e2O
	a3Vm5EGE4ot8spX579wd0tboddC5Y1Xk9ogt5ZTKW/moQedmAP9nFMbWNtQ8BHZr6D9EFCmyrAW
	y4gf02nsrtNzOeDH7r9T9EfA7cdWvzFw=
X-Received: by 2002:a05:6000:41dd:b0:43d:77e1:6a69 with SMTP id
 ffacd0b85a97d-45ea3cea871mr5291629f8f.38.1779378311355; Thu, 21 May 2026
 08:45:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJF2gTRumJwDi19nCmKZa+6KvvNvRSo=Jhyd7f6=5pe9J5Q0nQ@mail.gmail.com>
 <20260521113356.58513-1-pgeorge8929@gmail.com>
In-Reply-To: <20260521113356.58513-1-pgeorge8929@gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 21 May 2026 23:44:56 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRSkqgPQPjgEBd=PvXGzPdNZGsxpc7Bqd377=swPmKVYA@mail.gmail.com>
X-Gm-Features: AVHnY4JHzRBePjay30hygBlpIpYO4pcXKktFSPGkK1mJ80nesWcHI4Xo2RkIsNM
Message-ID: <CAJF2gTRSkqgPQPjgEBd=PvXGzPdNZGsxpc7Bqd377=swPmKVYA@mail.gmail.com>
Subject: Re: [PATCH v2] csky: Fix a4/a5 restoration in syscall trace path
To: hlsong <pgeorge8929@gmail.com>
Cc: linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 7:34=E2=80=AFPM hlsong <pgeorge8929@gmail.com> wrot=
e:
>
> From: hlsong89 <pgeorge8929@gmail.com>
>
> The syscall trace path reloads syscall arguments from pt_regs before
> calling the syscall handler. On C-SKY ABIv2, the 5th and 6th syscall
> arguments are prepared as stack arguments before invoking syscallid.
>
> The current code adjusts sp before loading LSAVE_A4 and LSAVE_A5. Since
> those offsets are relative to the original pt_regs base, loading them
> after changing sp fetches the wrong slots. As a result, traced syscalls
> that use the 5th or 6th argument may receive corrupted arguments.
>
> This is visible with mmap2(), which takes six arguments. A small
> PTRACE_SYSCALL reproducer opens a file and maps one page with:
>
>   mmap(NULL, 4096, PROT_READ | PROT_EXEC, MAP_PRIVATE, fd, 0)
>
> Before the fix, the traced child fails the mmap and exits with 12.
> After the fix, the mapping succeeds and the child exits with 0.
>
> Fix the trace path by loading a4/a5 from pt_regs before changing sp.
>
> Tested on: ck860f, linux-4.19.15, C-SKY abiv2
>
> Suggested-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: hlsong89 <pgeorge8929@gmail.com>
> ---
> Changes in v2:
> - Use Guo Ren's suggested approach to handle the ABIv2 stack arguments.
> - Tested with the ptrace+mmap reproducer.
>
>  arch/csky/kernel/entry.S | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/csky/kernel/entry.S b/arch/csky/kernel/entry.S
> index c68cdcc76..3261f46f2 100644
> --- a/arch/csky/kernel/entry.S
> +++ b/arch/csky/kernel/entry.S
> @@ -93,11 +93,11 @@ csky_syscall_trace:
>         ldw     a2, (sp, LSAVE_A2)
>         ldw     a3, (sp, LSAVE_A3)
>  #if defined(__CSKYABIV2__)
> -       subi    sp, 8
>         ldw     r9, (sp, LSAVE_A4)
> +       ldw     r10, (sp, LSAVE_A5)
> +       subi    sp, 8
>         stw     r9, (sp, 0x0)
> -       ldw     r9, (sp, LSAVE_A5)
> -       stw     r9, (sp, 0x4)
> +       stw     r10, (sp, 0x4)
>         jsr     syscallid                     /* Do system call */
>         addi    sp, 8
>  #else
>
> base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
> --
> 2.25.1
>
Applied, thx.

--=20
Best Regards
 Guo Ren
