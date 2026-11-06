Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946320;
	b=aEhMeVzJ6F+Sor8QqV+CxUCHzQWJHBI5PV6gjZ0UiULY8JUyBo2nN/CFle5jaobuYotf
	 5sbQQcDy6esfyu9Bd2nsmAxH+L5aMRmq5OgNU8rQNk+ogIlYSwkNdQxQs/uc4SYRJ9SRZ
	 pB366F7jO3b8lDPib76DeFdtXl9fvIBWT4MtLlDnrbF7v84G625qa0nB672hMMFBdGHkL
	 DMqyqsa8GDUwF11WiSDOV2Np/GCRvASPImcbCAoSf7c80GUuo2SSZeipc6hUEiycKFIbZ
	 6H27A6DP1yu9G2TxoeKTXDf3oCpiNvgQLInfDLuPBm6rbv9JJKxufY5dG+R7FVYeUgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946320;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RZr7vf5fgFHKXNA7mJ6w2EfU1zLqlhlVzr0/jpqQKrY=;
	b=u8q8RAk9FIDy7V70GcQYeOv7wZfvIcXib8o33a47F3U2toghUbwCCqXbbANO0KrOH8RZ
	 5nFrp5aDkYqpvqsQVw2LOkQf1UfmhE6ByJhUePvkr2suMV9iGTMFoKlsDcAHXqJWvdvAd
	 q5NALCPTW8ccyGzNlslXA46S20EGwJERTL+NbRVogkZ/zMlW3Mg4voLgD2ou0JsOxC5B/
	 L2RxYae7bUaK3yr/byNMSgZ/8BkoR4iNx1hUMECEVB6XrHBBSvf3NWc3WEzJMyG1k1ebj
	 kPhtNTgnOzdKCTqxFhghnKTkkrdh4TViYro7DNWz8P7CXHImpFeX0BkCAnkpCqZ7YIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HwTKaVbw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE51606A332
	for <linux-csky@vger.kernel.org>; Fri,  6 Nov 2026 06:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HwTKaVbw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC8801F008A7
	for <linux-csky@vger.kernel.org>; Fri,  6 Nov 2026 06:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793946319;
	bh=RZr7vf5fgFHKXNA7mJ6w2EfU1zLqlhlVzr0/jpqQKrY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HwTKaVbwq2lbALOZm1YK0BauOlDSkMv/LapAKU2HTo3n758op7IpWv+5yNPJHKs2V
	 v3J3QwQHMLHnBdzQvzEF4Z3VeajDnlLBc4sVMBtR4gJyFX0buYEvM/ZWPcJZ3OqK8s
	 MnENCYLXUGSdA+c21kKI4PIdEsHYtCOcrvqehMyLEvv74mS7f+WnFX78ARtlVJarML
	 tPYIZOUI75R938Mt/2bkBToWm6EC68a1RmA/RqvEb++bui4/8Ee017wYaGQuXv8tPg
	 WlfnwiO7Cb+n3nJvkg+oZnWgaVb1g6xAPqK3X8LwFNKeP+EB4pl+z61YOcicBscysx
	 FeOhcu9H10s8w==
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso2754875e9.1
        for <linux-csky@vger.kernel.org>; Thu, 05 Nov 2026 22:25:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBylYSYhZJd8WOc2lq0XPj2/v6epln7A2VRoqbnV6s0Bh+SUsXNN7WI0IOpb5WO1Xpc1+yA5+uXBw6Ac@vger.kernel.org
X-Gm-Message-State: APuU4Z/N2mncC4FLt6dAbAELRJOs4WT2hwzWzbnsJc2zBGqIN6klTFzf
	nC8CqvkCB0MvjdLTnOBbbRM+7n3LVBzC3wKWydsuTty1zgvD8XmPVkaVwYOY68lq/MMhs/EAahg
	7QuGxg7kMa35bazh8GPeA8j4U1Bx+PDU=
X-Received: by 2002:a05:600c:34ca:b0:4a2:8c5:5e5 with SMTP id
 5b1f17b1804b1-4b6dd63fd31mr20904695e9.7.1793946318506; Thu, 05 Nov 2026
 22:25:18 -0800 (PST)
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Post: <mailto:linux-csky@vger.kernel.org>
List-Help: <mailto:linux-csky+help@vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-csky+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029202624.2685097-1-rdunlap@infradead.org> <20261029202624.2685097-2-rdunlap@infradead.org>
In-Reply-To: <20261029202624.2685097-2-rdunlap@infradead.org>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 6 Nov 2026 14:25:06 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT7Oy-eHz8Qgwx-V6qT5eTAc1g0URWKEnvydaGcztmd9Q@mail.gmail.com>
X-Gm-Features: AclHuK9rmRbqOnJR6vd1YhaPy3N3OKbaJPk7vBUltpQhWwpu-npAYOxMypOFvGE
Message-ID: <CAJF2gTT7Oy-eHz8Qgwx-V6qT5eTAc1g0URWKEnvydaGcztmd9Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] csky: cachev2: add missing prototype
To: Randy Dunlap <rdunlap@infradead.org>
Cc: patches@lists.linux.dev, linux-csky@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 4:26=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Add a missing prototype to avoid a build warning:
>
> arch/csky/mm/cachev2.c:46:6: warning: no previous prototype for 'local_ic=
ache_inv_range' [-Wmissing-prototypes]
>    46 | void local_icache_inv_range(void *priv)
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Guo Ren <guoren@kernel.org>
> Cc: linux-csky@vger.kernel.org
>
>  arch/csky/include/asm/cache.h |    1 +
>  1 file changed, 1 insertion(+)
>
> --- linext-2026-1007.orig/arch/csky/include/asm/cache.h
> +++ linext-2026-1007/arch/csky/include/asm/cache.h
> @@ -17,6 +17,7 @@ void dcache_wb_line(unsigned long start)
>  void icache_inv_range(unsigned long start, unsigned long end);
>  void icache_inv_all(void);
>  void local_icache_inv_all(void *priv);
> +void local_icache_inv_range(void *priv);
>
>  void dcache_wb_range(unsigned long start, unsigned long end);
>  void dcache_wbinv_all(void);
Thanks, I will queue this patch.

--=20
Best Regards
 Guo Ren
