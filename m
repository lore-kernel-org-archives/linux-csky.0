Return-Path: <SRS0=qc9/=EE=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31158C2D0A3
	for <linux-csky@archiver.kernel.org>; Thu, 29 Oct 2020 23:17:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C69B920791
	for <linux-csky@archiver.kernel.org>; Thu, 29 Oct 2020 23:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604013419;
	bh=UcUmDAmTUEsxM/7Q5mGiU0kZmmYJV9o2OCzWx54x/LQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=luEru0btSO5HwnTd4ngkI4dDxt1gCuO/Wz1cAB1vcyGlLktOfPVTZSaWGM88r4JdK
	 qCl8H6ZIGHXSH7SuWFKhjMgTGkwhs57r7pfSbI6aAxaprfM9mIUeYs8nvOiSQewYqj
	 yBVaIftMc2eGhw6Y0HxeFAVlVbRGyqySq7dvRe84=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbgJ2XQ7 (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Thu, 29 Oct 2020 19:16:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbgJ2XQ7 (ORCPT
        <rfc822;linux-csky@vger.kernel.org>); Thu, 29 Oct 2020 19:16:59 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CE29C0613CF
        for <linux-csky@vger.kernel.org>; Thu, 29 Oct 2020 16:16:59 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id l16so4798484eds.3
        for <linux-csky@vger.kernel.org>; Thu, 29 Oct 2020 16:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OAaBl/U7PBG+TlUp0N4qfJ0eDW1D/8YEA2bXCC674us=;
        b=SyS4SffxYsNmj61H9VhYyfV30AKVcQI02I05R1QJ0WmBmFSO+bnQWo+8WU1Xmtdngw
         /WCUakc82ksJGHGKm7uLpuzRi56V0rh71ThvreQzsj4AGwhIaWOkntvIB7PKONmne7aI
         RS+5JSoq7Rynp7XqZeCI4Lh5y/aQJhenniqh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OAaBl/U7PBG+TlUp0N4qfJ0eDW1D/8YEA2bXCC674us=;
        b=HW6iAHx7F+2NkkHlVaJKKeYJA2cVnTurNauBBRgnsct8WfItOydl4QhRcUF2MKHCZ1
         3MQ2EF8NPr5Ywazf7xLNT7OcLJubbR1ikt8T512VkyWgTCCOFHlX2vXwXmutSM8g9Lco
         Ikmd+2iZG2IGcGVZkfkmUAVn01rYRoOYcT+ZhwnLi9AcGQDWq2O8yY3vBq+dAhLK3vhy
         ePyNYKeQJlg0HwTUvsLfEqxOqLTpsTT2nsezxorCZ9ZW6FJponaWaBugZ0j6Hfc1V+vk
         cAiBcIGf/rg2lc0EPAGWEBOq/f1KtyAuKURU+6IZHY3C2ONY4rDuKmxO1spj7KW2UFh3
         dbNQ==
X-Gm-Message-State: AOAM530/UL2qmBnEApLdtIcBUo8D/09ftSkXfk3Vpnm+AT9FTWYbPBP5
        QIoM6+YDP6BV8w+ORaoBZvi6C9DXSxQMMQ==
X-Google-Smtp-Source: ABdhPJxtvnGtdMIqSodHM+M7XQ07Nj60vJA+v8HdC1OdwMxqZZbAnPbixfmHGM0racBacl4IqO10Eg==
X-Received: by 2002:a50:d751:: with SMTP id i17mr6660089edj.337.1604013417491;
        Thu, 29 Oct 2020 16:16:57 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id p3sm2218184edy.38.2020.10.29.16.16.57
        for <linux-csky@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2020 16:16:57 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id o18so4782446edq.4
        for <linux-csky@vger.kernel.org>; Thu, 29 Oct 2020 16:16:57 -0700 (PDT)
X-Received: by 2002:a2e:8815:: with SMTP id x21mr3018764ljh.312.1604013088281;
 Thu, 29 Oct 2020 16:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201029221806.189523375@linutronix.de>
In-Reply-To: <20201029221806.189523375@linutronix.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 29 Oct 2020 16:11:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiFxxGapdOyZHE-7LbFPk+jdfoqdeeJg0zWNQ86WvJGXg@mail.gmail.com>
Message-ID: <CAHk-=wiFxxGapdOyZHE-7LbFPk+jdfoqdeeJg0zWNQ86WvJGXg@mail.gmail.com>
Subject: Re: [patch V2 00/18] mm/highmem: Preemptible variant of kmap_atomic & friends
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Paul McKenney <paulmck@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Ard Biesheuvel <ardb@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Christoph Hellwig <hch@lst.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux-MM <linux-mm@kvack.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Vineet Gupta <vgupta@synopsys.com>,
        "open list:SYNOPSYS ARC ARCHITECTURE" 
        <linux-snps-arc@lists.infradead.org>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-sparc <sparclinux@vger.kernel.org>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-xtensa@linux-xtensa.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

On Thu, Oct 29, 2020 at 3:32 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
>
> Though I wanted to share the current state of affairs before investigating
> that further. If there is consensus in going forward with this, I'll have a
> deeper look into this issue.

Me likee. I think this looks like the right thing to do.

I didn't actually apply the patches, but just from reading them it
_looks_ to me like you do the migrate_disable() unconditionally, even
if it's not a highmem page..

That sounds like it might be a good thing for debugging, but not
necessarily great in general.

Or am I misreading things?

                Linus
