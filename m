Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C67274B42;
	Sun,  1 Mar 2026 01:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328266; cv=none; b=Lts0Pp2zR7c1afJKeS+EUBWuRkc5Zhaljsom+Lj4LK6rX6DIFHVsEmG35F8RI50LQoxjrTd7KeCsEOGLE9ECxh2aA9CUQ19Wt3dZRr94nXSnXpOctONTYm/zLq8SAY2X5DhxDWGtRfwxzbrBV2GXxc6CSDXpSwrgQOlxOYJWp+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328266; c=relaxed/simple;
	bh=gm+y4nwaWMbq+//9qC2Pc/2Ash2y3Y/2Yoa0NBb2S5A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Vp0NxOflZywNbHwPLpz3XOQwCntmgYpsdnKZ/BUekTenBT72F2FBxkrj6iXOvvsduM/8tv7l+E1N3iq+K6nZSrDjxzmTY14gZoubTIcz4RTXf+4M2O6jQ4xaRZCYIsV2l6PW31JxpFWJSufUlw/rApPMEBoGFTskAFARS+1AJt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YO2xcgjy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YO2xcgjy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4DBBC19421;
	Sun,  1 Mar 2026 01:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328265;
	bh=gm+y4nwaWMbq+//9qC2Pc/2Ash2y3Y/2Yoa0NBb2S5A=;
	h=From:To:Cc:Subject:Date:From;
	b=YO2xcgjyr+csQg8a5m/gqJkYX9HhBBnotFVFlUsku63Y1+3Za43lEGo7His9BIbou
	 wvO0cUnn5GuUfepOfOqIdB8GrVwgPxSkGlD0NTVzSGFYhPts3QFzadXqE9BA1ZL6cw
	 3HelOcWR5MmuNWs0rDypSmWxX/jwarEXCa/mKj1G8kY/re5MvdOqygKfZAOh/tBlXe
	 dCWT4UGJdkQqTOaXQ7XMd/IaugOEk9XYBKjFWjKja9dCz2B9VLgqFhm/hEl3EOYBep
	 i2OdeRkyAVhJzKWHpS1ioSyD+KK4Ig3sj1Lg4d7TsdeiHKcF+5B23niSZnWlqB20ub
	 bUPK8bdqYI2Gw==
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
Subject: FAILED: Patch "tools: Fix bitfield dependency failure" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:24:23 -0500
Message-ID: <20260301012423.1681239-1-sashal@kernel.org>
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

The patch below does not apply to the 6.12-stable tree.
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




