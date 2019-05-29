Return-Path: <SRS0=K7zh=T5=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C84CC07542
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 08:31:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 52A0120665
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 08:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559118660;
	bh=T0KSRQmALz/1SWwV/6E1XcYYTQtsSgopphlVD1o+o38=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=VvNHbjjH2IWFJv+Ll4GtRq9NtGWtSbLWqv5IRBlUCh9WdcDFLUDFe0VJ3cadYBJc5
	 lQhEe52gcap4X3TVUwZy7LOvhW62ST8Iu4hPSdQOHQrHqLbOETUcaNs3t2CuG9BnpM
	 BBAcUmoyIXENkUbUVQiCuSVWiVT+hHSGE3rElbqk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbfE2Ia7 (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Wed, 29 May 2019 04:30:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:52730 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726752AbfE2Ia6 (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Wed, 29 May 2019 04:30:58 -0400
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D566D20665
        for <linux-csky@vger.kernel.org>; Wed, 29 May 2019 08:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559118658;
        bh=T0KSRQmALz/1SWwV/6E1XcYYTQtsSgopphlVD1o+o38=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QW4sc7lhD39n38MpTcNGd2JNbkDlv2HCrQZqRCGlEmMGZ2cpE5/BdAtcIQhxn1YY4
         xokPv08sb3rvhrGSAGLHIU2VW2/GAtqK1WpfPdcTXJ5oX7hvBeJhwm0z1zVmuNDvbU
         ZlFllxzwHQIfHSrkPPfSepJSRcMdvTP8ks9bReSA=
Received: by mail-wr1-f51.google.com with SMTP id h1so1056947wro.4
        for <linux-csky@vger.kernel.org>; Wed, 29 May 2019 01:30:57 -0700 (PDT)
X-Gm-Message-State: APjAAAXVVFwq+0O2qf+Psnum7qrDcEWumc0xsOKbWWzVSmCN1yv9M9KA
        +LopVKnV2KIjfcf7jTIAL5byJlPt6MAuGS0Or/A=
X-Google-Smtp-Source: APXvYqxhPurHJGJ5xz0Zn2bOtOMEls4OYCvPJkoMd7PmNwfDDrq+up0F2t+uON1jTbTt1vHWZ9VjrtlL43wyF7lOGS8=
X-Received: by 2002:adf:eb42:: with SMTP id u2mr1589674wrn.80.1559118654501;
 Wed, 29 May 2019 01:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
 <1559114328-23357-4-git-send-email-guoren@kernel.org> <20190529092307.6c78996b@windsurf.home>
 <CAJF2gTSgReEOOJAvXY=MraqTLV4DwkKOqsbQ-4rBdNiaibxQfQ@mail.gmail.com> <20190529095739.18d4d3c8@windsurf.home>
In-Reply-To: <20190529095739.18d4d3c8@windsurf.home>
From:   Guo Ren <guoren@kernel.org>
Date:   Wed, 29 May 2019 16:30:43 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRb4W=ZUz4-WxPwzdaQMMo1suwPsxU47QeGdjfBvgs3og@mail.gmail.com>
Message-ID: <CAJF2gTRb4W=ZUz4-WxPwzdaQMMo1suwPsxU47QeGdjfBvgs3og@mail.gmail.com>
Subject: Re: [PATCH V3 03/10] arch/csky: Add FLOAT_ABI compiler options
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc:     Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be, linux-csky@vger.kernel.org,
        buildroot@buildroot.org, Guo Ren <ren_guo@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

On Wed, May 29, 2019 at 3:57 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Wed, 29 May 2019 15:30:14 +0800
> Guo Ren <guoren@kernel.org> wrote:
>
> > > What is abiv1 vs. abiv2 ? Also, in your next commit, abiv1 is
> > > apparently used for ck610, but here this BR2_GCC_TARGET_FLOAT_ABI is
> > > defined for all cases, which seems to contradict your commit log.
> > abiv1 contain: ck610
> > abiv2 contain: ck807 ck810 ck860
> >
> > Abiv1 is almost the same as mcore and it's ELF_CODE is 39
> > Abiv2 is C-SKY own ISA and it's ELF_CODE is 252
> >
> > We don't support FPU in abiv1, because its opcode width is only
> > 16-bits and we don't want to continue developing it.
>
> Ah, and indeed BR2_CSKY_FPU cannot be selected for BR2_ck610.
>
> Please explain all of this in the commit log. Thanks!
>
OK, change the commit log with:

C-SKY CPU is seperated into two ABIs:
 - abiv1: mcore based ELF_NUM:39 and do not support FPU & VDSP. (CPU: 610)
 - abiv2: C-SKY own ISA with ELF_NUM:252 and support FPU & VDSP. (CPU:
807, 810, 860)

So we don't care BR2_GCC_TARGET_FLOAT_ABI for abiv1, because it based
on CSKY_FPU and it'll
never be selected by ck610.
