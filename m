Return-Path: <SRS0=8JPw=UC=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70254C04AB6
	for <linux-csky@archiver.kernel.org>; Mon,  3 Jun 2019 06:47:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 40A072084B
	for <linux-csky@archiver.kernel.org>; Mon,  3 Jun 2019 06:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559544443;
	bh=5s/ILXsgBKjESDXldGfI6BN32dant4zZ7w8zXSZ/FwI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=CFNmN2M5nyX2oH2BMv3KdqaFXq173RG/eR+9dnvweSO0CYMZ5p7ybyCqmwicKl7As
	 ndVx2W1UqoMWI9i5PvEbEKAkVJREKYpWHGzjAgz2/sJSo6I7Lgs47sBZ86u+zWfm72
	 zAWldQ7f2s7z+W5wr0PUAvEIwUWXY7fqjxce5xek=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727247AbfFCGrX (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Mon, 3 Jun 2019 02:47:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:60452 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726896AbfFCGrW (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Mon, 3 Jun 2019 02:47:22 -0400
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0867723A45
        for <linux-csky@vger.kernel.org>; Mon,  3 Jun 2019 06:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559544442;
        bh=5s/ILXsgBKjESDXldGfI6BN32dant4zZ7w8zXSZ/FwI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=z/MxMaeCJKa2y85/4IeuQ8jOnnekJVbbHiN14gMYTLFtn+iF4E/tgsNG7J+ByqmAU
         BdqJQZMSEw1zXrjusToTr9qlEFCzv0WIk63uCm1pul2OfVlpHdLE98RcpAzCfPti0j
         Eqj6hy248sjmpdDx7IwxZYMFn/9mAe3yX5rndyL0=
Received: by mail-wr1-f41.google.com with SMTP id n4so5460478wrw.13
        for <linux-csky@vger.kernel.org>; Sun, 02 Jun 2019 23:47:21 -0700 (PDT)
X-Gm-Message-State: APjAAAVcw42PGy3RmhXW1XFYMmXwT2dZgQLQS2UmRKolns8xbA/f7S9Z
        N/+LCz7Vh7lRD9q189XgaaWBHwWFF/qNz4ZgKyY=
X-Google-Smtp-Source: APXvYqwe2V8uh6ajBUBosVPnbTJmjeyssDC9Z1hdhUCt0TWBN2o+Z3Su161rB/kvc9oUkiIlL3VYpqS1cDCnQhg15M4=
X-Received: by 2002:adf:eb42:: with SMTP id u2mr14440727wrn.80.1559544440590;
 Sun, 02 Jun 2019 23:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <1559468510-22085-1-git-send-email-guoren@kernel.org>
 <1559468510-22085-2-git-send-email-guoren@kernel.org> <20190602134620.77a41eb3@windsurf>
In-Reply-To: <20190602134620.77a41eb3@windsurf>
From:   Guo Ren <guoren@kernel.org>
Date:   Mon, 3 Jun 2019 14:47:09 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSGEKBE6=EL7PyKvxJ0mF+2wFjXvBxyCZOfFPJ8jVW7hg@mail.gmail.com>
Message-ID: <CAJF2gTSGEKBE6=EL7PyKvxJ0mF+2wFjXvBxyCZOfFPJ8jVW7hg@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH V5 2/2] board/qemu/csky/readme.txt: Add C-SKY
 Qemu run Documentation
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc:     Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be, Guo Ren <ren_guo@c-sky.com>, zhiwei_liu@c-sky.com,
        linux-csky@vger.kernel.org, buildroot@buildroot.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

Hello Thomas,

On Sun, Jun 2, 2019 at 7:46 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Guo,
>
> On Sun,  2 Jun 2019 17:41:50 +0800
> guoren@kernel.org wrote:
>
> > + wget https://gitlab.com/c-sky/buildroot/-/jobs/197192514/artifacts/raw/output/images/csky_toolchain_csky_860_fpga_4.9_glibc_br_defconfig_56683a5a67ecf1dd0e67b05b9541de74530d0047.tar.xz;
> > + mkdir tools;
> > + tar -Jxf csky_toolchain_csky_860_fpga_4.9_glibc_br_defconfig_56683a5a67ecf1dd0e67b05b9541de74530d0047.tar.xz -C tools;
> > + LD_LIBRARY_PATH=./tools/lib ./tools/csky-qemu/bin/qemu-system-cskyv2 -M virt -cpu ck860 -smp 2 -kernel output/images/vmlinux -nographic;
> > +
> > +For ck810/ck807:
> > + LD_LIBRARY_PATH=./tools/lib ./tools/csky-qemu/bin/qemu-system-cskyv2 -M virt -kernel output/images/vmlinux -nographic;
> > +
> > +For ck610:
> > + LD_LIBRARY_PATH=./tools/lib ./tools/csky-qemu/bin/qemu-system-cskyv1 -M virt -kernel output/images/vmlinux -nographic;
>
> Instead of this, I think it makes sense to add support for C-SKY in the
> host-qemu package. It should be fairly easy to do, and then you can
> enable building host-qemu as part of the c-sky qemu defconfigs.
Qemu upstream is under way and I want to add host-qemu for C-SKY after that.

See here:
https://gitlab.com/c-sky/buildroot/tree/master/package/csky-qemu
I don't use package/qemu to build csky qemu and I add another
csky-qemu package for simple.

Best Regards
 Guo Ren
