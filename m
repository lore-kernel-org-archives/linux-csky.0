Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5373347F3D2;
	Mon,  5 Oct 2026 12:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202114; cv=none; b=ggjmaoi1pqWZrem5COUkiCLLELU3Bvc7qQMRphSWeO9MfyyWdHgPmBNhG9fmA31Eu4yE1JQFUbYwVrvlsKSFJXf5eQzO1mUds2lsNshb3tqtU8w+oWwMn6grlrgpP4pOqWqw+MeFWU2WbLDpYdRDXOsJn/hv4TiGD8h8llG7Tzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202114; c=relaxed/simple;
	bh=dVfhJoJiS+y4HqjQZXq2ePP5LMIw6YeYF5rKl4PXgNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ahytuHQHVCAGpMj/0ES2GyVAUHV0+RHuEj99E1VvCSqHTdPJMphOvOqkOlX6yREOwRSUU42/FXFfcHYiD66CohhacYvKmLisz+3YaMklIsmJz6QBXubNZ8ku8I/YgV77BhFH0fWp7W/FdffRnRdRJwQiuLPs6PLFgc8blAWnyvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=NSQSOFdm; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=yVF2XUVB; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="NSQSOFdm";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="yVF2XUVB"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791201958; bh=WB1+6laz/zdftbWnRBwqUx9
	lfSRFeEn9fmHSdN3sNQY=; b=NSQSOFdmgIQYISoNJ6JTI7VfZmiTCyZiZY2p/KhjpsjJ3znTvB
	tZ3JUfRwcvf9pI7m4v/BEK42NsvEKwF917sRsXW6MW1hCbtr9id3jnamCbe1ixws982zHawhBm7
	d0rXU+T5BQOQIEDfceQcX5yViFJch7XIT2xWq1VJ955RFZJGm8ron7cWjWJJ1f/Gb/vMF7ljIi6
	0/y42eO55jvbvOuEvA2hokGsi67BvnLsNRfKbv8tepK+xLVGRU93ON9a6j4flFUr2MWR9GqLDBb
	7kjU2zH0aHhC6VDRwhIanIBuuvxeAytTrSJUQbqF+BeNmlY85BjposM7TSnB/EDAgdQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791201958; bh=WB1+6laz/zdftbWnRBwqUx9
	lfSRFeEn9fmHSdN3sNQY=; b=yVF2XUVBjbV1NnIZ6aFdyuM9m6WI856DI3+QmSyEZQ2dckN7D5
	Evmbjxdpj0TEcQ/hVsrIF02k3DEBfUk2aaAA==;
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
Subject: [PATCH v5 0/3] Add two-byte cmpxchg emulation and wire it into the architectures
Date: Mon,  5 Oct 2026 12:05:53 +0000
Message-ID: <20261005120556.383004-1-brads@mainlining.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v5 of the two-byte cmpxchg emulation series, reduced to the
three architectures still missing after Paul McKenney queued the lib
and sh patches, ARC, csky and xtensa.

The v4 attempt at these folded in a type checking idiom,
(unsigned long)(0 ? *ptr : old), meant to make cmpxchg(&p, 4, 5) fail
to compile. The kernel test robot and Vineet Gupta showed that idiom
breaks real callers, fs/crypto/hooks.c passes a char * and an
unsigned char * to cmpxchg_release(), and the conditional expression
then has incompatible pointer types, which is a hard error on gcc 14
and newer. So this version only adds the case 2 dispatch, the
declarations the architectures already have are kept as is.

The ARC sizeof bug that v4 fixed along the way is in mainline
separately through Vineet's f050c3e61d2a ("ARC: arch_cmpxchg_relaxed
to use size of pointed type not pointer"), so the ARC patch here is
only the case 2 wiring on top of that.

On the why, RCU previously used single-byte cmpxchg(), which is what
motivated cmpxchg_emu_u8() in the first place, and Paul has now
queued cmpxchg_emu_u16(). Unused new code is frowned upon, so wiring
it into the architectures that need it is the missing half, and
there are existing workarounds for the missing two-byte cmpxchg() in
the tree, _Q_PENDING_BITS for one, that can make use of it.

Per Paul's suggestion each patch is standalone and can go in
independently, they only depend on the lib patch already queued.
Each one was build tested with the real cross toolchain, ARC with
arc-linux-gnu-gcc and csky and xtensa with the gcc 16.2 crosstool
builds Vineet pointed at, W=1, with the macro instantiated on
u8, u16, u32 and pointer types, confirming the new dispatch is
reached and no new warnings appear. The pointer instantiation
covers the fs/crypto/hooks.c case that broke v4.

Bradley Morgan (3):
  ARC: Emulate two-byte cmpxchg
  csky: Emulate two-byte cmpxchg
  xtensa: Emulate two-byte cmpxchg

 arch/arc/include/asm/cmpxchg.h    | 3 +++
 arch/csky/include/asm/cmpxchg.h   | 9 +++++++++
 arch/xtensa/include/asm/cmpxchg.h | 1 +
 3 files changed, 13 insertions(+)

-- 
2.53.0

