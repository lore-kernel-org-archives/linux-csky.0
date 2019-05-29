Return-Path: <SRS0=K7zh=T5=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37159C04AB3
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 08:39:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 171D321670
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 08:39:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbfE2Ijg (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Wed, 29 May 2019 04:39:36 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:39829 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbfE2Ijg (ORCPT
        <rfc822;linux-csky@vger.kernel.org>); Wed, 29 May 2019 04:39:36 -0400
X-Originating-IP: 90.88.147.134
Received: from windsurf.home (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr [90.88.147.134])
        (Authenticated sender: thomas.petazzoni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 896A640006;
        Wed, 29 May 2019 08:39:31 +0000 (UTC)
Date:   Wed, 29 May 2019 10:39:30 +0200
From:   Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To:     Guo Ren <guoren@kernel.org>
Cc:     Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be, linux-csky@vger.kernel.org,
        buildroot@buildroot.org, Guo Ren <ren_guo@c-sky.com>
Subject: Re: [PATCH V3 03/10] arch/csky: Add FLOAT_ABI compiler options
Message-ID: <20190529103930.35f88870@windsurf.home>
In-Reply-To: <CAJF2gTRb4W=ZUz4-WxPwzdaQMMo1suwPsxU47QeGdjfBvgs3og@mail.gmail.com>
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
        <1559114328-23357-4-git-send-email-guoren@kernel.org>
        <20190529092307.6c78996b@windsurf.home>
        <CAJF2gTSgReEOOJAvXY=MraqTLV4DwkKOqsbQ-4rBdNiaibxQfQ@mail.gmail.com>
        <20190529095739.18d4d3c8@windsurf.home>
        <CAJF2gTRb4W=ZUz4-WxPwzdaQMMo1suwPsxU47QeGdjfBvgs3og@mail.gmail.com>
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

On Wed, 29 May 2019 16:30:43 +0800
Guo Ren <guoren@kernel.org> wrote:

> OK, change the commit log with:
> 
> C-SKY CPU is seperated into two ABIs:
>  - abiv1: mcore based ELF_NUM:39 and do not support FPU & VDSP. (CPU: 610)
>  - abiv2: C-SKY own ISA with ELF_NUM:252 and support FPU & VDSP. (CPU:
> 807, 810, 860)
> 
> So we don't care BR2_GCC_TARGET_FLOAT_ABI for abiv1, because it based
> on CSKY_FPU and it'll
> never be selected by ck610.

This last part is not correct: BR2_GCC_TARGET_FLOAT_ABI *will* have a
value for abiv1. Except the value will always be "soft" because there's
no FPU support in ck610, which is the only core using abiv1. So saying
"We don't care about BR2_GCC_TARGET_FLOAT_ABI for abiv1" is not correct.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
