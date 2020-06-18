Return-Path: <SRS0=Jkn3=77=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376D5C433DF
	for <linux-csky@archiver.kernel.org>; Thu, 18 Jun 2020 23:00:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0516C2078D
	for <linux-csky@archiver.kernel.org>; Thu, 18 Jun 2020 23:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592521209;
	bh=3DTLftlJt9ZxiQeVIqHIUgQIlWAIxhhOUrdqiwYWxaM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=d1422z9gb+VyXihKJD4onRzLISefLjua4sBmxsWt0f4u07/sz9Tdxk5sCN9LyXdy5
	 akc0px7Ty3GyuHjnUgg1rsW83B0Xcxp0NO5YJuB0YxPmEhIEXuEGJO6AfUqaWMMzlh
	 HoRC54qPzgdNgQxFAbaZfBLgt8GI6CLzELEIwDqA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729080AbgFRXAG (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Thu, 18 Jun 2020 19:00:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbgFRXAF (ORCPT
        <rfc822;linux-csky@vger.kernel.org>); Thu, 18 Jun 2020 19:00:05 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3E1EC06174E
        for <linux-csky@vger.kernel.org>; Thu, 18 Jun 2020 16:00:03 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id n24so9249524lji.10
        for <linux-csky@vger.kernel.org>; Thu, 18 Jun 2020 16:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mPOiXGmVSJpnt+xtTiccAHXdSsoJkhvb/Wx3zcpBM1U=;
        b=PpDfYxcfStgK5uFhhyAFqUOqliV/bM94+itgR4KusvVnQbmktflqDFig8LU+VmfT8U
         Wp9ysSIcGje8X8t9l5wJHf1wL+pR3P1TqV9pMqozOt4rhHL1M31E1MehT9W8Vtcn4aBE
         eyTJqLmTx6caiIk7i8ez/5cGcDUmrpdauZssg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mPOiXGmVSJpnt+xtTiccAHXdSsoJkhvb/Wx3zcpBM1U=;
        b=jzDsni6evmavkNf7GBV2Ixij2NffdWPvCkSXiyAK7dlL35UV8wGCm3l6Q9bSCh8BmA
         /wdYnO/sp2IwQ5YzHMB3qGD879a5LuGj4uWruW0wSxegofgmpWUcvVDGRi6I1H8g/BK1
         FLF9xAe0ivmGHJCShgyrUQ9pMrK1dcNbjOuft/ex3DwGFMy0vyCgK2hboUPBKae2HCzh
         5qVjHp+HFP84FrZiAvRqAxNRFKHlJE14Tu7sAIa8aegcmrCbEB7/mmthIMBvTA4rOXY+
         gbWideIo7a/p7avCyXk5v4Cw0CJanbIm3luCGYyuRyTbCXhvoaxFRpU4htFqHJ4e+j7a
         BhuQ==
X-Gm-Message-State: AOAM531dki81oKPaujiMTzj4+fjdFIPmZbih6Cpn+hkogARt7vRNstpm
        k3RHci7o7vEhZJfTwkCI9v9omgISd90=
X-Google-Smtp-Source: ABdhPJw7OT9lJlf8JWu+bJRWnNpGaODd2KHsFa8usWpm9IA+HsN0fOmfCS5A/WGN3+mhPbW4fqq1kQ==
X-Received: by 2002:a2e:998f:: with SMTP id w15mr310816lji.463.1592521201837;
        Thu, 18 Jun 2020 16:00:01 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id r9sm875093ljj.127.2020.06.18.16.00.00
        for <linux-csky@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 16:00:01 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id x18so9286639lji.1
        for <linux-csky@vger.kernel.org>; Thu, 18 Jun 2020 16:00:00 -0700 (PDT)
X-Received: by 2002:a2e:8991:: with SMTP id c17mr275545lji.421.1592521200490;
 Thu, 18 Jun 2020 16:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200615221607.7764-1-peterx@redhat.com> <20200615221607.7764-8-peterx@redhat.com>
 <CAJF2gTSVSXO=phc1eeb-ZmDMrSDjSSLd3tN6ng_8n-pCSZh5zw@mail.gmail.com>
 <20200617154925.GC76766@xz-x1> <CAHk-=wi=58J7d5iyFyYyHrU+pzjWB55cit_LQCkSkavpH-trsg@mail.gmail.com>
 <20200617195807.GH76766@xz-x1> <CAHk-=wj_V2Tps2QrMn20_W0OJF9xqNh52XSGA42s-ZJ8Y+GyKw@mail.gmail.com>
 <20200618143801.GK76766@xz-x1> <CAHk-=whFEZbTJZaNwEkyevUV2aqRwbeVmtp6hhk1sK2mW4vaGA@mail.gmail.com>
 <20200618212430.GO76766@xz-x1> <20200618222834.GP76766@xz-x1>
In-Reply-To: <20200618222834.GP76766@xz-x1>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 18 Jun 2020 15:59:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wikLPYrSty_XWQU17zvFZ+seUGOzmcuqcTzgBuKeK_LSQ@mail.gmail.com>
Message-ID: <CAHk-=wikLPYrSty_XWQU17zvFZ+seUGOzmcuqcTzgBuKeK_LSQ@mail.gmail.com>
Subject: Re: [PATCH 07/25] mm/csky: Use mm_fault_accounting()
To:     Peter Xu <peterx@redhat.com>
Cc:     Guo Ren <guoren@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        linux-csky@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

On Thu, Jun 18, 2020 at 3:28 PM Peter Xu <peterx@redhat.com> wrote:
>
> > >         if (regs)
> > >                 perf_sw_event(event_type, 1, regs, address);
>
> Sadly, this line seems to fail the compilation:

Yeah, I should have known that. We require a constant event ID,
because it uses the magical static keys.

So never mind. The perf_sw_event() calls can't be shared for two different ID's.

           Linus
