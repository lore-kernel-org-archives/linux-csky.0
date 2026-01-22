Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8178633120E
	for <linux-csky@vger.kernel.org>; Thu, 22 Jan 2026 10:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769078626; cv=none; b=mPBO6gVKmvetnKAJ9k8OVqRusM2+n4NSoRRaw1Owg5wMj+p6eSlZbti3MDGLEzRxpfl6/QbxRSCRIi2AGXI92pbYG957zqAPFJHVWhSpT8y0+yCN9PKvokGqTyDH3wsKh45jUD1Q+/GG5pzVLUxzrPrn6bzZA1s/XdanQlfF6i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769078626; c=relaxed/simple;
	bh=Hfa7/DECuQO2qvwV1IO/8aZzU0uZMR2tumMSiWJlUIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=OB2TcNyYs7mIWM9BlOMIosF5i1XR+g1qe5r6oEeUD4Bfmi4bYjfcc7F09On9m+3maYWkse+pTe5wjvK5bDdzPmvQct1pkC2QuRn01+1kYLwddzteRYC3oxhY1S8zfZFizOM5pXxrDRAhtlEvPsjdIf5y+qBWCtKVpTpoV/sjbSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MvHVw9iG; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MvHVw9iG"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so6642985e9.3
        for <linux-csky@vger.kernel.org>; Thu, 22 Jan 2026 02:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769078620; x=1769683420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j0CRLAaM9RCahJaw7qWL++ooA7vv8R4s+eYUvhv27Ts=;
        b=MvHVw9iGsygPbpN/hNOBEoB2GTXgfRyWdBpiHXFG0Yh+TJ+NUFRaTcT9LUTOpp374u
         uAEr0V6BvStRTc/LooAT99ZY4VI6wCS/wxu0o2z4oFolq1Cm+aC3Buep2ghK7qg7L5WR
         1/I+XR5R+YIWWOZiK+i1kxgQYuQnT2Dhq/eskQLdbzQwjUytVCBYAEgVYxS6ssD5qyoi
         sQykJ337S43O9X/XxCdLWGxZv6axXMpQf+dQhIq82qeetGzj0EGvUXe4XdUQxyOiZGPx
         CJWREKeWsejsIISSKesSx0+XdCm9hB6zXEdhpAoOIpbXBggfSPi1FGZV6sqZmf96XGKu
         5Zmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078620; x=1769683420;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j0CRLAaM9RCahJaw7qWL++ooA7vv8R4s+eYUvhv27Ts=;
        b=d4xWIHRczLR+foF1mmPnPLyXDFV4qmaApcG5P4EvdVoeYyhC1QKXEj2YNFIE5f3dNL
         8/AuP3d4zz8GIbuCJH7uZJu14eldIWwU9kkyEGFepTWBMn6FoJkI/blUfzxFnsGh3B3O
         grz09CAHE5Ix/tz56ZLDWuikWxJnwYjKxXj4rBbmnWDZGE0e5zSr+iM+eUGQvgHh/Gwc
         fBf8DI5+GODGtY+MEC2H4SgU60x1hqEsyWc1VPgtNF0w3ZCw4LnVqekU6eIoXrXgQWdR
         hYGCQ2VVkboSOdY/9RtxtI9gJOYkNwh/YcES0+YKtQ6C8msWr4GKfg5Ffd7gFJUUyCYc
         d3bg==
X-Forwarded-Encrypted: i=1; AJvYcCXcCxbYKJqYyBhV2VwxR0S+5KgFNU2i/Zk8uA6lRDRVv+LrkyzEY3oUC6xjXfRur4ifpY063qSurQGA@vger.kernel.org
X-Gm-Message-State: AOJu0YzVAlgsoib+jjEAZXie+o8O7EzhICZVym/4puwmAdAAsndaQuWU
	HFiJUlASSyhp8dyLjmdUzdYNkE7q65eZ8SQtVpj7sew6nCWzH5I9VN6nPRdAvp4yd2I=
X-Gm-Gg: AZuq6aKzPCdsLmjhl6pLqMMSB6aWMZ1A0hycxqVsOD47bHKK4R09uokOd+pG/cnduMb
	f3YZKSqJeeTBTqGgvmAXjrZeSTRuMO613046pJXuhazbIkmNwBchWUm7Lj0FODS8/rptmCAv/0L
	l14712skRzn5zwaK8HWEs+E43z6XEC4OYwY1pL0+iTq7tTBnnSemr5Uq11cpGxf+qkfgoNhsY9W
	dkoOurKnYbL1bXBCjic6hBO8ciTYyxk7E1lUKPKxwEINnVPE2+4Ngqk/R5kM8pWQiywwEosgFcq
	/ZwTBNGBnNp+1EEfgeg6CMLlDf5dYCo4rBj4tS/mELAYcYmx1ZSCNc4Ho4UIdgVk2G92TPOv5ZP
	clT9cqofFKJPMrjU1JRRBLY1sVCekAvFVERrpykG2d3YrMKRVrqutmKslrAawReLVM+Li4DMw4q
	XMCKxMyOsteisOOpCF
