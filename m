Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764507;
	b=p+iza+ofWZMDu7umWOAkBz1+2jp/0OK725iT1KmydbZhfCQgAC4JkAQ8KHcQLN45Zr3j
	 jO3bZcNn3FGXoa9bvEY+uOcIW8Nd5pbve/Slmu4TAPXwYpeEivhXO8LLFuYPqcP9kPJRk
	 7nyBh3nTnkDkxsxANaYLATSmdcmgcjN2RY/OetjQq5+aYtFWzGFHMjCGW1zKzPA9mq4Yj
	 y8RUKScRfx8tKL+aaroDWmL9eIFsba5H7dSdBpm+gkehfCDuBlY/5C5oFjyjS88aPuvsu
	 rJE+cC/iI6QhQBq0Y/ONCjbnCqfKzI0NelIhhoUGtBxZIotsd4Gln+aPWYu56z2S2iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Tv8jBDwPfWPUczVVh5JF7DB2eeI41qRyApK4ect9U6E=;
	b=alynxW+3/a5WKuivBpvx7Ep2Jz8oKz6FSxD79goaSX9fXOlfp1N8XUi64lAz6ZC/Ria+
	 GYl5G04ecC22JvUnR93XFjbWKGpzK3XNvLkxgK3dJFGnyfVT4WS3gfEvmTXie0OrJ9Uc2
	 i5ZZRQFHn+4/gk/rkaTcMn1dakPpWoH4XGG1bWM8h4spZA9x32qpAmHyN3DYHfC6jcKVN
	 d8NOI37IsHers/mmY+GTobNXj5O9Xg0wC5PSMkAc9mOyVdkL/AaSmJFRU9j8AYZGfu9hT
	 FT4yPhJ2IVnlLNlS6KpxfjwGvtcoCKyS56NodeGdzRpg3sH3CU0pAXd6g9G3zS/zC0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BavTgEbc;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74770606A31D
	for <linux-csky@vger.kernel.org>; Fri, 23 Oct 2026 14:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74770606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BavTgEbc
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a089dfee18so1114683b3a.1
        for <linux-csky@vger.kernel.org>; Fri, 23 Oct 2026 07:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792764507; x=1793369307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tv8jBDwPfWPUczVVh5JF7DB2eeI41qRyApK4ect9U6E=;
        b=BavTgEbcw5Ftd4vmcFPPbbrH36zuOVeC+iDr8FEDLdCuhuOeRGtlO0oXKg4liq59Cr
         WTfSaNh3D3Fo5dAdwLjUp1PkBkqphJCETgzA0NBYTZ/IVVVZz1pHtH3UkiqJqwnlzWi5
         gTjVLp/iGkpWJArOs3jp0phr5FM5FyoqbwflJgWgljFKVRxseeDNNGFgOpRw7NB9xn9w
         BHUSyri8TRWcEn2+Z+gH7hIRhfZBCDr82hpRWxl7v6kx/2FG84Pb6HhjGsPkBydZtg3z
         EiRPVoJDkFD01jj/UimXzWCJrVEKAPVdLODLOe4jRoe/JQqcdeMPfCbMgCbOfwfe/n42
         z6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764507; x=1793369307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tv8jBDwPfWPUczVVh5JF7DB2eeI41qRyApK4ect9U6E=;
        b=zPXzXgeY1DMlWG9ZsvOF1QovukVrRvPtFfGvjayX3cuzpbS3rD17WWNslHFo4805Dc
         gwW6jc/uiOwEepmfrD7pwqhvCuVzdBm5ba3jaW6SJt/yo/TgbzWQUX4W/qpOirvxrhCS
         1DpNtTXz0LATU6XXEY5wgJPCfsIMBxQ/CqtEDVdrjYeiD4NWZS6awHmw9ojZupkkzg7C
         d4oAe38fAeW+wBi2YDc3oTvOXrgvzSq6ANIw5ykHbmuRdDSGP3DBWrYOtzXKScOLrqje
         Ki46RCYmcJkrkln8mWBypMNExzFj+Yo5oAuQSoWYZ6sbkm4EZp2svrSg0WxnCsH969Ii
         PDMA==
