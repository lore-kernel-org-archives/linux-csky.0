Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49693DA5DC
	for <linux-csky@vger.kernel.org>; Thu, 23 Apr 2026 07:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776927653; cv=none; b=OfVtD7tddU//WXaKiwR81uwQxrEA+zKyPWMgK4ND6TFpEdL17CZqNY3ajElJNBDPSZS52yGLpUB6LRZdPrcU9V0JcpU66TAImumBKoSSGdt14CTEeXLvKa4TL54k7VgNjTJv/OLsLFSdR20OLPtFKpxOgdO2vqLsiaoggM/kI5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776927653; c=relaxed/simple;
	bh=NvVaZuTiqo4nhPYlRPnLw4qoY9n3uCs0iDruHZXLw44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DkspP1x7SEH9FN08xWKDwuhKtxFq7GaYjv9clL3QjI8PIJG3nJdSJWQ3rsMmz3MErAYclyR4F3CU5mASJ9hAMaN+BiYAr89N+4CkZy/fLYwVkRA9XYUcnPyUdoYICsta2WBo5Q8pIVKFn4kla0JNN4uhZj2Oh72TJn5VNzTkw0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DbHhG83n; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbHhG83n"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79a46ebe2beso65139427b3.2
        for <linux-csky@vger.kernel.org>; Thu, 23 Apr 2026 00:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776927651; x=1777532451; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vsWji0MqctKLH5RWyMnSGJ4CeDIPIJ8NnIIk/Ffp050=;
        b=DbHhG83nRoGi5F4SyoT+LJWDcghoNvrqBOlcxEmYoXIkGs29QWZZ4UkLxEcJQqrO8X
         0J5nG2YRbPXLvjPjAOACrBEC06XBCZ+sTZKQ4/8wUdXoT3XRr9YxZRwvg8g04sSW2p5D
         qYKrCv0+jaWfaIcG19nufvB0nNa+718KuCwqUaK7rGwwiiIjsSjWDkuuKmGYefORVWvU
         Zc8qH+ERcrlT4begguMmir7Lj9t/zZEJVx2pqqsYl6duvK9f5YmGXYLrAGF+JRfZLG1o
         FzaS1idglOHQeEPyTF4fsa0fTY1hqXRiJBpo8izrD1416ry3mypXpYeizWr9jbOW257W
         xE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776927651; x=1777532451;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vsWji0MqctKLH5RWyMnSGJ4CeDIPIJ8NnIIk/Ffp050=;
        b=jX9w2r7l90oGvuY2IUkwwNFHZqNiC0yTdBzJRwoi5RWb6KFjy+ovE19+MdU93HHL+Z
         W/raZXbIx1VS+R9jVD16HJ23d2wILCVt3sS1VZpG0ACoP/4pdeWw6CJSQ729qoIcBhds
         PCcoqMBMGu0I+7b1ONyW4WBy12RjTZBJ0x7nlpqJF1OTOjJqoi+zRqJpQbSPr2C5AfRy
         AjxAwU89ckhjQ/BfAjkrorpCmffS+s8+jY3DswuvmdtikwcEeFr8TtgkldMqqazmGHYB
         mS266KKFjbIgj+gjs0vW0FFLyibH+zZHqOY74b1g015y01JDtla7xMXYw1ntcm9CLriE
         4gFw==
X-Forwarded-Encrypted: i=1; AFNElJ9tamVMhj97HDoaCLCMLyK0jPDuMYD31GHuKoQJ0+tP3zVPTLlSyWUCQiSSLgrld3HFPuaEZhrC9SyI@vger.kernel.org
X-Gm-Message-State: AOJu0YwnVQRAzskYK7yseoHcbumDhz7tga9QQ4quCgg4RjBGVL+9xPu3
	FD1j7hnB33Ci4ajIqDcWgHdo6/JtAAvaxyAOlIBxGhAioZz/ExMkdJzb
X-Gm-Gg: AeBDieuhDBTk+3zb5XNd4Ci7y0hsZ3Iz6IPGY86zKRXhZJEbRsmbDrINYnAdES63YPz
	fWbBxjFc4nkNikF7ypztENzqCCQVES6YwScvnFyE+KHu3BHKQTWG5GEwTbQZCCnNvxpNy741tU5
	KSJPwdTnkgR3j10QJzPIb/ZYFdFoL2Xc4+A1LNnxnXnXFUA8oarSzR//zjvbjU/Dzsy9YOSgaC4
	72IazbKhjA+uQkMu57FXFUP+EjTR9cwHGyL8uJw8xhvhPuy8uqqsq9+K32FgdJZCRRX8TiZ21c5
	gScpA5awQbxWfDRRqDSMSJ0wZbuIfy6cfnR8ZC5jSaYwx6WdyctE97XC+heUpp1+yCLUMnn4u9g
	3sA72bZcYl4mQRdAceAqf7ZZ4ZNqdcWeGZAMf0vv7Fay39/oJavod6ZSU5yXp/mTCeNKkbkofYs
	Vquqev5rMcom3Jk9qt3PyJDndvng7x
X-Received: by 2002:a05:690c:d8d:b0:79a:7cff:7b81 with SMTP id 00721157ae682-7b9ecf8a0b3mr260371497b3.27.1776927650884;
        Thu, 23 Apr 2026 00:00:50 -0700 (PDT)
Received: from localhost ([172.216.252.33])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bb005abc7asm29906347b3.38.2026.04.23.00.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 00:00:48 -0700 (PDT)
Date: Thu, 23 Apr 2026 10:00:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>, Guo Ren <guoren@kernel.org>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] perf dwarf-regs: Fix off by one in
 __get_dwarf_regnum_for_perf_regnum_csky()
Message-ID: <aenDmXNIKdwdtMzn@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Change the > comparison >= to prevent an out of bounds access of
the dwarf_csky_regnumsp[] array.

Fixes: 8cac4013b0c2 ("perf dwarf-regs: Add csky perf to dwarf register number mapping functions")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
---
 tools/perf/util/dwarf-regs-arch/dwarf-regs-csky.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/dwarf-regs-arch/dwarf-regs-csky.c b/tools/perf/util/dwarf-regs-arch/dwarf-regs-csky.c
index cb44b774f8d9..4c586a5cb763 100644
--- a/tools/perf/util/dwarf-regs-arch/dwarf-regs-csky.c
+++ b/tools/perf/util/dwarf-regs-arch/dwarf-regs-csky.c
@@ -118,7 +118,7 @@ int __get_dwarf_regnum_for_perf_regnum_csky(int perf_regnum, unsigned int flags)
 	if (flags & EF_CSKY_ABIV2)
 		idx++;
 
-	if (perf_regnum <  0 || perf_regnum > (int)ARRAY_SIZE(dwarf_csky_regnums) ||
+	if (perf_regnum <  0 || perf_regnum >= (int)ARRAY_SIZE(dwarf_csky_regnums) ||
 	    dwarf_csky_regnums[perf_regnum][idx] == 0)
 		return -ENOENT;
 
-- 
2.53.0

