Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F24B3955C4
	for <linux-csky@vger.kernel.org>; Thu, 21 May 2026 10:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779358537; cv=none; b=R8BSuIH9+5RaEgPTv3p65uTg+aOeGMpP7/upTb1a4O+ngTY8P15tCysVmOFFu5YJIk8flH2cG0oYm+v/3zRVl8ZB6njp3X0ZLdy40mP3rGzfpeOxeCM46NQoFMRHW3l5o8BqfnlBggb/SeTfSye53Ca7jMMYmUKkzvFUF8sic2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779358537; c=relaxed/simple;
	bh=42darh4Su4Oqq4kDoy9tZAHLOgILtYlXNbE+Nb/+9o4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BtW30mXJm0/Ja2Mrd6ghGUYGHDlatFe8JcW/M2aVzfpcm6A1fXjKsxwTJpYPcHe+WGyoMFKSnTxQSXfMdBP0eoo5Y4rjQLEH4DL+YzslRqdZ6n9KAsivZe8nD+QEqB0ALzeQjMhuVeZJGFBrKZL08yDwL8IenWPYl4nKoeADuNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MTW2o5YZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MTW2o5YZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7891F000E9
	for <linux-csky@vger.kernel.org>; Thu, 21 May 2026 10:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779358536;
	bh=Sq5sdf1BHswNBsZ6+LAF2gSK4SX2Nn7kXBEjfXg1knE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MTW2o5YZH8a2a82R0Mc5fNjo4FBNiDbiDBGZKccgjCsziwbZy1hr91+8Jkf/ivvGY
	 BNATQO0KLCAXgCQKAwGUE6wlrOH+23qkKxo9ROB+xfHgWEEHOK+gTvKzqgar73VT2I
	 /oNIC4MWXHtnSR51rTVMoKrwWzTwAzC2uSUNwudpW1zeD244tBHOpcPW51D+hafGkf
	 2v6OsSKjNSX9Yas6HH70Exb1T4SRSHZ8U8aceaEl9EUrU4NoXgWjH6JAnWnm6hjOWF
	 bVNlapdShx0C+Y/FsckXJuseAZnRmMjuNDxzBYch6eXUGr4Nk7fg+TJbvRzvbNDSB0
	 Ht9mCyvuuF/Sw==
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43fe62837baso3458654f8f.3
        for <linux-csky@vger.kernel.org>; Thu, 21 May 2026 03:15:36 -0700 (PDT)
X-Gm-Message-State: AOJu0YwEERDHc5mcr/yCmuCg4Fe7occXCuKHBLL8gFIqX2M84nwcq/hq
	89t4iVJWLtvYS4xSf9re0BO9Mdyzx9Y3hq8aQ/V4ga1XaSW499pO1sTazM/xBu+Nb6Gt2Hf3SPx
	1CQKmSQpWd99W9o6EvYapXsFw9Sq0xhw=
X-Received: by 2002:a05:6000:178b:b0:450:e5fd:e1a1 with SMTP id
 ffacd0b85a97d-45ea38d1c8dmr3566048f8f.3.1779358534909; Thu, 21 May 2026
 03:15:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521095946.37876-1-pgeorge8929@gmail.com>
In-Reply-To: <20260521095946.37876-1-pgeorge8929@gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 21 May 2026 18:15:18 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRumJwDi19nCmKZa+6KvvNvRSo=Jhyd7f6=5pe9J5Q0nQ@mail.gmail.com>
X-Gm-Features: AVHnY4KIp_DvG0kraNJ_K6rVNb0zhatGDmGXx0RLVOjwTp72O2yTTXwemVue-MI
Message-ID: <CAJF2gTRumJwDi19nCmKZa+6KvvNvRSo=Jhyd7f6=5pe9J5Q0nQ@mail.gmail.com>
Subject: Re: [PATCH] csky: Fix a4/a5 restoration in syscall trace path
To: hlsong <pgeorge8929@gmail.com>
Cc: linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 6:00=E2=80=AFPM hlsong <pgeorge8929@gmail.com> wrot=
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
> Fix the trace path by using the correct pt_regs offsets after adjusting s=
p.
>
> Tested on: ck860f, linux-4.19.15, C-SKY abiv2
>
> Signed-off-by: hlsong89 <pgeorge8929@gmail.com>
> ---
>  arch/csky/kernel/entry.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/csky/kernel/entry.S b/arch/csky/kernel/entry.S
> index c68cdcc76..98692fc78 100644
> --- a/arch/csky/kernel/entry.S
> +++ b/arch/csky/kernel/entry.S
> @@ -94,9 +94,9 @@ csky_syscall_trace:
>         ldw     a3, (sp, LSAVE_A3)
>  #if defined(__CSKYABIV2__)
>         subi    sp, 8
> -       ldw     r9, (sp, LSAVE_A4)
> +       ldw     r9, (sp, LSAVE_A4 + 8)
>         stw     r9, (sp, 0x0)
> -       ldw     r9, (sp, LSAVE_A5)
> +       ldw     r9, (sp, LSAVE_A5 + 8)
>         stw     r9, (sp, 0x4)
>         jsr     syscallid                     /* Do system call */
>         addi    sp, 8
> --
> 2.25.1
>

Thx for the fixup, but "LSAVE_A4 + 8" is really confusing for read. How abo=
ut:

diff --git a/arch/csky/kernel/entry.S b/arch/csky/kernel/entry.S
index c68cdcc76d60..3261f46f2244 100644
--- a/arch/csky/kernel/entry.S
+++ b/arch/csky/kernel/entry.S
@@ -93,11 +93,11 @@ csky_syscall_trace:
        ldw     a2, (sp, LSAVE_A2)
        ldw     a3, (sp, LSAVE_A3)
 #if defined(__CSKYABIV2__)
-       subi    sp, 8
        ldw     r9, (sp, LSAVE_A4)
+       ldw     r10, (sp, LSAVE_A5)
+       subi    sp, 8
        stw     r9, (sp, 0x0)
-       ldw     r9, (sp, LSAVE_A5)
-       stw     r9, (sp, 0x4)
+       stw     r10, (sp, 0x4)
        jsr     syscallid                     /* Do system call */
        addi    sp, 8
 #else

--=20
Best Regards
 Guo Ren
