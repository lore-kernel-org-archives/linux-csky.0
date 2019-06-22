Return-Path: <SRS0=Nb8v=UV=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AAAFC43613
	for <linux-csky@archiver.kernel.org>; Sat, 22 Jun 2019 08:18:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 762612089C
	for <linux-csky@archiver.kernel.org>; Sat, 22 Jun 2019 08:18:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbfFVISi (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Sat, 22 Jun 2019 04:18:38 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:40043 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbfFVISi (ORCPT
        <rfc822;linux-csky@vger.kernel.org>); Sat, 22 Jun 2019 04:18:38 -0400
X-Originating-IP: 37.168.134.180
Received: from windsurf (unknown [37.168.134.180])
        (Authenticated sender: thomas.petazzoni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id EB8061C0008;
        Sat, 22 Jun 2019 08:18:23 +0000 (UTC)
Date:   Sat, 22 Jun 2019 10:18:21 +0200
From:   Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To:     Thomas Huth <huth@tuxfamily.org>
Cc:     guoren@kernel.org, buildroot@buildroot.org,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        linux-csky@vger.kernel.org, Guo Ren <ren_guo@c-sky.com>,
        zhiwei_liu@c-sky.com,
        Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/qemu: Move patches to version
 directory
Message-ID: <20190622101821.4ef025b0@windsurf>
In-Reply-To: <20190604095605.7c9e7ef1@thl530.multi.box>
References: <1559564887-4088-1-git-send-email-guoren@kernel.org>
        <20190604095605.7c9e7ef1@thl530.multi.box>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

On Tue, 4 Jun 2019 09:56:05 +0200
Thomas Huth <huth@tuxfamily.org> wrote:

> At least the usbfs patch seems to be included in QEMU v4.0, so maybe it
> would be better to bump the version to 4.0 first?

Bumping to 4.0 would certainly be nice, but it really is a different
thing than what Guo is doing. Since it's not really necessary to add
support for C-SKY's Qemu version, I don't want to make bumping to 4.0 a
requirement for Guo's work.

> Thomas, did you ever send the first patch to upstream QEMU, too? Looks
> like a valid patch to me, so I think it should be accepted there,
> too...?

To be honest, I don't remember if I ever sent it upstream :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
