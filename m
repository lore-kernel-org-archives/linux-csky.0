Return-Path: <SRS0=8JPw=UC=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D90FC04AB6
	for <linux-csky@archiver.kernel.org>; Mon,  3 Jun 2019 07:00:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E294F27C73
	for <linux-csky@archiver.kernel.org>; Mon,  3 Jun 2019 07:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559545228;
	bh=eZhG8OiY5/awJ8xa8efe9B/e4C4ECZWOdIgYQg+Jm7Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=G0D74PB0a98sVH/80zffvbdI3KIrv6Xa3nvQO00KYswMEZ5mnxC6g4B/xGhsZ6SdT
	 oVj3kjROGIDeKQZkcK12ShNahui5uo0XvAy2Ki/OqxLQQP5vc4/v9ynhwDyNNt++G2
	 YbA50ZZaHGAlm948C5AkxJzDkJ+6Jwn+ZIo/Uoyo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbfFCHA1 (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Mon, 3 Jun 2019 03:00:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:46824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726383AbfFCHA1 (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Mon, 3 Jun 2019 03:00:27 -0400
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F1A5B27C75
        for <linux-csky@vger.kernel.org>; Mon,  3 Jun 2019 07:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559545226;
        bh=eZhG8OiY5/awJ8xa8efe9B/e4C4ECZWOdIgYQg+Jm7Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=T3reS0shJVwSkmVY++/u7bUc4oQB8E7/LbJGD8ak3fwJXzqHjfoHlDXUYT4X0Wysv
         ofQtHqmc+U93w5snQRtFkNW6qDarkX01nJPI1fVLQofZcKQnIAXURfXkfRa6CVYxFS
         Ln9graynyP2XLQWX3N2rbSSaahGLM6u0k3Df640w=
Received: by mail-wm1-f47.google.com with SMTP id f204so5898404wme.0
        for <linux-csky@vger.kernel.org>; Mon, 03 Jun 2019 00:00:25 -0700 (PDT)
X-Gm-Message-State: APjAAAU9YVGUqPkASzh42fMJnrysX+7ha/wK1nzKAakhDMIuwF9iGbin
        m+yjjqo3WQRjc+EO3YD36btXLlzn5X6gllXaoh4=
X-Google-Smtp-Source: APXvYqww3oIe6GjtGL6xTlzDSVhuUK1lvqtC1uHvq2OILlo3pL5EDCCk3SptAxPgNyuHDFT+CwJRWonVnkHLd8Zv6ZE=
X-Received: by 2002:a1c:6545:: with SMTP id z66mr1147823wmb.77.1559545224510;
 Mon, 03 Jun 2019 00:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <1559468510-22085-1-git-send-email-guoren@kernel.org> <20190602123218.244963b8@windsurf>
In-Reply-To: <20190602123218.244963b8@windsurf>
From:   Guo Ren <guoren@kernel.org>
Date:   Mon, 3 Jun 2019 15:00:12 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRd20OK5fcKaKmj3fYKekX3+PVb1_gjpr3y2X+w7-QAww@mail.gmail.com>
Message-ID: <CAJF2gTRd20OK5fcKaKmj3fYKekX3+PVb1_gjpr3y2X+w7-QAww@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH V5 1/2] configs/qemu_cskyXXX_virt: new defconfig
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc:     Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be, Guo Ren <ren_guo@c-sky.com>, zhiwei_liu@c-sky.com,
        linux-csky@vger.kernel.org, buildroot@buildroot.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

Hello Thomas,

On Sun, Jun 2, 2019 at 6:32 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> > From: Guo Ren <ren_guo@c-sky.com>
> >
> > Add C-SKY defconfig for QEMU virt machine.
> >
> > Tested with https://gitlab.com/c-sky/buildroot/pipelines
> >
> > Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>
> Thanks, it looks a lot better, but there are still a few things to
> improve.
>
> First, the readme.txt file should be in the same patch.
Ok.

>
> Second, you should update the DEVELOPES file so that it covers those
> additional files (board/qemu/csky and configs/qemu_csky*).
Ok, it'll be another patch.

>
> See below for other comments.
>
>
> > diff --git a/board/qemu/csky/linux-ck610.config.fragment b/board/qemu/csky/linux-ck610.config.fragment
> > new file mode 100644
> > index 0000000..d80d0ee
> > --- /dev/null
> > +++ b/board/qemu/csky/linux-ck610.config.fragment
> > @@ -0,0 +1,5 @@
> > +CONFIG_COMPILE_TEST=y
> > +CONFIG_CPU_CK610=y
> > +CONFIG_CPU_PM_WAIT=y
> > +CONFIG_CSKY_APB_INTC=y
> > +CONFIG_GX6605S_TIMER=y
>
> Thanks, this is _much_ better!
>
> > diff --git a/configs/qemu_csky610_virt_defconfig b/configs/qemu_csky610_virt_defconfig
> > new file mode 100644
> > index 0000000..9a82d57
> > --- /dev/null
> > +++ b/configs/qemu_csky610_virt_defconfig
> > @@ -0,0 +1,20 @@
> > +# Architecture
> > +BR2_csky=y
> > +BR2_ck610=y
>
> You need to add an option like this:
>
> # Linux headers same as kernel, a 5.0 series
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
Ok.

>
> > +# System
> > +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
>
> Please don't enable mdev.
Ok, I'll use BR2_ROOTFS_DEVICE_CREATION_STATIC=y.

>
> > +BR2_TARGET_ROOTFS_INITRAMFS=y
> > +
> > +# Toolchain
> > +BR2_OPTIMIZE_2=y
> > +BR2_SHARED_STATIC_LIBS=y
> > +BR2_TOOLCHAIN_BUILDROOT_CXX=y
> > +BR2_PACKAGE_HOST_GDB=y
>
> Please remove those options.
OK.

>
> > +# Kernel
> > +BR2_LINUX_KERNEL=y
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
> > +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> > +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck610.config.fragment"
>
> And of course, it should be changed similarly in all other defconfigs.
OK.

Best Regards
 Guo Ren
