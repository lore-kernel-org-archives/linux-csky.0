Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795368148;
	b=2lKaw5PeK4R9xh9ABL4SEo8QhRwSqhf/VflNnNHo6yNLQGEarWMmAeSx3KnpME7kMVTR
	 NBTZ5eciZXCran8EIz4IXjqw90T3rrM9gOXcoRJYma1xZ7ufnJHZXespjHJBiYDLNYklT
	 DPNpaBXdDE/E1ZyWO8Xn4usVSUfeXoJxSRG7F6eSp1PBnLY1r+I4tIup7XPke7iQzmod9
	 vDSP2BS7uRc95X/SN38s1Mc+zGilnEj7Ig2wo5/V2SyhZw5JTxiBpL6O3wSOCe+s9hikh
	 r7ZEfGZIujCCMCEnwldaH42I2d1zGY8Yift5fmSavJ9QBvo0NKmz3NmRe6Ltn8CD0VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795368148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bsJvZUqn+Bb7/gG6ywuV/4DLp7NmQEDZvD3R+5g2Jts=;
	b=tiVYDNxmDiSFz3kBdv33zCp86JIqtZcv1uoR4L4QIGwaBfcloTfuwsoHtZvOGXygk9Qc
	 IRZbxHmaZmz/dNEjPp1CNz6h4tJRYrfMFayjISnqNVBH0sVJx/Ks6aJhObEGrGcUjkD4z
	 0PT7tFFpa4nbShrCqldlDZCHBMVjyow8n67rcl7pu+YuKlx30VzU2cQ2Fsb2aL7xnZGDI
	 RMMEEmdXfMTWWX3O7DpUM7tdRGnoHXbxfef3nntTHra7QAq4oI+6mhlICKhGTqar3hTWM
	 JA6thBKax+K3jwPiMRWNLIIDnszw3ar/NQVrQA/7+DuMXRy6Q0RXl9EQM3y4xdGXt/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XBAzZYcv;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EB4606A33B
	for <linux-csky@vger.kernel.org>; Sun, 22 Nov 2026 17:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4EB4606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XBAzZYcv
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b41188c8b9so1835534a91.0
        for <linux-csky@vger.kernel.org>; Sun, 22 Nov 2026 09:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795368147; x=1795972947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bsJvZUqn+Bb7/gG6ywuV/4DLp7NmQEDZvD3R+5g2Jts=;
        b=XBAzZYcvI0UAjxnxRcreZ2xa57tWzsBIk+xJyJfakPnjZQLRqB7gnVTc6Qn5CdjUbO
         xXTqI9r+rGRXSGvF5d9u/Gnt8cBL/N5/xf6tBndcQ9TnX3hHeuD9tSzX8sNkkbj7vhA2
         NeZPxacRSsaOBC0O3QO9DSW6vT50WIL7fgQmtZa0YNtC+iyBs2ZZbCtUEdbBWGXZZsl3
         XzMwvQ4v9H33vCd27VDcugFyzLDIPGo4nIjz28dfG3CtbzZTvpHODKvnyuNs3l4NIsgV
         rmrwLL0KqwTgCr+ubLcXoPp9NBBDnxFxRbDWkoQYlII4OMLRVrvsRiSieYn+T9Gsvdjr
         irPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368147; x=1795972947;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsJvZUqn+Bb7/gG6ywuV/4DLp7NmQEDZvD3R+5g2Jts=;
        b=l4N8qp+VOlfUj2ynUnrvfCNcw/lfg9JPMDbvVPYSjK+hIHUZYzLoOrTxL+Y3uARn5j
         A/OaB0Vn7g8k+FZpXM+BJFgBj/hqc4uuO8fUv76xdCjfY1/y4QSrQemZBhPDNKQnXUOh
         DBFAM5+UZzfP4WYaxXahZH4yauh326CaVRV5P/8S8fswD1n4HF3ePohrm8gcBGD31BPB
         PAwn1+8lbTiJ1ofPE7WHVWnIJaDKtxyiX+hx2W8hCWGbsbYFOrUNJxfKETSdKJYay+qX
         ji4BMLF13ZZAbPhCjiz0CCyhnf1V1cwwddfPhawl8zVvsvYidxDS8Mdpk1fYOvboKCz1
         Ma+A==
