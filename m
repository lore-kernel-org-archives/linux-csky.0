Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59683630A3
	for <linux-csky@vger.kernel.org>; Thu, 21 May 2026 18:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779388190; cv=pass; b=nUnCghJINFLQmTGfkcfy9Wjx9Gz+/0PK6+QkfGzlzSyG7Z9SmM8Hix+H7kbtP1JiB40kPfcYTLLm2CPRrvjCpLWXXzyFs+9oA7+MLi5ngp94NkpjxaseDUAKXm1SfpEackqvueCN5NnfoUWfxDFkQnjlFEhXDa8PIuApmT1pilE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779388190; c=relaxed/simple;
	bh=Q5e6sSZzmuItajOaKFdLEVI5pAP0ZIMF7fYCfsF6InI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zgyld/te8/T1GCfZ24PZYIk0hNMkTXQURXB50XMoGhgCfgozpbYWXhR9G9eng4BGuQtFvyzYc3jNoI6JYtZE4S7MrZilRynVUTIEw3AR+YQKlG5c6jKKAqSPEvUUgxvZomJqfa0ii4o/opyCKngFO+SlMNJkRNNSRhEoXX30uEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D1lH6jJ1; arc=pass smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1lH6jJ1"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7dbca22dbfeso3461940a34.1
        for <linux-csky@vger.kernel.org>; Thu, 21 May 2026 11:29:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779388184; cv=none;
        d=google.com; s=arc-20240605;
        b=ez9sKr5RdcZ8dmVANCXrAoGrFn9F9OHxXqYpS97fxy8XJ//kY5j5d+kHTM149rih/M
         sTyhKz9nSGRq3u92Cg3JCv4dqrImG62UL2zdovU/21cMXF5bPDp2EQHEEZN87gnttFOd
         06A6WE+HaV1FHjbkaP9ITmLGuKiwkDaP96NRcJtlCcnQ09wu0/NGYtd2sxwL2wVUzrBK
         QV8DE97IcQFMTKvq8rjxII0Y1kcjpQzF3EzTWRnRmkab/E972g6h1UdiNpATEURirZVL
         n6WhytmanLcfCokGoJ/Q5xSp0xPF9GhrpW0qftieuXxWkG4O6CPKpTcYjvVpigDJ3HnG
         87/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gZpBuLQ9Aw8UYPgH/cnQy1hu7yQqfZzlVshE1mb55Yg=;
        fh=PINNAIEwn3cXjEj8ro6Hd5J5tHkvlm8KubxYtlb/HFg=;
        b=Y0OkC7hwCVwBwOukzeuFBzM3YWjXXbNKz45Wq5nNe6MA3anQSmw4HTOdg68pBO6nZr
         tj+BSso+4z9x6E8+PQ/HWZLbKXO468SA7cP0aa0u4rPoDRFO1Vafmara9hjHqrPbMAia
         WKeVdDIQHof8b7CjMctDJuhSu+QezhoyPVeq9WkVL9W4o29y5JqcK373OpVRQ7+qlPvZ
         BbAEuJSCvnSdiNugAFoA34A6F8wbMudvc0VPKcyGO33IPRzaaCio9s2HE4EVYRgZ7bPt
         iQ8c7GOOjuk6MTknMzVg2Buh13HTT58oSrhP2BaP4Eb583J4YVVaJ3uebLfo7Bi418mi
         4RuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779388184; x=1779992984; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZpBuLQ9Aw8UYPgH/cnQy1hu7yQqfZzlVshE1mb55Yg=;
        b=D1lH6jJ1o2PNNNBqns0pqltpBYT/pVTDi4ugBMo+s33iYCmmRiqx+9pat6NM1DL7dT
         f5m2bpbi7ekPyViJlDJFJQpWGo8OL+OourytcHiFtUJMAMaZotiKB0q2UY2Ikb5MQoRY
         Hz+A3FGbimc7vzEjdIxfksuaq9UjBhUgZsnvZlHT0yVVdNFrBJ7CaYNw+wxeZFCRJpUz
         0Z4EwI/wA2utHj88hwnrNtm/x765n2cHo7B8kgLdRHs0rJ2MkZ9nuzceqa+ptT8Y3X7s
         RpYVZ34QTFBDYckU7abop0pifoMpUsyRYWwsjy718qcpQ0PDoa3L0HXlVAk+IWa2w9kO
         j2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779388184; x=1779992984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gZpBuLQ9Aw8UYPgH/cnQy1hu7yQqfZzlVshE1mb55Yg=;
        b=Bd7JrTMpj1ZXFfvhJpt8ai7Q1l66RZiBIFBK6HsOndTw/0iGzBTrPRwF35rFIeDA+n
         R3jQv4z3lyx++45kqFuO39t9FbZ9ST11elPeawbz+SpVoGzp+iJrQP8QYoykBbqqNMGo
         WOeP/SMpRlWpVG1X20bwfqWAx0eV63MxC4rnz18svQ55DQCC0HLqYzf3lvaUbOyBx4Cf
         57yBGwRov1M9grkPaAku30yjhGUjWwc+3oBTOgaGhhi9p/aF4lfjDywCaDJX3SFnGUZe
         RDDyBpiXDp8SDklpg2m9h2ZKJaMXPuh1anD3iR8gLb2KoW0/o/19DEh4D03azKHywg1y
         9UKQ==
X-Gm-Message-State: AOJu0YzfFebdV1q6pwaj+e2z0eFEg0BDs2hFfArGgjqM13C9DrxrjP4J
	pDM6yLAYBJBUyR2KwDTdmTlryjR2E5ul+grMeoTlz/D8/Wuyv7syStLZN2UGCMbBGLVbs5YzZGr
	tuf1W1c5VVz57p75wY1fbbFCL08lV7xw=
