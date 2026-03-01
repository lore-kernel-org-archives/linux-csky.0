Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81B21E0B86;
	Sun,  1 Mar 2026 01:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328927; cv=none; b=LchO47iKEyNfyC2/GfT31Y46bRHgBQLfNSBjfzC12V8MyYDtuPmz/lQO2VWNTm4wAfFfCqHrml5wEWeTI6gxQEnK6MzcPBHBStfm8l7XoCMXvo0c2a0uYO935tyQrMgXEZ5eWnuKa9sMzI5Hmqu3wr2fannfXH7NObbFpclqCDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328927; c=relaxed/simple;
	bh=u42aSAGT1EOnVA3gFIBvM8eteMYTac1kszC/znii7ws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hppVvJpPskqtvhmjuC7A96DKBUzQtmCrjZWP8D/v2108bCQZocmsCGnEQT2aTLfLsLmQ1kdB84m4SN5vvscpUMaVgc0+lfpoA4ZGqp2glSDplD4Zj4XnVwbJo/9+m4EKusdquzxhsHexlTn3qNhn02ADmvQYuMtBV03HM0boehg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p6ylCREW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p6ylCREW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97EEDC19421;
	Sun,  1 Mar 2026 01:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328927;
	bh=u42aSAGT1EOnVA3gFIBvM8eteMYTac1kszC/znii7ws=;
	h=From:To:Cc:Subject:Date:From;
	b=p6ylCREWmG6NncS6aorasZIwQ3O8bnWDoNP5tn9SVEYez4gKfYCl6K+KF+RklqVaS
	 bkm+T6OQ4HLs6xKWBsbecKhEzme9Im8eIuU9WBA2ajYJ9XzQ7G+UqrBAsmxp+ZrEn5
	 XWbUMd2Q/ZQizDVp+mpSAu7+ZZRAfM67Y1BL/vyykSSe2ygosaMIfUYUSt7oKNqYGm
	 v4VMFwn9innG/3g5T7W+EcC9vjYEDL3Rxd5kZsW7mXXV/KNE7TFdwcB7G+Tr2zpgqP
	 XULDYc88FA2D8kTnRkuaMrrn2QnN6mUMwfZi9BDdQFBbWAmUOfnlqgm+Yf3yiVqzGf
	 32f+jV4xIl9aw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	leo.yan@arm.com
Cc: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>,
	Thomas Voegtle <tv@lio96.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-csky@vger.kernel.org
Subject: FAILED: Patch "tools: Fix bitfield dependency failure" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:35:25 -0500
Message-ID: <20260301013525.1695104-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From a537c0da168a08b0b6a7f7bd9e75f4cc8d45ff57 Mon Sep 17 00:00:00 2001
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 23 Jan 2026 13:32:03 +0000
Subject: [PATCH] tools: Fix bitfield dependency failure
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A perf build failure was reported by Thomas Voegtle on stable kernel
v6.6.120:

    CC      tests/sample-parsing.o
    CC      util/intel-pt-decoder/intel-pt-pkt-decoder.o
    CC      util/perf-regs-arch/perf_regs_csky.o
    CC      util/arm-spe-decoder/arm-spe-pkt-decoder.o
    CC      util/perf-regs-arch/perf_regs_loongarch.o
  In file included from util/arm-spe-decoder/arm-spe-pkt-decoder.h:10,
                   from util/arm-spe-decoder/arm-spe-pkt-decoder.c:14:
  /local/git/linux-stable-rc/tools/include/linux/bitfield.h: In function ‘le16_encode_bits’:
  /local/git/linux-stable-rc/tools/include/linux/bitfield.h:166:31: error: implicit declaration of
  function ‘cpu_to_le16’; did you mean ‘htole16’? [-Werror=implicit-function-declaration]
    ____MAKE_OP(le##size,u##size,cpu_to_le##size,le##size##_to_cpu) \
                                 ^~~~~~~~~
  /local/git/linux-stable-rc/tools/include/linux/bitfield.h:149:9: note: in definition of macro
  ‘____MAKE_OP’
    return to((v & field_mask(field)) * field_multiplier(field)); \
           ^~
  /local/git/linux-stable-rc/tools/include/linux/bitfield.h:170:1: note: in expansion of macro
  ‘__MAKE_OP’
   __MAKE_OP(16)

Fix this by including linux/kernel.h, which provides the required
definitions.

The issue was not found on the mainline due to the relevant C files have
included kernel.h.  It'd be good to merge this change on mainline
as well for robustness.

Closes: https://lore.kernel.org/stable/3a44500b-d7c8-179f-61f6-e51cb50d3512@lio96.de/
Fixes: 64d86c03e1441742 ("perf arm-spe: Extend branch operations")
Reported-by: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
Reported-by: Thomas Voegtle <tv@lio96.de>
Signed-off-by: Leo Yan <leo.yan@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ian Rogers <irogers@google.com>
Cc: James Clark <james.clark@linaro.org>
Cc: Leo Yan <leo.yan@arm.com>
Cc: Namhyung Kim <namhyung@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/include/linux/bitfield.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/include/linux/bitfield.h b/tools/include/linux/bitfield.h
index 6093fa6db2600..ddf81f24956ba 100644
--- a/tools/include/linux/bitfield.h
+++ b/tools/include/linux/bitfield.h
@@ -8,6 +8,7 @@
 #define _LINUX_BITFIELD_H
 
 #include <linux/build_bug.h>
+#include <linux/kernel.h>
 #include <asm/byteorder.h>
 
 /*
-- 
2.51.0




