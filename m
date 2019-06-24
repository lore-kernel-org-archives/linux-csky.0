Return-Path: <SRS0=mu5m=UX=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A591C43613
	for <linux-csky@archiver.kernel.org>; Mon, 24 Jun 2019 18:35:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0538020645
	for <linux-csky@archiver.kernel.org>; Mon, 24 Jun 2019 18:35:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727520AbfFXSfY (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Mon, 24 Jun 2019 14:35:24 -0400
Received: from mx2.suse.de ([195.135.220.15]:48956 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726378AbfFXSfY (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Mon, 24 Jun 2019 14:35:24 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id B5AD8AE67
        for <linux-csky@vger.kernel.org>; Mon, 24 Jun 2019 18:35:23 +0000 (UTC)
Subject: Re: [5.2-rc6] GX6605S testing
From:   =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
To:     linux-csky@vger.kernel.org
References: <5cc9c383-3e1c-344f-cff1-8e95797b4b2c@suse.de>
Openpgp: preference=signencrypt
Organization: SUSE Linux GmbH
Message-ID: <f9f91c30-e02d-ad57-f9f0-193e15f63d41@suse.de>
Date:   Mon, 24 Jun 2019 20:35:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5cc9c383-3e1c-344f-cff1-8e95797b4b2c@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

Am 24.06.19 um 20:12 schrieb Andreas Färber:
> Hello,
> 
> Newbie alert. I've tailored a Kconfig for the GX6605S dev board based on
> defconfig, which required to drop "if COMPILE_TEST" for GX6605S_TIMER
> since nothing was selecting it.

Another observation: earlycon didn't seem to work. After I sorted the
missing timer out I found this:

[    0.000000] earlycon: earlycon_map: Couldn't map 0x00403000
[    0.000000] earlycon: ns16550a0 at MMIO 0x00403000 (options '115200n8')

Having it working would be extremely helpful for diagnosing early-boot
issues such as a missing timer driver. ;)

Cheers,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG Nürnberg)