X-Gm-Message-State: AFq9FYIWpzrHmqfBY4hNAhAXH8qXg0ZzTwgMrOMSlQhZHY8TCSjqqBfe
	10P5X2YJZzhpOlf/FHoV1Z39kOieRdfRXoe3I2Zqs5V80GktBTxwyJfN
X-Gm-Gg: AYBFou1sHgFHMWpqfJ2jo69EIVbmnFYHQ4RBEoCUwZUJpyo0EyptgYEmKaAsGIdjESQ
	oDQbgdWxozvg9GMRxcgfune1f3lkDog/W2SxWh/nAvtzlPWGBraagQwiuGOdHQSCd8mHPkhj73p
	Ooe9NwIAKMsyLElgoqyFFu0ATnwkQyc8NrMqGWrRNV7Lzr4fy+odzR81ju+moIsgzMJfVsP3Eku
	RN01NmzAWewLgCuEFvaTLbW9BilIzC/JLqJwGiB7wt/uq4dLy4v7EZRlszqSmZqbMrRDz3SG3Ph
	RqKVIpcnikQ/zr/bLw3KN1cJc851r/Yc79ixSfWBIFsWC6cOPc8ARBORDqEehxXvKJWTZZ+quRV
	jn1oJkypehzZjb7PSgyofZNu4AWkTqjhZbepIZ7tsTuC5xixNmiS09YRQ2j9Gnf7bh70yUHslMY
	5BDl+Le5x7s8k5/6jC0E5HNfLGgwXwkuJaZb6sSijPne5rBPP6bZarWhuGnwDN4wIHGx4aHA3xG
	qUc0sIST9iPO1Nk3zhLauIVeNG2h7N9V1jiAuLC8Xlr37CLZKynOFjadM86
X-Received: by 2002:a05:6300:86:b0:3de:3f4d:f2bd with SMTP id adf61e73a8af0-3e359a4186fmr1313009637.6.1792764506480;
        Fri, 23 Oct 2026 07:08:26 -0700 (PDT)
Received: from arm-a100.. ([140.112.28.118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a338ef8352sm6443b3a.28.2026.10.23.07.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:08:25 -0700 (PDT)
From: Tzu-Ching Yang <shingekinocore@gmail.com>
To: Yury Norov <ynorov@nvidia.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-csky@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] csky: bitops: Use the compiler builtin for __fls()
Date: Fri, 23 Oct 2026 22:08:06 +0800
Message-Id: <20261023140806.1367050-1-shingekinocore@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <atpm00m6KYhXo6Wi@yury>
References: <20261022115922.1210342-1-shingekinocore@gmail.com> <atpm00m6KYhXo6Wi@yury>
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

On Thu, Oct 22, 2026 at 03:41:07PM -0400, Yury Norov wrote:
> So I didn't understand if you have an access to the hardware or not. I
> don't know the story behind using the non-generic version of ffl(),
> but it may be for performance reasons. Can you / someone else please
> run the lib/find_bit_benchmark.c on real hardware before we move this?

No, I have no csky hardware; all run-time tests were under XuanTie's
QEMU.

The ff1 asm is in fls(), which the patch keeps. __fls() has been a C
wrapper around it, fls(x) - 1, since the 2018 port (735ee005c371), with
no reason recorded. The builtin compiles to the same ff1: 4
instructions before and after with every GCC 9 to 16 and CPU tested,
so __fls() itself is neither faster nor slower. The gain is elsewhere:
the builtin folds constant arguments and merges repeated calls, which
saves 128 to 320 bytes of text. It is the csky part of the conversions
Arnd suggested in the ffs()/fls() thread (the Link: in the patch).

In lib/find_bit_benchmark.c only find_last_bit() reaches __fls(); the
other six tests use the unchanged __ffs() asm. _find_last_bit() is 27
instructions with one ff1 before and after with GCC 10 to 16 (28 -> 27
with GCC 9), and under QEMU with -icount it executes the same number of
instructions per call before and after with GCC 12 and 16, one fewer
with GCC 9. QEMU has no pipeline model, so a real core could still
differ.

Guo Ren, or anyone with a CK8xx board: could you run the benchmark
(CONFIG_FIND_BIT_BENCHMARK=y) before and after? I'm happy to wait.

Thanks,
Tzu-Ching
