Return-Path: <SRS0=z0i5=VH=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B140C73C6D
	for <linux-csky@archiver.kernel.org>; Wed, 10 Jul 2019 06:36:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 20CF620693
	for <linux-csky@archiver.kernel.org>; Wed, 10 Jul 2019 06:36:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbfGJGgY (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Wed, 10 Jul 2019 02:36:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41926 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725844AbfGJGgX (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Wed, 10 Jul 2019 02:36:23 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id B7FC030001D9;
        Wed, 10 Jul 2019 06:36:23 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (ovpn-116-84.ams2.redhat.com [10.36.116.84])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id A9D075B0BA;
        Wed, 10 Jul 2019 06:36:22 +0000 (UTC)
From:   Florian Weimer <fweimer@redhat.com>
To:     Mao Han <han_mao@c-sky.com>
Cc:     libc-alpha@sourceware.org, linux-csky@vger.kernel.org
Subject: Re: [PATCH 1/1] locale/tst-locale-locpath: Fix arguments passing
References: <7901d4ee7ba91c963a9a7c9365267552edad32f3.1562739903.git.han_mao@c-sky.com>
Date:   Wed, 10 Jul 2019 08:36:20 +0200
In-Reply-To: <7901d4ee7ba91c963a9a7c9365267552edad32f3.1562739903.git.han_mao@c-sky.com>
        (Mao Han's message of "Wed, 10 Jul 2019 14:26:34 +0800")
Message-ID: <87wogqbdln.fsf@oldenburg2.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Wed, 10 Jul 2019 06:36:23 +0000 (UTC)
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

* Mao Han:

> The arguments passed by Makefile are missing match with the arguments
> taken by locale/tst-locale-locpath.sh. Without this patch
> cross-test-ssh.sh will be called twice in a single command while
> doing the make check test wish ssh test wrapper.
>
> 	* locale/Makefile: Fix tst-locale-locpath arguments passing.

Still looks good.  Thanks.

Florian
