Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946300;
	b=obGx5ttUr+LzH7+QuFx7yKm7JVhwXe9weUji781+V0CSlDKq3uOQ/9Jz4IWx1NOjog9y
	 HsFf4dGcbwBCOq1GEu0oDqTU3uklupapqtozAdYySYJzS2siNraoPwd0VaPmpXWxmn4K1
	 s8oe3y5wnIQ8GX9IXkcGW/JbsN944S0QoTwpeiRgYsyOJGiNaH0kmIDRflH63s28QRtzf
	 8Rv1IQI80Cz0jFWRrlkxrs0uoMVm1FGtJxWMzO666g4UZ4tluKiVCAIBxp+xJKIlXPpoE
	 TViHteHmIVyNs/gBAu4g+hdWKN/YXP2/6YfSTFY5zry/xkorqwFk6z0NJb9FX3+t1sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946300;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5enhWdhIl/MgTPhFKTcfC8/saw2N4Zy++fA3QwojwsE=;
	b=fQUmG3QAi1sxjE2rrvT6qzVeDvT2VO4yHyrCXtei7gv9cTmsdPnf6cNmLEw972BVw2Na
	 MhfE0kTy01/pgWex/+xxx6d1tOSyyWg7XqIznl5J5syj23h6vB8zI/liJsna5nic8v2Bq
	 4TsweEEHKym2YchGcBQZt+J7dfznmh+2rtJKLmCSq9HSzTTjQmoffCJ0LFaceReHQ5N43
	 /Iq81vG+ZSPX9qR8rXGRXB3DULPB0QtRhZm0EK4SsveyGgzpMBor8bh1NnoHlvvtvVvSA
	 w+Oajy0BbLbRqLiPe4bkJcoEatsj540F1NWC5284rEy7RF8QYH0vMk235Z3wE2H7VNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BePDgzGu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C738C606A32D
	for <linux-csky@vger.kernel.org>; Fri,  6 Nov 2026 06:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BePDgzGu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA981F008A6
	for <linux-csky@vger.kernel.org>; Fri,  6 Nov 2026 06:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793946299;
	bh=5enhWdhIl/MgTPhFKTcfC8/saw2N4Zy++fA3QwojwsE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BePDgzGuUht9kJ8Wj5OzX0+Nke0USjqiu+KTZPt9h8N+oXzBWiyPD2SbBOVyizgTr
	 BmbFvT0Oi6hdsv9DKI3i95FoIudtBrP+3evVnaSaZeu51AU+VgSnYYskH8vfxIjM0s
	 VLPvpmgptdBwW+kQbkJ/ck92TFlHLb3J5sDTvdDppwApjH8QOfPzsZFVO2uNs06Jhv
	 zeZ7Gi1nr/MbNLkgUCihb+SyHlAEaKaVc3VjjSqqU0Wi0rBdRA9tId2VC65l9Oyioi
	 zY3JXYlqIySA1GBvtAxXmpKDSdiDj7m8GQjKCLOHtYLs5TY5vCfRqHaPRDCq/IVxz0
	 DFn1JZrKlEcUQ==
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4922523d1afso147891f8f.0
        for <linux-csky@vger.kernel.org>; Thu, 05 Nov 2026 22:24:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGOVVmzFEQ0an2r/YuY6a+OGBh4GdCCNbh4NNMCUT2NuetF9Rjn2epBC2mzIY38wC4l0R3NNPiHXW9Y@vger.kernel.org
X-Gm-Message-State: APuU4Z8l9WS3zR4LsYvmTljolIBnYGck954vliocyXF9IC8DILcKropG
	abXu/G+77JyLLL7+CR7TJuVUSTKVIx3vVVoA+QSCdtqyeCK900Aji4ugbMvkth1jOdR7Nnp5wqM
	1ajfELNLADa/Raf27Wfdv0uTN0++K++I=
X-Received: by 2002:a05:6000:4a06:b0:48d:f034:7fcd with SMTP id
 ffacd0b85a97d-49278a136fbmr3201746f8f.51.1793946298013; Thu, 05 Nov 2026
 22:24:58 -0800 (PST)
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Post: <mailto:linux-csky@vger.kernel.org>
List-Help: <mailto:linux-csky+help@vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-csky+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029202624.2685097-1-rdunlap@infradead.org> <20261029202624.2685097-5-rdunlap@infradead.org>
In-Reply-To: <20261029202624.2685097-5-rdunlap@infradead.org>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 6 Nov 2026 14:24:45 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ_OP9mDS-cR+hyGfKPWG8fm4=sNFD8Tqx563YusNE7mQ@mail.gmail.com>
X-Gm-Features: AclHuK-pqlKlsbGKcVWXGwPpboaBVUs7kbsV02O8Yfve_qJtRr0DTGLvw3Nd9fM
Message-ID: <CAJF2gTQ_OP9mDS-cR+hyGfKPWG8fm4=sNFD8Tqx563YusNE7mQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] csky: mm/tcm: add missing prototypes
To: Randy Dunlap <rdunlap@infradead.org>
Cc: patches@lists.linux.dev, linux-csky@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 4:26=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Include <asm/tcm.h> to provide function prototypes that were missing:
>
> arch/csky/mm/tcm.c:109:7: warning: no previous prototype for 'tcm_alloc' =
[-Wmissing-prototypes]
>   109 | void *tcm_alloc(size_t len)
> arch/csky/mm/tcm.c:124:6: warning: no previous prototype for 'tcm_free' [=
-Wmissing-prototypes]
>   124 | void tcm_free(void *addr, size_t len)
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Guo Ren <guoren@kernel.org>
> Cc: linux-csky@vger.kernel.org
>
>  arch/csky/mm/tcm.c |    1 +
>  1 file changed, 1 insertion(+)
>
> --- linext-2026-1007.orig/arch/csky/mm/tcm.c
> +++ linext-2026-1007/arch/csky/mm/tcm.c
> @@ -2,6 +2,7 @@
>
>  #include <linux/highmem.h>
>  #include <linux/genalloc.h>
> +#include <asm/tcm.h>
>  #include <asm/tlbflush.h>
>  #include <asm/fixmap.h>
>
Thanks, I will queue this patch.

--=20
Best Regards
 Guo Ren