X-Forwarded-Encrypted: i=1; AL+hErFyYUxGVbPf/9jtyPemA8g81WNjomcxht6UEIx7G5hd1oWAJLTo570lL20M8dOclZNj3cFwm7abkCOZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/xgK1vvAywWwpmTHfwCJCMvNQvAueJ3JZtxQnx6tMNs51lzkhS
	iKXPAP1NmdXEhAHXoHZTihetzj540M9P+Zs8erpZpnwLkbExNlYTTfkM
X-Gm-Gg: AZFdTZfIuJFr6KzR2KHxw5qgWBpBEqc5KMNUjMRzp8OTb/Sfa60PorqKQsmwx+B8ep1
	9ggI/HcerkY5o+mN6J46u3k0jJC2J/B7qVB0ElucAHAaThNTj+x7p+/ui9ZeyJ+zDlcM9xlWHma
	0DfBiEVH1Jfa8T0MMph46iZ9QKcCBNSbrEY8qh48GX1gWp5Js4AjQAA4W3eitqTiNl2O9nX6DKo
	L5qsFoyUWYPZoKKIcRDgJFMyekWdtarPCkWlD1N3P3n97n63TT2LY2gySkAFmoaQt1+G53In7TJ
	oOVw8S/qlF4phBU+R4Z6Z3fwREluEPCb7wjRF3IYr7i00fhTwnCudMtK5qbGP4Gqrdq2icE32Qk
	qNUu6XjEgNhkkM2z4gy7zojQqnhT8yVARgTv4moV7htwWtxd4RyI4xvNTsn956nQBi20E5Nk9KR
	LvbCpbBzOZlfCSqsTOHEkIKl/llT4rTDNmQHiKhTSO59HL/B4+s+u+nJbS9IBZFsatfTaTUTIbi
	suMX9vWKjcSJzipcQ0qJmap+rjaiwoRVo1xsIQbGws5oV6x8rSJItk2Yd+7LS+Qei8H0gpV5Swj
	u0kl1iU15KMB+N+ao84cEl91UahL2LscfzKKNq8QQZ0vXm04TY0bQ88IoRl+6g0vF1GzyqGi1eA
	Z6x4=
X-Received: by 2002:a17:90b:3d4d:b0:3b0:9162:948e with SMTP id 98e67ed59e1d1-3b41c905a3dmr8081661a91.27.1795368147033;
        Sun, 22 Nov 2026 09:22:27 -0800 (PST)
Received: from localhost ([2.27.148.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm13471136a91.4.2026.11.22.09.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:22:26 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Han Gao <gaohan@iscas.ac.cn>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Ripard <mripard@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	devicetree@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 06/19] clk: sunxi-ng: add support for the Allwinner V861 CCU
Date: Mon, 23 Nov 2026 01:22:15 +0800
Message-ID: <20261122172221.3552455-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <c8OwiyQSR8ivEFULfFWNow@gmail.com>
References: 
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Post: <mailto:linux-csky@vger.kernel.org>
List-Help: <mailto:linux-csky+help@vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-csky+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 15 Nov 2026 08:31:11 +0100 Jernej Škrabec <jernej.skrabec@gmail.com> wrote:

> Dne petek, 13. november 2026 ob 23:33:32 Srednjeevropski standardni čas je Han Gao via B4 Relay napisal(a):
> > From: Han Gao <gaohan@iscas.ac.cn>
> > 
> > Add the main CCU driver for the V861, based on the A523 one. The CPU
> > PLL, the CPU subsystem clocks and the E907 clocks are left to the
> > firmware.
> > 
> > Unlike on the A523, the second divider of the 27 MHz output is a power
> > of two. pll-audio-4x does not pass rate changes up, as its parent also
> > feeds the UART clock mux.
> > 
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> 
> Do you have any user manual for it? Or at least BSP code? It's hard to
> review patches without any of those references.

https://github.com/RevySR/linux/commit/bb06380bc2e5a02049cd01e0b10cb3c3c694b750

BSP code

> 
> Best regards,
> Jernej
> 
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

Sent using hkml (https://github.com/sjp38/hackermail)
