Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F1A5208A4
	for <linux-csky@vger.kernel.org>; Thu, 17 Sep 2026 16:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663665; cv=pass; b=jpdDEmWN/O9PJm/iCMU6Cw9J43YTcGuYUHuI35/nXhjfErIKfNCUUq/fcJvOfDOTCUopvzgIISQnZuSWqaxB8NsO+n2OQUkaPI4hu1+jrX3IRuugnlM7rCupq3Fw+Q7qYO8GDclFqlfXfyfUmK7tvkUiPRI70obEmMcWOm0Eefg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663665; c=relaxed/simple;
	bh=OXoyJpegabl0ocESy43SWOAVnutZsDrl9ix8aJurgKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lliT5WgNpBM48+Odnzu9aqN0NH7m/5FGGaMQ+mbuAElYpbGAoq+vNUN4o4O7ZmQGxGFfHzL3hD942/SHkFcdvXtR8JpQQo0ejswtd2InLF7xuemRj0i4rgsuDx2/GQih6RBNTIKsNGDDvBRBRRFmghCNvxg5UE02KFgnJKPXa4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eATgGJvg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dKGKnJD3; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eATgGJvg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dKGKnJD3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789663661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ghsNMjszr/YVVrzwI9L3VChkEhVa9VAV3CWSeRoOujg=;
	b=eATgGJvglDB/e/XNDRrzgW5WKOMEpiB7LymnGtDf3t8cuHmDceHF6yh3kS+B4K+hNcO7ms
	+q7mwqmlMk4xTiF2LCi9CdNZxB2HVauHdvJoBImez5qV++TOb0SpSxrRysTv9oeZ9rPF7n
	RqubMsnYYyb9IE5olgw4ULYsdRg071o=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-CKYT77C0NXqWDGtEwcEqAQ-1; Thu, 17 Sep 2026 12:47:39 -0400
X-MC-Unique: CKYT77C0NXqWDGtEwcEqAQ-1
X-Mimecast-MFC-AGG-ID: CKYT77C0NXqWDGtEwcEqAQ_1789663658
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c295b027ee0so120928466b.0
        for <linux-csky@vger.kernel.org>; Thu, 17 Sep 2026 09:47:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789663658; cv=none;
        d=google.com; s=arc-20260327;
        b=NuxDKWtGLbJcMp9h7o7b8Jlh7/+r3bDrRqMva95CnwGlXLgrzPuVrDLvCIVTLIeCMB
         uvczMTOgtt/aMtjh1xGQW3FK7EVBNKVBOZqfeSRgdIxns31UnajglQCo9R6RGjcj4lHm
         bsDt6Uy1PME6nh3hoH9vZfYXxTWEL83gIWZ74Mp1IkMl3mcostSWX1RAF2uU4ttWiBAv
         RkYeON5zmPHOxKm+ClvhUnn+bsEsvPEBQPAhTerqLuMuqkRHuJfHxi7V2OW4Ich3rXE4
         KhP6iofWw2g7nB+n7w918YyBDTx7sGIYVhOL53io47XjxERimT3jmCgWXkdQPx2tGZN3
         uQQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ghsNMjszr/YVVrzwI9L3VChkEhVa9VAV3CWSeRoOujg=;
        fh=Fb4ePRC+I6QGzFEKi6aCn0Zt2mWoKBsbCUIhfBjD8qE=;
        b=qgTxF1wVVJaxp3pox5dwDJ3U8Vvq34iGu8djHbaX5+PLboDzpGQlEoFSyyxlJvusIN
         OXwbBvKj1n22T+Zz+s2feES+hV2XLPi2pxI+rFHsxF83G/CqEf3IXlwY1lAS0BxT5SPB
         mXQYUq82BIN7oNuw+PGhyAqhTY7qsqUO0ip4ome+DATgefRJhN6oIU0QcamNMLYhyJeG
         N4wPhdOq99FWQs4t77XZZChsn66RPGgQNiwu78k53FIt38W3gzZbFEteXQcv6Tm4+yev
         8BfdY7Whhgtv4RYQ/sP+zq2RaBcYJqntqhwO7ZyXzDobS7Zuom/IzPIAXTRPzkFYjT8x
         1SoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789663658; x=1790268458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ghsNMjszr/YVVrzwI9L3VChkEhVa9VAV3CWSeRoOujg=;
        b=dKGKnJD38WiZGeDo9G7w61tJE8iA6+vSv3+VhV/+0BSAMznrhvPVqnGGKYQ4PLBA6I
         0x6n1uxTHhGhrERHIq4n2fwx7oBAGeJ0UH2xKBLCAHlcgYVJbSGdqkRY1bIrFojj6Vu2
         1xzNeV3ObTyMCYkO5MWwX8CYgFeVi4bWCgXmC4n+onP+bI4+jZOOu0utxMpLFY4bJHAr
         EnjiwLBgjs87fs6PxCZOmw1IRvyMdPyrIn9tJRRP/SWbFlBMtaD4DAF8BTLubz0gyLzg
         wVbhbv7VzQr/+jzG98EbBOOsFR5Vdnw7E8gs5KXES7CruX20+ZZXuAPdluYPVbk+dg7Y
         c55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789663658; x=1790268458;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghsNMjszr/YVVrzwI9L3VChkEhVa9VAV3CWSeRoOujg=;
        b=RrCjmob81SkpI3QTHC5ElR4Y8p5dILUw56zIlsPBQ+tBFNvrVdnAz/2A7/uFCvmvxo
         zot52B5Ua2E0EhTt7uW3FT4UYaJqNc90crB6y64b14qq1bQgZGRwbVrV2FHtc/bRwI6W
         nm7y6lTWWKJx46M4Pj9Ck+Th8se7lkSVXdX2RUb4NbhwlWmg5HyXQ0Mn7rTaMYW9KgDu
         VB7C1pgU/nH2Y+JUEq+XP8w5k/ggsZy3gmKw+mKLaZ+8SwfvrDxDqmdSNYEzTgzz0DL3
         vEsdR+nsMyrKJ9MpbTo9U7uffP6SuZ3cGDyHdao3HuqOn5RHvhLdq9YE+g/DJ83HLVTT
         ZtZA==
