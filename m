Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698837;
	b=TPjvRSVXDYGZim0uyBAspPEPIGaKOLaHip1N9hKAslmDp0Bq3c/eZ2vXT4koUYsXXjvP
	 Dh06HOnloBiF7hI6dEYqbFX5OJdK6xj39uvHqaeK9tAOD3rY+yfib2L1RczyOXQBUKMnc
	 29eAV4o67k4wdWLoqciPAmtsd5zH21L+ClRFt2OmOITEsy9Ek1chnXTUQ06t7gU2/5vjS
	 uKlD3a0iY888Ycx8kCNEtznhNZLhaJS0zbUCaYl9XWe9uzw80xJEQs7dBuguNdGWpKaEs
	 Fr8q1E7+a1Oyn9+tJoKWL7+MvZlVGLaEyzmfJR+iCg44cy5jZc4EkSMeqcyIyZIwpzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698837;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NGKjIx/lsrYSs635frFVwYK8gqcYIaaf5ELPmMFxaA4=;
	b=J4IJt0ltWmMzCdyK62Q76UC86jXiwDKVT+M6R/KxiPi9Zgho1kwTteoDkXt4TGPZmhlX
	 89OOlB69A4Pl1FbK8E+e5Ch6KEJTgBEmjGtOkKjsH0IQqntkZGF1nfFUIVAJLpVTVSE83
	 LljLDyGhLmSdmhtRxeOVpXUAhNQwcDyPEn0sjuHyj12PMNKyLo2iDR03qsoNIZvIR5Wyv
	 kc+9909CjFywhs4OkwWWCxuvj0dkWmx6sH8ERTGgPKKM4NoTTXY0PaJvpVHfLKgndd3PW
	 dk1scuG0pWTK9KecSbP4OREYHBIISWs06YI6tvwX/zCX7IbeJu1V6/QkA3VdhgEIesQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E76uDGxf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8E0606A326
	for <linux-csky@vger.kernel.org>; Thu, 26 Nov 2026 13:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E76uDGxf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8BA51F000C0
	for <linux-csky@vger.kernel.org>; Thu, 26 Nov 2026 13:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795698836;
	bh=NGKjIx/lsrYSs635frFVwYK8gqcYIaaf5ELPmMFxaA4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=E76uDGxfRoHMxGSx1n/KhJ+/uaL9TdbXC0lWWjb9UmJO+qdb3//M1VgGazAdje1Pf
	 pJKZvnJMW10Z7G9wYhRoZnqJ+GttWxUDW/DmhV5zn1mTSj62mG2eFCOp+qUwhw10Sm
	 kwMz/4/CQQJansfi+O1ysUveSuxNaDvXslw2VllzhDvIe+QiM8Vm0h0/3bZ2eQ73fG
	 EhicxdctRdXs9uh9tuvm+2zx+teaJl8bI2B9RZ0nLnVpHgQLf6ZBJDU0MbqVoUQedI
	 lIG7xfKPt0LJUj6A7L1VG+g9H9szNvIYHLeSPeiQFwyybnEgI1FqgszUlIkUVpSGZW
	 mpeycp5SAbIow==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ae2fb3fe2fso63234391fa.2
        for <linux-csky@vger.kernel.org>; Thu, 26 Nov 2026 05:13:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGqbvXouktHYzXmDxBf/71ktPzkif+mdBhF7bZeeGHfRCgpUKdsfQi/HOzqofMrJx2m5lkFeXv8EGzo@vger.kernel.org
X-Gm-Message-State: APuU4Z9rSHUKf20aRhfEkCxN2s5dm0s+RXOProw3tVNrHW9GsbQG1y3r
	vSVRekV4/W7tvZsg47g+B5tx5bTHcej4Ez8k6CnVjBxLkoHNf6ELfaJVt9SqF9B8Onqv5O5Tppr
	Y+Mvh6u+XEEolYIr6WEChTJdj0G2yCJE=
X-Received: by 2002:a05:6512:304d:b0:5c0:a65:ad2 with SMTP id
 2adb3069b0e04-5c1bc814bccmr7600916e87.49.1795698835538; Thu, 26 Nov 2026
 05:13:55 -0800 (PST)
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Post: <mailto:linux-csky@vger.kernel.org>
List-Help: <mailto:linux-csky+help@vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-csky+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
In-Reply-To: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 14:13:40 +0100
X-Gmail-Original-Message-ID: <CAD++jLkSr5Rw3vzQH_t2uGq3ZSnFDuFxwhMpdPbZ-OHmTqiMvg@mail.gmail.com>
X-Gm-Features: Aa3M54q_yjAB_gF_ehQIHoUZMFIkQNhkQlSji1urlQGfqAlyuSk3xRkB3BtsRVk
Message-ID: <CAD++jLkSr5Rw3vzQH_t2uGq3ZSnFDuFxwhMpdPbZ-OHmTqiMvg@mail.gmail.com>
Subject: Re: [PATCH 00/19] riscv: add initial support for the Allwinner V861
 and Avaota F2
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
	Andre Przywara <andre.przywara@arm.com>, Han Gao <rabenda.cn@gmail.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Han,

thanks for your patches!

On Fri, Nov 13, 2026 at 11:33=E2=80=AFPM Han Gao via B4 Relay
<devnull+gaohan.iscas.ac.cn@kernel.org> wrote:


>       dt-bindings: pinctrl: add the Allwinner V861 pin controllers
>       pinctrl: sunxi: allow a per-controller IRQ register base
>       pinctrl: sunxi: add support for the Allwinner V861 PIO
>       pinctrl: sunxi: add support for the Allwinner V861 R-PIO

Can you send these four patches separately so I can review and merge
them in isolation?

I think entire-SoC patch bombs only delay merging the things piecemal.

Thanks!
Linus Walleij
