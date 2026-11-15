Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794757266;
	b=mMX1enYfKQfveVhONtAHGYNkgk52ShVuVfnDZnUvnQMBEt7Ob0yg4gfHZ/7ECyqa8fZo
	 O8Sjlxk+1tSp6mIj1YqLBZZ24iCLhSnYGj7KUqazrF4xcP7wk4pxwhDLg61yOfDBuFmFk
	 4wIqMdSMsHxxWFUqbYsZVmwVXxC+knZwfSSERj12mY000vP4h2Q2bYgDyAA87ie+Ss2fN
	 /c5TzKKRtgex6J5HoIHWW1mvFikB8HXQJo2eb3e+y2x4LQL9EJ00js4zqM+qCh9WcEaiN
	 jg+vlQdEEm6syTz0UtWINtPkb9bxRhnq5v3Tgkizb42yJjvgAjpwdyy2DBdNta7odcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PVuohZ8xLFR5YiCoEYGFhyPTULZBGZj7Wpwh1r3TICY=;
	b=mVFYynqPr7L8VhuBEJUxo3C7atnVAMCEiIepWf9ReX03gEKTxl3WN0zV0CWI2IM7WNsn
	 xUfB/wxebbVQ97oTgB9fcRDAIj9SLduG6cDr7+0lvMwzWLTCYtU7Nv6OAhPoiyMzOjIhK
	 hpG+IMbZpBH3Cauzz6N4T0AoTal3iVyLAa/PYdwCwlQDvMkxuF2kbTnyagJ88mP9WoHT0
	 PA8HIdkA2WoEvAoh9XUVwaEaqI78fiyzHGObLlCzV/kLfohX49EFkDVcInBXBB4NRB5g0
	 Tn/fmOMrj6uJqnNuFxiLhRLvVZl7Flf9eRyGZ6tcOOv/PyaxJYSgS4/OHVnx7nqFxjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JcnXBjQ6;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDD9606A31F
	for <linux-csky@vger.kernel.org>; Sun, 15 Nov 2026 15:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEDD9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JcnXBjQ6
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4922523d1afso1243811f8f.0
        for <linux-csky@vger.kernel.org>; Sun, 15 Nov 2026 07:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794757264; x=1795362064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PVuohZ8xLFR5YiCoEYGFhyPTULZBGZj7Wpwh1r3TICY=;
        b=JcnXBjQ6oVs3WO6WxsJjlXF3Srfn+XWnPXlN0yzPpJsvcbjAwiYznR2yVsrq+dIF0J
         W9K1hDH1dg4Rq7lZSMIhfD3gchU0KLGorPdGJ+zlQeEucdr7nNce45CvydySUCY90PWY
         Xyu/qB9TRVQV4d6tUrWZIxOCTwwDWe69IsTtjWCZjxdP2vvALjzMAogu8SPoZHkOZyaF
         zuC9NuaXKcHS/ydQMct1JDP/0pjhpMGbTARWR/YcAz+Qib3t24DwWdP7jNV5O7sXEqo0
         nlPhnW30vWk79ZmVTGvnuZbrJ2Vgh12vhrZe5Vz+JkN4iiK2dMUW8v2WdxiY8cHNmbsu
         Y4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794757264; x=1795362064;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PVuohZ8xLFR5YiCoEYGFhyPTULZBGZj7Wpwh1r3TICY=;
        b=BhrLGN6sZvRNuBLEvqEBUgkTlDtCs7edIZrCVR/U/auzNUVRL8u7wWlkZMwIJOpnnm
         F4djAGapQF6JNLCZrm5YBQnAmSe21edc8QRR9ecBSpw4GDIrTBUw+YAzadxYrrn/wC9k
         qRtCevKZyYkD73Frn7+nU8xU0EpLcfDG2BSwcxEEuQifed3rE6r2fiGfZx3AgS0jcyUE
         34IWPckFJcPwwk3Lrt+QNmrSO1M7TGDh4UB8g7LmjIS2hBTgFp1RK5Yka9h7piL9+LDB
         PVlbo/dgGjb70oWnIrz8KEY2dMxfmC9SOv14poXcEqIeUzN7oAt0UoqRV2+v44a4eeGq
         igKg==
X-Forwarded-Encrypted: i=1; AL+hErH523FwRabOsb9/osybdgTF3/ukTnGBX9MnhYuSe9ZATyWSb9ZcPOf46Kw3cF3k0EbRCYz3V3LCzh5w@vger.kernel.org
X-Gm-Message-State: APuU4Z+S+qblYwzOW+S8GHJJwN2uE4NXWA2TrlQxamhfi/GZOxv87DE6
	sUzoUgUObX6DTmI3i/zSdo4qk9IzhNZvllwm48fnKs0JpGmYsy+01FE44uLfH2h/Qbg=