X-Forwarded-Encrypted: i=1; AKwUvByVN+dp99LESEmioO6TLFb5sdSS4xXChKMKO6A8yhYLVSVP+QRUszEwOlKaO9LNEiJ3Xc2dnw7a8N81@vger.kernel.org
X-Gm-Message-State: AFuF++mYCjoMPEQxd6cTCejs7c1LMMHXIiBe8kSSgsN7Z/G46wKKZajU
	yGBQNM1tx/AYgi1ifwzua8yAiKz1pgn3lUOuVBu3Z3YTl7peuqMkna/WyHU2PK3Ar9K8hU1kz6z
	Vhb34vCGyL2pf1rnHh1OwbC2VcfHYsnw2jwR1Tse3/Mw0O6f9evzVRSBwJpIJVo/Bo/eUzNrxms
	b0cVcIYdNFY++eJgm+XOcXdmBnQMyIIT1+ZPhTIw==
X-Gm-Gg: AYBFou0f2kGLerxwO/h+TVTjeimUS+urRTApahL2ZtWVsH3zkRXmWc9ieuq5Ws7EMLO
	dJMavQ3QsmXRHnEZ4otLTZGXypeFFTMFDBPIDsP10/iDU4a0qYpdF0TcR7U9oZ2/cGqI68EUpAT
	5aToxnhUk0B/REu5XTt6Uu3VRd8/bKiupDo70CH0G+M6iOokwXxIUXh62QC08A0y7K7jrcvXtcA
	KnchGg6dGMjgP3rdYsLmTg4JKKKGfD8l2pxtCrrPcf7J2E4fQYN/4wa3T8Xjleu7c+lsUOijHux
	3pk=
X-Received: by 2002:a17:907:1c29:b0:c25:fdbc:52df with SMTP id a640c23a62f3a-c29e5244c19mr627703666b.10.1789663657749;
        Thu, 17 Sep 2026 09:47:37 -0700 (PDT)
