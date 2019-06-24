Return-Path: <SRS0=mu5m=UX=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1481FC43613
	for <linux-csky@archiver.kernel.org>; Mon, 24 Jun 2019 18:12:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D847620663
	for <linux-csky@archiver.kernel.org>; Mon, 24 Jun 2019 18:12:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731817AbfFXSM2 (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Mon, 24 Jun 2019 14:12:28 -0400
Received: from mx2.suse.de ([195.135.220.15]:44880 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727763AbfFXSM2 (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Mon, 24 Jun 2019 14:12:28 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 6DDF1ABD4
        for <linux-csky@vger.kernel.org>; Mon, 24 Jun 2019 18:12:27 +0000 (UTC)
From:   =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: [5.2-rc6] GX6605S testing
Openpgp: preference=signencrypt
Organization: SUSE Linux GmbH
To:     linux-csky@vger.kernel.org
Message-ID: <5cc9c383-3e1c-344f-cff1-8e95797b4b2c@suse.de>
Date:   Mon, 24 Jun 2019 20:12:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

Hello,

Newbie alert. I've tailored a Kconfig for the GX6605S dev board based on
defconfig, which required to drop "if COMPILE_TEST" for GX6605S_TIMER
since nothing was selecting it.

I've forward-ported the board's binary dtb to match the upstream
bindings (still need to do some cleanups before I can post it here).
Mainly compatibles and one clock-frequency -> clocks.

Here's how far I've come with the uImage:

...
[   60.977460] sd 0:0:0:0: [sda] Attached SCSI removable disk
[   61.357214] random: crng init done
[   64.539130] EXT4-fs (sda2): mounted filesystem with ordered data
mode. Opts: (null)
[   64.763086] VFS: Mounted root (ext4 filesystem) on device 8:2.
[   66.946712] devtmpfs: mounted
[   67.058804] Freeing unused kernel memory: 100k freed
[   67.205338] This architecture does not have kernel memory protection.
[   67.386763] Run /sbin/init as init process
[   77.719086] Kernel panic - not syncing: Attempted to kill init!
exitcode=0x0000000b
[   77.927527] ---[ end Kernel panic - not syncing: Attempted to kill
init! exitcode=0x0000000b ]---

Note how the time is quite fast with the downstream frequency of 1 MHz.
Sadly there's no public manual for the GX6605S SoC, only for CK610 CPU.
24 MHz matches the wall clock much better, indicating about 3 seconds.

I've also tried using /bin/sh with the equivalent result.
The rootfs is the one from usb.img from the C-Sky GitHub pages (modified
to spawn getty for ttyS0), which booted okay with its binary 4.9 kernel.

So, does this mean that syscalls or something changed incompatibly
between downstream 4.9 and upstream 5.2 that I would need a new rootfs?
Or does this mean that I'm still missing some Kconfig setting or that
some fix/feature for CK610 hasn't made it into the mainline kernel yet?
Did anyone here succeed with mainline on GX6605S yet?

Thanks for any directions,

Andreas


https://hackweek.suse.com/18/projects/investigate-c-sky-architecture

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG Nürnberg)
