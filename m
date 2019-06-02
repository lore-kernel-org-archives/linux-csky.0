Return-Path: <SRS0=cdmM=UB=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCADDC282DC
	for <linux-csky@archiver.kernel.org>; Sun,  2 Jun 2019 11:46:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A93A6278FF
	for <linux-csky@archiver.kernel.org>; Sun,  2 Jun 2019 11:46:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfFBLqa (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Sun, 2 Jun 2019 07:46:30 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:48299 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbfFBLqa (ORCPT
        <rfc822;linux-csky@vger.kernel.org>); Sun, 2 Jun 2019 07:46:30 -0400
X-Originating-IP: 77.147.230.132
Received: from windsurf (132.230.147.77.rev.sfr.net [77.147.230.132])
        (Authenticated sender: thomas.petazzoni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 291CB40006;
        Sun,  2 Jun 2019 11:46:22 +0000 (UTC)
Date:   Sun, 2 Jun 2019 13:46:20 +0200
From:   Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To:     guoren@kernel.org
Cc:     Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be, Guo Ren <ren_guo@c-sky.com>, zhiwei_liu@c-sky.com,
        linux-csky@vger.kernel.org, buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH V5 2/2] board/qemu/csky/readme.txt: Add
 C-SKY Qemu run Documentation
Message-ID: <20190602134620.77a41eb3@windsurf>
In-Reply-To: <1559468510-22085-2-git-send-email-guoren@kernel.org>
References: <1559468510-22085-1-git-send-email-guoren@kernel.org>
        <1559468510-22085-2-git-send-email-guoren@kernel.org>
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

On Sun,  2 Jun 2019 17:41:50 +0800
guoren@kernel.org wrote:

> + wget https://gitlab.com/c-sky/buildroot/-/jobs/197192514/artifacts/raw/output/images/csky_toolchain_csky_860_fpga_4.9_glibc_br_defconfig_56683a5a67ecf1dd0e67b05b9541de74530d0047.tar.xz;
> + mkdir tools;
> + tar -Jxf csky_toolchain_csky_860_fpga_4.9_glibc_br_defconfig_56683a5a67ecf1dd0e67b05b9541de74530d0047.tar.xz -C tools;
> + LD_LIBRARY_PATH=./tools/lib ./tools/csky-qemu/bin/qemu-system-cskyv2 -M virt -cpu ck860 -smp 2 -kernel output/images/vmlinux -nographic;
> +
> +For ck810/ck807:
> + LD_LIBRARY_PATH=./tools/lib ./tools/csky-qemu/bin/qemu-system-cskyv2 -M virt -kernel output/images/vmlinux -nographic;
> +
> +For ck610:
> + LD_LIBRARY_PATH=./tools/lib ./tools/csky-qemu/bin/qemu-system-cskyv1 -M virt -kernel output/images/vmlinux -nographic;

Instead of this, I think it makes sense to add support for C-SKY in the
host-qemu package. It should be fairly easy to do, and then you can
enable building host-qemu as part of the c-sky qemu defconfigs.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
