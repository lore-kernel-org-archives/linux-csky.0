Return-Path: <SRS0=K7zh=T5=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB99BC04AB3
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 08:38:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9112121019
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 08:38:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbfE2Iic (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Wed, 29 May 2019 04:38:32 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:33331 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbfE2Iic (ORCPT
        <rfc822;linux-csky@vger.kernel.org>); Wed, 29 May 2019 04:38:32 -0400
X-Originating-IP: 90.88.147.134
Received: from windsurf.home (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr [90.88.147.134])
        (Authenticated sender: thomas.petazzoni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 88A0FE0011;
        Wed, 29 May 2019 08:38:25 +0000 (UTC)
Date:   Wed, 29 May 2019 10:38:24 +0200
From:   Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To:     Guo Ren <guoren@kernel.org>
Cc:     Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be, linux-csky@vger.kernel.org,
        buildroot@buildroot.org, Guo Ren <ren_guo@c-sky.com>
Subject: Re: [PATCH V3 01/10] arch/csky: Use VDSP instead of DSP
Message-ID: <20190529103824.58560e4e@windsurf.home>
In-Reply-To: <CAJF2gTT5N6ST9Ph-L+bX2WtNx4ENu0wQ2uQ63D=3C-Zqoit+3w@mail.gmail.com>
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
        <1559114328-23357-2-git-send-email-guoren@kernel.org>
        <20190529092128.36183371@windsurf.home>
        <CAJF2gTQC8UigBniC_RKUVFddX=PnN7O9GyBZXcxyXuPBg9WNHw@mail.gmail.com>
        <20190529095629.2b28cbb7@windsurf.home>
        <CAJF2gTT5N6ST9Ph-L+bX2WtNx4ENu0wQ2uQ63D=3C-Zqoit+3w@mail.gmail.com>
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

On Wed, 29 May 2019 16:12:25 +0800
Guo Ren <guoren@kernel.org> wrote:

> > Not just two patches: also a better commit log for the DSP -> VDSP
> > change.  
> 
> I want these two patches:
> 
> 1. Remove DSP, because it's no use in current buildroot.
> 2. Add VDSP support

OK, but then please split in yet another patch the fact of using
arch.mk.csky to build the GCC_TARGET_CPU variable.

> Here is my commit log for Introduce VDSP feature:
> 
> VDSP is C-SKY enhanced extension instruction set for SIMD, AI and DSP
> operation. It could be support by abiv2 (ck807, ck810, ck860).
> 
> Is that OK?

Yes. But please add a proper commit log in the patch removing the DSP
option.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
