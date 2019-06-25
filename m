Return-Path: <SRS0=/JCA=UY=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D7AC4646C
	for <linux-csky@archiver.kernel.org>; Tue, 25 Jun 2019 00:53:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6B32E20644
	for <linux-csky@archiver.kernel.org>; Tue, 25 Jun 2019 00:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561424022;
	bh=xRnB3UY/OjzxgT9NU2cOQS3sLRA3hjqUUAHmX+t+610=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=GYkWmrwPcCXuPEINiH2gfteSQ+ViHl7B8ck2IBKLPhoW0Zu+5Dylcs5MfdW00Xvdq
	 0xYLRVNy+9NpvpuALHr6C8sBU5e248b8slzW+uiIAHLZ+HrRpVRMUYYeC4rQk+Ri74
	 cX8r74Hij1awKW8lUj8cCk2Uheu3c5rDjHi09BrY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729730AbfFYAxm (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Mon, 24 Jun 2019 20:53:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:57036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729727AbfFYAxl (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Mon, 24 Jun 2019 20:53:41 -0400
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D7E9820644
        for <linux-csky@vger.kernel.org>; Tue, 25 Jun 2019 00:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561424021;
        bh=xRnB3UY/OjzxgT9NU2cOQS3sLRA3hjqUUAHmX+t+610=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=2ADrV9W5hp4sksJMmPrYHp1a0mQchN61Ms8/VmyEXbaBXLblio0IqfBYrf6mrFJ1+
         8BJO42dRvwrACF+IBVn1ZvdAT1P9v0IomomQ1rAi1t78pqHEapmCc0Ydc/KTyYtp4j
         GXo1fxfzUBE7i76eHnuYgi/vMVt0VayCVfv5stBI=
Received: by mail-wr1-f53.google.com with SMTP id r16so15768516wrl.11
        for <linux-csky@vger.kernel.org>; Mon, 24 Jun 2019 17:53:40 -0700 (PDT)
X-Gm-Message-State: APjAAAV16l9ZEJhvEgc4bZHAiB5m5+OlpRBdqXE39Pz1V6LuJ3OPs7NW
        yeG3NIuI7wuX8QO9VcO53L7KJ0x2C9oEo9T/5bE=
X-Google-Smtp-Source: APXvYqzBESGouz0ZnxoPWKS0DVbWT+XmrbLdVj5YDh2pLtB870CCP4zJIIE7RLS7PwgiOI/872EG8XYzdhpUcXTpy54=
X-Received: by 2002:adf:f28a:: with SMTP id k10mr31135971wro.343.1561424019468;
 Mon, 24 Jun 2019 17:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <5cc9c383-3e1c-344f-cff1-8e95797b4b2c@suse.de>
In-Reply-To: <5cc9c383-3e1c-344f-cff1-8e95797b4b2c@suse.de>
From:   Guo Ren <guoren@kernel.org>
Date:   Tue, 25 Jun 2019 08:53:27 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTQRO1T5OLH_3w9wWUV0W4r-7s6SgVGnYrqciEfUvTfng@mail.gmail.com>
Message-ID: <CAJF2gTTQRO1T5OLH_3w9wWUV0W4r-7s6SgVGnYrqciEfUvTfng@mail.gmail.com>
Subject: Re: [5.2-rc6] GX6605S testing
To:     =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc:     linux-csky@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

Hi Andreas,

On Tue, Jun 25, 2019 at 5:19 AM Andreas F=C3=A4rber <afaerber@suse.de> wrot=
e:
>
> Hello,
>
> Newbie alert. I've tailored a Kconfig for the GX6605S dev board based on
> defconfig, which required to drop "if COMPILE_TEST" for GX6605S_TIMER
> since nothing was selecting it.
>
> I've forward-ported the board's binary dtb to match the upstream
> bindings (still need to do some cleanups before I can post it here).
> Mainly compatibles and one clock-frequency -> clocks.
It's 27Mhz:
+ dummy_apb: apb-clock {
+ compatible =3D "fixed-clock";
+ clock-frequency =3D <27000000>;


>
> Here's how far I've come with the uImage:
>
> ...
> [   60.977460] sd 0:0:0:0: [sda] Attached SCSI removable disk
> [   61.357214] random: crng init done
> [   64.539130] EXT4-fs (sda2): mounted filesystem with ordered data
> mode. Opts: (null)
> [   64.763086] VFS: Mounted root (ext4 filesystem) on device 8:2.
> [   66.946712] devtmpfs: mounted
> [   67.058804] Freeing unused kernel memory: 100k freed
> [   67.205338] This architecture does not have kernel memory protection.
> [   67.386763] Run /sbin/init as init process
> [   77.719086] Kernel panic - not syncing: Attempted to kill init!
> exitcode=3D0x0000000b
> [   77.927527] ---[ end Kernel panic - not syncing: Attempted to kill
> init! exitcode=3D0x0000000b ]---
>
> Note how the time is quite fast with the downstream frequency of 1 MHz.
> Sadly there's no public manual for the GX6605S SoC, only for CK610 CPU.
> 24 MHz matches the wall clock much better, indicating about 3 seconds.
>
> I've also tried using /bin/sh with the equivalent result.
> The rootfs is the one from usb.img from the C-Sky GitHub pages (modified
> to spawn getty for ttyS0), which booted okay with its binary 4.9 kernel.
>
> So, does this mean that syscalls or something changed incompatibly
> between downstream 4.9 and upstream 5.2 that I would need a new rootfs?
> Or does this mean that I'm still missing some Kconfig setting or that
> some fix/feature for CK610 hasn't made it into the mainline kernel yet?
> Did anyone here succeed with mainline on GX6605S yet?
The syscall.h is changed for newest arch version. You need new rootfs
and I recommend you try this buildroot patch:
https://lore.kernel.org/linux-csky/1561376581-19568-1-git-send-email-guoren=
@kernel.org/T/#u

Use that rootfs.ext2 in output image.

--=20
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
