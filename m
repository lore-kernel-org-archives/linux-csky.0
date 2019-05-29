Return-Path: <SRS0=K7zh=T5=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D222C28CC0
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 09:02:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3221C21019
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 09:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559120564;
	bh=RZmvcj5YOFAWtnzNoPVkvskrM60xi4ggPsr5+hWUqXc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=jYMR/tsFCmerY7pL0tfLcU0DqZM/Vt5N4rlcF+HduhS08rv0zgQRT39qFiZgzA86Q
	 A5jjoOS7VcwhGcazPeudIukpVGwaXtb5l3Li6/NajXQaTtH/VhapH8KMuXejwDf5Tw
	 REIhAmnoX8CcNvWnrExaArcQ0MJoGarztnmqyZgc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbfE2JCo (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Wed, 29 May 2019 05:02:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:37368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725914AbfE2JCn (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Wed, 29 May 2019 05:02:43 -0400
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D9413216FD
        for <linux-csky@vger.kernel.org>; Wed, 29 May 2019 09:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559120563;
        bh=RZmvcj5YOFAWtnzNoPVkvskrM60xi4ggPsr5+hWUqXc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gnjv7SeE0vKzhW3IoVomNOQ4aBEKLNibYaSgW1CM2C5FfuFshlSQtN2rkyjDOiRit
         GbWlr2G6IhhrHTMeBaDRYf9/EZ9RjfqIN4WesdQcp1oH7SlYEz02ZNY+A2G8j5gE/+
         ds/KP2vnL2tvrkpkHqoHv7nrQmksNhJF+kyKR/90=
Received: by mail-wm1-f41.google.com with SMTP id f10so1058548wmb.1
        for <linux-csky@vger.kernel.org>; Wed, 29 May 2019 02:02:42 -0700 (PDT)
X-Gm-Message-State: APjAAAUba7xuoSG2DoBtkK3ofJinZhKmjVMQE9Tpa/+BuR4XRXcX5Gba
        nMhRkyR8jcRrv9npaH1PjzpC6y066WeMQRmgoiw=
X-Google-Smtp-Source: APXvYqzh82p1erMt8To7dp5mJhSi3O1DTG8NeEOl3Xj7YNWW2c6h6VTayYn0hNEubT6YPOgBKfhWKhYK8/bgXCAQP90=
X-Received: by 2002:a1c:6545:: with SMTP id z66mr6002066wmb.77.1559120561385;
 Wed, 29 May 2019 02:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
 <1559114328-23357-2-git-send-email-guoren@kernel.org> <20190529092128.36183371@windsurf.home>
 <CAJF2gTQC8UigBniC_RKUVFddX=PnN7O9GyBZXcxyXuPBg9WNHw@mail.gmail.com>
 <20190529095629.2b28cbb7@windsurf.home> <CAJF2gTT5N6ST9Ph-L+bX2WtNx4ENu0wQ2uQ63D=3C-Zqoit+3w@mail.gmail.com>
 <20190529103824.58560e4e@windsurf.home>
In-Reply-To: <20190529103824.58560e4e@windsurf.home>
From:   Guo Ren <guoren@kernel.org>
Date:   Wed, 29 May 2019 17:02:29 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQfu_FAck2YM5b=d8QaYQhBHoCSeG4tvL1i8a1=7vgofA@mail.gmail.com>
Message-ID: <CAJF2gTQfu_FAck2YM5b=d8QaYQhBHoCSeG4tvL1i8a1=7vgofA@mail.gmail.com>
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

On Wed, May 29, 2019 at 4:38 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Wed, 29 May 2019 16:12:25 +0800
> Guo Ren <guoren@kernel.org> wrote:
>
> > > Not just two patches: also a better commit log for the DSP -> VDSP
> > > change.
> >
> > I want these two patches:
> >
> > 1. Remove DSP, because it's no use in current buildroot.
> > 2. Add VDSP support
>
> OK, but then please split in yet another patch the fact of using
> arch.mk.csky to build the GCC_TARGET_CPU variable.

I changemind and I'll follow the above patches which you prior mentioned

- One switching to using arch.mk.sky, without changing DSP -> VDSP
- A follow-up one changing DSP -> VDSP, with a commit log that
   explains why you make this chang

>
> > Here is my commit log for Introduce VDSP feature:
> >
> > VDSP is C-SKY enhanced extension instruction set for SIMD, AI and DSP
> > operation. It could be support by abiv2 (ck807, ck810, ck860).
> >
> > Is that OK?
>
> Yes. But please add a proper commit log in the patch removing the DSP
> option.
DSP -> VDSP, with a commit log, like this:

Subject: Change DSP to VDSP for -mcpu

DSP is no use in current buildroot and gcc default enable the DSP
feature for C-SKY.
So DSP is part of our standard ISA, we needn't put it in -mcpu=xxx.

VDSP is C-SKY enhanced extension instruction set for SIMD, AI and DSP
operation. It could be support by abiv2 (ck807, ck810, ck860).

Best Regards
 Guo Ren
