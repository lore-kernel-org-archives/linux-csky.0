Return-Path: <SRS0=mu5m=UX=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42101C43613
	for <linux-csky@archiver.kernel.org>; Mon, 24 Jun 2019 05:58:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0D25C2089F
	for <linux-csky@archiver.kernel.org>; Mon, 24 Jun 2019 05:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561355886;
	bh=if+wRJE5B5XW7XL1AI68KFWd5nQSf8QA1HaRLVHHkwQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=Y/KFNHtq4XaOc+9V62IiQhX0lCMN1ql46m6sbwGiO2ndnn0da3wqtvutVt5N3WLcr
	 GZenEWX6NcEocNS3137WruxN88hzSvp5hgGvVWPqvv/nKnvVU7iwUQC/FE8WvmVaid
	 c/1i7aHOda3w0HKU8MhCMTCP7dDBor9g8DdHIyXI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbfFXF6F (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Mon, 24 Jun 2019 01:58:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:47702 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725782AbfFXF6F (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Mon, 24 Jun 2019 01:58:05 -0400
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A651B208CA
        for <linux-csky@vger.kernel.org>; Mon, 24 Jun 2019 05:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561355884;
        bh=if+wRJE5B5XW7XL1AI68KFWd5nQSf8QA1HaRLVHHkwQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JvbqeOm8aAxhHSHHhbKaElq5plPzici6FcWke+yOXVVfSzCsfSNZ/5kNPbZ9W9GoH
         8ebY6THsFvZtmwz8FtH4411z1GBjU1z3TB0xV+WnyFx4NzCQ1t1nUCZgRtcaJ7yB7P
         Zf3MP4uye2ZIwHrFuFU9i6sKgwhgNQDgE5fw4N6o=
Received: by mail-wr1-f41.google.com with SMTP id n9so12488385wru.0
        for <linux-csky@vger.kernel.org>; Sun, 23 Jun 2019 22:58:04 -0700 (PDT)
X-Gm-Message-State: APjAAAXgnDhsxfhCx8NV0WhZtdfvl/5jtLLfufZZ6YBANmug+99/bPLm
        icPZeag9hbLkzOPCK/MHzJoe9siUVoKPShzFKxg=
X-Google-Smtp-Source: APXvYqzb7qg0TiyN2vC4hHjxlnE/IuZxPalN/qtZqIwI5bj4gQGLvhc8iabYLDeLep6AC8NElypplG0jYQo+RYhVx1I=
X-Received: by 2002:adf:9bd3:: with SMTP id e19mr29732309wrc.38.1561355883232;
 Sun, 23 Jun 2019 22:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <1561347693-16089-1-git-send-email-guoren@kernel.org> <20190624055207.59b0c7bf@windsurf>
In-Reply-To: <20190624055207.59b0c7bf@windsurf>
From:   Guo Ren <guoren@kernel.org>
Date:   Mon, 24 Jun 2019 13:57:51 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTD2DJtRUX402LAR5wsgCbb7GwvfGLxMDcEkrhdMJNHXg@mail.gmail.com>
Message-ID: <CAJF2gTTD2DJtRUX402LAR5wsgCbb7GwvfGLxMDcEkrhdMJNHXg@mail.gmail.com>
Subject: Re: [PATCH] configs/csky_gx6605s: bump kernel to 5.0 and use
 buildroot toolchain
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc:     linux-csky@vger.kernel.org, buildroot@buildroot.org,
        Guo Ren <ren_guo@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

Hello,

On Mon, Jun 24, 2019 at 11:52 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Mon, 24 Jun 2019 11:41:33 +0800
> guoren@kernel.org wrote:
>
> > From: Guo Ren <ren_guo@c-sky.com>
> >
> > The most thing is to use the toolchain compiled by buildroot itself. And
> > we also bump kernel to 5.0 with kernel.org.
> >
> > For all 610s including qemu we use 0x10000000 PHYS_OFFSET for unified
> > maintain.
>
> I'm not sure what you mean by "unified maintain". How does it matter,
> considering that the Buildroot defconfig is anyway for one single
> platform ?
PHYS_OFFSET change need re-compile the vmlinux, because csky only
could align 512MB for dynamical. We define PHYS_OFFSET 0x10000000
here, then we could also boot the same vmlinux with both qemu and
gx6605s.

>
> > There is no gx6605s.dts for the config, so we need wget it from
> > csky gitlab CI storage.
>
> Meh, this is not great. Is the Gitlab CI URL really permanent? Jobs
> artifacts are usually removed after a configurable time, isn't it the
> case as well for this artifact ?
Seems it could be permanent, I use the 'keep' buttom on the gitlab job page.

>
> Also, why isn't this .dts not submitted to the upstream Linux kernel ?
I prepare to do that, but it need wait next linux kernel version to support it.

>
> Overall, I think I would prefer to see a patch to the Linux kernel in
> board/csky/ rather than downloading a random .dtb. Or just have
> the .dts file directly in board/csky/.
A .dts file directly in board/csky is also OK for me and I'll do that
in next version patch.

>
> For the record, DT is not about "config", it's about describing the
> hardware. You might give the DT kernel maintainers a heart attack if
> you call the DT "configuration"! :-)
Got it, DT is the DT, and config is the config, they are different.

But, my sentence:
origin: There is no gx6605s.dts for the config ...
correct: There is no gx6605s.dts in the buildroot config ...
That's what I mean, sorry for bad grammer :)

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
