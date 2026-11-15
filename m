Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727877;
	b=FnFEXrIi/rU6r7SHgmt3Mv7qDwoZf3vsosbSO+GLNPegkhIH918kt8DT2ca6SBSF3jrK
	 fxk5A9dyUyT+1ftGtgaVxVsg+YHu9IsJCf8vfviyNc1MyvfkoKsCH9lsxxJuBlMj4HYtp
	 PCbESUkRInwgMmwpW3l0bN9onrveT23K30ZiIvrdbjBzi+RUVkrVTU3UXBJHJ53wysutZ
	 AP/QjABsJKCpwSg2SaPaj0108Y4CJxClFhyZ1hpkczi/DW0YjYH+/fnznEFB+LZXORbZ4
	 ImeNL65qAuAl0tLry2TuFnjvz6OE606pO9Q77Zeyko5o5cTv7k0pVz8BBfbPEfkGk1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=qI3xoqr08MTqFKH89OHdawFy9+IYpxgrM6eMy9hh1r0=;
	b=hgBCPQhQd0LB5Wkqgyh3fZO5lIcAsDHIOL0dSWgDQDarGZvtFS0h06KJCpkJF4+hOtFx
	 f065Xr1L1iu0W2aYWop3xJJrxrz7m38NRFzLrle8ZH64/RBauqKN+zPWX/Vuuh7F56Ewe
	 jokSQxwVdEltEi6lAsI34QbotMnucPGJMO26mO3T6X2Dho8vR5KlKI0Ief/zGwUGf7qpQ
	 CwOxs/qMSSAKrs6DXgXR84+ggrRzlIawTyccInFhTS1aRZsnzP16HF0m7aO+v8vuHJMsN
	 hAngDZ1gCHG3kkVYZ14eDv0MZiUfp6R2F9g/BRdn8+sPbQE121OWNt9mFQpqQsp3VRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sfHX33b9;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91085606A31F
	for <linux-csky@vger.kernel.org>; Sun, 15 Nov 2026 07:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91085606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sfHX33b9
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-491971ac844so2232583f8f.2
        for <linux-csky@vger.kernel.org>; Sat, 14 Nov 2026 23:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727875; x=1795332675; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qI3xoqr08MTqFKH89OHdawFy9+IYpxgrM6eMy9hh1r0=;
        b=sfHX33b9HzNVq08BaSf4y0sViK/MK0chzVBJ0Q+gvrAe9T8wXjtDwJMVvfNxxjvT9l
         SEWTWE0sZtcsNwKWEFyXzvLZNe89AQsVdApUgEXQBL0TJsoj+jbScFkEv+3jRZ1lB8vf
         d/rISxDPp+F/K0bJHknHkk8CXnGYEM/127Yv2NeUvCKPhYO+eTU9rpQmEU6Dd62/EQvB
         fz0HUNzeHXC6U3b4kz52ODEk3D6rWUXeADFYBeeqPtDrSrS3EHKV1D44l3N4ZEbUKSDw
         GOdF9hL5WuF6stzHu5B4BcrufdthWBPcUDcNVZnPgxjB1MxYoePPvR2o1eoXKeb9bMzV
         K9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727875; x=1795332675;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qI3xoqr08MTqFKH89OHdawFy9+IYpxgrM6eMy9hh1r0=;
        b=NBC4UOSCAF3fPsi44gwb8pdYLhsGQdw8VXFWDtrCQKqHSy1lfVoA/7oQVLWkwSSDZ1
         G2ToXXvOvI9J8DQh8J654v9QR7ffv6cbwUKUh5Xeb87HpdZqGJWbfJxnX/9a2SCP/8aK
         iHj1KDNzjeWEWcshs7B9a4fmPGg/+8biGBsO+OvYv0+04C0IrRr9ytLmvvq5SLU0ZMAN
         YPhyCMcm22afRGYUv5/sIxR1c58PVr75YPr7D6wFzT3liMwVyi7ljxE3BT8AwcytbxTh
         BnoR2XE0QMhanlXyQyQFSC8NsyvFHPl6z43VlkqlRrksCaGCiZ8v6YP5tq66gKanJs5l
         kdOw==
