Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E94F25B08D
	for <linux-csky@vger.kernel.org>; Fri, 22 May 2026 00:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779411215; cv=none; b=SX7HfHKRYj3BFAL2JzdUGPviulgBKvJ1dDjcpeO7yd/XDz8EPdY1Q17dz/yKM3ieQIkKOBUAeH9J1VSB9OPV8k+Aq4K2yhKbUhcHuJ50WYTS7RzWeL8mC3XohYcVWy6tTG/s9DVo0iu3QWTpa3Gao4jmfX028jy7q6kZmlYLHZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779411215; c=relaxed/simple;
	bh=zDUvLctaHgXyMQ35Q2Uj8D+QOnK+PP5Mt8/CnsOcouw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LrQ/DshRAMbSsXgjGmNm8OK1Cy/ATmh8HhsxPL4Vv8vCUSBfjTpuKbOvabOFgwxa6XyauliJgZoJcGq/rtLwMOBky1TexYJ6J4NghDQ7vpSK4lI4iTFPyGxRdiemgosTA9LIv6OPA3kYZ/fp+mxoHM0EbFMA3beIb65u2DFU9Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWY5hUZV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWY5hUZV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07FE11F000E9
	for <linux-csky@vger.kernel.org>; Fri, 22 May 2026 00:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779411214;
	bh=fZ0lkfzpNiRHG7GpSIh7WZS9D/wJaogzECf/2GqY21w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UWY5hUZVZtYuYHerePq9Gesd2Oxm+H8yzYa3dHpA3Vs7rmpn4sM1FyDlGVMVvUlyO
	 euvQo2LxgddGR3hfMUDYZrwfdToAKgPxn12iqHguOvIeLKDygE4Fnt68Ab0Dsmo46/
	 J2307o/ayzVu/9VrCzzOE/qkuroy+NIBZ7IXyVDAulZWgrvFRZlWlkvSMuVw7WY+f2
	 SdB24G4gdRh3GjYWhputQUPMG30do+zVq8nl7VzTSFlF67wg5QMvGpvjkyqyv11zbr
	 rkxDXW9wousbaNBRnpwlD5Uc0JzRxGNwSW7xUYdwLCBMiWGCF9iEkoWf9UILm4v27/
	 THkov7bT/fU1g==
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45e7c636e74so3672075f8f.0
        for <linux-csky@vger.kernel.org>; Thu, 21 May 2026 17:53:33 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz5kFnjyOy2yVOAkSEl0faC2l13zZ53w+yCALSkRlgY7Ls0opbV
	KDC6DMpWe9EI3Ms0V2vXmwrzdDh4ZQ3cLY+5608DbNjHj1MLttNJrB0zlRb6/h7XlNNCfJyj0vt
	DFmaK5nnYh11JlMV0mbt2/Cm2MDeTfT4=
X-Received: by 2002:a05:6000:25fd:b0:45b:d5d7:1f59 with SMTP id
 ffacd0b85a97d-45eb38a64f8mr1228900f8f.24.1779411212674; Thu, 21 May 2026
 17:53:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJF2gTRumJwDi19nCmKZa+6KvvNvRSo=Jhyd7f6=5pe9J5Q0nQ@mail.gmail.com>
 <20260521113356.58513-1-pgeorge8929@gmail.com> <CAJF2gTRSkqgPQPjgEBd=PvXGzPdNZGsxpc7Bqd377=swPmKVYA@mail.gmail.com>
 <CABvmTk2+kd9n7xwSK=nnDBK4nC62sS7Du-MVeY17XV-p9pRufQ@mail.gmail.com>
In-Reply-To: <CABvmTk2+kd9n7xwSK=nnDBK4nC62sS7Du-MVeY17XV-p9pRufQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 22 May 2026 08:53:19 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT1LwmR=b+_-8M9Q4iZ5V=GYM0P7qbLSRWgsvajCtJ0kA@mail.gmail.com>
X-Gm-Features: AVHnY4Je-rbKl5qaKGGtcJ0t5CCBJSP7P0iM5BjyOIJs6EfhtGvTBDIbKhCKHpo
Message-ID: <CAJF2gTT1LwmR=b+_-8M9Q4iZ5V=GYM0P7qbLSRWgsvajCtJ0kA@mail.gmail.com>
Subject: Re: [PATCH v2] csky: Fix a4/a5 restoration in syscall trace path
To: George Patton <pgeorge8929@gmail.com>
Cc: linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please resend this patch, thx.

