Return-Path: <SRS0=K7zh=T5=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB9CC28CC0
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 09:06:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6AA4C21670
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 09:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559120814;
	bh=N+oSGVakQth8/Gc6Id7rHrNV+QlgTN//U6ARbK7z+gw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=KyrKKunWt9RiBG4AbUcYsLJ1jFuQJmWbyDgVilBf8QDqvNXU8YvgX5oVCm38tNTnH
	 2ho5fyh1l4Y0SsiiErIFNEy4EZobGfg+80vR/+BuYTpVX9bEAgip94Tchd1ezzTAIm
	 ULcTOzx+A4sAxWjVKqIjPz4pSoxkJIrdY6MB2Pnk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725861AbfE2JGy (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Wed, 29 May 2019 05:06:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:38848 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725956AbfE2JGy (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Wed, 29 May 2019 05:06:54 -0400
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0AE92216FD
        for <linux-csky@vger.kernel.org>; Wed, 29 May 2019 09:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559120813;
        bh=N+oSGVakQth8/Gc6Id7rHrNV+QlgTN//U6ARbK7z+gw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tcf7f43tmLSHKZLZdtOJQ9CGqD5GM3zGqK/l8DjR/mK2rMufGbF5PHttFfAjNFji0
         YdE2QuJHThqmqmKccTkboB35ZAmmBDo/mxc8P0ET106uyHqNPPvAFCSzmWocPvxZ6Q
         L7z11xtSzm2eWUuV8fisAXv0E7UhTyDRCYBJxu8U=
Received: by mail-wm1-f50.google.com with SMTP id i3so1057814wml.4
        for <linux-csky@vger.kernel.org>; Wed, 29 May 2019 02:06:52 -0700 (PDT)
X-Gm-Message-State: APjAAAW6fbgDNeU6kHpX3Ue1OWY9m0OwLWQ71EUT2UX1yB61Wkk89dqT
        f63JuWIo7tFc9g9rohb7KwCpmHnezebTalsNG2I=
X-Google-Smtp-Source: APXvYqzG0yyfiKkc9IZoCwmLKoUtfIXh6MnBbumnl5TGg94QjOeR2V9Qxs9hQYxC6xF3CCSWdfteE9tWZe16X3Q2pPc=
X-Received: by 2002:a1c:6545:: with SMTP id z66mr6016042wmb.77.1559120811592;
 Wed, 29 May 2019 02:06:51 -0700 (PDT)
MIME-Version: 1.0
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
 <1559114328-23357-2-git-send-email-guoren@kernel.org> <20190529092128.36183371@windsurf.home>
 <CAJF2gTQC8UigBniC_RKUVFddX=PnN7O9GyBZXcxyXuPBg9WNHw@mail.gmail.com>
 <20190529095629.2b28cbb7@windsurf.home> <CAJF2gTT5N6ST9Ph-L+bX2WtNx4ENu0wQ2uQ63D=3C-Zqoit+3w@mail.gmail.com>
 <20190529103824.58560e4e@windsurf.home> <CAJF2gTQfu_FAck2YM5b=d8QaYQhBHoCSeG4tvL1i8a1=7vgofA@mail.gmail.com>
In-Reply-To: <CAJF2gTQfu_FAck2YM5b=d8QaYQhBHoCSeG4tvL1i8a1=7vgofA@mail.gmail.com>
From:   Guo Ren <guoren@kernel.org>
Date:   Wed, 29 May 2019 17:06:39 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ3Q+b2+CPc+QP2Zpey53+=8Lf12=TJWjrr6Sig27npBw@mail.gmail.com>
Message-ID: <CAJF2gTQ3Q+b2+CPc+QP2Zpey53+=8Lf12=TJWjrr6Sig27npBw@mail.gmail.com>
Subject: Re: [PATCH V3 01/10] arch/csky: Use VDSP instead of DSP
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc:     Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be, linux-csky@vger.kernel.org,
        buildroot@buildroot.org, Guo Ren <ren_guo@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

On Wed, May 29, 2019 at 5:02 PM Guo Ren <guoren@kernel.org> wrote:
>
> On Wed, May 29, 2019 at 4:38 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello,
> >
> > On Wed, 29 May 2019 16:12:25 +0800
> > Guo Ren <guoren@kernel.org> wrote:
> >
> > > > Not just two patches: also a better commit log for the DSP -> VDSP
> > > > change.
> > >
> > > I want these two patches:
> > >
> > > 1. Remove DSP, because it's no use in current buildroot.
> > > 2. Add VDSP support
> >
> > OK, but then please split in yet another patch the fact of using
> > arch.mk.csky to build the GCC_TARGET_CPU variable.
>
> I changemind and I'll follow the above patches which you prior mentioned
>
> - One switching to using arch.mk.sky, without changing DSP -> VDSP
> - A follow-up one changing DSP -> VDSP, with a commit log that
>    explains why you make this chang
>
> >
> > > Here is my commit log for Introduce VDSP feature:
> > >
> > > VDSP is C-SKY enhanced extension instruction set for SIMD, AI and DSP
> > > operation. It could be support by abiv2 (ck807, ck810, ck860).
> > >
> > > Is that OK?
> >
> > Yes. But please add a proper commit log in the patch removing the DSP
> > option.
> DSP -> VDSP, with a commit log, like this:
>
> Subject: Change DSP to VDSP for -mcpu
>
> DSP is no use in current buildroot and gcc default enable the DSP
> feature for C-SKY.
> So DSP is part of our standard ISA, we needn't put it in -mcpu=xxx.
>
> VDSP is C-SKY enhanced extension instruction set for SIMD, AI and DSP
> operation. It could be support by abiv2 (ck807, ck810, ck860).
Correct: It is supported by abiv2.
