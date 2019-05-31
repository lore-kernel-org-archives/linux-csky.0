Return-Path: <SRS0=wqK1=T7=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B21CC04AB6
	for <linux-csky@archiver.kernel.org>; Fri, 31 May 2019 21:05:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 385BC26F20
	for <linux-csky@archiver.kernel.org>; Fri, 31 May 2019 21:05:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727196AbfEaVF1 (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Fri, 31 May 2019 17:05:27 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:43231 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbfEaVF1 (ORCPT
        <rfc822;linux-csky@vger.kernel.org>); Fri, 31 May 2019 17:05:27 -0400
Received: from windsurf (132.230.147.77.rev.sfr.net [77.147.230.132])
        (Authenticated sender: thomas.petazzoni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id BBD67240008;
        Fri, 31 May 2019 21:05:24 +0000 (UTC)
Date:   Fri, 31 May 2019 23:05:23 +0200
From:   Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To:     guoren@kernel.org
Cc:     Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be, Guo Ren <ren_guo@c-sky.com>,
        linux-csky@vger.kernel.org, buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH V4 08/11] package/gdb: Add C-SKY support
Message-ID: <20190531230523.28b2f5e9@windsurf>
In-Reply-To: <1559284748-32011-9-git-send-email-guoren@kernel.org>
References: <1559284748-32011-1-git-send-email-guoren@kernel.org>
        <1559284748-32011-9-git-send-email-guoren@kernel.org>
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

On Fri, 31 May 2019 14:39:05 +0800
guoren@kernel.org wrote:

> From: Guo Ren <ren_guo@c-sky.com>
> 
> Add gdb build for C-SKY Architecture:
> 
>  - Support host-gdb
>  - Support gdbserver for target

You had forgotten a "depends on !BR2_csky" in package/gdb/Config.in to
prevent "full gdb" from being selected. Indeed, building the full gdb
on the target is not supported on C-SKY yet. I fixed that before
applying.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
