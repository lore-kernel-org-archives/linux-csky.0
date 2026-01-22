Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3584336E49E
	for <linux-csky@vger.kernel.org>; Thu, 22 Jan 2026 16:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769100869; cv=none; b=KE43s8R/mWf2v3y3mkYuzks23zsfoLomJ4BD1fRyAgbmWvfF7B1HuAuMro+BPs9NiiU+3FTy5Do9rZMcLKu6tJKmIPQHWGrrkDWWBxEDEqevvxs0OlHrM6jtmw92IN0iIy7JidFovPjDMX6YjF3UMW60sxdTFZ4UgaaFQ6CyFLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769100869; c=relaxed/simple;
	bh=U3CxrbAAlN8gTA3wMaXLOq+KQ2KCxALBwEtyEmQVEng=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=dDgYtEkgANnX/UU9YDZR0i/fdH8kE0EFdlBwq/1KOZiFtU+B7ZtimybA+CiR1YmsXeKHihmrzXy9jdKdfV0ViGLYWQS67pd60zbo2o+gGiR5rhz0TutGc3IteAuRX4E47QBZxEyReBKwQphf92W1UEiZdtk35swytOTnlqZfToQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oEImuKVd; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oEImuKVd"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-121b1cb8377so2489707c88.0
        for <linux-csky@vger.kernel.org>; Thu, 22 Jan 2026 08:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769100856; x=1769705656; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zalmwLrK8cPj7cYoTUj/KkGE6/xfnap/Tev3VqTduZw=;
        b=oEImuKVdED36izjuwCT+ZZuLoE4ZtXRodRbC7Z5dfZhJO/A3UO/nxuoeLZmrvPq1n4
         UwUaOVfvYxuqxx/060C3wvyLW/AATEEx3HJwYmkZFlDVpCiUDp+6xMoCImKS/mZEkxuO
         58ZeIRXe83rbDmu0afEZGyIGIEnjUEAZFFInRRvK9XUCWoDBVbd/2BELtkrJbSffcvwm
         ojBHUKbVvZHtrPJJchO5hiydHyxNpp8dQQv5aSmAaGtpuE2jiQ9gPoNQupSpQPgBrSD0
         1Ulbu8dnaPpfeshjO/QmVhhl6agiPifTUsS/qugjs3WW/ncDmCmZpqxGPGis7OIHrY/p
         ANaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769100856; x=1769705656;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zalmwLrK8cPj7cYoTUj/KkGE6/xfnap/Tev3VqTduZw=;
        b=fPKyLf+09URqFMhbHBIqFvARYuluzcaiUKDWhDmZbGkk2W1vimqYtSMp6JoFL4rzrk
         4Imr01o2W9zdWi4sAUDBkkV7TwaZiihL3eC+DNyNUT2Ga4IXmfF/oe9L80oItHEyuhvW
         hvvj6IIdBUoNdZW2pUcaR1Y7dXkva4DOCVOXXnZ4NjE+fGAPsIofierou+iajGZ3kd52
         kIWMf1huvtXjlih3B+xtNVY3bgtpI5s7g3umIJ2YymTUnr0Fy5I4q8F9/7prt21h8aDA
         n275+0xM6TWfv2eZRubp4AOj97m+340zoQiQe9267w7byue2hwDLvsefqLj+1Zoey28c
         TVgA==
X-Forwarded-Encrypted: i=1; AJvYcCVfJwJkselKgpqPGEqvFDMQ94lhJ//mgCnl64Wzl2titbyWK9W02j3gJGuEDYP1rFY1DjrRjzbJWFk4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2/29lKifQSywGoQFTcXCU4s2+Y7/Xw5Tu4pDNYrAA4czHAoCw
	gSptlb1NN5ghFfbIK7CDjiJ7lKr+fipPd8HZYn7o2PgW9ozd5pFtvUaka6FQ9BBjgK1tS9hgjUa
	YpzyoW6L0NA==
X-Received: from dlbqj5.prod.google.com ([2002:a05:7022:ec05:b0:123:2b17:f461])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:4582:b0:11b:95fe:bee3
 with SMTP id a92af1059eb24-1246aabf3f6mr7269627c88.37.1769100856331; Thu, 22
 Jan 2026 08:54:16 -0800 (PST)
Date: Thu, 22 Jan 2026 08:53:56 -0800
In-Reply-To: <20260122165407.561888-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260122165407.561888-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122165407.561888-2-irogers@google.com>
Subject: [PATCH v2 01/12] perf header: Fix memory leaks in process_cpu_domain_info
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

