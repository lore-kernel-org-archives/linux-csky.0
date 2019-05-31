Return-Path: <SRS0=wqK1=T7=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E21C04AB6
	for <linux-csky@archiver.kernel.org>; Fri, 31 May 2019 21:04:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 65FF326F18
	for <linux-csky@archiver.kernel.org>; Fri, 31 May 2019 21:04:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727607AbfEaVEF (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Fri, 31 May 2019 17:04:05 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:48501 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbfEaVEF (ORCPT
        <rfc822;linux-csky@vger.kernel.org>); Fri, 31 May 2019 17:04:05 -0400
Received: from windsurf (132.230.147.77.rev.sfr.net [77.147.230.132])
        (Authenticated sender: thomas.petazzoni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id AF7BF240009;
        Fri, 31 May 2019 21:03:56 +0000 (UTC)
Date:   Fri, 31 May 2019 23:03:55 +0200
From:   Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To:     guoren@kernel.org
Cc:     Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be, Guo Ren <ren_guo@c-sky.com>,
        linux-csky@vger.kernel.org, buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH V4 00/11] Update arch/csky for buildroot
Message-ID: <20190531230355.7d8112bc@windsurf>
In-Reply-To: <1559284748-32011-1-git-send-email-guoren@kernel.org>
References: <1559284748-32011-1-git-send-email-guoren@kernel.org>
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

On Fri, 31 May 2019 14:38:57 +0800
guoren@kernel.org wrote:

> Guo Ren (11):
>   arch/csky: Add arch.mk.csky for -mcpu=xxx
>   arch/csky: Change DSP to VDSP for -mcpu
>   arch/csky: Add ck860 supported
>   arch/csky: Add FLOAT_ABI compiler options
>   arch/csky: Add ABI variable for toolchain build
>   package/binutils: Add C-SKY support
>   package/gcc: Add C-SKY support
>   package/gdb: Add C-SKY support
>   package/glibc: Add C-SKY support
>   configs/qemu_cskyXXX_virt: new defconfig
>   arch/csky: Enable csky toolchain build

I have applied the entire series to the next branch, except patch
"configs/qemu_cskyXXX_virt: new defconfig".

I made some changes in several patches, especially in the commit logs.
I'll reply to some of the individual patches when I did more than
changing the commit log.

I had to add one patch to package/linux-headers, so that only Linux
kernel versions that have C-SKY support can be selected. This was
missing in your series.

Thanks a lot for this contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
