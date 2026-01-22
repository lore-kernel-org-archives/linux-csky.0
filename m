Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFC3451049
	for <linux-csky@vger.kernel.org>; Thu, 22 Jan 2026 07:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769067117; cv=none; b=qnI83dzyYDo2ZBIEWsdiNiFECCH0zerOOvygI6enmwWV+dtNIK/MwsN4Iwn3Lu3wjw2n60E10eFf8xKbcIUKiTdfayrPtN0asNYebbUZXj2n4rofGWdhRwMj1MfROgTOjosAI+s1Jw+irE6Xo5qXB7K1RFbS7Ld2aKZ7fVbdBtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769067117; c=relaxed/simple;
	bh=p/53skaYkxw3FbY6a+zG/VnxhoQiWrk9vg0CARtxbUo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=SG5gMfOWkd+rk3lU/0xv6hLrmGypRX6SbcmIuj7OxXSdl/z66JbFePXaLGLD6pRv8xp81Pz3dxTsdZTSROMsRYpt2ufbYYrQch3rQCltgsz5TVgR1yvxQqZ2VRDs8CIOpQkO6AIdOBAlvi8EX3K9sMh9S5aRbFMRuTFaHXHhOQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SwAVxdMy; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SwAVxdMy"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-121b1cb8377so1458309c88.0
        for <linux-csky@vger.kernel.org>; Wed, 21 Jan 2026 23:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769067105; x=1769671905; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RuAcUlfLOH+Nmb5IOvdzZq6066CfyPFp8FPVv/E64Q8=;
        b=SwAVxdMyCSAc9RqvV05wFwSmWg0RGGbatx8oKkUF9aq0s2kDjuqTupnCriZf+oBMA9
         sfjeuDYPoZmRUKNfINrs9uLOfLL2EYqXb45EuWQgzVUnFRebln8PO8bsre4SKFTYMQ0a
         /DekiWPmQv/TvsyLEkvLErZF86Uj4fUjqnYxDUXaffcg48zELxlnrUXqZxQvba/O/4x7
         lTO9PS92hUeXrjXlvBpoq/3fLsoz03oyr95iTALhvbCYFS6EL2wdYsPbCgdgJndW/lJw
         S2I3khfXdWw4HOpF1XT1BSIOlFEl38jk0hGkot/kUb0RGhdlqakqwSXDvkyt0MMwqT87
         wDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067105; x=1769671905;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RuAcUlfLOH+Nmb5IOvdzZq6066CfyPFp8FPVv/E64Q8=;
        b=euK9qiUiAMFSdjmlfWc+H/nBY1rCI6eqpiHRcuBzzqSJl/u+tR4+iq2UIYN+ZOzcfS
         iz6YCW3NuF4hgVLbBDNtgAquLGR6kL/C/FbKGgCEihHD8rldCft1T5o7G0y3pdmSUnHF
         g2Hrp5IXGtoxsG72bdBGj1l7/Q4+9JAMQf7M1VN/QM3yDWjMy6CDtNpxBEuszRNDS2Eu
         pJHizPKGU+6vy0T36KM+OhQxUeq7RI76lI/n/O2sX6PEVtgCXMFUW6zMKFTEBQQT/Xuu
         HtObAbi1SulOYFjKCTVQgyimw5DsFOnRlC4pVaHOSKlzywDZ+PJzj+jpG066BD1ZtSlt
         094w==
X-Forwarded-Encrypted: i=1; AJvYcCXXKz972TwVq9/YGfhx5WLn8mnnVmXbnd/SwYbaEYkyBkSftpQ6lBzcGrob/5pJr2EbZjcsgXi+gaSV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+gbay05YKKAS71g+WqRVSXt2w01vcUS8UTxWTNs5wkd84OEmq
	aGJ7eHMdFsEW67ur7aFNgoB5anrVee1HasxAskMCZcQnjI1cL6pvxIxDYiuqTzqbZS+q7pheu3E
	U26j/jAp88w==
