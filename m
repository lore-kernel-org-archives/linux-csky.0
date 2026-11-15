Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727926;
	b=V2kv3nyJQrgvU1cdu7B0Ba2+x9lmq456lemrU3IWJPRkqEp3LzZlOl06uVBKL5N5gO+p
	 aMNCtb8IgtZZp1Tegj1U758MULi2hFzoQfm/TJn4icNjvV1wmm5mUjmMsDiMq0nJOMrh7
	 pEnIELnXeV661kX5CTmpV0i3IUNeHkqVuX2YGE4MtaJP5upeXF/Y7+eFpXHqQoAiRjux5
	 RwrYED+uV3WAoWYTBgJbKvTZ1PqM3etZn+YIu8HPcHsfabY28yHImvTFAC4VtppXSrfnD
	 G9p27vPYQdOhiZGG/wRwskpIsDzheGJV7HW4sFDfHyxfn9Ze9rpkEzhI2Llmfo79ACA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=WZJNoA9PE/aFpJtYQV1Avlq3zZ1+tFwplbGmb9pSnGY=;
	b=oIdKQ6RwD4jsC/LX/mHhnAZ1o+MfQggAdjrVg/gwrq/YLY98P60tEQZI281yQh6oNju9
	 ntcl979gJgvGSL1fQF9cpWhJv1f8b9DQJNW/HV8XBvDR+0ROFWWj+a8zhoZ5jszzZN7Q3
	 hCNWoocIaltgTlIs1+Kx7RwgkWy69L4+4NQRGjoYcq3nFbelxLp17bpFfEs5nWyW/V9jP
	 1/MlslNYcjvsx9g/sPHtv4xv7RJGfP/SmKtgGhX5NxjOAfaLZwpAYIGLU6lnU/4lKJAY0
	 wVx4blK2SwXIh19F8wW2GdR3yxdRBjVvqJwRMcmXLEv6ZqGOUhwpoTmTCqalxNzvtLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zGLp07qN;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A543606A31F
	for <linux-csky@vger.kernel.org>; Sun, 15 Nov 2026 07:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A543606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zGLp07qN
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a210470b49so18775445e9.2
        for <linux-csky@vger.kernel.org>; Sat, 14 Nov 2026 23:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727924; x=1795332724; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WZJNoA9PE/aFpJtYQV1Avlq3zZ1+tFwplbGmb9pSnGY=;
        b=zGLp07qNJvhQ6+u0soNSdE4zISfLgteQxFDtiLB3+MHdU5R8cLNayQpDOu9z6E8HsN
         cokgnkhAr/wayCMP5a5YNMbrz8W4SjZLOU5BRZvRdWywNx6ylkAud+eGM9IO9xu5mMW7
         vNaai9gq6sOgHH/Plv7KLPJqtlQ7SNQhP8MwbOsiVY9oebQhNkQHqvTKMcZy20gw6VyG
         k7ZCwjq9cWqbqhlBhjXQDv7h88lCfGgbi6MypmIx2cT/mMVK282PdLi8Wwi9Md6f2p2U
         0P0GPJt+gXIMzGs33ytfrKjlEGV7t0Pg95zZC84eG54l5hQ2KUyeWmzxrEwtZdsEBCOn
         OqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727924; x=1795332724;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZJNoA9PE/aFpJtYQV1Avlq3zZ1+tFwplbGmb9pSnGY=;
        b=ix7iNJNZ2B4NQXf9d9u+WzZoWjTFaHCmbShODg1IC/zl0fu5oWQroqAyDv0EKjsuZs
         VVvpFjigCrdmpYkxS0ToXCCerGV0nPO2Ldakt0da7BXH50zW9HJwNL0Ne/gvK402D1Qo
         Szxu6vNCRVCg3coGO9Yngitf+54x1LVddvtDtXZI/9XCRnWv3P8f6VxerZIScjnAfaJB
         4wCTmVhSi2XHje+5NhIGf/NxvZRpeCjzrBV+BWvekkdOdLEXC4FRKueFtJvyBHoMxbEA
         hpNu79nWQsTRDXCHFdPyd/wUXJf7OpHgLhzSchrEVr/d7cbtRaHpoX9bthO+vFOXpfKK
         xo4A==
X-Forwarded-Encrypted: i=1; AL+hErGzqtxjuTI2taHsBiXQImwido2fFPkv20/Oiu3kUhODOjtqCvSNTkr3nfErlV3OJVjTfmBIMoo6psiI@vger.kernel.org
X-Gm-Message-State: APuU4Z+MQvhOla3RGQKWg1KS147rH/YMAzZLpO4oImCNLnmN+TxovOus
	I29GpVDR7PZ8TRlVP6vO5R587NkUlARR16JIjLpnY1W08Kb43yMztePG
