Return-Path: <SRS0=Nb8v=UV=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA1AAC43613
	for <linux-csky@archiver.kernel.org>; Sat, 22 Jun 2019 15:49:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A0EC220675
	for <linux-csky@archiver.kernel.org>; Sat, 22 Jun 2019 15:49:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbfFVPtw (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Sat, 22 Jun 2019 11:49:52 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:58049 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbfFVPtw (ORCPT
        <rfc822;linux-csky@vger.kernel.org>); Sat, 22 Jun 2019 11:49:52 -0400
X-Originating-IP: 164.5.194.47
Received: from windsurf (esm-164-5-194-47.netplaza.fi [164.5.194.47])
        (Authenticated sender: thomas.petazzoni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 7B0FEFF806;
        Sat, 22 Jun 2019 15:49:44 +0000 (UTC)
Date:   Sat, 22 Jun 2019 17:49:42 +0200
From:   Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To:     guoren@kernel.org
Cc:     Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be, Guo Ren <ren_guo@c-sky.com>, zhiwei_liu@c-sky.com,
        linux-csky@vger.kernel.org, buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH 1/2] package/qemu: Move patches to version
 directory
Message-ID: <20190622174942.472127c5@windsurf>
In-Reply-To: <1559564887-4088-1-git-send-email-guoren@kernel.org>
References: <1559564887-4088-1-git-send-email-guoren@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

On Mon,  3 Jun 2019 20:28:06 +0800
guoren@kernel.org wrote:

> From: Guo Ren <ren_guo@c-sky.com>
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...ix-usage-of-mcontext-structure-on-ARM-uCl.patch | 35 -------------
>  .../qemu/0002-configure-improve-usbfs-check.patch  | 60 ----------------------
>  ...ix-usage-of-mcontext-structure-on-ARM-uCl.patch | 35 +++++++++++++
>  .../3.1.0/0002-configure-improve-usbfs-check.patch | 60 ++++++++++++++++++++++
>  4 files changed, 95 insertions(+), 95 deletions(-)
>  delete mode 100644 package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
>  delete mode 100644 package/qemu/0002-configure-improve-usbfs-check.patch
>  create mode 100644 package/qemu/3.1.0/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
>  create mode 100644 package/qemu/3.1.0/0002-configure-improve-usbfs-check.patch

Thanks, both patches applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
