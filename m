Return-Path: <SRS0=mu5m=UX=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30929C43613
	for <linux-csky@archiver.kernel.org>; Mon, 24 Jun 2019 03:52:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 037EA208C3
	for <linux-csky@archiver.kernel.org>; Mon, 24 Jun 2019 03:52:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbfFXDwU (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Sun, 23 Jun 2019 23:52:20 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:40239 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbfFXDwU (ORCPT
        <rfc822;linux-csky@vger.kernel.org>); Sun, 23 Jun 2019 23:52:20 -0400
X-Originating-IP: 212.213.198.112
Received: from windsurf (unknown [212.213.198.112])
        (Authenticated sender: thomas.petazzoni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 4156C20002;
        Mon, 24 Jun 2019 03:52:11 +0000 (UTC)
Date:   Mon, 24 Jun 2019 05:52:07 +0200
From:   Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To:     guoren@kernel.org
Cc:     linux-csky@vger.kernel.org, buildroot@buildroot.org,
        Guo Ren <ren_guo@c-sky.com>
Subject: Re: [PATCH] configs/csky_gx6605s: bump kernel to 5.0 and use
 buildroot toolchain
Message-ID: <20190624055207.59b0c7bf@windsurf>
In-Reply-To: <1561347693-16089-1-git-send-email-guoren@kernel.org>
References: <1561347693-16089-1-git-send-email-guoren@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

Hello,

On Mon, 24 Jun 2019 11:41:33 +0800
guoren@kernel.org wrote:

> From: Guo Ren <ren_guo@c-sky.com>
> 
> The most thing is to use the toolchain compiled by buildroot itself. And
> we also bump kernel to 5.0 with kernel.org.
> 
> For all 610s including qemu we use 0x10000000 PHYS_OFFSET for unified
> maintain.

I'm not sure what you mean by "unified maintain". How does it matter,
considering that the Buildroot defconfig is anyway for one single
platform ?

> There is no gx6605s.dts for the config, so we need wget it from
> csky gitlab CI storage.

Meh, this is not great. Is the Gitlab CI URL really permanent? Jobs
artifacts are usually removed after a configurable time, isn't it the
case as well for this artifact ?

Also, why isn't this .dts not submitted to the upstream Linux kernel ?

Overall, I think I would prefer to see a patch to the Linux kernel in
board/csky/ rather than downloading a random .dtb. Or just have
the .dts file directly in board/csky/.

For the record, DT is not about "config", it's about describing the
hardware. You might give the DT kernel maintainers a heart attack if
you call the DT "configuration"! :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
