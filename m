Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670376;
	b=db957gM4oy38i5fe07O8lstzDiVi0n4PFAORQ3McC9Ubokwtw9bo3Ci8h6NSakuxjyn+
	 IcxRiaFfY3/eKyE1le8AvX8Q77N5QjAr8/Axg8nm+Kvu36RSBY9lhyrFYwNNprbvD3yhQ
	 JMY1QqrivokXFASLeTGZ0YoIXf5Mtz7v2orF4B8OAtBGXFRL6zHFdxMTJeO4Ue/muDDaJ
	 e1+bfBEvoGHU/cOBhhyTGH2tDGHfAyQwGpEs+ig6SIaqFTOH+9qb7zmvhnnW+HmHH51Qn
	 sP5C4Je42irMLrl/wt3ZDb6XyklX8WzS4Ovln6lC1XnLp9KgxMekQDllrUFm082nTDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=XINGVnXS/59fmZDTv/3fLoxUfeQVR9Y3Vo1ejBBatBE=;
	b=CSQeV2iMAnd3XguzEkbJDEf1Jf+WUQNK5IAhtGgHo2WAJR/HHCADUzngT+f430SZbX+1
	 Zav0GFFM2WMxkANjmcAZjcfCj+RqOv46chktMwaqKOoDgzgHE2LFjNwzXL6ikXkSYjbES
	 cnS9eH3Qf0Ch+7zEdtosIP9zwS+JmoLtFkYo9b96KwauSmtjMAGuz9GOt4Qa7ZsSW9tUt
	 xv+JKqJ5rReMUljEzeADZpKyfgUqINS73ANCd4QmoTAgdfamkcfymvaCa5u9tFoAFUSiH
	 vWzeNJjqUMd8dAReuMZV4klfJ3n4Vz445ZQJ4rwwLq65iLmltwk88R++AmnlhObnQOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H8MV5mHe;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B570606A31F
	for <linux-csky@vger.kernel.org>; Thu, 22 Oct 2026 11:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B570606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H8MV5mHe
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a264b6a06bso178344b3a.3
        for <linux-csky@vger.kernel.org>; Thu, 22 Oct 2026 04:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792670375; x=1793275175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XINGVnXS/59fmZDTv/3fLoxUfeQVR9Y3Vo1ejBBatBE=;
        b=H8MV5mHePY61sZTF1PItFLG8m+SDaYKHDRqB1gr5Vk0h4SfvTU4pYNyiZPg0K1UtGX
         sOlN/iywGbBkOgN8XVRD/VqYX2zs3GMNNE9jX7GPoIc4s3VAqly7omE37kAtT8YZMn/z
         jRnpFa/jLmT3sHPgV/+BE0TthFw3r/rnYFCjb3NJAqfGC6Ls0HIJM6wM9pKJnMI7lS4L
         spW10lbuM/JoZQFK7Cq3leTxmQbymKQVyg+lfXJqQmWUejs1IsMgzhfQv90o4KmQRbTp
         DhL04C/PhxI3aS8HZZrrw4YXzhJ+G6t6vYVGV2KbRqoUNyQ1IICC5+534NwP/Gkfbpba
         alyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792670375; x=1793275175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XINGVnXS/59fmZDTv/3fLoxUfeQVR9Y3Vo1ejBBatBE=;
        b=NVZomPZclGVQdeMlJSrLNIavFZ8I0nCGkrjPyGtwt8Vs0cBisEYhsBvmBtqdUS3Eg9
         taYw08scncY9rYLIugrlG5t5pNICadu7OVX9b5KOOf8OSAoTNrq5dg34JeYmDzxFehYy
         Lob7SQhLpeVfB1qkJV6x13aZPf9jJnOTm84Wq/kC38qp7nas+jMSl6YXmvceEJ1OBcjE
         7+oR7ZSP0xdcyXYK4vKFHDQOk3nGFe3NP+Slt4ySQ3QfyTHESpgB2tw2+R33hCAz/J3Z
         /cLMtFE+v1wWW+MXI/wflntDjEaXC9eMkVs+C7QaiAJM7rGQmzkosH/os6BSDISI5leG
         BZ/Q==
X-Gm-Message-State: AFq9FYL5/0OX57IlpxvOf2VCu6SwReLvlfclOtvtUHN74oQ3kRmJ1BvM
	j+VxUw7obLcc9M76z+6tGKUhlgJmzPrfKEyqxWrP5gLRp+8tmC9V938P
X-Gm-Gg: AYBFou2c6+EH9JA3mSjgs9sLnUZCtQg0eJKH/sY+clLBRPg3eL14w5ZlHb3b1IEtcAb
	oA9tp8rWyQQoHpPRhMP6H7u3aAjTmOiRKObSUFGZ+FRo9oYtU4tIKO8oicLoVOS9QraM3RMd8gh
	jsM9r4vCAHhq0gm8U1EnbJKaqz0jeKY6EfDjZRSeuCSEcDiZ02dNKa+T8ioW8Nds95/CcSGiKWo
	YZCgA7n5stAi7YRvd7syoAKZcDBBI1FYjC2OPdHMxLaz6HFmX0rV2aAN27S3w5jb3Cvc6AVHJKL
	ir+5YhCmNP8++A3Z2sqMC6p38A470RXsSS1Ngvz1Z81oYKfZJiv5oAtIYh0a1B+DyO1y+6r4Gn2
	2S/EpSiBnThS+M9cKsO4T5TF38cbZG+ezfH7PiPZTIZcPapf+9A/SvgtA8B/XNUn5bLqyO/FBAZ
	9+TQiOEGS3ERPkheDCYo2XivkgqywM1iFCwSR2ya51M4QCMrCYJxpQ1G+EFJ6Qi3AT2ZUMM7/pQ
	RBLnNXuhLWSmNSuz5htVyipUwS28fGwRkrwVh96yZNXhpLQC8PwhVA2Q9sc