X-Gm-Gg: AYBFou2KPzlKhmv9cemREfOI7mqyJIAR8/Q/Zp3C7kCwqWWWESTaryFEygQ6cHdEBXo
	tllU7RyOJadeACXMdzqa1WaMexdyIyPSLqoDA6TSulZfO+0s9enboWJFdjtJ6mghdPVaBT9Iis5
	O5sm7qVzmTZoiDZXgjE+oLuw33+dSJSl8T4IHAy5miDVA2QQznmW/ZVCUkYR4fWswnCz0CNY03P
	VKMfZzb0yqJ8yuTZgdNrZrM5JbqPHRQp4TObFk1OL+RcdghqfuirEK4QULajge37WXxERkeUpG4
	pZidq+PZhq1C7zuOvRuEwaeoY2/8Vc7xeDjkxcj+t9a5I82ploTopHK2G4THz3aYxZb7UC4zihO
	5ybvBH3Vf5TRUTrP03KY1cK6vHvjReWmqZe+KL2LxdLuAV5ZmV0V/oDiC7arAe/s/r+fhUw69mt
	dytVzpyu5bhrXaemWPr3knIHtHehG6mEQbZaPngqKJ6pRvaX4rr/8pOZlxGmYiOllgI3/YwFisA
	2zU/wChNgMbSLAZMgCGgsFHJWKSLyWShNvjH3jh1xb3GJMf5I7F0c1GQRjtBp+dc8p0flnZ00T3
	WIG+ux48//ky254QnM3Aa/d6b02Xp1EoV5ispPEzXmtSbCeCmxEF9uUfgkWOSp/gGo3T73+nuoq
	7QbpNioZTVtC0h4aFE2psARs4He0a2DQBzau5He+WZ21CIuJRX6RQoYqZnVvPNIey/j2PN5Ggn1
	Zu6pFH645waMDbv2TAeQp8M7fGsBgQJqxkFHeKaokjmhVYHQywQs07qi9uT/SpYUoed7RDtv9W4
	VlM2u+yMI7gTPokDIntUmgVu7hUaq9fq8yizmeqm9eq6Yo=
X-Received: by 2002:a05:600c:1f90:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb55ab281bmr146703185e9.21.1794727924403;
        Sat, 14 Nov 2026 23:32:04 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571cfa2esm183982925e9.2.2026.11.14.23.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:32:03 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: gaohan@iscas.ac.cn, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Anup Patel <anup@brainfault.org>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
 devicetree@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>
Subject:
 Re: [PATCH 19/19] MAINTAINERS: add an entry for the Allwinner V861 SoC
Date: Sun, 15 Nov 2026 08:32:01 +0100
Message-ID: <G7_h6i47RcuqvaGeHxw_dw@gmail.com>
In-Reply-To: <45f41ca4bcc76a6c5d0b9180c6492308ec3e85c9.camel@icenowy.me>
References:
 <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-19-eb71ec3ee523@iscas.ac.cn>
 <45f41ca4bcc76a6c5d0b9180c6492308ec3e85c9.camel@icenowy.me>
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Post: <mailto:linux-csky@vger.kernel.org>
List-Help: <mailto:linux-csky+help@vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-csky+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 15. november 2026 ob 06:11:31 Srednjeevropski standardni =C4=
=8Das je Icenowy Zheng napisal(a):
> =E5=9C=A8 2026-11-14=E5=85=AD=E7=9A=84 06:33 +0800=EF=BC=8CHan Gao via B4=
 Relay=E5=86=99=E9=81=93=EF=BC=9A
> > From: Han Gao <gaohan@iscas.ac.cn>
> >=20
> > Add myself as maintainer for the V861 bindings, clock and pin control
> > drivers and device trees.
>=20
> I think traditionally sunxi do not add maintainers for specific SoCs.
>=20
> Maybe you should patch the regexp of "ARM/Allwinner sunXi SoC support"
> item instead.

Usually no entries are added at all.

Best regards,
Jernej

>=20
> Thanks,
> Icenowy
>=20
> >=20
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> >  MAINTAINERS | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 93abbb315065..dfc300dc1eb2 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -24031,6 +24031,18 @@ F:	drivers/irqchip/irq-riscv-intc.c
> >  F:	include/linux/irqchip/riscv-aplic.h
> >  F:	include/linux/irqchip/riscv-imsic.h
> > =20
> > +RISC-V ALLWINNER V861 SoC SUPPORT
> > +M:	Han Gao <gaohan@iscas.ac.cn>
> > +L:	linux-riscv@lists.infradead.org
> > +L:	linux-sunxi@lists.linux.dev
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/clock/allwinner,sun252i-
> > v861-ccu.yaml
> > +F:	arch/riscv/boot/dts/allwinner/sun252i-v861*
> > +F:	drivers/clk/sunxi-ng/ccu-sun252i-v861*.c
> > +F:	drivers/pinctrl/sunxi/pinctrl-sun252i-v861*.c
> > +F:	include/dt-bindings/clock/sun252i-v861*.h
> > +F:	include/dt-bindings/reset/sun252i-v861*.h
> > +
> >  RISC-V ANDES SoC Support
> >  M:	Ben Zong-You Xie <ben717@andestech.com>
> >  S:	Maintained
>=20
>=20




