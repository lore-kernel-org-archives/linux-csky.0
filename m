Return-Path: <SRS0=/JCA=UY=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0552CC48BD6
	for <linux-csky@archiver.kernel.org>; Tue, 25 Jun 2019 07:25:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D3E902085A
	for <linux-csky@archiver.kernel.org>; Tue, 25 Jun 2019 07:25:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730051AbfFYHZl (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Tue, 25 Jun 2019 03:25:41 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35864 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730031AbfFYHZj (ORCPT
        <rfc822;linux-csky@vger.kernel.org>); Tue, 25 Jun 2019 03:25:39 -0400
Received: by mail-pl1-f193.google.com with SMTP id k8so8366752plt.3
        for <linux-csky@vger.kernel.org>; Tue, 25 Jun 2019 00:25:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=D5TcDpWvSvR6guGVHBK74rSc1eO/xYZXbYoBMxMUInU=;
        b=ujtqgtKO6naYBjlDKRpqKVRFB/HZRdc6Jcz+pObGECKk+s2K+8skWh+UZZow932iu3
         /SZSQIKy2KaiXCkAvV/e6qdbERFfrv9of/HBeqe5aOqdILK4UtKXyGKn+WWCv6iCXYX0
         T0i4QixjiIpbVgjiFF/mYb6JRs3rgFATV5GJxV8H0AipHpATb4KMP/qOs9/TFnkhL/Qz
         O9cWF4+PD0qO1lTtCqgcbmHvVl5id1l+V6+FfzuiUxi5xyPmW6WY+1vUQB3Os8nEZ6S+
         7e6OLIAh8qLizPT1Hk/zCJknL2SHtZi/+R/kdnKlxoH3CYgUM+e+G6dXZqYbJDOVpAPu
         YDIQ==
X-Gm-Message-State: APjAAAUWMzLtCvkD0edemApFiJV1j6GbmD8p32GraTsYaNhyrkYCs/QC
        K5C8DNza2W5Xfvr+cbl6JLFIgg==
X-Google-Smtp-Source: APXvYqyhnohLrNNrcI6vZeIQBQp/G4PBGqvQA75lKl/2Tpz7XDtiEUVz7aNrXVF4nP1pxWqGGr2wLg==
X-Received: by 2002:a17:902:bf08:: with SMTP id bi8mr118969510plb.189.1561447538458;
        Tue, 25 Jun 2019 00:25:38 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net. [220.132.236.182])
        by smtp.gmail.com with ESMTPSA id v4sm14845133pff.45.2019.06.25.00.25.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 25 Jun 2019 00:25:37 -0700 (PDT)
Date:   Tue, 25 Jun 2019 00:25:37 -0700 (PDT)
X-Google-Original-Date: Tue, 25 Jun 2019 00:24:47 PDT (-0700)
Subject:     Re: [PATCH] arm64: asid: Optimize cache_flush for SMT
In-Reply-To: <20190624114010.GA51882@lakrids.cambridge.arm.com>
CC:     guoren@kernel.org, julien.grall@arm.com,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        linux-csky@vger.kernel.org, ren_guo@c-sky.com,
        catalin.marinas@arm.com
From:   Palmer Dabbelt <palmer@sifive.com>
To:     mark.rutland@arm.com
Message-ID: <mhng-1ed90194-b48d-42f0-b558-c369cc116527@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

On Mon, 24 Jun 2019 04:40:10 PDT (-0700), mark.rutland@arm.com wrote:
> I'm very confused by this patch. The title says arm64, yet the code is
> under arch/csky/, and the code in question refers to HARTs, which IIUC
> is RISC-V terminology.
>
> On Mon, Jun 24, 2019 at 12:04:29AM +0800, guoren@kernel.org wrote:
>> From: Guo Ren <ren_guo@c-sky.com>
>>
>> The hardware threads of one core could share the same TLB for SMT+SMP
>> system. Assume hardware threads number sequence like this:
>>
>> | 0 1 2 3 | 4 5 6 7 | 8 9 a b | c d e f |
>>    core1     core2     core3     core4
>
> Given this is the Linux logical CPU ID rather than a physical CPU ID,
> this assumption is not valid. For example, CPUs may be renumbered across
> kexec.
>
> Even if this were a physical CPU ID, this doesn't hold on arm64 (e.g.
> due to big.LITTLE).
>
>> Current algorithm seems is correct for SMT+SMP, but it'll give some
>> duplicate local_tlb_flush. Because one hardware threads local_tlb_flush
>> will also flush other hardware threads' TLB entry in one core TLB.
>
> Does any architecture specification mandate that behaviour?
>
> That isn't true for arm64, I have no idea whether RISC-V mandates that,
> and as below it seems this is irrelevant on C-SKY.

There is no event defined by RISC-V that ever requires implementations flush
the TLB of more than one hart at a time.  There is also nothing in the
normative text of the RISC-V manuals that allows for any differentiation
between multiple threads on a single core and multiple cores (though I am about
to suggest adding two, against my will :)).

