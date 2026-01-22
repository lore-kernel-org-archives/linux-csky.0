Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC48E3A7E05
	for <linux-csky@vger.kernel.org>; Thu, 22 Jan 2026 21:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769117736; cv=none; b=BBRaZmbTre5WdlCXsM2gS0r1K5mu3IztFJ5hHMtHiKnFX25uaPG/ZMnjoA4VUa66q+W+t/cs1V8c67pjgccjk5hNt+8wclgNgmT6BGgBQFInRh6usyV+1aoyKNnlUnxZennPcgh1QFV1LHliqjbENqMwiHTrap5d3bzxGxEOY/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769117736; c=relaxed/simple;
	bh=WqOiFcX/heg3IGph3C/ogbRzFLpcL0diaA21e5ry5lo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=creTBQcD+zncYMOxZ6NBkd0bJx1pGxg3TIRp07Kx4OEfWUOENKa6zgBZ3ZCnTG02oCNrjgRI9dXuyO1idyNDNZtON8/vRI5CNwJTZiL9A0cIYxPABd1IQy/9hfeSyOsaoVavRsDKD440E13OYESlx+UN9ot6ezG+wMgNx2CG6FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1Y8nq/S7; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1Y8nq/S7"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2b71c5826fbso1481501eec.1
        for <linux-csky@vger.kernel.org>; Thu, 22 Jan 2026 13:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769117729; x=1769722529; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DnbHjkP7sr2MY8dvLIuI6wPgadGKGFiX6WTYohRo5Kw=;
        b=1Y8nq/S7wN0VV3NB0L8PwHjj08D3Y9JAraVXXMj6G/a76O2pZxgMPKygDo7kVYZOHj
         JgkWrADou6WXqOvhWxo3jf0iSbLAJaLH8F7jmRmMXL9wLICY2H/3+BkgFHwTnnf4gzF9
         DpBbtiRxiB47KT3qNFvFt7bTvVmITCnZVHRNjfonbwiSNeRs8pqvuHkSIeiX7eFvi0Vw
         yZlvsjOVqJZ1oAVBZLO6ltwjY1N4yUoD0bbeLoAo/A/EsSV0Zu9zBYjGgqnJqgTjOSq5
         6qX7pZxUDZJd/3JbvKFrB/w05O381VUMhDmxgBSzBCuA+imfuhgEp58v3u9mujeL5mo1
         NRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769117729; x=1769722529;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DnbHjkP7sr2MY8dvLIuI6wPgadGKGFiX6WTYohRo5Kw=;
        b=uGnuS4t/B+PtRnCQ0OjNcF73+imVSiak1tP+r7grqSSJKxFOdlilNS1ErJE1aFPdKE
         2Kob5mM7WXJaAeHI6upzfvc/b33VW/14vNoKitcItLhAN9N5dQCSmHAsxxUMlekfxlGK
         PU0I8m5X0WAzXz3pofHuIu3O78e8Pk4qQ5ZWQwzHX8gfhLk/z8JrtkDGJBvNpRstVFzb
         AFpU+b9ktmt36WV17Etu474y2Hv3j1CyrXiy886H1qSixdLJBp3Vf9pTmcBDpe+gTBa8
         wVWnhzeX2xDIWN7NWoZH/4fp1hqw9ezsLYzaKNJ0P5F1XtG9bdF4IUi6/i/rJEqz4p7a
         OtmA==
X-Forwarded-Encrypted: i=1; AJvYcCUfF3utiOQtkQhzE3GV/TWLHJOOmvKaGktCoIU4Fh4dKW5ftF3pmZ7HW5tHaxg1uDN5rHm2myGr1/mO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1wxHCjxO6k2CQaq8vZK+KSOqZt4i/c4yaGOZe3mg/7Z1aaUmE
	LuaWKc70wBzfwzJIa2TekZyjquMqYfpsquQs2PcygS2xC9pJIwNZge/KCqa3n31RlbO/iCIwzgX
	W6Hl7rMdsUw==
X-Received: from dycok8.prod.google.com ([2002:a05:7301:db08:b0:2ac:32e7:3ccd])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:4084:b0:2b7:2263:3d3c
 with SMTP id 5a478bee46e88-2b739b6d29fmr262486eec.24.1769117728705; Thu, 22
 Jan 2026 13:35:28 -0800 (PST)
Date: Thu, 22 Jan 2026 13:35:07 -0800
In-Reply-To: <20260122213516.671089-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260122213516.671089-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122213516.671089-4-irogers@google.com>
Subject: [PATCH v3 03/12] perf maps: Fix reference count leak in maps__find_ams
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

ams and so ams->ms.map is an in argument, however, it is also
overwritten. As a map is reference counted, ensure a map__put is done
before overwriting it.

Signed-off-by: Ian Rogers <irogers@google.com>
Fixes: 42fd623b58db ("perf maps: Get map before returning in maps__find")
---
 tools/perf/util/maps.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/util/maps.c b/tools/perf/util/maps.c
index 8ccc46d515b6..4092211cff62 100644
--- a/tools/perf/util/maps.c
+++ b/tools/perf/util/maps.c
@@ -708,6 +708,7 @@ int maps__find_ams(struct maps *maps, struct addr_map_symbol *ams)
 	if (ams->addr < map__start(ams->ms.map) || ams->addr >= map__end(ams->ms.map)) {
 		if (maps == NULL)
 			return -1;
+		map__put(ams->ms.map);
 		ams->ms.map = maps__find(maps, ams->addr);
 		if (ams->ms.map == NULL)
 			return -1;
-- 
2.52.0.457.g6b5491de43-goog

