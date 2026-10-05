Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF30E47C107;
	Mon,  5 Oct 2026 12:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202027; cv=none; b=prRWuW/aUrYHwmuQbjmlD15W880ukTaJBDKQeb/DfAFjf+Ez5ZyVYpHMN48GyiaH0vq/BTIqhOMmPBYNOX2GMLkmn2lE6t6ANTs890PXMUBJVi2C5sAyJ+QpxpyZ9db5t0td+Xe14jPTbxyOWQQL01EVlpOG4TRMBYsFAlMpmms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202027; c=relaxed/simple;
	bh=dVfhJoJiS+y4HqjQZXq2ePP5LMIw6YeYF5rKl4PXgNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wf/Ci4JA74PJsf8k8Ii0842/Ze6rUUK9kRatuiN2i34rb/g9z8vBWiUd46HnTcTkRxK+TfoBWsHF+/dVbkCP3HYGfeWHOrdhsMqn0gCZ5IUpqqf3QVp6jggt6dO6uLakcVJe/fZsRfTxWbSBot6O07jOxznrI6MuKQzEjM//cbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=mZpsQkry; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=IkkrIXU+; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="mZpsQkry";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="IkkrIXU+"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791202022; bh=WB1+6laz/zdftbWnRBwqUx9
	lfSRFeEn9fmHSdN3sNQY=; b=mZpsQkryyXLoVdU4aygsGtx5TfuOyCUvUlvBlpNbbChN6QFank
	cScpkJKx3nZv5rZtFAlt6CMAPo3h5QSLz4LtMxuxSE9rHbj2ujW4qkc1FClCnFYauPqFoCGD1C2
	VuQjoDR/XlzdWR2KMR1HIrS26MBmLAdEJXFJ+y65/0zpuXEqCcDvR9YSIaPNw1OXW+ONPSgoD7p
	NjeFsqPbiNWc+Y6ewwn4ZZaI24gL8foa/dCecDf2Eehkwj/56VpbpFCDNnjE6soEBloZ6j36F/D
	yyWpSIf++jsnkA3iIY6nVH8K9i5gCvvRjq77bXCSEgk6lPwIKgjaq9b8vA4qMuyqAVQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791202022; bh=WB1+6laz/zdftbWnRBwqUx9
	lfSRFeEn9fmHSdN3sNQY=; b=IkkrIXU+PLAMzr/Cv0HtBp3zBybJ/1ZkNSlwjf4fcBYdFgeIkR
	CEFxZYWk8Y9OSo3c3mV3j3CnuntzATKOxxCg==;
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
Date: Mon,  5 Oct 2026 12:06:57 +0000
Message-ID: <20261005120700.383058-1-brads@mainlining.org>
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

