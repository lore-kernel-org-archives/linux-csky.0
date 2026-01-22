Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F87D36828A
	for <linux-csky@vger.kernel.org>; Thu, 22 Jan 2026 16:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769100891; cv=none; b=dhPlap1SymgswMQS73J4LzARKy0borKxsUaCBnEVBG0gKY7YyMThWERm7eRcfQyMQZHfTE0c22ZS+eRFp3O8SSl6uyW18ApwP7lzScFlWEDZwPGcAOUIv19cszpoziql6evW4C5Y++OFy4XPDaFS8vQlFDADQipSHb+lmbYCi/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769100891; c=relaxed/simple;
	bh=DNIcWZ9QKgcap8GIm+HHaS7sytvjKF8lN4kZaGLyU7M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=C5pUvCesgHOWLDj4030HM70wbSX86NnXRM/ptvDUoflH2zRTXqwJL38YZND569QYtjvOybGSWWTxZRHZp96w0bO3ojkqf3cM3gu7sZs+wWrtivN1YhyuIQtgucKBdTz+hnKN44k9tHywkiPK7doLzhLP3TXF+qqai0siWVlKk3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xt1PmwZs; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xt1PmwZs"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-1233893db9fso5138373c88.0
        for <linux-csky@vger.kernel.org>; Thu, 22 Jan 2026 08:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769100877; x=1769705677; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6zuXMW9ePaQZdk+//RX5ln7bDZ0bQbPZ3cyiYbZ9aMU=;
        b=xt1PmwZsaUx4dgkEzsUbAq8Wq3pjhpNJofXV83Ct6qieDEbvBOPY2UI/mTXdyghxT0
         f4sRXOmpmMPIe/o8THF+nmOuDhig9ghl+SkL+YSq0/rzdXw1FotT8tcVcyShI1KLp40X
         BmJFIB1O3NQR7S/bDNtJ+s0XGNftHQcanMg4vz1tm9icm7QtNdwOOfFDwv6BsnyP8BDY
         /5yeMoOAknT5XNXv5lCa+GqB/8C537g6Ubh1CS3SGRZC+Lg6ke34TDPFNxlrfICKmMHi
         aWDzS+KARNj1t3Qy2YfweAoFJpGSuk/3/sYYdNKRaH3O8okwaYS3V9nUtOFwZrzxFD+J
         ETJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769100877; x=1769705677;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6zuXMW9ePaQZdk+//RX5ln7bDZ0bQbPZ3cyiYbZ9aMU=;
        b=QhQFvx5/5xosgfuC39lAPD5X4zzMwoFTSjo8S7toOoRUVHO9n04cbN9HOxcHz3eCMQ
         8OowZzWCR4+EkGgvSW7pyrdZkf8plVVHzU8XLZSkJnyLavgdCJkkc6X2W2pNbbt//Bmh
         T8IX1dzuOcAm1eiDB3pu/xixomnSO9wUtGHBQ3a5wOap6xoqJkNL/kLcoH7FnZrH34oD
         9lh7zrefDnBCnMvDOSpEmt1psMq46LjAsO10219C+h+bT0r21K6eqwrvhcxLI7rLuR2A
         PLMSQvnC19p3uw15AG1HmcIadCi2OEobNmjwEnW7nRsAM3bEpC4OdzL7fP6uoUIB4yqx
         Q4bw==
X-Forwarded-Encrypted: i=1; AJvYcCVAQQIswvC2ZdcrwmcdDApo4P5bKxbMNcdXQeLiqqeI6/chXT1D9sQwqFNvnQbQUZtGDbO5DbbPyyfh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4NwnkK3Xu60V4xDM5owNaNVWW5zVv30lB254hViAZptguU5in
	+eyEXJsNZksAkQHyvNp88PCnABaqdsdSsIxoHODxtDhybUlFFMFhKVxf+4n2SHVnt+vYpGvwuO7
	OtvWgCFDYeg==
X-Received: from dlbph24.prod.google.com ([2002:a05:7022:3718:b0:121:766b:11e4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:b94:b0:11b:8f02:a876
 with SMTP id a92af1059eb24-1244a75eb07mr15601672c88.23.1769100877336; Thu, 22
 Jan 2026 08:54:37 -0800 (PST)
Date: Thu, 22 Jan 2026 08:54:07 -0800
In-Reply-To: <20260122165407.561888-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260122165407.561888-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122165407.561888-13-irogers@google.com>
Subject: [PATCH v2 12/12] perf disasm: Minor layout tweaks for struct arch
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

Pack some holes to bring down the overall struct size from 96 to 88
bytes.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/disasm.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
index 2793d48aa04e..6a1905f9d4fc 100644
--- a/tools/perf/util/disasm.h
+++ b/tools/perf/util/disasm.h
@@ -18,22 +18,22 @@ struct type_state;
 struct disasm_line;
 
 struct e_machine_and_e_flags {
-	uint16_t e_machine;
 	uint32_t e_flags;
+	uint16_t e_machine;
 };
 
 struct arch {
-	/** @id: ELF machine and flags associated with arch. */
-	struct e_machine_and_e_flags id;
 	/** @name: name such as "x86" or "powerpc". */
 	const char		*name;
 	const struct ins	*instructions;
 	size_t			nr_instructions;
 	size_t			nr_instructions_allocated;
-	bool			sorted_instructions;
 	const char		*insn_suffix;
 	unsigned int		model;
 	unsigned int		family;
+	/** @id: ELF machine and flags associated with arch. */
+	struct e_machine_and_e_flags id;
+	bool			sorted_instructions;
 	struct		{
 		char comment_char;
 		char skip_functions_char;
-- 
2.52.0.457.g6b5491de43-goog

