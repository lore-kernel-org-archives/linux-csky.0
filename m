Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9022DECC2
	for <linux-csky@vger.kernel.org>; Thu, 22 Jan 2026 10:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769078828; cv=none; b=HZmLtnLVjiK/aeoavtmMtM1XL5juCicfCUrmxH11SEQzXvAlaGaxFrgE273mPnOvPUoMeYO10/xpINfvXpCFbjILfKT7SdL8GHBvqvjiIpZ1j2Sm0VW1NKU+R/1eBnQTyOYz0d16Ok0u5ufg6v46BzeMNyTqHZO4g0J5/TVrSfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769078828; c=relaxed/simple;
	bh=48YBA/wPZzNiV48KWg/GIGgM+avsbs3uTsgLWY6rttQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ae0qmfATKuB1xZqQcsnOPfsNUlBTA3ppeozzU/WHPvPKhIf61+EhRINfZnkpykfB2U6cSbCWoyhqlePYy5pL2XTWr2gOulQpZTD1AMJWUlb7aZvgETXK1Rz3Q6jn2T3UO9hF9BfC/w3zAWW5GDsoAK84we9b6yLZsr3a9QdGWoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jPwsi3bZ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jPwsi3bZ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-430f3ef2d37so665970f8f.3
        for <linux-csky@vger.kernel.org>; Thu, 22 Jan 2026 02:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769078824; x=1769683624; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p3kgZdZGe15qcgbvjAtESEFU8KlhQRc0to8H1amWHdU=;
        b=jPwsi3bZC8G1LJBY7OXtHscMFNTYk7DMBpbU3szMWQMQMYaGvWJqX3EQ8xrDiS/z0O
         unP7Xo97NgBrP7XqKqq6g7dGEbod+uyk5XkMQQlynWMER6NGjkR/P/5u7/F4DLp5ZuYQ
         +Q7/sedTuLpH3CDUQgVvn/SCiFqfWVC/vHhvSyQVZ8vO7qK0VwMzDlGlvxGJ1F7xIyOE
         MvyZGzV7vc9qEMzRX5PsqHyhCQkxpbD6cR1tAmLt1IRET3tk5b8X6ThnfRzIseyQjvhW
         uO6v3urI4dvXi0LlAMSUIdRV1QATnpBwF8qfeJHqejYbMHUkmnu+BLmvlXaXZqePSEhm
         SpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078824; x=1769683624;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p3kgZdZGe15qcgbvjAtESEFU8KlhQRc0to8H1amWHdU=;
        b=MrxKeqSIGLcfnnDGcAU7X5GequVT+YVVLR98mv5V8D568dYnVqQ+OeKFscVvXsyuf+
         yjFZDLqcs7CN7U3CskIhES/kwtXHsLC2TkeUYpDvfe2cUjhDoLr20RYXJjxYl2HKf3Si
         XlrOKYDrxjDtmm9jHuFl4tyYwbD5GzdSg1E2dQ1RpkO+QEZEMqElSurZjPH3RIYhWRiR
         6R7xORKN8KEMnJ59M2p52FAcart+EFaJssDZ9EMRWxzWe0AltlJCfYE68ZEJ64V0TL+y
         4HSG8bMQ5EdqlKW9TiGxfyrJjc/v0exLlAPQJRJvV1owgRzMHC9MXKp8XYsEvL6d9I3W
         y/xg==
X-Forwarded-Encrypted: i=1; AJvYcCVBeuWC5YSzqw7cqyQjr0mmZwO9cIVr2y7Klhkuh/dWjkWKeNUSw6eCCMQL9b5aZIWYg2tNCYk/6tbZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzbSx5YE1gbY32UIWeEfcrkhFLYBpWXBOV2UfwSbyjPbusgHvNX
	h/HwwWW9s7JLj2YrJQXpDbREMsT5P96SUC0DDVyihtA8p7fbrpQoJGG6h0m9U98FB7g=
X-Gm-Gg: AZuq6aK3JsndYY3Wex7cD86opzrcrHbLrn7ts1t6OiHPAlzYownW3oi7EC8w0hCReBl
	qzuwfXqGKsIPQxn8Z8yR9lXDrcPokVLe7E+TsCB3L1CjE04i25Ac84zkjJkfpjGQ0nxmDAJJ/Ew
	eJnZbsnstu94Q9ltGKW3slGzhZkTKSxH3bOg0wpgsc9OwJZk7KujF6EWJVivM7mMOUjJbnH8l8A
	kHmF6qV7+i7OZ8OX01dlJWC0ufruvxiX98HwF2QB7Pcvo2c6KiPd7EavKIxQA4Hm3qOjfQCXW1K
	o9H5gr94umj7BzAyWri+HG6hmYZqdMUQxMd9BAscbQNI8E+8fbQSkFpVNZSCZxMXrBsmEwVM0uK
	u17oVIAdsR2tTIHyJpSMXwXMFOgzBuBpC2pEpQ5R5eedj8HtGNGaURNMW36BMlBOCwpF1qxKoN9
	ObAl39A3m/NHxPMZOF
