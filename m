Return-Path: <SRS0=K7zh=T5=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6255C04AB3
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 07:30:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8CA33216FD
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 07:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559115028;
	bh=idcoNhswcdLziM3xTokWYHChkxYAvGbUzmPctbxiVI8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=mxsfV3u+4Pa2xD/XVPYSRee9iswH1dnyRsW8O3EjklBpIMDAQnaj8M2lLrmn+hZ/f
	 o3ce2aEBANJF0r3fjoYPKyXyiuMZkJFvb9E6qTeEkvQTh6v5a9qEhd7bhLxDw32HCo
	 voSfdOzaEfMEdF5ZUkfqYysroUZlkRwpsnembHME=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726544AbfE2Ha2 (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Wed, 29 May 2019 03:30:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:55024 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726080AbfE2Ha2 (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Wed, 29 May 2019 03:30:28 -0400
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 68263217D4
        for <linux-csky@vger.kernel.org>; Wed, 29 May 2019 07:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559115027;
        bh=idcoNhswcdLziM3xTokWYHChkxYAvGbUzmPctbxiVI8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=iyGcqf9Hyhfbqs8zkCVZnT8UjAYBB4aFVp2K92Wzi3xmeselXz6nkkEPrn9S7yp0c
         4KsBkyniqWIi2E5rYKCakr6qhGQEvn1KqgGneLEz8hglxowOgTJP9QlxB3vEn3STj4
         qpgFfY1menIg5G28gChDR0WDigUvZrdOPgsYHZw4=
Received: by mail-wr1-f42.google.com with SMTP id l17so875696wrm.10
        for <linux-csky@vger.kernel.org>; Wed, 29 May 2019 00:30:27 -0700 (PDT)
X-Gm-Message-State: APjAAAWZFVQhoCYvOjJjNuDeHNHOsy+xJBow745cYwMEdtQyNxblZmST
        h3sh5koKVFHbvKpYsLxtmMOp+iC2i+qH0Ly0Sqw=
X-Google-Smtp-Source: APXvYqz+fLOl9ab2YGVnLy2MxQtqTDT5mybKHA+lSp1sp05FOxXCvhKp3VmPjrm4eiBWr1vrp7outaiDs+b5YHKpzq4=
X-Received: by 2002:a5d:610e:: with SMTP id v14mr11563062wrt.343.1559115025930;
 Wed, 29 May 2019 00:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
 <1559114328-23357-4-git-send-email-guoren@kernel.org> <20190529092307.6c78996b@windsurf.home>
In-Reply-To: <20190529092307.6c78996b@windsurf.home>
From:   Guo Ren <guoren@kernel.org>
Date:   Wed, 29 May 2019 15:30:14 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSgReEOOJAvXY=MraqTLV4DwkKOqsbQ-4rBdNiaibxQfQ@mail.gmail.com>
Message-ID: <CAJF2gTSgReEOOJAvXY=MraqTLV4DwkKOqsbQ-4rBdNiaibxQfQ@mail.gmail.com>
Subject: Re: [PATCH V3 03/10] arch/csky: Add FLOAT_ABI compiler options
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc:     Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be, linux-csky@vger.kernel.org,
        buildroot@buildroot.org, Guo Ren <ren_guo@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

On Wed, May 29, 2019 at 3:23 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Wed, 29 May 2019 15:18:41 +0800
> guoren@kernel.org wrote:
>
> > From: Guo Ren <ren_guo@c-sky.com>
> >
> > This is only for abiv2 and abiv1 don't support FPU.
> >
> > Signed-off-by: Guo Ren <ren_guo@c-sky.com>
>
> What is abiv1 vs. abiv2 ? Also, in your next commit, abiv1 is
> apparently used for ck610, but here this BR2_GCC_TARGET_FLOAT_ABI is
> defined for all cases, which seems to contradict your commit log.
abiv1 contain: ck610
abiv2 contain: ck807 ck810 ck860

Abiv1 is almost the same as mcore and it's ELF_CODE is 39
Abiv2 is C-SKY own ISA and it's ELF_CODE is 252

We don't support FPU in abiv1, because its opcode width is only
16-bits and we don't want
to continue developing it.

Best Regards
 Guo Ren
