Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5547E3C1FF7
	for <linux-csky@vger.kernel.org>; Thu, 22 Jan 2026 21:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769117746; cv=none; b=cB6t38oQri/UCgW+mP5ysiQQFo8M+mFR9MwasIpNbmrTVwUw4Mp2IdNn7do7jRoM1clcN2FVBOoypyYcdgKG1nFq0OjCFGCuvG5/GVHTQbV3bxxEgzKQLHyl9tX8LXdZtFC1xb/oh6RZkBdznqwCHpJEb2kbEHmGL4asXGEKYFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769117746; c=relaxed/simple;
	bh=/4t52AvyWDIvlIx3zdnelq0uOogrQvoAgZggoWjNLIQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=pPSzDVsAB6G2svg+ThrMGsXTjlIBwGOE8G779LZFztBAo8DMY3CK8BzrVbKlcURcFdRlziPNvOuLtBd071Wg5hx0ERgBm1S2hOcssjC6XXLlZAFiBl0FjXCFplJa6i5SHBrpn03NhyNpgIWwcMJ/i/G1v7hiEvUQeCcmZ4crnf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K5X30jG6; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K5X30jG6"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2b708fa4093so4324912eec.0
        for <linux-csky@vger.kernel.org>; Thu, 22 Jan 2026 13:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769117741; x=1769722541; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xlxy7gGNB7fnsuI8qX0WFdpap2bNeW5xmXABoxpIzho=;
        b=K5X30jG6zcPq+d8xQn4tUPtcYCXPCiWMyKIuIMN0F0vRqs3PL3F4tXC4W/UjKib34I
         VJD6KVgHhaGq13IYvxk7i5kgFdUaER47vwbYS2V7fhLadKI3EB1q4xv/20W4btJxsejL
         zGe4bv+5Y6MhcAVYR+VAWfi774hcowZmQcGyNL3bI5S7+uVLrGJ2MCClOYmXXWm78d30
         WwC2n8b9FagDgjmO4KMcJcKB8hgVnEov7FyxXF7hbsQgLSE2gDGFW2Qt8buQBbAfColw
         JyYyDisdAYVKV37iSY2dERtDNyrCiK18EhH7zkYbgaIYk3dIO35HRtKgvwt0UJz0b2gs
         TUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769117741; x=1769722541;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xlxy7gGNB7fnsuI8qX0WFdpap2bNeW5xmXABoxpIzho=;
        b=CLsEXxIdblx/gUXIppZW38eUo4L50Uq1IPCMpw/1qPrzl5oXvC9r76PO7JhU1ZC9Kf
         eEB98kXtbjpLti/k6afq+KJSLVEYofQDN262bLPRbS5UREXumt2pQlkTXJ7cNlKK9TOY
         Z1L4ZUBHb8jYlYnk49Ljmrt4EmBaYfqeyZrLR45eC4IMpnS4694ChhegoJ80oIunMOhj
         MVT0C1gyuYPpKPxd1makKn6fEBIPiUXM+QIqDi8VZiMZQpgEZOhSROXQzE4xlzpMRs+Y
         i+U/23f56kKsokcOqQUXovrx+G8anFH8n1q+DjguYRsT/wZqcS11tmntN9TNd9vVqW+D
         Tqgg==
X-Forwarded-Encrypted: i=1; AJvYcCW/wiGvW1uzcli/hy37Aqhop4DBohL3xqOoeMjKMKxjIK8YfaQ0qF66BWFgEkRMvGOYk/u8IM+Q6ORI@vger.kernel.org
X-Gm-Message-State: AOJu0YwKcPMIGyCVUDcFUg/WuMLUv0do2+u3b49k/BT3Bj0JAmYB3ghK
	InuAuZpF9hFsJ3JtnHM9s9LXrqCcRWAUyF6XvFW/JX7mS5qgFu2cNRgvcuE4wku/e7zlY3nRCYt
	bPC+o0wuaPA==
X-Received: from dybqo12.prod.google.com ([2002:a05:7301:678c:b0:2b6:b6b8:7fee])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:578e:b0:2ae:53da:9787
 with SMTP id 5a478bee46e88-2b739beb0bamr355131eec.40.1769117740757; Thu, 22
 Jan 2026 13:35:40 -0800 (PST)
Date: Thu, 22 Jan 2026 13:35:13 -0800
In-Reply-To: <20260122213516.671089-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260122213516.671089-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122213516.671089-10-irogers@google.com>
Subject: [PATCH v3 09/12] perf disasm: Refactor ins__is_call/jump to avoid
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
index 32df10f6fed5..79dc116ade2f 100644
--- a/tools/perf/util/annotate-arch/annotate-loongarch.c
+++ b/tools/perf/util/annotate-arch/annotate-loongarch.c
@@ -57,9 +57,10 @@ static int loongarch_call__parse(const struct arch *arch, struct ins_operands *o
 	return 0;
 }
 
-const struct ins_ops loongarch_call_ops = {
+static const struct ins_ops loongarch_call_ops = {
 	.parse	   = loongarch_call__parse,
 	.scnprintf = call__scnprintf,
+	.is_call   = true,
 };
 
 static int loongarch_jump__parse(const struct arch *arch, struct ins_operands *ops,
@@ -106,9 +107,10 @@ static int loongarch_jump__parse(const struct arch *arch, struct ins_operands *o
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
index 81db102b3e15..7b2d27b62e6b 100644
--- a/tools/perf/util/annotate-arch/annotate-s390.c
+++ b/tools/perf/util/annotate-arch/annotate-s390.c
@@ -57,9 +57,10 @@ static int s390_call__parse(const struct arch *arch, struct ins_operands *ops,
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
index 845c2d0f39b1..8c3e9094600a 100644
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

