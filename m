Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA0B46D558;
	Mon,  5 Oct 2026 12:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202103; cv=none; b=KbeReBeIAq5I19CR53PfOV3QCfVbxPnCINtOS0G+/7vO8nddW37VYFIUcD/uU8hcI3uXqL40GMLNrnd2YrVb8m4AP70QLXRy1yTPawle5MDgbXzGAu/mZkayEL1IuYDWc7JpbEqtmLMZFOc+EN7CUgdHvStrlskz9Z1fNGb55SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202103; c=relaxed/simple;
	bh=yZQ6MQkJUUodfAS7nSlsKzC1XUxSwzYOyiw/wkJHPxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D/6cqU6iC83Pcgc5q3hnpn0bZFLP0tL4vo0rBKKceEDArGyXFme1bgTGTcXSV21uBF27BWGyJhahLYn3otEO2SSYNF//sjKisaRghANNI5AStjiMd73MZ5WvfKD3iahTjhZ7gCHUboKevUceXg2ZSau3Jlletpj9Nvz1pvEdYr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=eZ2XT5Bh; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=4fNx8f8p; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="eZ2XT5Bh";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="4fNx8f8p"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791201962; bh=UyE2WbqxID6O1bGrrpnC3dh
	LKyhQZ5MZNS++hKSonwE=; b=eZ2XT5Bh4pXDtA40DlRj0lsF7MM3PQxbEpumAS8ocLlYGKCpBh
	Onu1KggTJSFIP63bAJ3GV4GjZDdY+q/CwNpMAMIr25H8f4WS6hnIsnCfFZVGkbQrTBlYkPBPtYv
	pkDrle8XJRHWS1Tu2bPND0bxnKRaeoo7efvNSGvAlXWgem4IcsdZwGQ4z5N/bHwI+vjEJ06nJ+1
	uXN8fP2rLAYFAOmrL6v40zx4nAEVt9hJm/1WXxTzQb6RVZbG4Qlc77YlmIyhGb4oYmGiDo0q7St
	ypMDw1C9AXDUxI+PTPaH1jxY6hXMBBs7ohriLVC7nghSPWC8XfVHG1iBVwWHNQVDvCw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791201962; bh=UyE2WbqxID6O1bGrrpnC3dh
	LKyhQZ5MZNS++hKSonwE=; b=4fNx8f8psYphS2ELO4DamDMhCz7KzrLNPkKLK5GgxIU8P6GdKk
	tdaM6pSLX+q1NGmVNr7INXgUzQwffOmwUCCA==;
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
Date: Mon,  5 Oct 2026 12:05:55 +0000
Message-ID: <20261005120556.383004-3-brads@mainlining.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005120556.383004-1-brads@mainlining.org>
References: <20261005120556.383004-1-brads@mainlining.org>
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

