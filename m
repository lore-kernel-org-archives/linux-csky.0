Return-Path: <SRS0=K7zh=T5=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE313C28CC0
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 11:58:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC1BD20644
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 11:58:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbfE2L6o (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Wed, 29 May 2019 07:58:44 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:36761 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbfE2L6n (ORCPT
        <rfc822;linux-csky@vger.kernel.org>); Wed, 29 May 2019 07:58:43 -0400
X-Originating-IP: 90.88.147.134
Received: from windsurf.home (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr [90.88.147.134])
        (Authenticated sender: thomas.petazzoni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 079731BF204;
        Wed, 29 May 2019 11:58:36 +0000 (UTC)
Date:   Wed, 29 May 2019 13:58:36 +0200
From:   Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To:     Guo Ren <guoren@kernel.org>
Cc:     Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be, linux-csky@vger.kernel.org,
        buildroot@buildroot.org, Guo Ren <ren_guo@c-sky.com>
Subject: Re: [PATCH V3 01/10] arch/csky: Use VDSP instead of DSP
Message-ID: <20190529135836.1a907b0e@windsurf.home>
In-Reply-To: <CAJF2gTRf_kzuqM_takvwNHU3sBfTBjqOBDv4xbqwnS9E9f9uTQ@mail.gmail.com>
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
        <1559114328-23357-2-git-send-email-guoren@kernel.org>
        <20190529092128.36183371@windsurf.home>
        <CAJF2gTQC8UigBniC_RKUVFddX=PnN7O9GyBZXcxyXuPBg9WNHw@mail.gmail.com>
        <20190529095629.2b28cbb7@windsurf.home>
        <CAJF2gTT5N6ST9Ph-L+bX2WtNx4ENu0wQ2uQ63D=3C-Zqoit+3w@mail.gmail.com>
        <20190529103824.58560e4e@windsurf.home>
        <CAJF2gTQfu_FAck2YM5b=d8QaYQhBHoCSeG4tvL1i8a1=7vgofA@mail.gmail.com>
        <20190529112317.08fe1013@windsurf.home>
        <CAJF2gTRf_kzuqM_takvwNHU3sBfTBjqOBDv4xbqwnS9E9f9uTQ@mail.gmail.com>
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

On Wed, 29 May 2019 17:45:19 +0800
Guo Ren <guoren@kernel.org> wrote:

> > I am willing to help you formulate this properly, but since I still
> > don't understand why you are dropping the DSP option, I can't really
> > help by proposing a better wording.  
> DSP extention is no longer used for C-SKY and there is no defconfig
> use "e" extension in buildroot.

Not having a defconfig doesn't mean something is not supported. There
are tons of features in Buildroot that are not enabled by defconfig,
and still we do support them.

> Change commit log, like this:
> 
> Subject: Change DSP to VDSP for -mcpu
> 
> DSP extention is no longer used for C-SKY gcc and there is no
> defconfig use "e" extension
> in buildroot.

Again, the defconfig aspect is irrelevant. Only the fact the extension
is no longer used for C-SKY is relevant.

> VDSP is C-SKY enhanced extension instruction set for SIMD, AI and DSP
> operation. It could be supported by abiv2 (ck807, ck810, ck860).
> 
> Is that OK?

Yes, with the change above.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
