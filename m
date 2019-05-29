Return-Path: <SRS0=K7zh=T5=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A65CC04AB3
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 08:53:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0E0CB20B7C
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 08:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559120023;
	bh=q8IiL2RLUNFx4EKEW0cMp9hSjtQ/zTsqkm+IIHVGQEA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=nnJUBZ1AIrPKKvZp1gDPeSOuD7yUTzCSS/VNqPuezeNFlbXP/Dkg6O82fLvkjZchb
	 qVm/vxcCMfAreNN3OsnlV/q/4zSrFjDRupgHdnPrj22R74XVwoPT+lFjolo7oJAsjG
	 43LXTVGvFfAZjSD+euY4VBM45o12KKlRy3gYcWck=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725894AbfE2Ixm (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Wed, 29 May 2019 04:53:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:34456 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725861AbfE2Ixm (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Wed, 29 May 2019 04:53:42 -0400
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CCF1C21721
        for <linux-csky@vger.kernel.org>; Wed, 29 May 2019 08:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559120022;
        bh=q8IiL2RLUNFx4EKEW0cMp9hSjtQ/zTsqkm+IIHVGQEA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VgP94ptr8GCwTNVKjCM7hrMQ5ZHq5yfEFoj8ZJ2JRg5Ukcg538cr6a3izlBC37KVv
         Kn91i0E3y/1MvpcC5YoBc/MxPfQwJqZSHDkAwIRYhXrFxFck8wtp7Uzatal4ox5tjB
         +rmEaM1QIhcKx9ArlDcWNURHagFaiZfcCWdC4nXY=
Received: by mail-wm1-f53.google.com with SMTP id v19so3847839wmh.0
        for <linux-csky@vger.kernel.org>; Wed, 29 May 2019 01:53:41 -0700 (PDT)
X-Gm-Message-State: APjAAAVNmYnMZeDACbu0eCrDrLexXfDvBt10lx/amcB/Zrt9dNJrlroE
        GnISqYHMSfUhgxRLUiAvYmCzR7uH/PbQOR0yU1s=
X-Google-Smtp-Source: APXvYqx7u/QH1fyJMROw6SxaHtxaaXP6HQWYC47SVKu/miYgOH2wj8W2IxskuLzMgnQln5PBuecBkM7F88iOefAPt3M=
X-Received: by 2002:a7b:cd84:: with SMTP id y4mr6115955wmj.79.1559120020420;
 Wed, 29 May 2019 01:53:40 -0700 (PDT)
MIME-Version: 1.0
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
 <1559114328-23357-4-git-send-email-guoren@kernel.org> <20190529092307.6c78996b@windsurf.home>
 <CAJF2gTSgReEOOJAvXY=MraqTLV4DwkKOqsbQ-4rBdNiaibxQfQ@mail.gmail.com>
 <20190529095739.18d4d3c8@windsurf.home> <CAJF2gTRb4W=ZUz4-WxPwzdaQMMo1suwPsxU47QeGdjfBvgs3og@mail.gmail.com>
 <20190529103930.35f88870@windsurf.home>
In-Reply-To: <20190529103930.35f88870@windsurf.home>
From:   Guo Ren <guoren@kernel.org>
Date:   Wed, 29 May 2019 16:53:29 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQtG+Az=GmKqJkZa0KSDXU=Q=Hp-UD+z92ixoN=X38L-Q@mail.gmail.com>
Message-ID: <CAJF2gTQtG+Az=GmKqJkZa0KSDXU=Q=Hp-UD+z92ixoN=X38L-Q@mail.gmail.com>
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

Thx,

On Wed, May 29, 2019 at 4:39 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Guo,
>
> On Wed, 29 May 2019 16:30:43 +0800
> Guo Ren <guoren@kernel.org> wrote:
>
> > OK, change the commit log with:
> >
> > C-SKY CPU is seperated into two ABIs:
> >  - abiv1: mcore based ELF_NUM:39 and do not support FPU & VDSP. (CPU: 610)
> >  - abiv2: C-SKY own ISA with ELF_NUM:252 and support FPU & VDSP. (CPU:
> > 807, 810, 860)
> >
> > So we don't care BR2_GCC_TARGET_FLOAT_ABI for abiv1, because it based
> > on CSKY_FPU and it'll
> > never be selected by ck610.
>
> This last part is not correct: BR2_GCC_TARGET_FLOAT_ABI *will* have a
> value for abiv1. Except the value will always be "soft" because there's
> no FPU support in ck610, which is the only core using abiv1. So saying
> "We don't care about BR2_GCC_TARGET_FLOAT_ABI for abiv1" is not correct.
Yes, Approved and I'll change it like this:

C-SKY CPU is seperated into two ABIs:
 - abiv1: mcore based ELF_NUM:39 and do not support FPU & VDSP. (CPU: 610)
 - abiv2: C-SKY own ISA with ELF_NUM:252 and support FPU & VDSP. (CPU:
807, 810, 860)

BR2_GCC_TARGET_FLOAT_ABI *will* have a value for abiv1. Except the
value will always be "soft"
because there's no FPU support in ck610, which is the only core using abiv1.

Best Regards
 Guo Ren
