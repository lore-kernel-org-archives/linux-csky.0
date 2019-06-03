Return-Path: <SRS0=8JPw=UC=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3925DC04AB6
	for <linux-csky@archiver.kernel.org>; Mon,  3 Jun 2019 07:32:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1D6C3272AC
	for <linux-csky@archiver.kernel.org>; Mon,  3 Jun 2019 07:32:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbfFCHcU (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Mon, 3 Jun 2019 03:32:20 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:47035 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfFCHcT (ORCPT
        <rfc822;linux-csky@vger.kernel.org>); Mon, 3 Jun 2019 03:32:19 -0400
X-Originating-IP: 90.88.144.139
Received: from windsurf (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr [90.88.144.139])
        (Authenticated sender: thomas.petazzoni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 4A39EFF818;
        Mon,  3 Jun 2019 07:32:13 +0000 (UTC)
Date:   Mon, 3 Jun 2019 09:32:12 +0200
From:   Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To:     Guo Ren <guoren@kernel.org>
Cc:     Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be, Guo Ren <ren_guo@c-sky.com>, zhiwei_liu@c-sky.com,
        linux-csky@vger.kernel.org, buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH V5 2/2] board/qemu/csky/readme.txt: Add
 C-SKY Qemu run Documentation
Message-ID: <20190603093212.74f84255@windsurf>
In-Reply-To: <CAJF2gTSGEKBE6=EL7PyKvxJ0mF+2wFjXvBxyCZOfFPJ8jVW7hg@mail.gmail.com>
References: <1559468510-22085-1-git-send-email-guoren@kernel.org>
        <1559468510-22085-2-git-send-email-guoren@kernel.org>
        <20190602134620.77a41eb3@windsurf>
        <CAJF2gTSGEKBE6=EL7PyKvxJ0mF+2wFjXvBxyCZOfFPJ8jVW7hg@mail.gmail.com>
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

On Mon, 3 Jun 2019 14:47:09 +0800
Guo Ren <guoren@kernel.org> wrote:

> Qemu upstream is under way and I want to add host-qemu for C-SKY after that.
> 
> See here:
> https://gitlab.com/c-sky/buildroot/tree/master/package/csky-qemu
> I don't use package/qemu to build csky qemu and I add another
> csky-qemu package for simple.

Well, why not simply adding C-SKY support to the existing
package/qemu ? It should be fairly easy, just change the
version/source/site, and that's it ? Since you're in the process of
upstreaming, I assume you're using a recent version of Qemu, so all the
logic in qemu.mk for upstream Qemu should apply to the C-SKY variant as
well.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
