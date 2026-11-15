Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794757400;
	b=nF8LSu93u04O6YHWYo2nCjHIa9pKJMrCFHW4nBO4eIMZy5Z2fbnXIVOpP1i8m0WnOUHH
	 vs2YMxjQJFxRF1m5BoqUIo1OanRIu8IOEIv40Q9y2IyzIAGniUS/FCDqwOxU54g0BJ2XA
	 VFdJKtfXDGvOoTvOV4cZ0IMTXYYUaPg878Rafn/+UZPiXzy6u8lL1UvPD6DGHG2XQBAAT
	 b/RdDlPZjx5eFe/RpmiTbkgp/E0qfBMDBPBpGa/gjpr2Pk0OZA6NDvos6qzSy7/3VhDNM
	 zk9967Hpm7210e8xcRRHkthknfAtzuFkKofEwxLsmag7CboNfUh36jggOjs0WYyhmYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hziuiiMUYFT/Qu2Fwgb6Sb0cIY/xqbSxPRQl/HG5KA0=;
	b=5o7u4fpmChUhNvryOReTMQy8Iy9FX77tyQMclBArlLmIIKcjsODxUegbnLyIUU05IpZr
	 lSR3TGzT+RD/hY00ezs/iZHzZnO6IZbxXLHGAQAVFmCY68q3pSAEEonLGan6+8UxQcvVn
	 4GcrUBySEBc+OqJXudU+mKxTfuA0LuWN9+6pOr+dkhViBdCxXmVjNZdkQxDVPbQWbfJga
	 gmYZHO3NgQtbzQW+NxenFZsGQacMWFCSGX3UQUNmvoMV+W+d4QbUFh36Zwwr1MbSI3ZnS
	 rsTfOjlMYdrxPXo2QHNAtiBLIyFvhkiucrEq5K0wgbzZt/zuZE/WsOzHOFC4WnSfOgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HBYr2ghe;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886BE606A32D
	for <linux-csky@vger.kernel.org>; Sun, 15 Nov 2026 15:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 886BE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HBYr2ghe
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so11973275e9.1
        for <linux-csky@vger.kernel.org>; Sun, 15 Nov 2026 07:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794757399; x=1795362199; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hziuiiMUYFT/Qu2Fwgb6Sb0cIY/xqbSxPRQl/HG5KA0=;
        b=HBYr2gheQUl7c26Y3yfqksOaTOYrIFYUyEUzlZUZhWSZy+HAESqRcXZrP+TZZhM8z9
         75y4g55klpFlA/Qulr9Yg7kYDWq1+w93Piu62izk5f8edZNdPTqmw53yQIcVZJ8POpjR
         FCFDGpFCG+XXUQSOtyP6WZHieYuBpqKKanKZ3wnDH3I4OGAaLXxf7XH2XvGb65akJdzr
         QUEsYnB0UF1WTP5FCzRnWQED5TK5P0HAm0HJ7Hpeq/wgtIM84HN+PLhoAeYrZah9RjSs
         zqZK2w+ADZMGUpKyIfEL5w7Zfqyz1Z40uP2rSoJOgyF58OsUuKjbbaFJV/9eOLQrvgqB
         Q1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794757399; x=1795362199;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hziuiiMUYFT/Qu2Fwgb6Sb0cIY/xqbSxPRQl/HG5KA0=;
        b=oLBD/jgKGp4y+waXfFumSKTBf9evkog1r3qkv76sBA+5EtDxmHWD6F3HOO2eGOIdpL
         27MB2DeMnb7KFuHI4xST2k/m5YPQP/mj2IF+LAjNeyvIbartvcMaA/0W+mIZPobhkmRv
         29ySyzENjBaUTFGihfLJsixPzuYoB/dtZuYfbGx811iYxaxpyenQLhqQogKeyihE2ghC
         m6qRpXAztIAZEg3klupmjuB4n8niLilqsuFfazQ5raLrFd22Sc98GadDWDOkPxiY2yAM
         pJJ1xj5oQgRq9GkuVDHS+871sydAQZojtQVmOxB/MrOd3vrNoc4+Ska/FmFD36XNd4Tb
         gAfg==