X-Received: by 2002:a17:907:1c29:b0:c25:fdbc:52df with SMTP id
 a640c23a62f3a-c29e5244c19mr627698766b.10.1789663657315; Thu, 17 Sep 2026
 09:47:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788351089.git.rrobaina@redhat.com> <4ada9fcbb93af8d5c1c9bfe2c83d94fc10bfe327.1788351089.git.rrobaina@redhat.com>
 <CA+=Fv5T4826T2sd0Gbh-nfZsqcWK_phdBKy4BLWOvDTt92t5Eg@mail.gmail.com>
In-Reply-To: <CA+=Fv5T4826T2sd0Gbh-nfZsqcWK_phdBKy4BLWOvDTt92t5Eg@mail.gmail.com>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Thu, 17 Sep 2026 13:47:26 -0300
X-Gm-Features: AcwNN1UQ-9H3EW5aAPKYI2mYiHxV9kMvBFdM8jP3WAhZbefwH7qcxYHE69PGYDs
Message-ID: <CAABTaaAUBzp1uaLve2piMhEB1R5po5n5+Sy+U0mbbe70Ak-SUw@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] alpha: pass pt_regs to audit_syscall_entry()
To: Magnus Lindholm <linmag7@gmail.com>
Cc: audit@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, bpf@vger.kernel.org, paul@paul-moore.com, 
	eparis@redhat.com, sgrubb@redhat.com, oleg@redhat.com, 
	richard.henderson@linaro.org, mattst88@gmail.com, linux@armlinux.org.uk, 
	catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, monstr@monstr.eu, 
	tsbogend@alpha.franken.de, jonas@southpole.se, 
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, chris@zankel.net, 
	jcmvbkbc@gmail.com, tglx@kernel.org, peterz@infradead.org, luto@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 2:21=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com> =
wrote:
>
> Hi Ricardo,
>
> On Wed, Sep 2, 2026 at 4:44=E2=80=AFPM Ricardo Robaina <rrobaina@redhat.c=
om> wrote:
> >
> > audit_syscall_entry() now takes a pointer to pt_regs and extracts
> > the syscall arguments itself via syscall_get_arguments(). Drop the
> > individual argument registers from the call and pass regs instead.
> >
> > Signed-off-by: Ricardo Robaina <rrobaina@redhat.com>
> > ---
> >  arch/alpha/kernel/ptrace.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/arch/alpha/kernel/ptrace.c b/arch/alpha/kernel/ptrace.c
> > index fc8f6cedbb28..8a39c0473297 100644
> > --- a/arch/alpha/kernel/ptrace.c
> > +++ b/arch/alpha/kernel/ptrace.c
> > @@ -496,8 +496,7 @@ asmlinkage unsigned long syscall_trace_enter(void)
> >         }
> >
> >  #ifdef CONFIG_AUDITSYSCALL
> > -       audit_syscall_entry(syscall_get_nr(current, regs),
> > -               regs->r16, regs->r17, regs->r18, regs->r19);
> > +       audit_syscall_entry(syscall_get_nr(current, regs), regs);
> >  #endif
> >         return syscall_get_nr(current, regs);
> >  }
> > --
> > 2.55.0
> >
> This doesn't apply on top of my "alpha: enable GENERIC_ENTRY" series
>
> https://lore.kernel.org/linux-alpha/20260902184058.198679-1-linmag7@gmail=
.com/T/#t
>
> That series moves alpha's syscall entry onto the generic entry
> framework and removes syscall_trace_enter() and its direct
> audit_syscall_entry() call entirely - verified with git am against
> GENERIC_ENTRY applied, it fails at exactly this hunk.
> You don't need a replacement alpha patch, though. Once GENERIC_ENTRY
> lands, alpha's syscall entry goes through
> syscall_enter_from_user_mode_randomize_stack(), which already calls
> syscall_enter_audit() as part of the shared entry helpers
> (include/linux/entry-common.h). I applied patch 1/13 alone on top of
> GENERIC_ENTRY and confirmed alpha's entry path already routes through
> the updated __audit_syscall_entry() - no alpha-specific code needed.
> So for alpha, you can drop this patch in the next revision rather
> than rebase it.
>
> Regards
> Magnus
>

Hi Magnus,

Thanks for reviewing this patch! Ok, I'll drop this patch from the series.

Thanks!
-Ricardo

