Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794662119;
	b=cOsfBHBuJ7Fu+KwGWHXobGSReOoPQk1PMVRiGzvuEH/hIEw++7X7Dea8l9DaVATt0vsx
	 GKKlEdVHPe6NGI3bdpuSSMeECG4vKTZh2D/8hfQH9ubHaj/+H9bnzS1roLXQ5iVJuyjqA
	 YCaiKvbkL0yIIP3ICjqWv6xGY3LoCaHCIrmPCPjAAVHAQ5EwraTikG1iCZjrxja9Fppsz
	 EppGd/T1+nkuVsTfguODLUTIoluNtJo+w7hz5W8iauGtfndBdhiiy1dPQxDSnaTK6/8uy
	 pTh0twIaofhxWmPQjrGTYRD49+rU0GuI6CQ7TXyw1JYSHSSbSaK1+B4NNio6vMqLOcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662119;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vNQVHHIZZSTfT1nrplfEiIhLIPg6pXBmqlh+M+H8vW4=;
	b=aKKW9l1Zdu7H20lLiUTmDeS3O0+MMX7vOXcM9NMQO+F7m+uLT6EzctAxixoCWeDFq/3U
	 UrhMW35NCpsqsA+g29S8wWL9bEE/BAuReamSpEMclUDjaNn/hUKLQglckM0sLMmwVA9P1
	 bEl8laDty9a0eSTDn1i0LmdzthWLHFDt0Wo/v/juRHClWPL17vyEzRwiiucR+zoIqmNcn
	 30JgiSaQLmYOpSwAEgIHwIfBuo/pNqG6CeoyDH5uqZ2DWOiSjrSohyEsZuh7yBqZVTi8a
	 lpr8NgvIvZVedRb5nBRHpvouTWaLs3Qic1YMNSghtNzSLHjPMkOlx6IQFWLhtUWgg8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lf7YOYxV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B6B606B0C5
	for <linux-csky@vger.kernel.org>; Sat, 14 Nov 2026 13:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lf7YOYxV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 907B51F00932
	for <linux-csky@vger.kernel.org>; Sat, 14 Nov 2026 13:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794662119;
	bh=vNQVHHIZZSTfT1nrplfEiIhLIPg6pXBmqlh+M+H8vW4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lf7YOYxVYTo5d0Tbx5gjgNZgPFz3MxuFXw29Z0fXtpyvQLlRrt2F0jRnECvFS16r7
	 430u/94eNRLSN8StKFXd5LKPWVBYC1YmrUZCOGWBSbDeS2mC0JiTT+JGiARRZNMo20
	 Vf/baGSX3peSR8oLnSEzJDLJ+cSDFHAri6ZstYW4/MNQe+8OTtzEScdG1Tt3kOzQz5
	 EkInjFMaSoynkqxUCzlB+LBP17jf5p+BjAXmQT5Afitek8u6KhlK5VTbb3IU9EAq4Y
	 09a/neI1QYgYvPd8juYRJOS+ySsYJOjR26YtDPUj9Sob509vbXEM6thWCsomRplVQW
	 rED+Vwwv0D4sw==
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so2409055e9.3
        for <linux-csky@vger.kernel.org>; Sat, 14 Nov 2026 05:15:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGCEMb97YyA+e9FqVH3PUD0ZOw4GUt24XbIWTQ4M/Y3qi4i2PIajYnFbK1bbHhC4UfX81cmGKOOb7cG@vger.kernel.org
X-Gm-Message-State: APuU4Z8Q0NiGwqRgAcTzJ0LEIvFXiDAVBSzjFLwza0WEPIt4TPDLTfzV
	2CKUKJ3jfW6ttASXtBcd/a7CUE0vZ5N38rxrj9denTwfmSzJoTY6wzNMSgdiQfditV24mYUJy96
	MribY1zMBV/X5LhNktemRE360Fq0e10k=
X-Received: by 2002:a05:600c:470a:b0:4ac:b0b2:fa12 with SMTP id
 5b1f17b1804b1-4bb559f5d44mr107933255e9.1.1794662118139; Sat, 14 Nov 2026
 05:15:18 -0800 (PST)
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Post: <mailto:linux-csky@vger.kernel.org>
List-Help: <mailto:linux-csky+help@vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-csky+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn> <20261114-v861-v1-19-eb71ec3ee523@iscas.ac.cn>
In-Reply-To: <20261114-v861-v1-19-eb71ec3ee523@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 14 Nov 2026 21:15:06 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQQhhDe6vxjNSUfoC87D5hW_DFS+gUnrt3ojnzQJEd5jw@mail.gmail.com>
X-Gm-Features: AclHuK9KtD0Arqx9onqXzPVHTGELkECSfl6DqyPNiPMBBAgZM_jcqAKpqYXH_44
Message-ID: <CAJF2gTQQhhDe6vxjNSUfoC87D5hW_DFS+gUnrt3ojnzQJEd5jw@mail.gmail.com>
Subject: Re: [PATCH 19/19] MAINTAINERS: add an entry for the Allwinner V861 SoC
To: gaohan@iscas.ac.cn
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 6:33=E2=80=AFAM Han Gao via B4 Relay
<devnull+gaohan.iscas.ac.cn@kernel.org> wrote:
>
> From: Han Gao <gaohan@iscas.ac.cn>
>
> Add myself as maintainer for the V861 bindings, clock and pin control
> drivers and device trees.
>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  MAINTAINERS | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065..dfc300dc1eb2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24031,6 +24031,18 @@ F:     drivers/irqchip/irq-riscv-intc.c
>  F:     include/linux/irqchip/riscv-aplic.h
>  F:     include/linux/irqchip/riscv-imsic.h
>
> +RISC-V ALLWINNER V861 SoC SUPPORT
> +M:     Han Gao <gaohan@iscas.ac.cn>
> +L:     linux-riscv@lists.infradead.org
> +L:     linux-sunxi@lists.linux.dev
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/clock/allwinner,sun252i-v861-cc=
u.yaml
> +F:     arch/riscv/boot/dts/allwinner/sun252i-v861*
> +F:     drivers/clk/sunxi-ng/ccu-sun252i-v861*.c
> +F:     drivers/pinctrl/sunxi/pinctrl-sun252i-v861*.c
> +F:     include/dt-bindings/clock/sun252i-v861*.h
> +F:     include/dt-bindings/reset/sun252i-v861*.h
> +
Good Work, thx for maintaining these.

Acked-by: GUO Ren (XuanTie) <guoren@kernel.org>

--=20
Best Regards
 Guo Ren
