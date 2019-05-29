Return-Path: <SRS0=K7zh=T5=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9841EC04AB3
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 07:39:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 64E3221670
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 07:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559115594;
	bh=EQbJDptjQpznVNypPCZRpcB9ZX2w3FxYlpHNNjnlhj8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=pZg58hXLHhjR3SPOw5l4sJVBadOVfagJcHxppuYwc3S14rjMVT+ixICUYPl9h2q36
	 r8jAw3/wpIbDMIEs0mQO8zwrwH3e0vG1k39ClaSn8WvW5W3E27zUflzqh8PwSjo+AD
	 nCkvJxiuExplPTRshKVv+HvgrUUoUQy6Q7LhtAbI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbfE2Hjy (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Wed, 29 May 2019 03:39:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:57842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726057AbfE2Hjy (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Wed, 29 May 2019 03:39:54 -0400
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6034421670
        for <linux-csky@vger.kernel.org>; Wed, 29 May 2019 07:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559115593;
        bh=EQbJDptjQpznVNypPCZRpcB9ZX2w3FxYlpHNNjnlhj8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=whayowaXV9WurjIzyHPBG6FT2sYflT0zniSFXAjfKgPFrpyJywl/ZtKJT995ji/GS
         9lZ+L6TRnKfEnCtMlO5ux1JYwQpcRQyPfR2jUESkf5AHcwb9lmDEBpJQHHCZK4Hzal
         /bKZkx6sjrnEg+stH24C0SyLbjQTwfDaFoFPjuZM=
Received: by mail-wm1-f54.google.com with SMTP id t5so799048wmh.3
        for <linux-csky@vger.kernel.org>; Wed, 29 May 2019 00:39:53 -0700 (PDT)
X-Gm-Message-State: APjAAAXUmBlEHWIKg8fGBVsAkEWM+llwM7Ga6gl3rqsUQ/fR6XgdSmTI
        cEZjSKWT9WGgdNe846zYkSybNbe4nd0c03IcuB4=
X-Google-Smtp-Source: APXvYqxBo8gsbazYE57K16AIjdcu9MTXCIIu0723YxF7e6OPqyi87kQqde53D1jbBSV8tubSV0UXuw7apZTAjvclHn0=
X-Received: by 2002:a1c:4c07:: with SMTP id z7mr5735658wmf.172.1559115592029;
 Wed, 29 May 2019 00:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
 <1559114328-23357-4-git-send-email-guoren@kernel.org> <20190529092307.6c78996b@windsurf.home>
In-Reply-To: <20190529092307.6c78996b@windsurf.home>
From:   Guo Ren <guoren@kernel.org>
Date:   Wed, 29 May 2019 15:39:40 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTTeLNOdKVnS1b=6hoLsnc_zt6H+-qN_B57iYp5K-zQ6A@mail.gmail.com>
Message-ID: <CAJF2gTTTeLNOdKVnS1b=6hoLsnc_zt6H+-qN_B57iYp5K-zQ6A@mail.gmail.com>
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
BR2_GCC_TARGET_FLOAT_ABI=soft-float is OK for ck610

Best Regards
 Guo Ren
