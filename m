Return-Path: <SRS0=K7zh=T5=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99EB6C28CC0
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 09:23:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7037720B7C
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 09:23:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725936AbfE2JX0 (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Wed, 29 May 2019 05:23:26 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:38531 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbfE2JX0 (ORCPT
        <rfc822;linux-csky@vger.kernel.org>); Wed, 29 May 2019 05:23:26 -0400
X-Originating-IP: 90.88.147.134
Received: from windsurf.home (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr [90.88.147.134])
        (Authenticated sender: thomas.petazzoni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id F13D61BF20C;
        Wed, 29 May 2019 09:23:20 +0000 (UTC)
Date:   Wed, 29 May 2019 11:23:17 +0200
From:   Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To:     Guo Ren <guoren@kernel.org>
Cc:     Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be, linux-csky@vger.kernel.org,
        buildroot@buildroot.org, Guo Ren <ren_guo@c-sky.com>
Subject: Re: [PATCH V3 01/10] arch/csky: Use VDSP instead of DSP
Message-ID: <20190529112317.08fe1013@windsurf.home>
In-Reply-To: <CAJF2gTQfu_FAck2YM5b=d8QaYQhBHoCSeG4tvL1i8a1=7vgofA@mail.gmail.com>
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
        <1559114328-23357-2-git-send-email-guoren@kernel.org>
        <20190529092128.36183371@windsurf.home>
        <CAJF2gTQC8UigBniC_RKUVFddX=PnN7O9GyBZXcxyXuPBg9WNHw@mail.gmail.com>
        <20190529095629.2b28cbb7@windsurf.home>
        <CAJF2gTT5N6ST9Ph-L+bX2WtNx4ENu0wQ2uQ63D=3C-Zqoit+3w@mail.gmail.com>
        <20190529103824.58560e4e@windsurf.home>
        <CAJF2gTQfu_FAck2YM5b=d8QaYQhBHoCSeG4tvL1i8a1=7vgofA@mail.gmail.com>
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

On Wed, 29 May 2019 17:02:29 +0800
Guo Ren <guoren@kernel.org> wrote:

> DSP is no use in current buildroot and gcc default enable the DSP
> feature for C-SKY.
> So DSP is part of our standard ISA, we needn't put it in -mcpu=xxx.

"DSP is no use in current Buildroot" is not correct. The option exists,
and it changes the BR2_GCC_TARGET_CPU value. So it *is* used: it adds
"e" to BR2_GCC_TARGET_CPU. So this explanation is not really
good/sufficient.

I am willing to help you formulate this properly, but since I still
don't understand why you are dropping the DSP option, I can't really
help by proposing a better wording.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
