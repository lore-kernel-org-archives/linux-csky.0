Return-Path: <SRS0=/JCA=UY=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1695C4646B
	for <linux-csky@archiver.kernel.org>; Tue, 25 Jun 2019 01:35:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A7FF020652
	for <linux-csky@archiver.kernel.org>; Tue, 25 Jun 2019 01:35:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729137AbfFYBfq (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Mon, 24 Jun 2019 21:35:46 -0400
Received: from mx2.suse.de ([195.135.220.15]:59426 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729984AbfFYBfq (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Mon, 24 Jun 2019 21:35:46 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 4B740AB5F;
        Tue, 25 Jun 2019 01:35:45 +0000 (UTC)
Subject: Re: [5.2-rc6] GX6605S testing
To:     Guo Ren <guoren@kernel.org>
Cc:     linux-csky@vger.kernel.org
References: <5cc9c383-3e1c-344f-cff1-8e95797b4b2c@suse.de>
 <CAJF2gTTQRO1T5OLH_3w9wWUV0W4r-7s6SgVGnYrqciEfUvTfng@mail.gmail.com>
From:   =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Openpgp: preference=signencrypt
Organization: SUSE Linux GmbH
Message-ID: <07cb6aac-5c25-c142-8301-150f9aa64628@suse.de>
Date:   Tue, 25 Jun 2019 03:35:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAJF2gTTQRO1T5OLH_3w9wWUV0W4r-7s6SgVGnYrqciEfUvTfng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

Hi Guo,

Am 25.06.19 um 02:53 schrieb Guo Ren:
> On Tue, Jun 25, 2019 at 5:19 AM Andreas Färber <afaerber@suse.de> wrote:
>> [   67.205338] This architecture does not have kernel memory protection.
>> [   67.386763] Run /sbin/init as init process
>> [   77.719086] Kernel panic - not syncing: Attempted to kill init!
>> exitcode=0x0000000b
>> [   77.927527] ---[ end Kernel panic - not syncing: Attempted to kill
>> init! exitcode=0x0000000b ]---
[...]
>> So, does this mean that syscalls or something changed incompatibly
>> between downstream 4.9 and upstream 5.2 that I would need a new rootfs?
[...]
> The syscall.h is changed for newest arch version. You need new rootfs
> and I recommend you try this buildroot patch:
> https://lore.kernel.org/linux-csky/1561376581-19568-1-git-send-email-guoren@kernel.org/T/#u
> 
> Use that rootfs.ext2 in output image.

Given that Buildroot is not building for me (host-gmp - both upstream
and downstream), is such a mainline-compatible rootfs tarball somewhere
on GitLab? The closest job I found there was 4.14 gx6622, nothing 5.x
and gx6605s.

Thanks,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG Nürnberg)