X-Received: by 2002:a05:6000:2dc5:b0:435:8f1b:bb28 with SMTP id ffacd0b85a97d-4358fe9d0fcmr12333244f8f.0.1769078823855;
        Thu, 22 Jan 2026 02:47:03 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43597719d1fsm14789146f8f.23.2026.01.22.02.47.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 02:47:03 -0800 (PST)
Message-ID: <10c875e6-6cc2-4695-a0aa-01507541daf4@linaro.org>
Date: Thu, 22 Jan 2026 10:47:01 +0000
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/11] perf annotate arch clean up
From: James Clark <james.clark@linaro.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Zecheng Li <zecheng@google.com>, Tianyou Li <tianyou.li@intel.com>,
 Thomas Falcon <thomas.falcon@intel.com>, Julia Lawall
 <Julia.Lawall@inria.fr>, Suchit Karunakaran <suchitkarunakaran@gmail.com>,
 Athira Rajeev <atrajeev@linux.ibm.com>,
 Aditya Bodkhe <aditya.b1@linux.ibm.com>, Howard Chu <howardchu95@gmail.com>,
 =?UTF-8?Q?Krzysztof_=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Shimin Guo <shimin.guo@skydio.com>, Sergei Trofimovich <slyich@gmail.com>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20260122073127.375139-1-irogers@google.com>
 <9fd8375c-2de7-4305-ac3e-42ff8f919964@linaro.org>
Content-Language: en-US
In-Reply-To: <9fd8375c-2de7-4305-ac3e-42ff8f919964@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 22/01/2026 10:43 am, James Clark wrote:
> 
> 
> On 22/01/2026 7:31 am, Ian Rogers wrote:
>> 2 initial memory leak fix patches for perf annotate.
>>
>> Move the disasm.c #included arch files into a new util/annotate-arch
>> directory. Make the code compile standalone. Try to better encapsulate
>> architecture specific code within the files and with a
>> arch__new_<arch> function that allows additional data to be associated
>> with the struct arch using the standard container_of trick.
>>
>> Make the lookup of struct arch use the ELF machine gather from a
>> thread rather than an evsel. For example, the evsel can't determine
>> the difference between EM_386 and EM_X86_64 so generally the latter
>> has currently been used. This means the dwarf registers are off as
>> register 1 is CX with EM_386 and DX with EM_X86_64. To facilitate this
>> change map_symbol is refactored to use a struct thread rather than a
>> struct maps, the maps being obtainable from the thread.
>>
>> To make in and out arguments clearer, for safety, etc. try to constify
>> struct arch and its related structs.
>>
> 
> Hi Ian,
> 
> I get this crash, not sure which commit causes it exactly but it 
> happened 2/2 times on both x86 and arm:
> 
>   $ perf record -- true
>   $ perf report
> 
>   < Select first sample >
>   < Select annotate >
> 
> perf: Segmentation fault
> -------- backtrace --------
>      #0 0x5df8f58ba973 in ui__signal_backtrace setup.c:110
>      #1 0x74373a642520 in __restore_rt libc_sigaction.c:0
>      #2 0x5df8f5963f0d in dso__kernel dso.h:532
>      #3 0x5df8f5965d0a in __map__const_kmap map.c:627
>      #4 0x5df8f5965a36 in map__rip_2objdump map.c:531
>      #5 0x5df8f58e5bef in symbol__parse_objdump_line disasm.c:1032
>      #6 0x5df8f58e498b in symbol__disassemble_objdump disasm.c:1503
>      #7 0x5df8f58e3852 in symbol__disassemble disasm.c:1621
>      #8 0x5df8f58c638d in symbol__annotate annotate.c:1055
>      #9 0x5df8f58c8628 in symbol__annotate2 annotate.c:2209
>      #10 0x5df8f58a36b7 in __hist_entry__tui_annotate annotate.c:1189
>      #11 0x5df8f58adf86 in do_annotate hists.c:2488
>      #12 0x5df8f58ad762 in evsel__hists_browse hists.c:3441
>      #13 0x5df8f58b78f2 in perf_evsel_menu__run hists.c:3556
>      #14 0x5df8f58adabc in __evlist__tui_browse_hists hists.c:3643
>      #15 0x5df8f58abf3b in evlist__tui_browse_hists hists.c:3691
>      #16 0x5df8f571ac3a in report__browse_hists builtin-report.c:688
>      #17 0x5df8f5719943 in __cmd_report builtin-report.c:1177
>      #18 0x5df8f57181bc in cmd_report builtin-report.c:1890
>      #19 0x5df8f57b5c3a in run_builtin perf.c:348
>      #20 0x5df8f57b53b3 in handle_internal_command perf.c:398
>      #21 0x5df8f57b5b2f in run_argv perf.c:445
>      #22 0x5df8f57b5091 in main perf.c:551
>      #23 0x74373a629d90 in __libc_start_call_main libc_start_call_main.h:58
>      #24 0x74373a629e40 in __libc_start_main@@GLIBC_2.34 libc-start.c:128
>      #25 0x5df8f56ead35 in _start perf[55d35]
> 
> 

Also the annotate test fails:

  $ sudo perf test 74
  74: perf annotate basic tests                       : FAILED!


