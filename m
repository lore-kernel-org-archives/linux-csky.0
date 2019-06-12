Return-Path: <SRS0=jGRj=UL=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08326C31E46
	for <linux-csky@archiver.kernel.org>; Wed, 12 Jun 2019 05:43:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C69E020874
	for <linux-csky@archiver.kernel.org>; Wed, 12 Jun 2019 05:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1560318232;
	bh=gPKYSf2vdkda4Um8TvvH+oFND+4dq/TFWVg4ZxOuNCE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=YC1BOB7UI0aLUDBUmo16CvgOrxK8FdaWgoRuvU8GhfRQtNWlp7zzUBtc08NwiEe5Z
	 XtwI6HM5CdkPqxiNAnOJTJlyfDCfIPWEXBGyrqRq/+wf2Vx+gp5NfZpaBvq42JDbAR
	 xg/YRKM087u+yqDkuEMSv7sTWPgkJdvlUkiK6X28=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730624AbfFLFnw (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Wed, 12 Jun 2019 01:43:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:38568 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726593AbfFLFnw (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Wed, 12 Jun 2019 01:43:52 -0400
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9894620B1F
        for <linux-csky@vger.kernel.org>; Wed, 12 Jun 2019 05:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560318230;
        bh=gPKYSf2vdkda4Um8TvvH+oFND+4dq/TFWVg4ZxOuNCE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=UtxUNjrp3k3MXmeyhVJ0nuet2Vae+ByOIctnJpkkfgx3mioJEk1DKenympRSptWdN
         3tPZwm+W5O1uqYrksZkDuiAi+93hU7YnGg+Gw/yrO1NF3x6hvp7+e9ZSx6ziyrJDVn
         ytHLRdzt6knSvWzkNgOX9wn8tq2FYSxzcY5DV6PI=
Received: by mail-wm1-f53.google.com with SMTP id w9so3424761wmd.1
        for <linux-csky@vger.kernel.org>; Tue, 11 Jun 2019 22:43:50 -0700 (PDT)
X-Gm-Message-State: APjAAAVogbKYdDfcUY250Ut+fXuenKqmnlxbyXaI+x86UGto+THZ46xt
        6miPG+Xy5luM8wlkR3AN6H4MdWbdTsIxo77jpkw=
X-Google-Smtp-Source: APXvYqwUAuh7sBYrLE2xDYNXtWWwSjjuVclYSzNwM4fNCUcd3Wpe+SF03lnKJhJOdT0IkQEBSPgzBqnhC8liXT7PIsg=
X-Received: by 2002:a7b:cd84:: with SMTP id y4mr20646787wmj.79.1560318229108;
 Tue, 11 Jun 2019 22:43:49 -0700 (PDT)
MIME-Version: 1.0
References: <1559551865-8662-1-git-send-email-guoren@kernel.org>
In-Reply-To: <1559551865-8662-1-git-send-email-guoren@kernel.org>
From:   Guo Ren <guoren@kernel.org>
Date:   Wed, 12 Jun 2019 13:43:37 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS2MfTcP5t=8piwrOQe41G9jdt_wfD0crE06b6U0hJr+g@mail.gmail.com>
Message-ID: <CAJF2gTS2MfTcP5t=8piwrOQe41G9jdt_wfD0crE06b6U0hJr+g@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH V6] configs/qemu_cskyXXX_virt: new defconfig
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be
Cc:     Guo Ren <ren_guo@c-sky.com>, zhiwei_liu@c-sky.com,
        linux-csky@vger.kernel.org, buildroot@buildroot.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

Hello Thomas,

Ping ... Is the patch all right?

Best Regards
 Guo Ren

On Mon, Jun 3, 2019 at 4:51 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <ren_guo@c-sky.com>
>
> Add C-SKY defconfig for QEMU virt machine.
>
> Tested with https://gitlab.com/c-sky/buildroot/pipelines
>
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  .gitlab-ci.yml                              |  4 ++++
>  DEVELOPERS                                  |  2 ++
>  board/qemu/csky/linux-ck610.config.fragment |  5 +++++
>  board/qemu/csky/linux-ck807.config.fragment |  5 +++++
>  board/qemu/csky/linux-ck810.config.fragment |  5 +++++
>  board/qemu/csky/linux-ck860.config.fragment |  9 +++++++++
>  board/qemu/csky/readme.txt                  | 12 ++++++++++++
>  configs/qemu_csky610_virt_defconfig         | 14 ++++++++++++++
>  configs/qemu_csky807_virt_defconfig         | 14 ++++++++++++++
>  configs/qemu_csky810_virt_defconfig         | 14 ++++++++++++++
>  configs/qemu_csky860_virt_defconfig         | 14 ++++++++++++++
>  11 files changed, 98 insertions(+)
>  create mode 100644 board/qemu/csky/linux-ck610.config.fragment
>  create mode 100644 board/qemu/csky/linux-ck807.config.fragment
>  create mode 100644 board/qemu/csky/linux-ck810.config.fragment
>  create mode 100644 board/qemu/csky/linux-ck860.config.fragment
>  create mode 100644 board/qemu/csky/readme.txt
>  create mode 100644 configs/qemu_csky610_virt_defconfig
>  create mode 100644 configs/qemu_csky807_virt_defconfig
>  create mode 100644 configs/qemu_csky810_virt_defconfig
>  create mode 100644 configs/qemu_csky860_virt_defconfig
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 374dbfe..4fa3473 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -248,6 +248,10 @@ qemu_aarch64_virt_defconfig: { extends: .defconfig }
>  qemu_arm_versatile_defconfig: { extends: .defconfig }
>  qemu_arm_versatile_nommu_defconfig: { extends: .defconfig }
>  qemu_arm_vexpress_defconfig: { extends: .defconfig }
> +qemu_csky610_virt_defconfig: { extends: .defconfig }
> +qemu_csky807_virt_defconfig: { extends: .defconfig }
> +qemu_csky810_virt_defconfig: { extends: .defconfig }
> +qemu_csky860_virt_defconfig: { extends: .defconfig }
>  qemu_m68k_mcf5208_defconfig: { extends: .defconfig }
>  qemu_m68k_q800_defconfig: { extends: .defconfig }
>  qemu_microblazebe_mmu_defconfig: { extends: .defconfig }
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 5bfc456..edb372e 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -976,7 +976,9 @@ F:  package/reaver/
>  N:     Guo Ren <ren_guo@c-sky.com>
>  F:     arch/Config.in.csky
>  F:     board/csky/
> +F:     board/qemu/csky
>  F:     configs/csky_*
> +F:     configs/qemu_csky*
>
>  N:     Gustavo Pimentel <gustavo.pimentel@synopsys.com>
>  F:     configs/arm_juno_defconfig
> diff --git a/board/qemu/csky/linux-ck610.config.fragment b/board/qemu/csky/linux-ck610.config.fragment
> new file mode 100644
> index 0000000..d80d0ee
> --- /dev/null
> +++ b/board/qemu/csky/linux-ck610.config.fragment
> @@ -0,0 +1,5 @@
> +CONFIG_COMPILE_TEST=y
> +CONFIG_CPU_CK610=y
> +CONFIG_CPU_PM_WAIT=y
> +CONFIG_CSKY_APB_INTC=y
> +CONFIG_GX6605S_TIMER=y
> diff --git a/board/qemu/csky/linux-ck807.config.fragment b/board/qemu/csky/linux-ck807.config.fragment
> new file mode 100644
> index 0000000..b6974f0
> --- /dev/null
> +++ b/board/qemu/csky/linux-ck807.config.fragment
> @@ -0,0 +1,5 @@
> +CONFIG_COMPILE_TEST=y
> +CONFIG_CPU_CK807=y
> +# CONFIG_CPU_HAS_FPU is not set
> +CONFIG_CPU_PM_WAIT=y
> +CONFIG_CSKY_APB_INTC=y
> diff --git a/board/qemu/csky/linux-ck810.config.fragment b/board/qemu/csky/linux-ck810.config.fragment
> new file mode 100644
> index 0000000..50fa1f4
> --- /dev/null
> +++ b/board/qemu/csky/linux-ck810.config.fragment
> @@ -0,0 +1,5 @@
> +CONFIG_COMPILE_TEST=y
> +CONFIG_CPU_CK810=y
> +# CONFIG_CPU_HAS_FPU is not set
> +CONFIG_CPU_PM_WAIT=y
> +CONFIG_CSKY_APB_INTC=y
> diff --git a/board/qemu/csky/linux-ck860.config.fragment b/board/qemu/csky/linux-ck860.config.fragment
> new file mode 100644
> index 0000000..e8f6af1
> --- /dev/null
> +++ b/board/qemu/csky/linux-ck860.config.fragment
> @@ -0,0 +1,9 @@
> +CONFIG_COMPILE_TEST=y
> +CONFIG_CPU_CK860=y
> +# CONFIG_CPU_HAS_FPU is not set
> +CONFIG_CPU_PM_WAIT=y
> +CONFIG_SMP=y
> +CONFIG_HOTPLUG_CPU=y
> +CONFIG_CSKY_APB_INTC=y
> +CONFIG_CSKY_MPINTC=y
> +CONFIG_CSKY_MP_TIMER=y
> diff --git a/board/qemu/csky/readme.txt b/board/qemu/csky/readme.txt
> new file mode 100644
> index 0000000..89d68aa
> --- /dev/null
> +++ b/board/qemu/csky/readme.txt
> @@ -0,0 +1,12 @@
> +Run with qemu:
> +
> +For ck860 smp:
> + qemu-system-cskyv2 -M virt -cpu ck860 -smp 2 -nographic -kernel vmlinux
> +
> +For ck810/ck807:
> + qemu-system-cskyv2 -M virt -nographic -kernel vmlinux
> +
> +For ck610:
> + qemu-system-cskyv1 -M virt -nographic -kernel vmlinux
> +
> +The login prompt will appear in the terminal that started Qemu. Username is root and no password.
> diff --git a/configs/qemu_csky610_virt_defconfig b/configs/qemu_csky610_virt_defconfig
> new file mode 100644
> index 0000000..b75a5b8
> --- /dev/null
> +++ b/configs/qemu_csky610_virt_defconfig
> @@ -0,0 +1,14 @@
> +# Architecture
> +BR2_csky=y
> +BR2_ck610=y
> +
> +# System
> +BR2_ROOTFS_DEVICE_CREATION_STATIC=y
> +BR2_TARGET_ROOTFS_INITRAMFS=y
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck610.config.fragment"
> diff --git a/configs/qemu_csky807_virt_defconfig b/configs/qemu_csky807_virt_defconfig
> new file mode 100644
> index 0000000..035bf66
> --- /dev/null
> +++ b/configs/qemu_csky807_virt_defconfig
> @@ -0,0 +1,14 @@
> +# Architecture
> +BR2_csky=y
> +BR2_ck807=y
> +
> +# System
> +BR2_ROOTFS_DEVICE_CREATION_STATIC=y
> +BR2_TARGET_ROOTFS_INITRAMFS=y
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck807.config.fragment"
> diff --git a/configs/qemu_csky810_virt_defconfig b/configs/qemu_csky810_virt_defconfig
> new file mode 100644
> index 0000000..9ce2aa9
> --- /dev/null
> +++ b/configs/qemu_csky810_virt_defconfig
> @@ -0,0 +1,14 @@
> +# Architecture
> +BR2_csky=y
> +BR2_ck810=y
> +
> +# System
> +BR2_ROOTFS_DEVICE_CREATION_STATIC=y
> +BR2_TARGET_ROOTFS_INITRAMFS=y
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck810.config.fragment"
> diff --git a/configs/qemu_csky860_virt_defconfig b/configs/qemu_csky860_virt_defconfig
> new file mode 100644
> index 0000000..d86c1e6
> --- /dev/null
> +++ b/configs/qemu_csky860_virt_defconfig
> @@ -0,0 +1,14 @@
> +# Architecture
> +BR2_csky=y
> +BR2_ck860=y
> +
> +# System
> +BR2_ROOTFS_DEVICE_CREATION_STATIC=y
> +BR2_TARGET_ROOTFS_INITRAMFS=y
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck860.config.fragment"
> --
> 2.7.4
>
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
