Return-Path: <SRS0=wqK1=T7=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99624C04AB6
	for <linux-csky@archiver.kernel.org>; Fri, 31 May 2019 21:09:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7185C26F21
	for <linux-csky@archiver.kernel.org>; Fri, 31 May 2019 21:09:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727087AbfEaVJ1 (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Fri, 31 May 2019 17:09:27 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:46453 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727075AbfEaVJ0 (ORCPT
        <rfc822;linux-csky@vger.kernel.org>); Fri, 31 May 2019 17:09:26 -0400
X-Originating-IP: 77.147.230.132
Received: from windsurf (132.230.147.77.rev.sfr.net [77.147.230.132])
        (Authenticated sender: thomas.petazzoni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 2193840005;
        Fri, 31 May 2019 21:09:21 +0000 (UTC)
Date:   Fri, 31 May 2019 23:09:20 +0200
From:   Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To:     guoren@kernel.org
Cc:     Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be, Guo Ren <ren_guo@c-sky.com>,
        linux-csky@vger.kernel.org, buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH V4 10/11] configs/qemu_cskyXXX_virt: new
 defconfig
Message-ID: <20190531230920.302c0222@windsurf>
In-Reply-To: <1559284748-32011-11-git-send-email-guoren@kernel.org>
References: <1559284748-32011-1-git-send-email-guoren@kernel.org>
        <1559284748-32011-11-git-send-email-guoren@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

Hello Guo;

On Fri, 31 May 2019 14:39:07 +0800
guoren@kernel.org wrote:

> From: Guo Ren <ren_guo@c-sky.com>
> 
> Add C-SKY defconfig for QEMU virt machine.
> 
> Tested with https://gitlab.com/c-sky/buildroot/pipelines
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> ---
>  .gitlab-ci.yml                      |   4 +
>  board/qemu/csky/610_defconfig       | 526 +++++++++++++++++++++++++++++++++++
>  board/qemu/csky/807_defconfig       | 531 +++++++++++++++++++++++++++++++++++
>  board/qemu/csky/810_defconfig       | 531 +++++++++++++++++++++++++++++++++++
>  board/qemu/csky/860_defconfig       | 533 ++++++++++++++++++++++++++++++++++++

These kernel defconfig files are too long, they contain lots of options
that seem unnecessary. Could you trim them down by removing many
unnecessary options ?

Also, perhaps there could be a file with the set of common options, and
a fragment for each CPU core, to avoid all the duplication ?

In addition, they should have a name that makes it clear they are Linux
kernel configuration file.

>  configs/qemu_csky610_virt_defconfig |  29 ++
>  configs/qemu_csky807_virt_defconfig |  30 ++
>  configs/qemu_csky810_virt_defconfig |  30 ++
>  configs/qemu_csky860_virt_defconfig |  30 ++
>  9 files changed, 2244 insertions(+)

Please add the appropriate board/qemu/csky/readme.txt file to explain
how to run these in Qemu, and which Qemu version it was tested with.

Finally, make sure to add the appropriate entries to the DEVELOPERS
file.


> diff --git a/configs/qemu_csky860_virt_defconfig b/configs/qemu_csky860_virt_defconfig
> new file mode 100644
> index 0000000..118ad51
> --- /dev/null
> +++ b/configs/qemu_csky860_virt_defconfig
> @@ -0,0 +1,30 @@
> +# Architecture
> +BR2_csky=y
> +BR2_ck860=y
> +
> +# System
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y

We typically don't enable mdev in minimal defconfigs.

> +BR2_TARGET_ROOTFS_INITRAMFS=y
> +
> +# Toolchain
> +BR2_OPTIMIZE_2=y
> +BR2_SHARED_STATIC_LIBS=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
> +BR2_PACKAGE_HOST_GDB=y
> +BR2_TARGET_OPTIMIZATION="-mbacktrace"

Please drop these options, and keep the default.

> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/csky/860_defconfig"
> +
> +# Packages on board
> +BR2_PACKAGE_LINUX_TOOLS_PERF=y
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +BR2_PACKAGE_GDB=y
> +BR2_PACKAGE_BASH=y
> +BR2_PACKAGE_KMOD=y
> +BR2_PACKAGE_UTIL_LINUX=y
> +BR2_PACKAGE_UTIL_LINUX_LIBBLKID=y

Ditto, please drop these "Packages on board" options: our defconfig
should be minimal, i.e build just a bootloader (if needed), a Linux
kernel image and the default Buildroot package set (just Busybox).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
