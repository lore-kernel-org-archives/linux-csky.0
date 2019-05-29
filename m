Return-Path: <SRS0=K7zh=T5=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E02AC04AB3
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 07:56:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F141B21019
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 07:56:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725956AbfE2H4e (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Wed, 29 May 2019 03:56:34 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:36007 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbfE2H4e (ORCPT
        <rfc822;linux-csky@vger.kernel.org>); Wed, 29 May 2019 03:56:34 -0400
X-Originating-IP: 90.88.147.134
Received: from windsurf.home (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr [90.88.147.134])
        (Authenticated sender: thomas.petazzoni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 2E736C0002;
        Wed, 29 May 2019 07:56:30 +0000 (UTC)
Date:   Wed, 29 May 2019 09:56:29 +0200
From:   Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To:     Guo Ren <guoren@kernel.org>
Cc:     Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be, linux-csky@vger.kernel.org,
        buildroot@buildroot.org, Guo Ren <ren_guo@c-sky.com>
Subject: Re: [PATCH V3 01/10] arch/csky: Use VDSP instead of DSP
Message-ID: <20190529095629.2b28cbb7@windsurf.home>
In-Reply-To: <CAJF2gTQC8UigBniC_RKUVFddX=PnN7O9GyBZXcxyXuPBg9WNHw@mail.gmail.com>
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
        <1559114328-23357-2-git-send-email-guoren@kernel.org>
        <20190529092128.36183371@windsurf.home>
        <CAJF2gTQC8UigBniC_RKUVFddX=PnN7O9GyBZXcxyXuPBg9WNHw@mail.gmail.com>
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

On Wed, 29 May 2019 15:30:45 +0800
Guo Ren <guoren@kernel.org> wrote:

> OK, two pathes.

Not just two patches: also a better commit log for the DSP -> VDSP
change.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
