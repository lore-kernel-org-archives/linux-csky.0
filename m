Return-Path: <SRS0=jGRj=UL=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D190C31E46
	for <linux-csky@archiver.kernel.org>; Wed, 12 Jun 2019 05:50:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DDCA1208CB
	for <linux-csky@archiver.kernel.org>; Wed, 12 Jun 2019 05:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1560318611;
	bh=FemZa9ACQRQr6yBf+2ZE+Dyb90YmOqs49usGvRlyTj4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=Ao0/TFYFO3tOqA9/aBWwSDSprerm/e5GlKyOB6srf+tfL0aDefpSoxNQ7W5Cmegs+
	 NRIZB0ggYD1+oHWEVyQWuBhuM7sA4ochIqaBd9PzWp2Y9ZwyL3rr/1JDYs0VTRmByz
	 67B8MaFoP561Teq/KmP8gQ7Cq6olBmxqnHspiMqU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730665AbfFLFuL (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Wed, 12 Jun 2019 01:50:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:41522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725601AbfFLFuK (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Wed, 12 Jun 2019 01:50:10 -0400
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C8851208CB
        for <linux-csky@vger.kernel.org>; Wed, 12 Jun 2019 05:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560318610;
        bh=FemZa9ACQRQr6yBf+2ZE+Dyb90YmOqs49usGvRlyTj4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Wc+xUQeDMVf1hnkfzkemqK6Hid5Udpvu9LacN501MZdnTAmP/DZsxB7stXlTsZWy4
         93NU/tqH6j85TRB+Ot9izRwzjnRDuMtIZSI55RExhx4R/9H/sa7r88MzKCmmULWVXF
         BDcpqnaCY5wLiqIhviaG8YTJHecpIhvOYgAgpx6k=
Received: by mail-wm1-f42.google.com with SMTP id c66so5155248wmf.0
        for <linux-csky@vger.kernel.org>; Tue, 11 Jun 2019 22:50:09 -0700 (PDT)
X-Gm-Message-State: APjAAAUY7HmjOVLnHLBOxE+u3FTXg4rrY/cCrtnmTMbQNrijuZpEuGX2
        gSyg+msUuCRlufZvoCsCRslTKihUrqiOTo7Hxgg=
X-Google-Smtp-Source: APXvYqxVAvrMVodZnF06fKI/tEPm+KKdk917KbgOPUoR6oEi9ew91NhFDLupOlFZTnJLRn0sj32IrfW5AANcnJrLccQ=
X-Received: by 2002:a7b:cd84:: with SMTP id y4mr20669075wmj.79.1560318608394;
 Tue, 11 Jun 2019 22:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <1559564887-4088-1-git-send-email-guoren@kernel.org> <1559564887-4088-2-git-send-email-guoren@kernel.org>
In-Reply-To: <1559564887-4088-2-git-send-email-guoren@kernel.org>
From:   Guo Ren <guoren@kernel.org>
Date:   Wed, 12 Jun 2019 13:49:57 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT=uB4qvB6Dej_BAnZSwiezTwHyJwywhiP4NJsFgXuDog@mail.gmail.com>
Message-ID: <CAJF2gTT=uB4qvB6Dej_BAnZSwiezTwHyJwywhiP4NJsFgXuDog@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 2/2] package/qemu: Add C-SKY qemu support
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

Ping ...

As you've asked in:
https://lore.kernel.org/linux-csky/20190603093212.74f84255@windsurf/T/#u

Is the patch all right for buildroot?

Best Regards
 Guo Ren

On Mon, Jun 3, 2019 at 8:28 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <ren_guo@c-sky.com>
>
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/qemu/Config.in.host |  1 +
>  package/qemu/qemu.hash      |  1 +
>  package/qemu/qemu.mk        | 12 ++++++++++++
>  3 files changed, 14 insertions(+)
>
> diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
> index 8a0df38..effe58b 100644
> --- a/package/qemu/Config.in.host
> +++ b/package/qemu/Config.in.host
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
>         default y if BR2_arm
>         default y if BR2_armeb
>         default y if BR2_aarch64
> +       default y if BR2_csky
>         default y if BR2_i386
>         default y if BR2_m68k
>         default y if BR2_microblazeel
> diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
> index 338d2ae..9ee9833 100644
> --- a/package/qemu/qemu.hash
> +++ b/package/qemu/qemu.hash
> @@ -2,3 +2,4 @@
>  sha256 6a0508df079a0a33c2487ca936a56c12122f105b8a96a44374704bef6c69abfc  qemu-3.1.0.tar.xz
>  sha256 6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
>  sha256 48ffe9fc7f1d5462dbd19340bc4dd1d8a9e37c61ed535813e614cbe4a5f0d4df  COPYING.LIB
> +sha256 61091767ffd16002e77f005155d096208094e69dee35e6d5ddcaa6c8a13b5e26  qemu-b517e1dc3125a57555d67a8deed9eac7b42288e2.tar.gz
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 19bcafa..012406e 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -4,9 +4,14 @@
>  #
>  ################################################################################
>
> +ifeq ($(BR2_csky),y)
> +QEMU_VERSION = b517e1dc3125a57555d67a8deed9eac7b42288e2
> +QEMU_SITE = $(call github,c-sky,qemu,$(QEMU_VERSION))
> +else
>  QEMU_VERSION = 3.1.0
>  QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
>  QEMU_SITE = http://download.qemu.org
> +endif
>  QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
>  QEMU_LICENSE_FILES = COPYING COPYING.LIB
>  # NOTE: there is no top-level license file for non-(L)GPL licenses;
> @@ -209,6 +214,13 @@ endif
>  ifeq ($(HOST_QEMU_ARCH),sh4aeb)
>  HOST_QEMU_ARCH = sh4eb
>  endif
> +ifeq ($(HOST_QEMU_ARCH),csky)
> +ifeq ($(BR2_ck610),y)
> +HOST_QEMU_ARCH = cskyv1
> +else
> +HOST_QEMU_ARCH = cskyv2
> +endif
> +endif
>  HOST_QEMU_SYS_ARCH ?= $(HOST_QEMU_ARCH)
>
>  ifeq ($(BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE),y)
> --
> 2.7.4
>
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
