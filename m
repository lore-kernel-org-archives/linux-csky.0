Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2923B8BD8
	for <linux-csky@vger.kernel.org>; Thu, 22 Jan 2026 21:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769117738; cv=none; b=icQ7Gr2wCi7UrSfwr+USgJ/WBgUrCASiSPwgtzk2SPkS1naMcESy+YGseJXJBqrZNv9BceJpKkNZS7RS6eGIdwCCUBFZemkZ1iDizo8l4+We83mtppB3Fmp3tcjF5ZWNDMnLtbdoaAnFB0tBOmpSYJcGWf0/AHoLLf6hHqoCazY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769117738; c=relaxed/simple;
	bh=HROS/LsQhXiqK5xk7LqdyKPQt+HgIYbzmD0lD0XdWu4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=os5gW8gFAhsgLKc1IJQ/Ac0x6Vp6sTcElpq6KWB26Zmm+wY0KIx8+PRzmtgIlhoEVgkWmj4x477jIZv1XLnTxjl161+EQ5sCHgLPBTrI1I6zl7ku5MMh+oQQ/h1zr0aSwcW9JlHbcy0KS1hJY0k1dYAsU4JYYSqZoCRgXfWBEFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1KllpoRl; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1KllpoRl"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2b6f0b345e3so7790438eec.0
        for <linux-csky@vger.kernel.org>; Thu, 22 Jan 2026 13:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769117723; x=1769722523; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZjxarqoXVmrnwFoXxcECDiv8CYdTI3p8aLn4Yna1I44=;
        b=1KllpoRlPPn2CuTsg0o+j502Vo+0zUzmNY74Vs++qW50DN5PrU+ZmQSg0yBSxve5T3
         c+Um3aPrz+kYLh2yA3M3R9/rywy1rKMyl/FD9JUi8sq5Krh3AIU1M1ZIgvE/hnGj9QM7
         tVKqu9djXGC13O3vmbH/pSuMgfQPNv5OuZOZTo6YASzkSngttgkIde5qNLIOXMrjuqAz
         BARqQJ2VsgHnsxAsL/FOmZbYIFf/mQSMjlz0Khl2s1gYXMQebuOKlO0zhFs9uhMzjb5O
         FInqxmRkUHd9NKaB6IMc3MQhgCX5xOwGWxP4TRXBRCfbWP/CRjLzvzFtG1b6oksHOrb1
         7ybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769117723; x=1769722523;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZjxarqoXVmrnwFoXxcECDiv8CYdTI3p8aLn4Yna1I44=;
        b=O/74bMaZNJh5uIjOSsQvk/MfC663Y9iLjvjN/+Q9Tupsh+0nS6+G0C2YOtTeNdSVc5
         qjlsvuwhrEBL+UzChIaRlK5+7AuX5x0qwOQIL6GKL6ZBAdlFds9SmnZojzeRfhiPXA0v
         26aKZyzpCubqOWi5+H7czY8s6I+R8upebzlwzieA5MroUGYtpwphhrm54QU3rGGhq7Ot
         DySZxqmqE/5TpptrtvIsV4F5iWViDfJzVHWm59AZ6DcyKlo6/p5OPt0e50EzlNHFsJN1
         4C3bL3h2vi5ksEfE7rFuuHcrAVjbpuj+7eRh3X53qMu1kzOLBu7s7CU6iNswbOqsyKlT
         1DsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyIZTe2e6q4r5SsEnFkKQLRIuSh5DJFsb9x5c+L0Y1BX6ZK/fgfET8bSQyjgzc84mFL95HO0mhPMoz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9ykVLboY7nRMPnPvXCuH5R742/XXelSNNzJlKzFlI3FHftAwS
	33LlyALMmhHyohA2mW50OS/0mSOl9+1FIjembQO3R6WOx0XfrW7wl0SL5l7mwLQZmjxAqJH/0V/
	Pm9qux7mfUw==
X-Received: from dycph3.prod.google.com ([2002:a05:7300:dd43:b0:2b7:b7:1269])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:6094:b0:2ae:5d5b:4ed0
 with SMTP id 5a478bee46e88-2b739b751e6mr408223eec.21.1769117723263; Thu, 22
 Jan 2026 13:35:23 -0800 (PST)
Date: Thu, 22 Jan 2026 13:35:04 -0800
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122213516.671089-1-irogers@google.com>
Subject: [PATCH v3 00/12] perf annotate arch clean up
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Zecheng Li <zecheng@google.com>, 
	Tianyou Li <tianyou.li@intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Julia Lawall <Julia.Lawall@inria.fr>, Suchit Karunakaran <suchitkarunakaran@gmail.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Howard Chu <howardchu95@gmail.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Shimin Guo <shimin.guo@skydio.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

3 initial memory leak fix patches for perf annotate.

Move the disasm.c #included arch files into a new util/annotate-arch
directory. Make the code compile standalone. Try to better encapsulate
architecture specific code within the files and with a
arch__new_<arch> function that allows additional data to be associated
with the struct arch using the standard container_of trick.

Make the lookup of struct arch use the ELF machine gather from a
thread rather than an evsel. For example, the evsel can't determine
the difference between EM_386 and EM_X86_64 so generally the latter
has currently been used. This means the dwarf registers are off as
register 1 is CX with EM_386 and DX with EM_X86_64. To facilitate this
change map_symbol is refactored to use a struct thread rather than a
struct maps, the maps being obtainable from the thread.

To make in and out arguments clearer, for safety, etc. try to constify
struct arch and its related structs.