X-Gm-Gg: Acq92OESTQrYXLx43zybyXzj/IWBRRMoOHEWjPHu06kxftCB6v4Z+Yeebcg1GZMe8mS
	e1J+x8rFnC+ZfkKRLzZ91KWmjVDW09wDAro7J6JEZp9Uc0DOLcMgbvjNGh8hy3qU9viAdJEb2pQ
	rVgM1fM0nqdaEu1nl8rVcxbROwZ+v33yGlLz75WvSBn5fZCy8sX7sD7o/mj5d8MF6rTqwggGl+n
	e6JDuYCDBy8bpT3wDOwEC7VMFO93DN7aqgcBKl5bwVT0BP+CNTJFZJu5QJ8yuBp4NwWcIB1a5hk
	V/iab2vlUdqUXe/DplVpcLcEPJNPziruL3sNDlo=
X-Received: by 2002:a05:6820:4512:b0:69d:7d6e:e198 with SMTP id
 006d021491bc7-69d7eb8d767mr188067eaf.16.1779388184260; Thu, 21 May 2026
 11:29:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJF2gTRumJwDi19nCmKZa+6KvvNvRSo=Jhyd7f6=5pe9J5Q0nQ@mail.gmail.com>
 <20260521113356.58513-1-pgeorge8929@gmail.com> <CAJF2gTRSkqgPQPjgEBd=PvXGzPdNZGsxpc7Bqd377=swPmKVYA@mail.gmail.com>
In-Reply-To: <CAJF2gTRSkqgPQPjgEBd=PvXGzPdNZGsxpc7Bqd377=swPmKVYA@mail.gmail.com>
From: Hanlin Song <pgeorge8929@gmail.com>
Date: Thu, 21 May 2026 18:29:33 +0800
X-Gm-Features: AVHnY4JGWB4uZXEa8BUhtoHI091oejgcNkJzGagzB03p3fQR0p1K7CYHhaGgujE
Message-ID: <CABvmTk0P0tT3xNFMLbGaoRH5sVFC0oVR+9Un=OFRnLMz=fCgfA@mail.gmail.com>
Subject: Re: [PATCH v2] csky: Fix a4/a5 restoration in syscall trace path
To: Guo Ren <guoren@kernel.org>
Cc: linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guo,

Sorry for the noise. I noticed that the patch was submitted with my
short handle as the author / Signed-off-by name.

If it is still possible, could you please update it from:

hlsong <pgeorge8929@gmail.com>

to:

Hanlin Song <pgeorge8929@gmail.com>

Thanks,
Hanlin


Guo Ren <guoren@kernel.org> =E4=BA=8E2026=E5=B9=B45=E6=9C=8821=E6=97=A5=E5=
=91=A8=E5=9B=9B 23:45=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, May 21, 2026 at 7:34=E2=80=AFPM hlsong <pgeorge8929@gmail.com> wr=
ote:
> >
> > From: hlsong89 <pgeorge8929@gmail.com>
> >
> > The syscall trace path reloads syscall arguments from pt_regs before
> > calling the syscall handler. On C-SKY ABIv2, the 5th and 6th syscall
> > arguments are prepared as stack arguments before invoking syscallid.
> >
> > The current code adjusts sp before loading LSAVE_A4 and LSAVE_A5. Since
> > those offsets are relative to the original pt_regs base, loading them
> > after changing sp fetches the wrong slots. As a result, traced syscalls
> > that use the 5th or 6th argument may receive corrupted arguments.
> >
> > This is visible with mmap2(), which takes six arguments. A small
> > PTRACE_SYSCALL reproducer opens a file and maps one page with:
> >
> >   mmap(NULL, 4096, PROT_READ | PROT_EXEC, MAP_PRIVATE, fd, 0)
> >
> > Before the fix, the traced child fails the mmap and exits with 12.
> > After the fix, the mapping succeeds and the child exits with 0.
> >
> > Fix the trace path by loading a4/a5 from pt_regs before changing sp.
> >
> > Tested on: ck860f, linux-4.19.15, C-SKY abiv2
> >
> > Suggested-by: Guo Ren <guoren@kernel.org>
> > Signed-off-by: hlsong89 <pgeorge8929@gmail.com>
> > ---
> > Changes in v2:
> > - Use Guo Ren's suggested approach to handle the ABIv2 stack arguments.
> > - Tested with the ptrace+mmap reproducer.
> >
> >  arch/csky/kernel/entry.S | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/csky/kernel/entry.S b/arch/csky/kernel/entry.S
> > index c68cdcc76..3261f46f2 100644
> > --- a/arch/csky/kernel/entry.S
> > +++ b/arch/csky/kernel/entry.S
> > @@ -93,11 +93,11 @@ csky_syscall_trace:
> >         ldw     a2, (sp, LSAVE_A2)
> >         ldw     a3, (sp, LSAVE_A3)
> >  #if defined(__CSKYABIV2__)
> > -       subi    sp, 8
> >         ldw     r9, (sp, LSAVE_A4)
> > +       ldw     r10, (sp, LSAVE_A5)
> > +       subi    sp, 8
> >         stw     r9, (sp, 0x0)
> > -       ldw     r9, (sp, LSAVE_A5)
> > -       stw     r9, (sp, 0x4)
> > +       stw     r10, (sp, 0x4)
> >         jsr     syscallid                     /* Do system call */
> >         addi    sp, 8
> >  #else
> >
> > base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
> > --
> > 2.25.1
> >
> Applied, thx.
>
> --
> Best Regards
>  Guo Ren