X-Received: by 2002:a05:600c:674f:b0:477:9b35:3e49 with SMTP id 5b1f17b1804b1-4801eaba084mr256056335e9.3.1769078620209;
        Thu, 22 Jan 2026 02:43:40 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804703b90bsm68693945e9.6.2026.01.22.02.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 02:43:39 -0800 (PST)
Message-ID: <9fd8375c-2de7-4305-ac3e-42ff8f919964@linaro.org>
Date: Thu, 22 Jan 2026 10:43:38 +0000
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/11] perf annotate arch clean up
To: Ian Rogers <irogers@google.com>
References: <20260122073127.375139-1-irogers@google.com>
Content-Language: en-US
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
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260122073127.375139-1-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 22/01/2026 7:31 am, Ian Rogers wrote:
> 2 initial memory leak fix patches for perf annotate.
> 
> Move the disasm.c #included arch files into a new util/annotate-arch
> directory. Make the code compile standalone. Try to better encapsulate
> architecture specific code within the files and with a
> arch__new_<arch> function that allows additional data to be associated
> with the struct arch using the standard container_of trick.
> 
> Make the lookup of struct arch use the ELF machine gather from a
> thread rather than an evsel. For example, the evsel can't determine
> the difference between EM_386 and EM_X86_64 so generally the latter
> has currently been used. This means the dwarf registers are off as
> register 1 is CX with EM_386 and DX with EM_X86_64. To facilitate this
> change map_symbol is refactored to use a struct thread rather than a
> struct maps, the maps being obtainable from the thread.
> 
> To make in and out arguments clearer, for safety, etc. try to constify
> struct arch and its related structs.
> 

Hi Ian,

I get this crash, not sure which commit causes it exactly but it 
happened 2/2 times on both x86 and arm:

  $ perf record -- true
  $ perf report

  < Select first sample >
  < Select annotate >

perf: Segmentation fault
-------- backtrace --------
     #0 0x5df8f58ba973 in ui__signal_backtrace setup.c:110
     #1 0x74373a642520 in __restore_rt libc_sigaction.c:0
     #2 0x5df8f5963f0d in dso__kernel dso.h:532
     #3 0x5df8f5965d0a in __map__const_kmap map.c:627
     #4 0x5df8f5965a36 in map__rip_2objdump map.c:531
     #5 0x5df8f58e5bef in symbol__parse_objdump_line disasm.c:1032
     #6 0x5df8f58e498b in symbol__disassemble_objdump disasm.c:1503
     #7 0x5df8f58e3852 in symbol__disassemble disasm.c:1621
     #8 0x5df8f58c638d in symbol__annotate annotate.c:1055
     #9 0x5df8f58c8628 in symbol__annotate2 annotate.c:2209
     #10 0x5df8f58a36b7 in __hist_entry__tui_annotate annotate.c:1189
     #11 0x5df8f58adf86 in do_annotate hists.c:2488
     #12 0x5df8f58ad762 in evsel__hists_browse hists.c:3441
     #13 0x5df8f58b78f2 in perf_evsel_menu__run hists.c:3556
     #14 0x5df8f58adabc in __evlist__tui_browse_hists hists.c:3643
     #15 0x5df8f58abf3b in evlist__tui_browse_hists hists.c:3691
     #16 0x5df8f571ac3a in report__browse_hists builtin-report.c:688
     #17 0x5df8f5719943 in __cmd_report builtin-report.c:1177
     #18 0x5df8f57181bc in cmd_report builtin-report.c:1890
     #19 0x5df8f57b5c3a in run_builtin perf.c:348
     #20 0x5df8f57b53b3 in handle_internal_command perf.c:398
     #21 0x5df8f57b5b2f in run_argv perf.c:445
     #22 0x5df8f57b5091 in main perf.c:551
     #23 0x74373a629d90 in __libc_start_call_main libc_start_call_main.h:58
     #24 0x74373a629e40 in __libc_start_main@@GLIBC_2.34 libc-start.c:128
     #25 0x5df8f56ead35 in _start perf[55d35]