X-Forwarded-Encrypted: i=1; AL+hErGBHBF7GmHCnVjIEaETcB72RtPFQUKZiy54QTXldY9JAYdOmozn8oH8ef6IcuADbcC5tx9fOPS6L3PD@vger.kernel.org
X-Gm-Message-State: APuU4Z9Kaviuw7DjTChfrjQiU0zXLZxvuH/lE5JPq0jjMyGpdFOK48q4
	uCYpBq2qdX5nhM+flZP7AD4e0HGn9JEXU65duJsH6wRk8up6VLM3e5kbUinJMHYirCiGbY2MxTL
	e7xvI
X-Gm-Gg: AYBFou0m0mCv82HfLr9lE4LM283YkTvXYaamuq72N7OPOWaqKQCldNRfqgsfLsU6u2W
	u28DuG89YEm0GAX8bglEVdRjKjAAp0qKgZ/Vwt0fGVJVNYd37MOEK8rABUaB7+s/O88UwctMZQT
	LOlToHiamoxYG8rjQ2gz6iDN/hjfx44PRq9QLfnP37Ng8HmPwZTj2OX8qojeuklvcBLG9b3Ioze
	JDDLMXZD/zb1aKrnQ5MxC2otOjytJFqbJXOf/I8y4m2TiPcT4FSsP+TErvLPH5zTQ4wOYYdP068
	W5BZ+MSIQBO7r7aaGofbJ30AP+Gp7iHPlXkQhAQujkqe7tP/bJXCi55gB3LBc5e6jBsNgBBn7V6
	HjW+CzKC3uTBsXHun4wi+Lq1y9EqYncmsWoqdh4FMpFjVyOSPyi2sdG/GGS6sBmP43TGN1Pif4v
	T/zGPGn6sl4RwoHGDbdkD01vI0beE/cEJzl5MjVEL9Wq7n98RLnPNhxBUJGR+J+LQ+8A8qKLET6
	9JCrqL+737fm10/zYzKfS86V+bY95uHgpMjL5pepc6RHqL4cjOxNfHycZO3RIev7VmQFX5gHFxu
	Y9KL78QwHUAKjfG+AAtG2cOShZ8q98H8mK5SXWk+yS/sjtrarThy3kUI
X-Received: by 2002:a05:600c:608c:b0:4bb:680f:9a3 with SMTP id 5b1f17b1804b1-4bb680f0a64mr77590835e9.2.1794757398894;
        Sun, 15 Nov 2026 07:43:18 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb68c00b10sm52646085e9.0.2026.11.15.07.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:43:17 -0800 (PST)
Date: Sun, 15 Nov 2026 16:43:16 +0100
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
Subject: Re: [PATCH 15/19] pinctrl: sunxi: add support for the Allwinner V861
 R-PIO
Message-ID: <avnSl53KHJWGrBcE@monoceros>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-15-eb71ec3ee523@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="nd4yu7xpyaelhc7q"
Content-Disposition: inline
In-Reply-To: <20261114-v861-v1-15-eb71ec3ee523@iscas.ac.cn>


--nd4yu7xpyaelhc7q
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 15/19] pinctrl: sunxi: add support for the Allwinner V861
 R-PIO
MIME-Version: 1.0

Same feedback as for patch #14: Don't include <linux/mod_devicetable.h>
and please fix the spacing in the of_device_id array.

Best regards
Uwe

--nd4yu7xpyaelhc7q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr50xEACgkQj4D7WH0S
/k7FQQf9GMWHvRPfVzE3vnOHAT8nN1+INki1D4kL4uwlHr3JU4yutcwFkaHKLsQU
b4DbnyStL4d7i466zTUN7GaSuTfs5LByLE0hKNibeGI5Wa+bHdhPXZw6poTITVON
f2BwjcuK+Zq5YQKqimrjo/4tbchvvRaJ2tX4FrpWxIYNSEVPVDu3Ku1FTeQTjQiW
q3iSJsE9FH4VZAUg2tViVg4jIzTIj6ncm2+HvaOFr/vv8gwncEBYp0IlMVPyqH3A
a+UAaIoEVNFvPPDDjTGrnHlPAjkkKoP4p3OAxBnC1l6qyEx0qCChV2gqtkPof0ba
XuoM97TKUIIJOGjYertizBLa8GJ32A==
=5u67
-----END PGP SIGNATURE-----

--nd4yu7xpyaelhc7q--