X-Received: from dlbep12.prod.google.com ([2002:a05:7022:108c:b0:11e:64d:cd3b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:eacf:b0:11a:fec5:d005
 with SMTP id a92af1059eb24-1246a95600emr5252743c88.10.1769067104935; Wed, 21
 Jan 2026 23:31:44 -0800 (PST)
Date: Wed, 21 Jan 2026 23:31:24 -0800
In-Reply-To: <20260122073127.375139-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260122073127.375139-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122073127.375139-9-irogers@google.com>
Subject: [PATCH v1 08/11] perf disasm: Refactor ins__is_call/jump to avoid
 exposing arch ins_ops
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

Add booleans indicating whether and ins_ops are call or jump and
return it. This avoids exposing loongarch and s390 ins_ops for the
sake of matching.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/annotate-arch/annotate-loongarch.c | 6 ++++--
 tools/perf/util/annotate-arch/annotate-s390.c      | 3 ++-
 tools/perf/util/disasm.c                           | 6 ++++--
 tools/perf/util/disasm.h                           | 5 ++---
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/tools/perf/util/annotate-arch/annotate-loongarch.c b/tools/perf/util/annotate-arch/annotate-loongarch.c
index 4bd651b63652..b95ae5d6657f 100644
--- a/tools/perf/util/annotate-arch/annotate-loongarch.c
+++ b/tools/perf/util/annotate-arch/annotate-loongarch.c
@@ -55,9 +55,10 @@ static int loongarch_call__parse(const struct arch *arch, struct ins_operands *o
 	return 0;
 }
 
-const struct ins_ops loongarch_call_ops = {
+static const struct ins_ops loongarch_call_ops = {
 	.parse	   = loongarch_call__parse,
 	.scnprintf = call__scnprintf,
+	.is_call   = true,
 };
 
 static int loongarch_jump__parse(const struct arch *arch, struct ins_operands *ops,
@@ -104,9 +105,10 @@ static int loongarch_jump__parse(const struct arch *arch, struct ins_operands *o
 	return 0;
 }
 
-const struct ins_ops loongarch_jump_ops = {
+static const struct ins_ops loongarch_jump_ops = {
 	.parse	   = loongarch_jump__parse,
 	.scnprintf = jump__scnprintf,
+	.is_jump   = true,
 };
 
 static
diff --git a/tools/perf/util/annotate-arch/annotate-s390.c b/tools/perf/util/annotate-arch/annotate-s390.c
index c1d06caa5f77..6d1a1da277e2 100644
--- a/tools/perf/util/annotate-arch/annotate-s390.c
+++ b/tools/perf/util/annotate-arch/annotate-s390.c
@@ -54,9 +54,10 @@ static int s390_call__parse(const struct arch *arch, struct ins_operands *ops,
 	return 0;
 }
 
-const struct ins_ops s390_call_ops = {
+static const struct ins_ops s390_call_ops = {
 	.parse	   = s390_call__parse,
 	.scnprintf = call__scnprintf,
+	.is_call   = true,
 };
 
 static int s390_mov__parse(const struct arch *arch __maybe_unused,
diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index c732b015f2e8..bc5323ecb5da 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -315,11 +315,12 @@ int call__scnprintf(const struct ins *ins, char *bf, size_t size,
 const struct ins_ops call_ops = {
 	.parse	   = call__parse,
 	.scnprintf = call__scnprintf,
+	.is_call   = true,
 };
 
 bool ins__is_call(const struct ins *ins)
 {
-	return ins->ops == &call_ops || ins->ops == &s390_call_ops || ins->ops == &loongarch_call_ops;
+	return ins->ops && ins->ops->is_call;
 }
 
 /*
@@ -469,11 +470,12 @@ const struct ins_ops jump_ops = {
 	.free	   = jump__delete,
 	.parse	   = jump__parse,
 	.scnprintf = jump__scnprintf,
+	.is_jump   = true,
 };
 
 bool ins__is_jump(const struct ins *ins)
 {
-	return ins->ops == &jump_ops || ins->ops == &loongarch_jump_ops;
+	return ins->ops && ins->ops->is_jump;
 }
 
 static int comment__symbol(char *raw, char *comment, u64 *addrp, char **namep)
diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
index 83503c5075f9..b6a2a30fdf27 100644
--- a/tools/perf/util/disasm.h
+++ b/tools/perf/util/disasm.h
@@ -93,6 +93,8 @@ struct ins_ops {
 			struct disasm_line *dl);
 	int (*scnprintf)(const struct ins *ins, char *bf, size_t size,
 			 struct ins_operands *ops, int max_ins_name);
+	bool is_jump;
+	bool is_call;
 };
 
 struct annotate_args {
@@ -139,9 +141,6 @@ bool ins__is_fused(const struct arch *arch, const char *ins1, const char *ins2);
 bool ins__is_ret(const struct ins *ins);
 bool ins__is_lock(const struct ins *ins);
 
-extern const struct ins_ops s390_call_ops;
-extern const struct ins_ops loongarch_call_ops;
-extern const struct ins_ops loongarch_jump_ops;
 const struct ins_ops *check_ppc_insn(struct disasm_line *dl);
 
 struct disasm_line *disasm_line__new(struct annotate_args *args);
-- 
2.52.0.457.g6b5491de43-goog