> Ian Rogers (11):
>    perf maps: Fix reference count leak in maps__find_ams
>    perf annotate: Fix args leak of map_symbol
>    perf disasm: Constify use of struct arch
>    perf disasm: Constify use of struct ins_op
>    perf disasm: Constify use of struct ins
>    perf disasm: Rework the string arch__is to use the ELF machine
>    perf disasm: Don't include C files from the arch directory
>    perf disasm: Refactor ins__is_call/jump to avoid exposing arch ins_ops
>    perf map_symbol: Switch from holding maps to holding thread
>    perf disasm: Refactor arch__find and initialization of arch structs
>    perf disasm: Minor layout tweaks for struct arch
> 
>   tools/perf/arch/arc/annotate/instructions.c   |  11 -
>   .../perf/arch/riscv64/annotate/instructions.c |  36 --
>   tools/perf/ui/browsers/annotate.c             |   6 +-
>   tools/perf/ui/browsers/hists.c                |   3 +-
>   tools/perf/util/Build                         |   1 +
>   tools/perf/util/addr_location.c               |   4 -
>   tools/perf/util/addr_location.h               |   1 -
>   tools/perf/util/annotate-arch/Build           |  11 +
>   tools/perf/util/annotate-arch/annotate-arc.c  |  18 +
>   .../annotate-arch/annotate-arm.c}             |  48 +-
>   .../annotate-arch/annotate-arm64.c}           |  59 +--
>   .../annotate-arch/annotate-csky.c}            |  29 +-
>   .../annotate-arch/annotate-loongarch.c}       |  57 ++-
>   .../annotate-arch/annotate-mips.c}            |  29 +-
>   .../annotate-arch/annotate-powerpc.c}         | 125 +++++-
>   .../util/annotate-arch/annotate-riscv64.c     |  41 ++
>   .../annotate-arch/annotate-s390.c}            |  59 ++-
>   .../annotate-arch/annotate-sparc.c}           |  26 +-
>   .../annotate-arch/annotate-x86.c}             |  89 ++--
>   tools/perf/util/annotate-data.c               |  12 +-
>   tools/perf/util/annotate-data.h               |   2 +-
>   tools/perf/util/annotate.c                    |  88 ++--
>   tools/perf/util/annotate.h                    |  10 +-
>   tools/perf/util/callchain.c                   |  12 +-
>   tools/perf/util/capstone.c                    |  18 +-
>   tools/perf/util/db-export.c                   |   1 -
>   tools/perf/util/disasm.c                      | 424 +++++++-----------
>   tools/perf/util/disasm.h                      |  95 ++--
>   tools/perf/util/event.c                       |   2 -
>   tools/perf/util/hist.c                        |  18 +-
>   tools/perf/util/llvm.c                        |   8 +-
>   tools/perf/util/machine.c                     |  13 +-
>   tools/perf/util/map_symbol.c                  |   5 +-
>   tools/perf/util/map_symbol.h                  |   3 +-
>   tools/perf/util/maps.c                        |   1 +
>   tools/perf/util/sort.c                        |   2 +-
>   tools/perf/util/unwind-libdw.c                |   2 +-
>   tools/perf/util/unwind-libunwind-local.c      |   2 +-
>   38 files changed, 752 insertions(+), 619 deletions(-)
>   delete mode 100644 tools/perf/arch/arc/annotate/instructions.c
>   delete mode 100644 tools/perf/arch/riscv64/annotate/instructions.c
>   create mode 100644 tools/perf/util/annotate-arch/Build
>   create mode 100644 tools/perf/util/annotate-arch/annotate-arc.c
>   rename tools/perf/{arch/arm/annotate/instructions.c => util/annotate-arch/annotate-arm.c} (59%)
>   rename tools/perf/{arch/arm64/annotate/instructions.c => util/annotate-arch/annotate-arm64.c} (70%)
>   rename tools/perf/{arch/csky/annotate/instructions.c => util/annotate-arch/annotate-csky.c} (67%)
>   rename tools/perf/{arch/loongarch/annotate/instructions.c => util/annotate-arch/annotate-loongarch.c} (66%)
>   rename tools/perf/{arch/mips/annotate/instructions.c => util/annotate-arch/annotate-mips.c} (59%)
>   rename tools/perf/{arch/powerpc/annotate/instructions.c => util/annotate-arch/annotate-powerpc.c} (73%)
>   create mode 100644 tools/perf/util/annotate-arch/annotate-riscv64.c
>   rename tools/perf/{arch/s390/annotate/instructions.c => util/annotate-arch/annotate-s390.c} (70%)
>   rename tools/perf/{arch/sparc/annotate/instructions.c => util/annotate-arch/annotate-sparc.c} (85%)
>   rename tools/perf/{arch/x86/annotate/instructions.c => util/annotate-arch/annotate-x86.c} (93%)
> 