X-Received: by 2002:a05:6a21:48b:b0:3dd:a195:fa25 with SMTP id adf61e73a8af0-3e287eea3a3mr3590304637.74.1792670374907;
        Thu, 22 Oct 2026 04:59:34 -0700 (PDT)
Received: from arm-a100.. ([140.112.28.118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0894b49d1sm2035007b3a.12.2026.10.22.04.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:59:34 -0700 (PDT)
From: Tzu-Ching Yang <shingekinocore@gmail.com>
To: Guo Ren <guoren@kernel.org>
Cc: linux-csky@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] csky: bitops: Use the compiler builtin for __fls()
Date: Thu, 22 Oct 2026 19:59:22 +0800
Message-Id: <20261022115922.1210342-1-shingekinocore@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Post: <mailto:linux-csky@vger.kernel.org>
List-Help: <mailto:linux-csky+help@vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-csky+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The csky __fls() is a C wrapper, fls(x) - 1, around the ff1 asm
volatile in fls(), so the compiler can neither fold it for a constant
argument nor merge repeated calls. GCC implements __builtin_clzl()
with the same ff1 instruction for CK807, CK810 and CK860; CK610
(abiv1) cannot be built with upstream GCC.

Use the asm-generic builtin __fls() instead. ffs(), __ffs() and fls()
keep their asm: GCC has no ctz pattern for csky, so builtin ffs() and
__ffs() would become calls to __ffssi2() and __ctzsi2(), and a builtin
fls() needs a test for zero that ff1 makes unnecessary by returning 32
for 0.

__fls() now returns unsigned int instead of unsigned long, like the
asm-generic version; both are 32 bits wide on csky. __fls(0) remains
undefined.

With GCC 9 to 16, the text of every defconfig-based vmlinux tested
shrinks by 128 to 320 bytes.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/all/affe7da1-41aa-4710-bee0-5e3c2b8a8dfc@app.fastmail.com/
Signed-off-by: Tzu-Ching Yang <shingekinocore@gmail.com>
---
In a test function, __fls(x) takes 4 instructions (return included)
before and after with each GCC and CPU tested, at -O2 and -Os; with a
constant argument, it now folds.

CK610 needs an abiv1 GCC; the only one I could find is the vendor's 6.3,
older than the 8.1 minimum and without a clz pattern for abiv1. There,
__fls() would become a call to __clzsi2(), which lib/clz_ctz.c
implements with the fls() asm, so it would still work; a builtin fls()
would make __clzsi2() call itself.

Testing: 35 defconfig-based kernels for CK807, CK810 and CK860, some
with KUnit or SMP, built before and after with W=1 by kernel.org GCC 9.5
to 16.2 (GCC 8 has no csky port, and GCC 9 to 11 reject -mcpu=ck860): no
new warnings and no calls to __ctzsi2(), __clzsi2() or __ffssi2().
allmodconfig with GCC 12 and 16 compiles the same objects with the same
warnings, but does not reach a vmlinux because of GCC internal compiler
errors, before and after. Under XuanTie's qemu-cskyv2 user mode, the old
and new helpers return the same values for every defined 32-bit input,
built with the kernel's flags by each GCC for each CPU at -O2 and -Os.
On qemu-system-cskyv2 -M virt, the ffs and bitops KUnit tests pass
before and after; test_bitmap passes with GCC 12 to 16 and has the same
one failure with GCC 9 to 11 in both, from a test bug fixed in
linux-next. No csky hardware was available.

Against the linux-next branch of c-sky/csky-linux.git (abb81e5ce7d9);
also applies to next-20261021 and to bitmap-for-next. Full build and
test data on request.

 arch/csky/include/asm/bitops.h | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/csky/include/asm/bitops.h b/arch/csky/include/asm/bitops.h
index 80d67eee6e86..118fb0df5267 100644
--- a/arch/csky/include/asm/bitops.h
+++ b/arch/csky/include/asm/bitops.h
@@ -49,14 +49,7 @@ static __always_inline __attribute_const__ int fls(unsigned int x)
 	return (32 - x);
 }
 
-/*
- * asm-generic/bitops/__fls.h
- */
-static __always_inline __attribute_const__ unsigned long __fls(unsigned long x)
-{
-	return fls(x) - 1;
-}
-
+#include <asm-generic/bitops/builtin-__fls.h>
 #include <asm-generic/bitops/ffz.h>
 #include <asm-generic/bitops/fls64.h>
 

base-commit: abb81e5ce7d995baa41556b8125fa59e28ba3be8
-- 
2.34.1

