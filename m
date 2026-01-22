Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5357E38BF8D
	for <linux-csky@vger.kernel.org>; Thu, 22 Jan 2026 21:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769117735; cv=none; b=pVIkKSUS//CjLeLn2Km0Ar3rR2+KSl8nE3RsN0ymPOj4iBNjW4DmbtRAiEdkOFvwLrEetdrDe1k3P5fzftDRd1siQvKBAN4xYy8GLtpohkw4GhnAcPpI64TvKydtxgJlUjIzOPBV/DN+nurjtzM/T8FNO681REu/qPrFYVFcOVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769117735; c=relaxed/simple;
	bh=U3CxrbAAlN8gTA3wMaXLOq+KQ2KCxALBwEtyEmQVEng=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=IpjqQv0eaO3zJGQHmtoNipS2Dz6GZG6GMxCafuwt3KjmMukM5Y+vXp/ej7ioDGwqlCQlPS16BRaENopo3XczzD8BwQ0kvvAI8JQaQMuXd9viCT3zOrT1YnyNSlKBRy+QSn3UwBKy+4X6uBUdyqAAg1w1DIMKDzRGCemUgaXgE88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yANl44qH; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yANl44qH"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-1233b91de6bso2741381c88.1
        for <linux-csky@vger.kernel.org>; Thu, 22 Jan 2026 13:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769117725; x=1769722525; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zalmwLrK8cPj7cYoTUj/KkGE6/xfnap/Tev3VqTduZw=;
        b=yANl44qHNJ1er8muLcjEqtLhDdjFZ0Qq8NLCQ4MOZqLvuO2YBZDcaI34QXWTR80iLA
         JwK6cpBb4R/wsWd3ylbjM9lKcr20sjCnh01segm7L/GqGTekZleJ4PR8gclcqE5u57Vy
         J+j/tES/8RgQ6oVhmPeRIPX//WQoe8omlk5s0ODlTw/1AMOXa7hDUhlTYIWqEuZ2mcpi
         PxtrAdYIcBECIn3cMxBL71wtXrc6CsunxX744SQpdUQVW/5uVaYavUJRjsGL7lK4NBH8
         Ah+jCZuxoTc55Lv5Ojfmo3Tlk6kO4d1n3KjrddLnurV8zZVOipmO4BNuw6Mg1qucDPlA
         GwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769117725; x=1769722525;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zalmwLrK8cPj7cYoTUj/KkGE6/xfnap/Tev3VqTduZw=;
        b=V6OcHYMQ8Ho6qE57FoLZ5SnAXOsKoCFmiuncvOpve34vB8u+5WyvrexnZFoBBwpu3x
         VTSH7sCYVg3WwcSIwZkZ/B5WCfSBpFpzMiB6ugLxj5AE+g2rVEisWoBXq9Cet2fuP4Nk
         R/VvfNmH6ENd8ShSN/2p58GyczhciykCle6ZCAvBrCj2WmfuvNqjqFK+Xf6NmV7uOJKl
         jiRRGgNdsVR31mWwTG8xsIAFocw9zJBEUz6wgtinzaYkkRhs3kgnM26g6qfSBH+X5DCm
         D2qCM3oQIzhjZfKnkjkLtlxBP9xM+EtkUVVgp+9TiBJhS/aijMY0/Kmhs4JznO8b4BEU
         X6Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVlauH9UythQp7wFLmg2L1Me/PCbRCPPhJ8zfIhHW/vmiVPoZvQohkAv5VeP6dBGpm5czmQrjrxPenh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7ukUWPXQwMI0Q27G8jpL86za1zaacXKTjhsKddyzCx1wBEmvn
	kFPQGKu3kjgEBacc/ruvsLta/TJJe2ZTOtakrOX4dTKMZNFVXTE+OU0gNz2NC0nS3AAa2tcd98M
	8nSWoYJCOZg==
X-Received: from dlii17.prod.google.com ([2002:a05:7022:4191:b0:11d:cd2a:4c1b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:2397:b0:119:e56b:91ea
 with SMTP id a92af1059eb24-1247dbf80ecmr276440c88.27.1769117724953; Thu, 22
 Jan 2026 13:35:24 -0800 (PST)
Date: Thu, 22 Jan 2026 13:35:05 -0800
In-Reply-To: <20260122213516.671089-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260122213516.671089-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122213516.671089-2-irogers@google.com>
Subject: [PATCH v3 01/12] perf header: Fix memory leaks in process_cpu_domain_info
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

do_read_string returns a string in allocated memory, for some reason
there was unused memory allocations and unnecessary strdups. Remove
these and make the "perf annotate basic tests" leak sanitizer clean.

Signed-off-by: Ian Rogers <irogers@google.com>
Fixes: d40c68a49f69 ("perf header: Support CPU DOMAIN relation info")
---
 tools/perf/util/header.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/tools/perf/util/header.c b/tools/perf/util/header.c
index 9a15dd4b7640..eefd1cd73b6a 100644
--- a/tools/perf/util/header.c
+++ b/tools/perf/util/header.c
@@ -3634,6 +3634,7 @@ static int process_cpu_domain_info(struct feat_fd *ff, void *data __maybe_unused
 			if (!d_info)
 				return -1;
 
+			assert(cd_map[cpu]->domains[domain] == NULL);
 			cd_map[cpu]->domains[domain] = d_info;
 			d_info->domain = domain;
 
@@ -3642,30 +3643,20 @@ static int process_cpu_domain_info(struct feat_fd *ff, void *data __maybe_unused
 				if (!dname)
 					return -1;
 
-				d_info->dname = zalloc(strlen(dname) + 1);
-				if (!d_info->dname)
-					return -1;
-
-				d_info->dname = strdup(dname);
+				d_info->dname = dname;
 			}
 
 			cpumask = do_read_string(ff);
 			if (!cpumask)
 				return -1;
 
-			d_info->cpumask = zalloc(strlen(cpumask) + 1);
-			if (!d_info->cpumask)
-				return -1;
-			d_info->cpumask = strdup(cpumask);
+			d_info->cpumask = cpumask;
 
 			cpulist = do_read_string(ff);
 			if (!cpulist)
 				return -1;
 
-			d_info->cpulist = zalloc(strlen(cpulist) + 1);
-			if (!d_info->cpulist)
-				return -1;
-			d_info->cpulist = strdup(cpulist);
+			d_info->cpulist = cpulist;
 		}
 	}
 
-- 
2.52.0.457.g6b5491de43-goog

