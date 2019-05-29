Return-Path: <SRS0=K7zh=T5=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F71C28CC0
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 09:45:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 849382070D
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 09:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559123133;
	bh=EnB3wRzXj0LtgmVlTWwqZzm/j2XN5V8k/y0m25kQGNM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=xymBZNBLJ3JQMYtnAqbxcJf6UAxpB6l6Dmq9u62l2M/aHJy8HMw3vp1lrgPtuUCXP
	 3ufiOXaXvaRjeO78MQydRnO6jlJ4uT/Pl7Ai/MgBz7XGNEPOYlgsDu9RANCwk6myqI
	 SckDL50qkuyEOJL+WQnkuUVkTxfqG5fITSjxuSHY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbfE2Jpd (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Wed, 29 May 2019 05:45:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:53730 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725874AbfE2Jpd (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Wed, 29 May 2019 05:45:33 -0400
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 52C6C21734
        for <linux-csky@vger.kernel.org>; Wed, 29 May 2019 09:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559123132;
        bh=EnB3wRzXj0LtgmVlTWwqZzm/j2XN5V8k/y0m25kQGNM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qoOsxH4EwZlZRYcOfhRrEiJJKK+lc81q3BN0Fm2SFi2aE9mv7l8IcnGiWmvjmtnZF
         XIyAnSbfclL9GyAJy2kr26a46X7hVnS/e9ygXwUtkRaYN0dthQTVHLBaJxrpZl9dbK
         L57yadcM8Q/8tfR5jungUgsmcRrf1zhZIavtTKXo=
Received: by mail-wr1-f47.google.com with SMTP id l2so1228815wrb.9
        for <linux-csky@vger.kernel.org>; Wed, 29 May 2019 02:45:32 -0700 (PDT)
X-Gm-Message-State: APjAAAUdI3MLs+sh4t6ki/YoVvL5qBylM8hnKS7K5IohnGJsJTdRn+1S
        ya1N/yS/LDvIfyPjpIzmd2IMfcMwgQmvDr0RHZY=
X-Google-Smtp-Source: APXvYqzJaMhIhP9suRr8+sxG7xDZ9J1ZB3iImDOxVhkeJ6s/6X5jIXAt4wR4OoDo1lOgK/y7k1kRLfoaAQHwU76jAGA=
X-Received: by 2002:adf:eb42:: with SMTP id u2mr1846561wrn.80.1559123130644;
 Wed, 29 May 2019 02:45:30 -0700 (PDT)
MIME-Version: 1.0
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
 <1559114328-23357-2-git-send-email-guoren@kernel.org> <20190529092128.36183371@windsurf.home>
 <CAJF2gTQC8UigBniC_RKUVFddX=PnN7O9GyBZXcxyXuPBg9WNHw@mail.gmail.com>
 <20190529095629.2b28cbb7@windsurf.home> <CAJF2gTT5N6ST9Ph-L+bX2WtNx4ENu0wQ2uQ63D=3C-Zqoit+3w@mail.gmail.com>
 <20190529103824.58560e4e@windsurf.home> <CAJF2gTQfu_FAck2YM5b=d8QaYQhBHoCSeG4tvL1i8a1=7vgofA@mail.gmail.com>
 <20190529112317.08fe1013@windsurf.home>
In-Reply-To: <20190529112317.08fe1013@windsurf.home>
From:   Guo Ren <guoren@kernel.org>
Date:   Wed, 29 May 2019 17:45:19 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRf_kzuqM_takvwNHU3sBfTBjqOBDv4xbqwnS9E9f9uTQ@mail.gmail.com>
Message-ID: <CAJF2gTRf_kzuqM_takvwNHU3sBfTBjqOBDv4xbqwnS9E9f9uTQ@mail.gmail.com>
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

Hello,

On Wed, May 29, 2019 at 5:23 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Wed, 29 May 2019 17:02:29 +0800
> Guo Ren <guoren@kernel.org> wrote:
>
> > DSP is no use in current buildroot and gcc default enable the DSP
> > feature for C-SKY.
> > So DSP is part of our standard ISA, we needn't put it in -mcpu=xxx.
>
> "DSP is no use in current Buildroot" is not correct. The option exists,
> and it changes the BR2_GCC_TARGET_CPU value. So it *is* used: it adds
> "e" to BR2_GCC_TARGET_CPU. So this explanation is not really
> good/sufficient.
>
> I am willing to help you formulate this properly, but since I still
> don't understand why you are dropping the DSP option, I can't really
> help by proposing a better wording.
DSP extention is no longer used for C-SKY and there is no defconfig
use "e" extension in buildroot.
I have regretted submitting it to the buildroot.

Change commit log, like this:

Subject: Change DSP to VDSP for -mcpu

DSP extention is no longer used for C-SKY gcc and there is no
defconfig use "e" extension
in buildroot.

VDSP is C-SKY enhanced extension instruction set for SIMD, AI and DSP
operation. It could be supported by abiv2 (ck807, ck810, ck860).

Is that OK?

Best Regards
 Guo Ren