X-Gm-Gg: AYBFou0PbMKDP0elVcWJwT22PGPgPDv1BB1OyjWmtI5RtPpan+17aGaThZ8CFyQQ+ea
	nvzmKjaBJdr+62nifIVzL4py64TzOVhtIv5ZzoZBwv0uoKkLPf2jXa33EP7sLCNagvCKDwn2vZD
	3zRvi4FAMKySniUkmYH6ul+Soc9m1WwpyCEnJssUn6xmhUnNhLjFTH3JLe6dUqoXGUjVBcQb3Ya
	N7nfklyYf0DnzvlZMha5eWlDAfgQ4HG0Y//jsjnIJgZcckwKa7x2ijBAsKGqxYw6LbfXluT9u1u
	FMAFYU3XtmZOhwoU2jlDCayryoyoSnN+8fJJa+7Ok7U34vWIrxOlHXsUdw8r9Ln0VEoihR7BrKQ
	4gNght1IespGpTc2qTVkiyti/zKRK18mM3p5mTZaMFdVo8Sx2QJXZ21STBfHQQ+1UeTauB8FRwY
	kCEfvknzv54/me/AFH0rcY3mz4W6/tIux6RBxZ3kGYwTljyYG9PouZTC87R+bARJDavJWRRtewR
	7Q2PDVYLcN7a2htUcpx63uJAlkD5uukWBEAK5SZaCGIN+u1szrvrYmTVm+H/ldSbqh6D1l1DlJK
	lh+kzbn83heeyqgVWjLDuNCds2QbEBtjM3I=
X-Received: by 2002:a05:6000:2c04:b0:48e:d36:77 with SMTP id ffacd0b85a97d-49c6fc9db5bmr19465481f8f.4.1794757264141;
        Sun, 15 Nov 2026 07:41:04 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49c888b90d4sm16462060f8f.9.2026.11.15.07.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:41:03 -0800 (PST)
Date: Sun, 15 Nov 2026 16:41:01 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: gaohan@iscas.ac.cn
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 14/19] pinctrl: sunxi: add support for the Allwinner V861
 PIO
Message-ID: <avnR67LnZo4Mo0Tf@monoceros>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-14-eb71ec3ee523@iscas.ac.cn>
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Post: <mailto:linux-csky@vger.kernel.org>
List-Help: <mailto:linux-csky+help@vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-csky+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fgskattfdxvvv7hb"
Content-Disposition: inline
In-Reply-To: <20261114-v861-v1-14-eb71ec3ee523@iscas.ac.cn>


--fgskattfdxvvv7hb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 14/19] pinctrl: sunxi: add support for the Allwinner V861
 PIO
MIME-Version: 1.0

Hello,

On Sat, Nov 14, 2026 at 06:33:40AM +0800, Han Gao via B4 Relay wrote:
> new file mode 100644
> index 000000000000..742465076d86
> --- /dev/null
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun252i-v861.c
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Allwinner V861 SoC pinctrl driver.
> + *
> + * Copyright (c) 2026 Han Gao <gaohan@iscas.ac.cn>
> + */
> +
> +#include <linux/mod_devicetable.h>

Don't include <linux/mod_devicetable.h>. <linux/platform_device.h>
already provides of_device_id with less dependencies, so please just
drop including <linux/mod_devicetable.h>.

> +#include <linux/platform_device.h>
> +#include <linux/pinctrl/pinctrl.h>
> +
> [...]
> +static const struct of_device_id v861_pinctrl_match[] = {
> +	{ .compatible = "allwinner,sun252i-v861-pinctrl", },
> +	{}
> +};

Please drop the comma before the closing } and add a space in the list
terminator.

Best regards
Uwe

--fgskattfdxvvv7hb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr50okACgkQj4D7WH0S
/k78BwgAggANSfiR3lIax5U5QxcHapAeEwjkuu5kUUd7ThVymu6geBziPkTKM9LN
kV1vp14gkKuMuThllE6yPhDE+jBai3H2dmZPRAVxRmkHkRXaCGvN2Qy6QvjG7hn+
pKrIhNm9FD3gtJcf3syW5npYiRAxG/6TkK+Gz1PXPgmg9Yj7puOzJ5ZZsZ+kBOcS
xiSHHn5ujqEIP4jnBc7Dv7UpeDH4NxdbQ6ssuWEYpdmNKvGpbP4Xi4tlxo4RAMXF
XWXJcAtussx3dylMOghSQ5VBKABwOqksAb/tX5/oaY13ScR8Lg/M3WzfjwXPwvtR
yRXJHXEAk7lxYPB9WoXGrz3bVWm0dg==
=Eo1Y
-----END PGP SIGNATURE-----

--fgskattfdxvvv7hb--
