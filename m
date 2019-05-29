Return-Path: <SRS0=K7zh=T5=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F6CEC04AB3
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 07:31:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 75A2A21019
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 07:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559115064;
	bh=F/h8ZtPftVAgRxTNrCVLrQrWOrBLx0zHVfonIbDhqNQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=v1+txgzzqU8surT3f7OKdeMzJVqr1EZJp9Fg8UbPXMCxZpFLosJcdaGs4WXhYScdl
	 JH0FOxOruoPG/+3LRfIDJymEtWqj0+jLSOc+bCjpaWqBUJkj4uZbcPYe+/DHEEBz9J
	 mEg6Xu9hymM8Vz3V8TsiI95UnZXyRKzlUkA8oTHA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbfE2HbE (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Wed, 29 May 2019 03:31:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:55304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725911AbfE2HbE (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Wed, 29 May 2019 03:31:04 -0400
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4D21E21019
        for <linux-csky@vger.kernel.org>; Wed, 29 May 2019 07:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559115063;
        bh=F/h8ZtPftVAgRxTNrCVLrQrWOrBLx0zHVfonIbDhqNQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dikshIwFFEy+4HHlNn04mUxfah/5f59iXy4w7sVEj065P6FQjYwhwZApa9i8rJJhs
         BnGs4xC8R3xdXC6gATeH1MPS/YH5VHqIR46uj7xtDTznDm5R1phlpUlgBiUYx9AnT3
         XEGpAnFNTdSJx6kgvBZO5RqEm/teldfGHKiU3Nl4=
Received: by mail-wr1-f49.google.com with SMTP id t4so892253wrx.7
        for <linux-csky@vger.kernel.org>; Wed, 29 May 2019 00:31:03 -0700 (PDT)
X-Gm-Message-State: APjAAAUY4ZSSHXqZRm3h0KCBBRqjkcZLaUABDx6WwtSuBZOdgYEHFhov
        QkM7OYXKjDbcPpC7BuXz0Z+pG33e6vblO1K2FCs=
X-Google-Smtp-Source: APXvYqxknI/YnRy1PsV1o3WaC7VaywgD5BDlSdsjW1mOxUNPNXXj4/RAMK2vRGnOA0vjVdhleuYImWeunnsPTkPXH/Q=
X-Received: by 2002:adf:eb42:: with SMTP id u2mr1376647wrn.80.1559115056313;
 Wed, 29 May 2019 00:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
 <1559114328-23357-2-git-send-email-guoren@kernel.org> <20190529092128.36183371@windsurf.home>
In-Reply-To: <20190529092128.36183371@windsurf.home>
From:   Guo Ren <guoren@kernel.org>
Date:   Wed, 29 May 2019 15:30:45 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQC8UigBniC_RKUVFddX=PnN7O9GyBZXcxyXuPBg9WNHw@mail.gmail.com>
Message-ID: <CAJF2gTQC8UigBniC_RKUVFddX=PnN7O9GyBZXcxyXuPBg9WNHw@mail.gmail.com>
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

OK, two pathes.

On Wed, May 29, 2019 at 3:21 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Guo,
>
> Thanks for this new iteration. I apologize, but unfortunately it's
> still not good, and doesn't match the suggestions I did.
>
> On Wed, 29 May 2019 15:18:39 +0800
> guoren@kernel.org wrote:
>
> > From: Guo Ren <ren_guo@c-sky.com>
> >
> > Use VDSP enhanced instructions Co-processor instead of DSP.
>
> Your commit log should explain why.
>
> > Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> > ---
> >  arch/Config.in.csky | 17 +++--------------
> >  arch/arch.mk.csky   | 24 ++++++++++++++++++++++++
>
> The change to using arch.mk.csky should be done separately. So this
> commit should be split into two:
>
>  - One switching to using arch.mk.sky, without changing DSP -> VDSP
>
>  - A follow-up one changing DSP -> VDSP, with a commit log that
>    explains why you make this chang
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
