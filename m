Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946333;
	b=jsjpXEvuK/Z42QwGqHuZwYT4oZ4ShjXrTzXoU670lC9Do8hoPkI3TKTsBIt0T3PsDZVG
	 nToLVXRBcVSABSrrElQbCnJB10jtek3slwDkCTKbPDmLU5ZwQjvWidfizV4Cd1a9yQSZT
	 DGuxY88x8/0qFDnydvi+4uuFcbl9h5ls1NoTKKk0MXKTpZW/k+9d39CNiBkFlBij/5M74
	 Lr4rmpg095sP4zVeY0Eo6CG0T+pQf0esv8gXwXtWt8VhnokfKbTwfPNR47YqoP3NEARIv
	 nbSRAb7dZaNfwVsr/0pAxNtAyFxToHG57xsFC/EkAfjPQZDR3QyhzOzYD9IUzpKZ5Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946333;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yh6Y7BZ84cxtCnoU0AticnfysmrdXRcXWUIexGoTN0g=;
	b=opDeYBjBn/HRF1OtB96y5/CD6A/qUJ5+rlXVtja5H47DMmTvvbYrX1uMEvYznnIUKwKZ
	 f5hk8Bf2ZM+v0rSAoqVuf1D87rRf4ZdDL2EovsQIlyp5eZonz8zGyz9Wq/etsjD/SuxzX
	 nxB9AHx3tyOUIfuwrJwUTVc7UKa5j2Hy+wMNeKx/azy3/ZSoZKcVBICgRpsfjzY2oW8oM
	 knZDP/RZiMe65uRkuyuo2F755cWLr1KbhnRueRlWiqJFVdewEbpDMkaS0OoYpMD+i6AQz
	 ww+caEMbZGkn1/uiDLgOBBEyJsY/C1h5Ia7QSn9i8qDiGKiy6M+pT3e/eHo81VKfJkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ABeSUjkd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAF7606A32E
	for <linux-csky@vger.kernel.org>; Fri,  6 Nov 2026 06:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ABeSUjkd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A93C1F008A1
	for <linux-csky@vger.kernel.org>; Fri,  6 Nov 2026 06:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793946333;
	bh=yh6Y7BZ84cxtCnoU0AticnfysmrdXRcXWUIexGoTN0g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ABeSUjkdomXJlRp7OLxtnwqoEbxd50k36saBTReHLXk7wNcTEpjheYev6c2DOl3Ev
	 u9XcUHi7pI8nT27gWz2PDVbFZG++fI7ee19hFVeuDfSIYDrFvz3nIakk1SQouYl7I+
	 UQRweX56pYHUxt42PYDhwjnQYjQ9EEe+UsqZ2iivjdQu4FAE7T9DP5zFFpQ+QAK3jG
	 HCJahhsOQ+rX6IaVNGvrorCWVyeghlCjarVR9xMQ3+V4xx64d9ixsOjY+K5vc+DYph
	 7J5b/7xWjmGMe5O5BkaSZHoymzH47Pn4jPpjKbDZwrexlDzzwIt5M7bubVsIwwXgkz
	 ajlXJqe/a6lxw==
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so1683625e9.3
        for <linux-csky@vger.kernel.org>; Thu, 05 Nov 2026 22:25:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBz5VQzYybOd3/EFWqIZBvCjNSgc8FTDwZS845b1r9lOlSrWpj0KuqBMV2KcTIE3SFAgfuGxXoBamukl@vger.kernel.org
X-Gm-Message-State: APuU4Z/gSAaueXJa3cgLq3VZxw1as301iBzsuz8COTg4Wd9GJBiNY0G/
	TFof7ND3krDMpicZ3aoV/2c9r5zPpnHcLlE1ojwd/daWKHGLphsCjtlpofZobEXn4mSCj3wSQZi
	BAfbtmGg5kQL/DvLa8EWwW71jQm0SQ1w=
X-Received: by 2002:a05:600c:1c23:b0:4af:c210:5b3f with SMTP id
 5b1f17b1804b1-4b6df3fd28amr22873545e9.24.1793946331804; Thu, 05 Nov 2026
 22:25:31 -0800 (PST)
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Post: <mailto:linux-csky@vger.kernel.org>
List-Help: <mailto:linux-csky+help@vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-csky+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029202624.2685097-1-rdunlap@infradead.org> <20261029202624.2685097-4-rdunlap@infradead.org>
In-Reply-To: <20261029202624.2685097-4-rdunlap@infradead.org>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 6 Nov 2026 14:25:19 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQwaH15YmgDtKg9uXcnAMmt3=Z3Scperjh=4+PerR-kew@mail.gmail.com>
X-Gm-Features: AclHuK8cgp4i24_xILUa4Qvec3rGOwQhNh1y33xNaaVBpsFMlgn5g6m_fQeuDvk
Message-ID: <CAJF2gTQwaH15YmgDtKg9uXcnAMmt3=Z3Scperjh=4+PerR-kew@mail.gmail.com>
Subject: Re: [PATCH 3/4] csky: kernel/process: add missing prototype
To: Randy Dunlap <rdunlap@infradead.org>
Cc: patches@lists.linux.dev, linux-csky@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 4:26=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Include <linux/cpu.h> to provide a function prototype that was missing:
>
> arch/csky/kernel/process.c:90:6: warning: no previous prototype for 'arch=
_cpu_idle' [-Wmissing-prototypes]
>    90 | void arch_cpu_idle(void)
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Guo Ren <guoren@kernel.org>
> Cc: linux-csky@vger.kernel.org
>
>  arch/csky/kernel/process.c |    1 +
>  1 file changed, 1 insertion(+)
>
> --- linext-2026-1007.orig/arch/csky/kernel/process.c
> +++ linext-2026-1007/arch/csky/kernel/process.c
> @@ -5,6 +5,7 @@
>  #include <linux/sched.h>
>  #include <linux/sched/task_stack.h>
>  #include <linux/sched/debug.h>
> +#include <linux/cpu.h>
>  #include <linux/delay.h>
>  #include <linux/kallsyms.h>
>  #include <linux/uaccess.h>
Thanks, I will queue this patch.


--=20
Best Regards
 Guo Ren
