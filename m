Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED9F47668A;
	Mon,  5 Oct 2026 12:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202179; cv=none; b=e5JV6r7MSUhQYdEkq6Zu9vBcNvXe5SipKG6qnMb0hpiNMETS5M7yXVD0CudLTChrbcDQpxiGE0g7E7LNNyFJm95Cu8syVcsVMR0VpLr3UH9S+M7UexL9lol1CgvM4qg5/kxA9TTcO2Y0O5ZO6mk4kOAl6iWgK3vO1wJE2pCprHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202179; c=relaxed/simple;
	bh=yZQ6MQkJUUodfAS7nSlsKzC1XUxSwzYOyiw/wkJHPxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MRpptVHC3pc+RC8gWHGIOp3vOlxOfJLxob0aMARj633QXsc5MBRRsgu89UWEmcgtW3PNPUvFbmdAfjS1XxKzJ3uk48ua7H+I97ui+2Nidz5/PyoIktBe390cntJz4NEUwhgdbDvlrXL4Ok1vX/oi6MitHuNvwcazEB2J+61hlvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=rTl8ubsK; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Q6M3tnXK; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="rTl8ubsK";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Q6M3tnXK"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791202026; bh=UyE2WbqxID6O1bGrrpnC3dh
	LKyhQZ5MZNS++hKSonwE=; b=rTl8ubsK68VnzzAoJ06grCjpnVljgY6irkKS6xzwA0e50XxCG4
	fgWicCYVH9aWJ/d05yzlcXXtrFO2gCD+00zalNkNsm9r257kgHQeFDCDdjTuLd4sTTbuWf6qvtX
	HSDPbyCRAY8Vo6iEBkojAhtchIg1abBuONGQ+v1JSA49311frmMZawdNf1bHNufNpTRPjbRQX8m
	HNLNrz/tO5DQjPSA8pKE0WeWGlpXxC8I7IOnDTNrQEnRrN/pwRtITI4GZig4oUfVzn13/HenHnO
	a5eVal9ioHRZtXC1R/Ur48ME4K48i8HryQXwRjuLavGOn25MvoTLJPWsnjhh2E22l4A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791202026; bh=UyE2WbqxID6O1bGrrpnC3dh
	LKyhQZ5MZNS++hKSonwE=; b=Q6M3tnXKegcyxQ/ar5xcHyJbNFw2/dvgiQW7xxhcf4bOGNNGju
	rF5I1b7DMHBwWdSDN8zHGSPcu2ZbFw9EosDg==;
From: Bradley Morgan <brads@mainlining.org>
To: akpm@linux-foundation.org,
	vgupta@kernel.org,
	guoren@kernel.org,
	chris@zankel.net,
	jcmvbkbc@gmail.com
Cc: arnd@arndb.de,
	paulmck@kernel.org,
	david.laight.linux@gmail.com,
	glaubitz@physik.fu-berlin.de,
	ysato@users.sourceforge.jp,
	dalias@libc.org,
	linux-snps-arc@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	brads@mainlining.org
Subject: [PATCH v5 2/3] csky: Emulate two-byte cmpxchg
Date: Mon,  5 Oct 2026 12:06:59 +0000
Message-ID: <20261005120700.383058-3-brads@mainlining.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005120700.383058-1-brads@mainlining.org>
References: <20261005120700.383058-1-brads@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

C-SKY has no two-byte atomic compare and swap, so the __cmpxchg()
macros let case 2 fall through to BUILD_BUG() via default, and a
two-byte cmpxchg() fails the build.

Route case 2 through the new cmpxchg_emu_u16(), which narrows the
old and new values itself, so all three orderings, relaxed, acquire
and full, keep the (uintptr_t) casts the case 1 path already uses.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 arch/csky/include/asm/cmpxchg.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/csky/include/asm/cmpxchg.h b/arch/csky/include/asm/cmpxchg.h
index db6dda47184e..6f3ca79e54ac 100644
--- a/arch/csky/include/asm/cmpxchg.h
+++ b/arch/csky/include/asm/cmpxchg.h
@@ -64,6 +64,9 @@
 	switch (size) {						\
 	case 1:							\
 		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
+		break;							\
+	case 2:							\
+		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (unsigned long)__old, (unsigned long)__new); \
 		break;						\
 	case 4:							\
 		asm volatile (					\
@@ -97,6 +100,9 @@
 	switch (size) {						\
 	case 1:							\
 		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
+		break;							\
+	case 2:							\
+		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (unsigned long)__old, (unsigned long)__new); \
 		break;						\
 	case 4:							\
 		asm volatile (					\
@@ -131,6 +137,9 @@
 	switch (size) {						\
 	case 1:							\
 		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
+		break;							\
+	case 2:							\
+		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (unsigned long)__old, (unsigned long)__new); \
 		break;						\
 	case 4:							\
 		asm volatile (					\
-- 
2.53.0

