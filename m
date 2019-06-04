Return-Path: <SRS0=R725=UD=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80854C282CE
	for <linux-csky@archiver.kernel.org>; Tue,  4 Jun 2019 08:34:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5512B248B8
	for <linux-csky@archiver.kernel.org>; Tue,  4 Jun 2019 08:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559637290;
	bh=zqpC2R/fbqoscySMQOqUyAG4KCgwdPW6ptDOmxycprM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=QEjleGAhjtIV3xFZ5I/zSK8USLYYIpTEcAlJXd2Q/4fTsIXMZIUdXbbsZSIuBI2pu
	 a7HmqTTxm43TbKF5ET4N9yzc5I64nrKrYQw0a4d2gORAGLl5EUR3RP9PIHCbslCknj
	 MZM/XUssnt6DY7L0wfbIq6UNuXJvfRm5Rw6s5aQA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbfFDIeu (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Tue, 4 Jun 2019 04:34:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:45078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726735AbfFDIeu (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Tue, 4 Jun 2019 04:34:50 -0400
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0147C248B8
        for <linux-csky@vger.kernel.org>; Tue,  4 Jun 2019 08:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559637289;
        bh=zqpC2R/fbqoscySMQOqUyAG4KCgwdPW6ptDOmxycprM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bUvMWY8eONby9OahhcWDg1SH/AsZHebewc0ILT94quZ0g6Rp0ByaND4HoC/DfOun1
         pdKtOv0ETnfmQZuBCkjxQiOS2+uKywcxOiNZmwp+vO8ML8OTKdl53yLjiW3pVHytoW
         yy+aucLV8x2QL2jPhdTyfXGz/DzKeaHjMK6Ou6Jg=
Received: by mail-wr1-f45.google.com with SMTP id n4so9585043wrw.13
        for <linux-csky@vger.kernel.org>; Tue, 04 Jun 2019 01:34:48 -0700 (PDT)
X-Gm-Message-State: APjAAAVCnuhUbPH0oElRQ9DqlimKy8UeUP4vbh5eEp9yZNcX18wY1vhE
        zw1I0w9H6wGJ1INnzfp85i/Ng6S2UhP5A3Vy+uo=
X-Google-Smtp-Source: APXvYqwzxY1qtN5G3u+2Qhew1T9BR/C6sq8heUvo5WWZrLRf6xE1t07ce3QN8U1DWre1g9faDa+pFEnc4kagnY105cQ=
X-Received: by 2002:adf:eb45:: with SMTP id u5mr2276357wrn.38.1559637287576;
 Tue, 04 Jun 2019 01:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <1559564887-4088-1-git-send-email-guoren@kernel.org> <20190604095605.7c9e7ef1@thl530.multi.box>
In-Reply-To: <20190604095605.7c9e7ef1@thl530.multi.box>
From:   Guo Ren <guoren@kernel.org>
Date:   Tue, 4 Jun 2019 16:34:36 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTf4WoMvYwgeEKu5QXnn5U9UoFDC6MFUvhhYwrnZqHSYQ@mail.gmail.com>
Message-ID: <CAJF2gTTf4WoMvYwgeEKu5QXnn5U9UoFDC6MFUvhhYwrnZqHSYQ@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/qemu: Move patches to version directory
To:     Thomas Huth <huth@tuxfamily.org>
Cc:     buildroot@buildroot.org,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be, Guo Ren <ren_guo@c-sky.com>, zhiwei_liu@c-sky.com,
        linux-csky@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

Hi Thomas,

On Tue, Jun 4, 2019 at 3:56 PM Thomas Huth <huth@tuxfamily.org> wrote:
>
> Am Mon,  3 Jun 2019 20:28:06 +0800
> schrieb guoren@kernel.org:
>
> > From: Guo Ren <ren_guo@c-sky.com>
> >
> > Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > ---
> >  ...ix-usage-of-mcontext-structure-on-ARM-uCl.patch | 35 -------------
> >  .../qemu/0002-configure-improve-usbfs-check.patch  | 60
> > ---------------------- ...ix-usage-of-mcontext-structure-on-ARM-uCl.patch
> > | 35 +++++++++++++ .../3.1.0/0002-configure-improve-usbfs-check.patch
> > | 60 ++++++++++++++++++++++ 4 files changed, 95 insertions(+), 95
> > deletions(-) delete mode 100644
> > package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
> > delete mode 100644
> > package/qemu/0002-configure-improve-usbfs-check.patch create mode
> > 100644
> > package/qemu/3.1.0/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
> > create mode 100644
> > package/qemu/3.1.0/0002-configure-improve-usbfs-check.patch
>
> At least the usbfs patch seems to be included in QEMU v4.0, so maybe it
> would be better to bump the version to 4.0 first?
I've no idea about qemu 4.0 and these patch can't apply to
csky-qemu-3.0. So I need to move them
to their own version's directory.

Best Regards
 Guo Ren