On Fri, May 22, 2026 at 2:14=E2=80=AFAM George Patton <pgeorge8929@gmail.co=
m> wrote:
>
> Hi Guo,
>
> Sorry for the noise. I noticed that the patch was submitted with my
> short handle as the author / Signed-off-by name.
>
> If it is still possible, could you please update it from:
>
> hlsong <pgeorge8929@gmail.com>
>
> to:
>
> Hanlin Song <pgeorge8929@gmail.com>
>
> Thanks,
> Hanlin
>
> Guo Ren <guoren@kernel.org> =E4=BA=8E2026=E5=B9=B45=E6=9C=8821=E6=97=A5=
=E5=91=A8=E5=9B=9B 23:45=E5=86=99=E9=81=93=EF=BC=9A
>>
>> On Thu, May 21, 2026 at 7:34=E2=80=AFPM hlsong <pgeorge8929@gmail.com> w=
rote:
>> >
>> > From: hlsong89 <pgeorge8929@gmail.com>
>> >
>> > The syscall trace path reloads syscall arguments from pt_regs before
>> > calling the syscall handler. On C-SKY ABIv2, the 5th and 6th syscall
>> > arguments are prepared as stack arguments before invoking syscallid.
>> >
>> > The current code adjusts sp before loading LSAVE_A4 and LSAVE_A5. Sinc=
e
>> > those offsets are relative to the original pt_regs base, loading them
>> > after changing sp fetches the wrong slots. As a result, traced syscall=
s
>> > that use the 5th or 6th argument may receive corrupted arguments.
>> >
>> > This is visible with mmap2(), which takes six arguments. A small
>> > PTRACE_SYSCALL reproducer opens a file and maps one page with:
>> >
>> >   mmap(NULL, 4096, PROT_READ | PROT_EXEC, MAP_PRIVATE, fd, 0)
>> >
>> > Before the fix, the traced child fails the mmap and exits with 12.
>> > After the fix, the mapping succeeds and the child exits with 0.
>> >
>> > Fix the trace path by loading a4/a5 from pt_regs before changing sp.
>> >
>> > Tested on: ck860f, linux-4.19.15, C-SKY abiv2
>> >
>> > Suggested-by: Guo Ren <guoren@kernel.org>
>> > Signed-off-by: hlsong89 <pgeorge8929@gmail.com>
>> > ---
>> > Changes in v2:
>> > - Use Guo Ren's suggested approach to handle the ABIv2 stack arguments=
.
>> > - Tested with the ptrace+mmap reproducer.
>> >
>> >  arch/csky/kernel/entry.S | 6 +++---
>> >  1 file changed, 3 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/arch/csky/kernel/entry.S b/arch/csky/kernel/entry.S
>> > index c68cdcc76..3261f46f2 100644
>> > --- a/arch/csky/kernel/entry.S
>> > +++ b/arch/csky/kernel/entry.S
>> > @@ -93,11 +93,11 @@ csky_syscall_trace:
>> >         ldw     a2, (sp, LSAVE_A2)
>> >         ldw     a3, (sp, LSAVE_A3)
>> >  #if defined(__CSKYABIV2__)
>> > -       subi    sp, 8
>> >         ldw     r9, (sp, LSAVE_A4)
>> > +       ldw     r10, (sp, LSAVE_A5)
>> > +       subi    sp, 8
>> >         stw     r9, (sp, 0x0)
>> > -       ldw     r9, (sp, LSAVE_A5)
>> > -       stw     r9, (sp, 0x4)
>> > +       stw     r10, (sp, 0x4)
>> >         jsr     syscallid                     /* Do system call */
>> >         addi    sp, 8
>> >  #else
>> >
>> > base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
>> > --
>> > 2.25.1
>> >
>> Applied, thx.
>>
>> --
>> Best Regards
>>  Guo Ren



--=20
Best Regards
 Guo Ren
