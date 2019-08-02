Return-Path: <SRS0=8I0L=V6=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E87C32750
	for <linux-csky@archiver.kernel.org>; Fri,  2 Aug 2019 21:46:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A8EBD2087C
	for <linux-csky@archiver.kernel.org>; Fri,  2 Aug 2019 21:46:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731911AbfHBVqW (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Fri, 2 Aug 2019 17:46:22 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:41067 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726052AbfHBVqW (ORCPT
        <rfc822;linux-csky@vger.kernel.org>); Fri, 2 Aug 2019 17:46:22 -0400
X-Originating-IP: 90.76.216.45
Received: from windsurf.home (lfbn-1-2159-45.w90-76.abo.wanadoo.fr [90.76.216.45])
        (Authenticated sender: thomas.petazzoni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id D0CB4240002;
        Fri,  2 Aug 2019 21:46:19 +0000 (UTC)
Date:   Fri, 2 Aug 2019 23:46:19 +0200
From:   Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To:     guoren@kernel.org
Cc:     Guo Ren <ren_guo@c-sky.com>, linux-csky@vger.kernel.org,
        buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH V2] configs/csky_gx6605s: bump kernel to 5.0
 and use buildroot toolchain
Message-ID: <20190802234619.0342bfe5@windsurf.home>
In-Reply-To: <1561376581-19568-1-git-send-email-guoren@kernel.org>
References: <1561376581-19568-1-git-send-email-guoren@kernel.org>
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

On Mon, 24 Jun 2019 19:43:01 +0800
guoren@kernel.org wrote:

> +BR2_ROOTFS_DEVICE_CREATION_STATIC=y

I dropped this option to keep the default behavior of using devtmpfs,
and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
