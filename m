Return-Path: <SRS0=wqK1=T7=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA3C3C04AB6
	for <linux-csky@archiver.kernel.org>; Fri, 31 May 2019 21:04:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 987B826F18
	for <linux-csky@archiver.kernel.org>; Fri, 31 May 2019 21:04:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727207AbfEaVEd (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Fri, 31 May 2019 17:04:33 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:42963 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbfEaVEd (ORCPT
        <rfc822;linux-csky@vger.kernel.org>); Fri, 31 May 2019 17:04:33 -0400
X-Originating-IP: 77.147.230.132
Received: from windsurf (132.230.147.77.rev.sfr.net [77.147.230.132])
        (Authenticated sender: thomas.petazzoni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 82D151BF20A;
        Fri, 31 May 2019 21:04:25 +0000 (UTC)
Date:   Fri, 31 May 2019 23:04:24 +0200
From:   Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To:     guoren@kernel.org
Cc:     Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be, Guo Ren <ren_guo@c-sky.com>,
        linux-csky@vger.kernel.org, buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH V4 02/11] arch/csky: Change DSP to VDSP for
 -mcpu
Message-ID: <20190531230424.4f3a6e20@windsurf>
In-Reply-To: <1559284748-32011-3-git-send-email-guoren@kernel.org>
References: <1559284748-32011-1-git-send-email-guoren@kernel.org>
        <1559284748-32011-3-git-send-email-guoren@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

On Fri, 31 May 2019 14:38:59 +0800
guoren@kernel.org wrote:

> From: Guo Ren <ren_guo@c-sky.com>
> 
> DSP extention is no longer used for C-SKY gcc and use VDSP instead of
> DSP.
> 
> VDSP is C-SKY enhanced extension instruction set for SIMD, AI and DSP
> operation. It could be supported by abiv2 (ck807, ck810, ck860).
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I've split this patch into two: one removing the DSP option, one adding
the VDSP option. Also, I've added the appropriate Config.in.legacy
option to replace BR2_CSKY_DSP.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
