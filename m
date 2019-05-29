Return-Path: <SRS0=K7zh=T5=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 753B3C28CC0
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 12:34:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 426682081C
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 12:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559133289;
	bh=qR0J+3owD7F/KcEwJMmQjv+2GgZK3GykWKqQVX3drPc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=DuuMlFZWgBwAisy6j71p8f2FVHRswEmm7yT0Ag7X2cNTKXnyzwWFOwDt9R8tIPWsy
	 xvaGv4TBTEbgI/I1RSqv9RWDgdsRXnRF443T3XWNqTzYKCDyMED7gh+3QRxbkRvNGI
	 Wq0V09SLQjkBf3LHehshBADdvVLT4R854mBmAFWk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbfE2Mes (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Wed, 29 May 2019 08:34:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:42112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725914AbfE2Mer (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Wed, 29 May 2019 08:34:47 -0400
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3BF072081C
        for <linux-csky@vger.kernel.org>; Wed, 29 May 2019 12:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559133287;
        bh=qR0J+3owD7F/KcEwJMmQjv+2GgZK3GykWKqQVX3drPc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=D0RSfGPI/Ea9cnF/2G55qEaLfDKXrSqfZtOEGjTojKf2CZT+4bJYu6O33mkIhpH8y
         lxTTeEGfGDTCem5xyy+RJScnRTHXSioPBPzB7w7u1MFJubCyLegVPqDNfETwN+I6EZ
         EaAiX0ytwbX3T7Jej8ZS7KBvGzORGbrdMEaLRsDA=
Received: by mail-wr1-f51.google.com with SMTP id w13so1629487wru.11
        for <linux-csky@vger.kernel.org>; Wed, 29 May 2019 05:34:47 -0700 (PDT)
X-Gm-Message-State: APjAAAVv5uzNVWrq5xcx3iVRETTTCek9HvHGOiZVT9nfmg4ifRze5f6M
        NKjd5IWGgGm6i3NJKmO42GJQeTsUijayiyRgxzg=
X-Google-Smtp-Source: APXvYqwDK6kecWiul6k2PWKN9XKubJKkoSYFhmWg1obOeNfjgwLbcI+CNIYEDl2HTOYQ6nJqOlSgEmt9WH57aPZ1i+M=
X-Received: by 2002:adf:fe07:: with SMTP id n7mr7997834wrr.7.1559133285891;
 Wed, 29 May 2019 05:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
 <1559114328-23357-2-git-send-email-guoren@kernel.org> <20190529092128.36183371@windsurf.home>
 <CAJF2gTQC8UigBniC_RKUVFddX=PnN7O9GyBZXcxyXuPBg9WNHw@mail.gmail.com>
 <20190529095629.2b28cbb7@windsurf.home> <CAJF2gTT5N6ST9Ph-L+bX2WtNx4ENu0wQ2uQ63D=3C-Zqoit+3w@mail.gmail.com>
 <20190529103824.58560e4e@windsurf.home> <CAJF2gTQfu_FAck2YM5b=d8QaYQhBHoCSeG4tvL1i8a1=7vgofA@mail.gmail.com>
 <20190529112317.08fe1013@windsurf.home> <CAJF2gTRf_kzuqM_takvwNHU3sBfTBjqOBDv4xbqwnS9E9f9uTQ@mail.gmail.com>
 <20190529135836.1a907b0e@windsurf.home>
In-Reply-To: <20190529135836.1a907b0e@windsurf.home>
From:   Guo Ren <guoren@kernel.org>
Date:   Wed, 29 May 2019 20:34:34 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS5V8tL-KbLCXt2O6bPp3GpEZKPuVv0Zv9OKArKGy3izQ@mail.gmail.com>
Message-ID: <CAJF2gTS5V8tL-KbLCXt2O6bPp3GpEZKPuVv0Zv9OKArKGy3izQ@mail.gmail.com>
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

On Wed, May 29, 2019 at 7:58 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Wed, 29 May 2019 17:45:19 +0800
> Guo Ren <guoren@kernel.org> wrote:
>
> > > I am willing to help you formulate this properly, but since I still
> > > don't understand why you are dropping the DSP option, I can't really
> > > help by proposing a better wording.
> > DSP extention is no longer used for C-SKY and there is no defconfig
> > use "e" extension in buildroot.
>
> Not having a defconfig doesn't mean something is not supported. There
> are tons of features in Buildroot that are not enabled by defconfig,
> and still we do support them.
Agree, remove defconfig sentence.

Best Regards
 Guo Ren
