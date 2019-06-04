Return-Path: <SRS0=R725=UD=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BDDFC282CE
	for <linux-csky@archiver.kernel.org>; Tue,  4 Jun 2019 07:56:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3B85B24B47
	for <linux-csky@archiver.kernel.org>; Tue,  4 Jun 2019 07:56:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbfFDH4K (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Tue, 4 Jun 2019 03:56:10 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50995 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726786AbfFDH4J (ORCPT
        <rfc822;linux-csky@vger.kernel.org>); Tue, 4 Jun 2019 03:56:09 -0400
Received: by mail-wm1-f67.google.com with SMTP id f204so9749918wme.0
        for <linux-csky@vger.kernel.org>; Tue, 04 Jun 2019 00:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oZlRAOsVn9ePxA/Zig+oyFItJmNAsnSY1BiCxTvDEH0=;
        b=H6vrIEZ2z1ZvXJKbANU8iYBZODLwLRiXitZsstneC0F5DQtvtTRph7GxndgkInVDwx
         yOoso+Ac/nQoY/77I8nuHKGbPmnwAS4kFHE0OX+C0JTRjoMARCSSysLSWuXyJUQOs/c2
         GhPD/S3xc0OAuWPM1Gd87XI3G9+rkApCdI8OcL4ChFUSvUao/ZzHVegu5AchCeZmSqNf
         XAjT4aLlTWGl3xzY78M4IJA/Y1YIkWLlmP16v6dTYhc50zgsP29kslWTgBMADqmzdnOM
         xMumYdA3un6f56GBoysKgOgkRHjs8AHwqzzgkzHNt3yjWlr01mODLo9hi+fiEj8e/xn4
         9cqA==
X-Gm-Message-State: APjAAAVUDqcTKf0AhcK1o7rifGUIzsFJOWWudMczcH4niNdlsEeZlvBX
        28UeR8aVjsY2jparZhxf1YM=
X-Google-Smtp-Source: APXvYqwlFwwfWUbZetvBnJGgtN11T0hFYdLCr29N3HirCNhHxTbpAeJydzJbOz0AjA9ygu9uFDDlIg==
X-Received: by 2002:a1c:7d13:: with SMTP id y19mr16797788wmc.21.1559634967978;
        Tue, 04 Jun 2019 00:56:07 -0700 (PDT)
Received: from thl530.multi.box (pD9575227.dip0.t-ipconnect.de. [217.87.82.39])
        by smtp.gmail.com with ESMTPSA id o1sm30212449wre.76.2019.06.04.00.56.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 00:56:07 -0700 (PDT)
Date:   Tue, 4 Jun 2019 09:56:05 +0200
From:   Thomas Huth <huth@tuxfamily.org>
To:     guoren@kernel.org, buildroot@buildroot.org,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be, Guo Ren <ren_guo@c-sky.com>, zhiwei_liu@c-sky.com,
        linux-csky@vger.kernel.org
Subject: Re: [Buildroot] [PATCH 1/2] package/qemu: Move patches to version
 directory
Message-ID: <20190604095605.7c9e7ef1@thl530.multi.box>
In-Reply-To: <1559564887-4088-1-git-send-email-guoren@kernel.org>
References: <1559564887-4088-1-git-send-email-guoren@kernel.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

Am Mon,  3 Jun 2019 20:28:06 +0800
schrieb guoren@kernel.org:

> From: Guo Ren <ren_guo@c-sky.com>
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...ix-usage-of-mcontext-structure-on-ARM-uCl.patch | 35 -------------
>  .../qemu/0002-configure-improve-usbfs-check.patch  | 60
> ---------------------- ...ix-usage-of-mcontext-structure-on-ARM-uCl.patch
> | 35 +++++++++++++ .../3.1.0/0002-configure-improve-usbfs-check.patch
> | 60 ++++++++++++++++++++++ 4 files changed, 95 insertions(+), 95
> deletions(-) delete mode 100644
> package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
> delete mode 100644
> package/qemu/0002-configure-improve-usbfs-check.patch create mode
> 100644
> package/qemu/3.1.0/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
> create mode 100644
> package/qemu/3.1.0/0002-configure-improve-usbfs-check.patch

At least the usbfs patch seems to be included in QEMU v4.0, so maybe it
would be better to bump the version to 4.0 first?

Thomas, did you ever send the first patch to upstream QEMU, too? Looks
like a valid patch to me, so I think it should be accepted there,
too...?

 Thomas H