>> Ian Rogers (11):
>>    perf maps: Fix reference count leak in maps__find_ams
>>    perf annotate: Fix args leak of map_symbol
>>    perf disasm: Constify use of struct arch
>>    perf disasm: Constify use of struct ins_op
>>    perf disasm: Constify use of struct ins
>>    perf disasm: Rework the string arch__is to use the ELF machine
>>    perf disasm: Don't include C files from the arch directory
>>    perf disasm: Refactor ins__is_call/jump to avoid exposing arch ins_ops
>>    perf map_symbol: Switch from holding maps to holding thread
>>    perf disasm: Refactor arch__find and initialization of arch structs
>>    perf disasm: Minor layout tweaks for struct arch
>>
>>   tools/perf/arch/arc/annotate/instructions.c   |  11 -
>>   .../perf/arch/riscv64/annotate/instructions.c |  36 --
>>   tools/perf/ui/browsers/annotate.c             |   6 +-
>>   tools/perf/ui/browsers/hists.c                |   3 +-
>>   tools/perf/util/Build                         |   1 +
>>   tools/perf/util/addr_location.c               |   4 -
>>   tools/perf/util/addr_location.h               |   1 -
>>   tools/perf/util/annotate-arch/Build           |  11 +
>>   tools/perf/util/annotate-arch/annotate-arc.c  |  18 +
>>   .../annotate-arch/annotate-arm.c}             |  48 +-
>>   .../annotate-arch/annotate-arm64.c}           |  59 +--
>>   .../annotate-arch/annotate-csky.c}            |  29 +-
>>   .../annotate-arch/annotate-loongarch.c}       |  57 ++-
>>   .../annotate-arch/annotate-mips.c}            |  29 +-
>>   .../annotate-arch/annotate-powerpc.c}         | 125 +++++-
>>   .../util/annotate-arch/annotate-riscv64.c     |  41 ++
>>   .../annotate-arch/annotate-s390.c}            |  59 ++-
>>   .../annotate-arch/annotate-sparc.c}           |  26 +-
>>   .../annotate-arch/annotate-x86.c}             |  89 ++--
>>   tools/perf/util/annotate-data.c               |  12 +-
>>   tools/perf/util/annotate-data.h               |   2 +-
>>   tools/perf/util/annotate.c                    |  88 ++--
>>   tools/perf/util/annotate.h                    |  10 +-
>>   tools/perf/util/callchain.c                   |  12 +-
>>   tools/perf/util/capstone.c                    |  18 +-
>>   tools/perf/util/db-export.c                   |   1 -
>>   tools/perf/util/disasm.c                      | 424 +++++++-----------
>>   tools/perf/util/disasm.h                      |  95 ++--
>>   tools/perf/util/event.c                       |   2 -
>>   tools/perf/util/hist.c                        |  18 +-
>>   tools/perf/util/llvm.c                        |   8 +-
>>   tools/perf/util/machine.c                     |  13 +-
>>   tools/perf/util/map_symbol.c                  |   5 +-
>>   tools/perf/util/map_symbol.h                  |   3 +-
>>   tools/perf/util/maps.c                        |   1 +
>>   tools/perf/util/sort.c                        |   2 +-
>>   tools/perf/util/unwind-libdw.c                |   2 +-
>>   tools/perf/util/unwind-libunwind-local.c      |   2 +-
>>   38 files changed, 752 insertions(+), 619 deletions(-)
>>   delete mode 100644 tools/perf/arch/arc/annotate/instructions.c
>>   delete mode 100644 tools/perf/arch/riscv64/annotate/instructions.c
>>   create mode 100644 tools/perf/util/annotate-arch/Build
>>   create mode 100644 tools/perf/util/annotate-arch/annotate-arc.c
>>   rename tools/perf/{arch/arm/annotate/instructions.c => util/ 
>> annotate-arch/annotate-arm.c} (59%)
>>   rename tools/perf/{arch/arm64/annotate/instructions.c => util/ 
>> annotate-arch/annotate-arm64.c} (70%)
>>   rename tools/perf/{arch/csky/annotate/instructions.c => util/ 
>> annotate-arch/annotate-csky.c} (67%)
>>   rename tools/perf/{arch/loongarch/annotate/instructions.c => util/ 
>> annotate-arch/annotate-loongarch.c} (66%)
>>   rename tools/perf/{arch/mips/annotate/instructions.c => util/ 
>> annotate-arch/annotate-mips.c} (59%)
>>   rename tools/perf/{arch/powerpc/annotate/instructions.c => util/ 
>> annotate-arch/annotate-powerpc.c} (73%)
>>   create mode 100644 tools/perf/util/annotate-arch/annotate-riscv64.c
>>   rename tools/perf/{arch/s390/annotate/instructions.c => util/ 
>> annotate-arch/annotate-s390.c} (70%)
>>   rename tools/perf/{arch/sparc/annotate/instructions.c => util/ 
>> annotate-arch/annotate-sparc.c} (85%)
>>   rename tools/perf/{arch/x86/annotate/instructions.c => util/ 
>> annotate-arch/annotate-x86.c} (93%)
>>
> 