X-Forwarded-Encrypted: i=1; AL+hErEUyldzH9n381eKN30C7PSiPVhBtxRczShiHSD51WK3d0cMqXtH6bKQ8qzboUVwgyBbKtEGdUsm7RMH@vger.kernel.org
X-Gm-Message-State: APuU4Z9H24vmYgZnzjLRdjURFsDfCsfAy4jK75dUhFWAUMMCfxF9ivzd
	gNg58oCsvunqeuMwOfL9G5mc0/mDWPoeWY3BnfDhMMACE2dzMrBa3fBB
X-Gm-Gg: AYBFou2wlO0efMuCLOPsv1rqkmtiov51Ox2Lv0lCQKjJ2qvW+9i6eHpE8Oui41HZTg7
	XyLkxxm5zum/u99SxYGtHC23o7F8wwNxPYhpVzkXHPwDUUdQ7ujhRusvhMzWHjAdW8gAECUC0Bt
	qWAXMAopaj1IN6HCkSiJ+OPZSCNdHAjKoEO2srH53+AlPleTXnchw4zipfjKnvhZXfxSyhFpqK8
	i58AMAAbBDAaDmAnuPYHpglRyQtmswxuEfyG8JssPUvpjSRwgDZPaA6rQp28xxmvjCtyW/kb96h
	UIqP6CM7csUBNeJOnwcPQUwjyDZsk54c5mAMQLVy0aj5qH+2BqM/pcxThz15MnU/1ZweeES0lnr
	jR/GSKMctye9JfSlHf+RzTb8zRelL2vsu4C8sRvbMK6g5IL7jDg2vN4A6OM//aSdOrR/YiPqONM
	g+TmA/9TBbVW2gGEa10N2+2Y+WgKaoFFKOwSzGVdH/xiusbsnLbho7RVCFqUq7CWZR0sXljW7Xq
	cLzVIrSxzaQh/Ha5ASbE+fknwW+u6dql8D+WUC6EplMVU9b8ksItmUQ+a/jofRltGkPs+3kfHsd
	xZoM5lBjZPyymTzsx9uUG3OTSV/GpFg9jHLEdZSYx7Ak40XCInebEtB1D9YjouIlN3xr0eJ/NlC
	HHJTokTs3h+6RUECvDLR+azEay35BLTaDwtkJ6rvtydBVLzOAqRCYlxLXQBdUPi4tYIhP2CVCet
	xa86nWa1W0gf9ivYtlCtkqKV+WKUHJEvG8Zq3R0FA1tD108CqYGoxEjU86PeFyhXch+PkVEuIYs
	kSpap9lXifX9MrXuFaHFcFHFQ==
X-Received: by 2002:a05:6000:25ec:b0:493:803e:800f with SMTP id ffacd0b85a97d-49c725e5749mr15660384f8f.29.1794727874441;
        Sat, 14 Nov 2026 23:31:14 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e31sm12992274f8f.19.2026.11.14.23.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:31:13 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Samuel Holland <samuel.holland@sifive.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Anup Patel <anup@brainfault.org>,
 Han Gao <gaohan@iscas.ac.cn>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, gaohan@iscas.ac.cn
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
 devicetree@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject:
 Re: [PATCH 06/19] clk: sunxi-ng: add support for the Allwinner V861 CCU
Date: Sun, 15 Nov 2026 08:31:11 +0100
Message-ID: <c8OwiyQSR8ivEFULfFWNow@gmail.com>
In-Reply-To: <20261114-v861-v1-6-eb71ec3ee523@iscas.ac.cn>
References:
 <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-6-eb71ec3ee523@iscas.ac.cn>
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

Dne petek, 13. november 2026 ob 23:33:32 Srednjeevropski standardni =C4=8Da=
s je Han Gao via B4 Relay napisal(a):
> From: Han Gao <gaohan@iscas.ac.cn>
>=20
> Add the main CCU driver for the V861, based on the A523 one. The CPU
> PLL, the CPU subsystem clocks and the E907 clocks are left to the
> firmware.
>=20
> Unlike on the A523, the second divider of the 27 MHz output is a power
> of two. pll-audio-4x does not pass rate changes up, as its parent also
> feeds the UART clock mux.
>=20
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

Do you have any user manual for it? Or at least BSP code? It's hard to
review patches without any of those references.

Best regards,
Jernej