v3: Fix arch initialization on arm, arm64, powerpc and sparc as spotted by Suchit
    Karunakaranw.

v2: Add a patch to fix a domain info memory leak that was blocking
    leak sanitizer analysis. Fix more map_symbol leaks or uses after
    reference count put (Suchit Karunakaranw
    <suchitkarunakaran@gmail.com>).  Try to repro annotate test crash
    (James Clark) but suspect it was addressed in the other reference
    count fixes.
    https://lore.kernel.org/lkml/20260122165407.561888-1-irogers@google.com/

v1: https://lore.kernel.org/lkml/20260122073127.375139-1-irogers@google.com/

Ian Rogers (12):
  perf header: Fix memory leaks in process_cpu_domain_info
  perf annotate: Fix args leak of map_symbol
  perf maps: Fix reference count leak in maps__find_ams
  perf disasm: Constify use of struct arch
  perf disasm: Constify use of struct ins_op
  perf disasm: Constify use of struct ins
  perf disasm: Rework the string arch__is to use the ELF machine
  perf disasm: Don't include C files from the arch directory
  perf disasm: Refactor ins__is_call/jump to avoid exposing arch ins_ops
  perf map_symbol: Switch from holding maps to holding thread
  perf disasm: Refactor arch__find and initialization of arch structs
  perf disasm: Minor layout tweaks for struct arch

 tools/perf/arch/arc/annotate/instructions.c   |  11 -
 .../perf/arch/riscv64/annotate/instructions.c |  36 --
 tools/perf/ui/browsers/annotate.c             |   6 +-
 tools/perf/ui/browsers/hists.c                |   3 +-
 tools/perf/util/Build                         |   1 +
 tools/perf/util/addr_location.c               |   4 -
 tools/perf/util/addr_location.h               |   1 -
 tools/perf/util/annotate-arch/Build           |  11 +
 tools/perf/util/annotate-arch/annotate-arc.c  |  18 +
 .../annotate-arch/annotate-arm.c}             |  50 +-
 .../annotate-arch/annotate-arm64.c}           |  59 +--
 .../annotate-arch/annotate-csky.c}            |  29 +-
 .../annotate-arch/annotate-loongarch.c}       |  71 +--
 .../annotate-arch/annotate-mips.c}            |  29 +-
 .../annotate-arch/annotate-powerpc.c}         | 127 +++++-
 .../util/annotate-arch/annotate-riscv64.c     |  41 ++
 .../annotate-arch/annotate-s390.c}            |  70 +--
 .../annotate-arch/annotate-sparc.c}           |  28 +-
 .../annotate-arch/annotate-x86.c}             |  89 ++--
 tools/perf/util/annotate-data.c               |  12 +-
 tools/perf/util/annotate-data.h               |   2 +-
 tools/perf/util/annotate.c                    |  88 ++--
 tools/perf/util/annotate.h                    |  10 +-
 tools/perf/util/callchain.c                   |  12 +-
 tools/perf/util/capstone.c                    |  18 +-
 tools/perf/util/db-export.c                   |   1 -
 tools/perf/util/disasm.c                      | 428 +++++++-----------
 tools/perf/util/disasm.h                      |  95 ++--
 tools/perf/util/event.c                       |   2 -
 tools/perf/util/header.c                      |  17 +-
 tools/perf/util/hist.c                        |  18 +-
 tools/perf/util/llvm.c                        |   8 +-
 tools/perf/util/machine.c                     |  13 +-
 tools/perf/util/map_symbol.c                  |   5 +-
 tools/perf/util/map_symbol.h                  |   3 +-
 tools/perf/util/maps.c                        |   1 +
 tools/perf/util/sort.c                        |   2 +-
 tools/perf/util/unwind-libdw.c                |   2 +-
 tools/perf/util/unwind-libunwind-local.c      |   2 +-
 39 files changed, 775 insertions(+), 648 deletions(-)
 delete mode 100644 tools/perf/arch/arc/annotate/instructions.c
 delete mode 100644 tools/perf/arch/riscv64/annotate/instructions.c
 create mode 100644 tools/perf/util/annotate-arch/Build
 create mode 100644 tools/perf/util/annotate-arch/annotate-arc.c
 rename tools/perf/{arch/arm/annotate/instructions.c => util/annotate-arch/annotate-arm.c} (59%)
 rename tools/perf/{arch/arm64/annotate/instructions.c => util/annotate-arch/annotate-arm64.c} (70%)
 rename tools/perf/{arch/csky/annotate/instructions.c => util/annotate-arch/annotate-csky.c} (67%)
 rename tools/perf/{arch/loongarch/annotate/instructions.c => util/annotate-arch/annotate-loongarch.c} (60%)
 rename tools/perf/{arch/mips/annotate/instructions.c => util/annotate-arch/annotate-mips.c} (59%)
 rename tools/perf/{arch/powerpc/annotate/instructions.c => util/annotate-arch/annotate-powerpc.c} (73%)
 create mode 100644 tools/perf/util/annotate-arch/annotate-riscv64.c
 rename tools/perf/{arch/s390/annotate/instructions.c => util/annotate-arch/annotate-s390.c} (66%)
 rename tools/perf/{arch/sparc/annotate/instructions.c => util/annotate-arch/annotate-sparc.c} (85%)
 rename tools/perf/{arch/x86/annotate/instructions.c => util/annotate-arch/annotate-x86.c} (93%)

-- 
2.52.0.457.g6b5491de43-goog

