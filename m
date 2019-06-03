Return-Path: <SRS0=8JPw=UC=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BEE8C04AB6
	for <linux-csky@archiver.kernel.org>; Mon,  3 Jun 2019 07:30:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5F4BC27CCD
	for <linux-csky@archiver.kernel.org>; Mon,  3 Jun 2019 07:30:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbfFCHat (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Mon, 3 Jun 2019 03:30:49 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:53569 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726136AbfFCHas (ORCPT
        <rfc822;linux-csky@vger.kernel.org>); Mon, 3 Jun 2019 03:30:48 -0400
X-Originating-IP: 90.88.144.139
Received: from windsurf (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr [90.88.144.139])
        (Authenticated sender: thomas.petazzoni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 6AF346000E;
        Mon,  3 Jun 2019 07:30:41 +0000 (UTC)
Date:   Mon, 3 Jun 2019 09:30:40 +0200
From:   Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To:     Guo Ren <guoren@kernel.org>
Cc:     Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be, Guo Ren <ren_guo@c-sky.com>, zhiwei_liu@c-sky.com,
        linux-csky@vger.kernel.org, buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH V5 1/2] configs/qemu_cskyXXX_virt: new
 defconfig
Message-ID: <20190603093040.38fab710@windsurf>
In-Reply-To: <CAJF2gTRd20OK5fcKaKmj3fYKekX3+PVb1_gjpr3y2X+w7-QAww@mail.gmail.com>
References: <1559468510-22085-1-git-send-email-guoren@kernel.org>
        <20190602123218.244963b8@windsurf>
        <CAJF2gTRd20OK5fcKaKmj3fYKekX3+PVb1_gjpr3y2X+w7-QAww@mail.gmail.com>
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

On Mon, 3 Jun 2019 15:00:12 +0800
Guo Ren <guoren@kernel.org> wrote:

> > Second, you should update the DEVELOPES file so that it covers those
> > additional files (board/qemu/csky and configs/qemu_csky*).  
> Ok, it'll be another patch.

No, it should be in the same patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
