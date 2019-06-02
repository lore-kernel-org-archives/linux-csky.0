Return-Path: <SRS0=cdmM=UB=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C2EC282DC
	for <linux-csky@archiver.kernel.org>; Sun,  2 Jun 2019 10:32:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 421222510B
	for <linux-csky@archiver.kernel.org>; Sun,  2 Jun 2019 10:32:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbfFBKcb (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Sun, 2 Jun 2019 06:32:31 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:49533 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbfFBKcb (ORCPT
        <rfc822;linux-csky@vger.kernel.org>); Sun, 2 Jun 2019 06:32:31 -0400
X-Originating-IP: 77.147.230.132
Received: from windsurf (132.230.147.77.rev.sfr.net [77.147.230.132])
        (Authenticated sender: thomas.petazzoni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 78D16C0002;
        Sun,  2 Jun 2019 10:32:19 +0000 (UTC)
Date:   Sun, 2 Jun 2019 12:32:18 +0200
From:   Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To:     guoren@kernel.org
Cc:     Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be, Guo Ren <ren_guo@c-sky.com>, zhiwei_liu@c-sky.com,
        linux-csky@vger.kernel.org, buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH V5 1/2] configs/qemu_cskyXXX_virt: new
 defconfig
Message-ID: <20190602123218.244963b8@windsurf>
In-Reply-To: <1559468510-22085-1-git-send-email-guoren@kernel.org>
References: <1559468510-22085-1-git-send-email-guoren@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

Hello Guo,

On Sun,  2 Jun 2019 17:41:49 +0800
guoren@kernel.org wrote:

> From: Guo Ren <ren_guo@c-sky.com>
> 
> Add C-SKY defconfig for QEMU virt machine.
> 
> Tested with https://gitlab.com/c-sky/buildroot/pipelines
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thanks, it looks a lot better, but there are still a few things to
improve.

First, the readme.txt file should be in the same patch.

Second, you should update the DEVELOPES file so that it covers those
additional files (board/qemu/csky and configs/qemu_csky*).

See below for other comments.


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

Thanks, this is _much_ better!

> diff --git a/configs/qemu_csky610_virt_defconfig b/configs/qemu_csky610_virt_defconfig
> new file mode 100644
> index 0000000..9a82d57
> --- /dev/null
> +++ b/configs/qemu_csky610_virt_defconfig
> @@ -0,0 +1,20 @@
> +# Architecture
> +BR2_csky=y
> +BR2_ck610=y

You need to add an option like this:

# Linux headers same as kernel, a 5.0 series
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y

> +# System
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y

Please don't enable mdev.

> +BR2_TARGET_ROOTFS_INITRAMFS=y
> +
> +# Toolchain
> +BR2_OPTIMIZE_2=y
> +BR2_SHARED_STATIC_LIBS=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
> +BR2_PACKAGE_HOST_GDB=y

Please remove those options.

> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck610.config.fragment"

And of course, it should be changed similarly in all other defconfigs.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
