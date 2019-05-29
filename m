Return-Path: <SRS0=K7zh=T5=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C5C3C07542
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 08:12:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5B1E321019
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 08:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559117561;
	bh=360Am+SKxueHKNRiWpiFGMkAem36g7efZqGclASmz/0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=VG6QmQEY5HUpU8IHD16iy+oprLkrqykRWLPCp+6K9ykqmBnwmbKhI43ZL94UGsJAX
	 JeSz39Bt7s8susvCpya9FhW3j+2iHLyDS0umzgh12yMaI2KX5kP02CQ6v+SZzq3G1X
	 JwFb9B90/1hhCPM0fMWi14/MT4j577Hbe3qpOZJk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbfE2IMk (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Wed, 29 May 2019 04:12:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:46048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725987AbfE2IMj (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Wed, 29 May 2019 04:12:39 -0400
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B58AD21019
        for <linux-csky@vger.kernel.org>; Wed, 29 May 2019 08:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559117559;
        bh=360Am+SKxueHKNRiWpiFGMkAem36g7efZqGclASmz/0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hejj914L/y32ZCvjzvwbNv8a6PErPJm5SUZHswTOF8oYI5jDOZSSkejNaSEYcphxz
         IU3cBe6sYmKY85Ad44IzhiCiJJ3tapJp8WFaq/KofEinZF4GcibJNggEB2NihaSZI5
         XKz+50I0cvfSolh+z5w88fb2FJhkFiHzlmfnnYtM=
Received: by mail-wr1-f54.google.com with SMTP id r7so964790wrr.13
        for <linux-csky@vger.kernel.org>; Wed, 29 May 2019 01:12:38 -0700 (PDT)
X-Gm-Message-State: APjAAAVzkjpl8BMia+Wl282Q0e4MSNTXaZFr+SDzpysUt8f6gqgbXDS7
        IgxjXUKJDAyhB2qN8nV0Q01eURxIkzaiipk17SU=
X-Google-Smtp-Source: APXvYqw3EJrd5593CkbtapM+L8KPaf9ugTGkHlWb6OL62vQpq6s6+IBXyv61Ovxrzm9/y2uHr9UgxjGzuRB+RuHdz4I=
X-Received: by 2002:adf:cd0d:: with SMTP id w13mr79372646wrm.38.1559117557357;
 Wed, 29 May 2019 01:12:37 -0700 (PDT)
MIME-Version: 1.0
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
 <1559114328-23357-2-git-send-email-guoren@kernel.org> <20190529092128.36183371@windsurf.home>
 <CAJF2gTQC8UigBniC_RKUVFddX=PnN7O9GyBZXcxyXuPBg9WNHw@mail.gmail.com> <20190529095629.2b28cbb7@windsurf.home>
In-Reply-To: <20190529095629.2b28cbb7@windsurf.home>
From:   Guo Ren <guoren@kernel.org>
Date:   Wed, 29 May 2019 16:12:25 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT5N6ST9Ph-L+bX2WtNx4ENu0wQ2uQ63D=3C-Zqoit+3w@mail.gmail.com>
Message-ID: <CAJF2gTT5N6ST9Ph-L+bX2WtNx4ENu0wQ2uQ63D=3C-Zqoit+3w@mail.gmail.com>
Subject: Re: [PATCH V3 01/10] arch/csky: Use VDSP instead of DSP
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc:     Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be, linux-csky@vger.kernel.org,
        buildroot@buildroot.org, Guo Ren <ren_guo@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

On Wed, May 29, 2019 at 3:56 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Guo,
>
> On Wed, 29 May 2019 15:30:45 +0800
> Guo Ren <guoren@kernel.org> wrote:
>
> > OK, two pathes.
>
> Not just two patches: also a better commit log for the DSP -> VDSP
> change.

I want these two patches:

1. Remove DSP, because it's no use in current buildroot.
2. Add VDSP support

Here is my commit log for Introduce VDSP feature:

VDSP is C-SKY enhanced extension instruction set for SIMD, AI and DSP
operation. It could be support by abiv2 (ck807, ck810, ck860).

Is that OK?
