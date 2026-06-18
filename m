Received: from mail.thinkmo.de (s3.thinkmo.de [162.55.237.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A2C227BB9;
	Thu, 18 Jun 2026 16:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.237.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781799612; cv=none; b=uiaRdc+yEvlg2YDh1Vd6p0UxXLC9J17kZVJKLrhxKFZ/bPhH6NmxNU9KkDRH1cr8XUz9DTA/45AegXMPyPP4kkdpPbf5NJcSIxNp3oR2eJrypQ9YOtvZ1iMEEiLy/2ct1JbY5dFod8zCUCCRM9HL4oG8Jj2fLXswSXMRyhEvcVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781799612; c=relaxed/simple;
	bh=vw+vnAwXuDCaKGR2/7d0dNFZfsiNsiPg7eeeclmd45s=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=umidTrbSXYSuF2BPFJxdspZAjacUzmus06Xoy3cF763lSoUuuMrOXjRTT4ZrING+HhDp0xR1Zj6CzzDKishVri38C+QFZUvR7AQ3FQh6oGqG/lcEps/m0js5dpkI+i3fumk3X75LrQm62oJmal3ANz8ngsF20KmEswbYDU2+Lb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=fail smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=YWu5AcD8; arc=none smtp.client-ip=162.55.237.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="YWu5AcD8"
Received: from localhost (localhost [127.0.0.1])
	by mail.thinkmo.de (Postfix) with ESMTP id 4gh5MX2mnczyf1;
	Thu, 18 Jun 2026 16:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=debian.org; h=
	content-disposition:content-type:content-type:mime-version
	:message-id:subject:subject:from:from:date:date:received
	:received; s=mail202007.waldi.user; t=1781799112; bh=NW9d1PxeE1e
	LAjGTteotvZH+ScLI5NcVPomeRq8kL+Y=; b=YWu5AcD8I/nyc1YidonpGAB5f9J
	tpjqvbmjB1Mt4YLU4ltY/vdXPvZIqQt7mZvDCFHx91zMOJe6x0/ZxpsbiZUv37xk
	hmCJjsL/ENPl6Mjr5zpGvWG6sYp4c7KaBZtGv55SNelpQYpO91m6wBF5CFFfS3Ym
	QU852bK9gJG69L2W/8nEgptD9qxHLwmUMW7DomYB6ti0wutXefZ3QI0A7P2/6NF7
	bqfJAE29q52wQKtEgZpNRS5qjWVPRQEBnChpE2KcBPGTfFAPAHiuL1fDFGmrExT9
	3Lyqsaeg/bOI/OQeJHkxykDqo+NmIbKwGlcSznyX6Lb8EdbCLsYVdFM9y/w==
X-Virus-Scanned: Debian amavis at 
Received: from mail.thinkmo.de ([127.0.0.1])
 by localhost (mail.thinkmo.de [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P2JQ8vJz0VZN; Thu, 18 Jun 2026 16:11:52 +0000 (UTC)
Received: from steamhammer.waldi.eu.org (unknown [IPv6:2a02:8071:5af1:6518:ad11:fa76:980a:620e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by mail.thinkmo.de (Postfix) with ESMTPSA id 4gh5MX1PLbzyTR;
	Thu, 18 Jun 2026 16:11:52 +0000 (UTC)
Date: Thu, 18 Jun 2026 18:11:50 +0200
From: Bastian Blank <waldi@debian.org>
To: Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: [PATCH] csky: Add build salt to the vDSO
Message-ID: <ajQYxr-Zq4lN_Bvf@steamhammer.waldi.eu.org>
Mail-Followup-To: Bastian Blank <waldi@debian.org>, 
	Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

The vDSO needs to have a unique build id in a similar manner
to the kernel and modules. Use the build salt macro.

Signed-off-by: Bastian Blank <waldi@debian.org>
---
I was not able to properly test this change, due to unavailable
toolchain.

 arch/csky/kernel/vdso/note.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/csky/kernel/vdso/note.S b/arch/csky/kernel/vdso/note.S
index 2a956c942211..f42c7ad4f564 100644
--- a/arch/csky/kernel/vdso/note.S
+++ b/arch/csky/kernel/vdso/note.S
@@ -4,9 +4,12 @@
  * Here we can supply some information useful to userland.
  */
 
+#include <linux/build-salt.h>
 #include <linux/elfnote.h>
 #include <linux/version.h>
 
 ELFNOTE_START(Linux, 0, "a")
 	.long LINUX_VERSION_CODE
 ELFNOTE_END
+
+BUILD_SALT
-- 
2.53.0
