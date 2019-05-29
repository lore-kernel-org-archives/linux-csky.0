Return-Path: <SRS0=K7zh=T5=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E01C04AB3
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 07:57:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DA40221019
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 07:57:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbfE2H5o (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Wed, 29 May 2019 03:57:44 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:44229 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbfE2H5o (ORCPT
        <rfc822;linux-csky@vger.kernel.org>); Wed, 29 May 2019 03:57:44 -0400
X-Originating-IP: 90.88.147.134
Received: from windsurf.home (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr [90.88.147.134])
        (Authenticated sender: thomas.petazzoni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 216684000B;
        Wed, 29 May 2019 07:57:39 +0000 (UTC)
Date:   Wed, 29 May 2019 09:57:39 +0200
From:   Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To:     Guo Ren <guoren@kernel.org>
Cc:     Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be, linux-csky@vger.kernel.org,
        buildroot@buildroot.org, Guo Ren <ren_guo@c-sky.com>
Subject: Re: [PATCH V3 03/10] arch/csky: Add FLOAT_ABI compiler options
Message-ID: <20190529095739.18d4d3c8@windsurf.home>
In-Reply-To: <CAJF2gTSgReEOOJAvXY=MraqTLV4DwkKOqsbQ-4rBdNiaibxQfQ@mail.gmail.com>
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
        <1559114328-23357-4-git-send-email-guoren@kernel.org>
        <20190529092307.6c78996b@windsurf.home>
        <CAJF2gTSgReEOOJAvXY=MraqTLV4DwkKOqsbQ-4rBdNiaibxQfQ@mail.gmail.com>
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

On Wed, 29 May 2019 15:30:14 +0800
Guo Ren <guoren@kernel.org> wrote:

> > What is abiv1 vs. abiv2 ? Also, in your next commit, abiv1 is
> > apparently used for ck610, but here this BR2_GCC_TARGET_FLOAT_ABI is
> > defined for all cases, which seems to contradict your commit log.  
> abiv1 contain: ck610
> abiv2 contain: ck807 ck810 ck860
> 
> Abiv1 is almost the same as mcore and it's ELF_CODE is 39
> Abiv2 is C-SKY own ISA and it's ELF_CODE is 252
> 
> We don't support FPU in abiv1, because its opcode width is only
> 16-bits and we don't want to continue developing it.

Ah, and indeed BR2_CSKY_FPU cannot be selected for BR2_ck610.

Please explain all of this in the commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