>> So we can use bitmap to reduce local_tlb_flush for SMT.
>>
>> C-SKY cores don't support SMT and the patch is no benefit for C-SKY.
>
> As above, this patch is very confusing -- if this doesn't benefit C-SKY,
> why modify the C-SKY code?
>
> Thanks,
> Mark.
>
>>
>> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Julien Grall <julien.grall@arm.com>
>> ---
>>  arch/csky/include/asm/asid.h |  4 ++++
>>  arch/csky/mm/asid.c          | 11 ++++++++++-
>>  arch/csky/mm/context.c       |  2 +-
>>  3 files changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/csky/include/asm/asid.h b/arch/csky/include/asm/asid.h
>> index ac08b0f..f654492 100644
>> --- a/arch/csky/include/asm/asid.h
>> +++ b/arch/csky/include/asm/asid.h
>> @@ -23,6 +23,9 @@ struct asid_info
>>  	unsigned int		ctxt_shift;
>>  	/* Callback to locally flush the context. */
>>  	void			(*flush_cpu_ctxt_cb)(void);
>> +	/* To reduce duplicate tlb_flush for SMT */
>> +	unsigned int		harts_per_core;
>> +	unsigned int		harts_per_core_mask;
>>  };
>>
>>  #define NUM_ASIDS(info)			(1UL << ((info)->bits))
>> @@ -73,6 +76,7 @@ static inline void asid_check_context(struct asid_info *info,
>>
>>  int asid_allocator_init(struct asid_info *info,
>>  			u32 bits, unsigned int asid_per_ctxt,
>> +			unsigned int harts_per_core,
>>  			void (*flush_cpu_ctxt_cb)(void));
>>
>>  #endif
>> diff --git a/arch/csky/mm/asid.c b/arch/csky/mm/asid.c
>> index b2e9147..50a983e 100644
>> --- a/arch/csky/mm/asid.c
>> +++ b/arch/csky/mm/asid.c
>> @@ -148,8 +148,13 @@ void asid_new_context(struct asid_info *info, atomic64_t *pasid,
>>  		atomic64_set(pasid, asid);
>>  	}
>>
>> -	if (cpumask_test_and_clear_cpu(cpu, &info->flush_pending))
>> +	if (cpumask_test_cpu(cpu, &info->flush_pending)) {
>> +		unsigned int i;
>> +		unsigned int harts_base = cpu & info->harts_per_core_mask;
>>  		info->flush_cpu_ctxt_cb();
>> +		for (i = 0; i < info->harts_per_core; i++)
>> +			cpumask_clear_cpu(harts_base + i, &info->flush_pending);
>> +	}
>>
>>  	atomic64_set(&active_asid(info, cpu), asid);
>>  	cpumask_set_cpu(cpu, mm_cpumask(mm));
>> @@ -162,15 +167,19 @@ void asid_new_context(struct asid_info *info, atomic64_t *pasid,
>>   * @info: Pointer to the asid allocator structure
>>   * @bits: Number of ASIDs available
>>   * @asid_per_ctxt: Number of ASIDs to allocate per-context. ASIDs are
>> + * @harts_per_core: Number hardware threads per core, must be 1, 2, 4, 8, 16 ...
>>   * allocated contiguously for a given context. This value should be a power of
>>   * 2.
>>   */
>>  int asid_allocator_init(struct asid_info *info,
>>  			u32 bits, unsigned int asid_per_ctxt,
>> +			unsigned int harts_per_core,
>>  			void (*flush_cpu_ctxt_cb)(void))
>>  {
>>  	info->bits = bits;
>>  	info->ctxt_shift = ilog2(asid_per_ctxt);
>> +	info->harts_per_core = harts_per_core;
>> +	info->harts_per_core_mask = ~((1 << ilog2(harts_per_core)) - 1);
>>  	info->flush_cpu_ctxt_cb = flush_cpu_ctxt_cb;
>>  	/*
>>  	 * Expect allocation after rollover to fail if we don't have at least
>> diff --git a/arch/csky/mm/context.c b/arch/csky/mm/context.c
>> index 0d95bdd..b58523b 100644
>> --- a/arch/csky/mm/context.c
>> +++ b/arch/csky/mm/context.c
>> @@ -30,7 +30,7 @@ static int asids_init(void)
>>  {
>>  	BUG_ON(((1 << CONFIG_CPU_ASID_BITS) - 1) <= num_possible_cpus());
>>
>> -	if (asid_allocator_init(&asid_info, CONFIG_CPU_ASID_BITS, 1,
>> +	if (asid_allocator_init(&asid_info, CONFIG_CPU_ASID_BITS, 1, 1,
>>  				asid_flush_cpu_ctxt))
>>  		panic("Unable to initialize ASID allocator for %lu ASIDs\n",
>>  		      NUM_ASIDS(&asid_info));
>> --
>> 2.7.4
>>
