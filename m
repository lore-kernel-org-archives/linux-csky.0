Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794661654;
	b=fvxNVQpM6OtnnuNsm4y/i2bC4z8S18h93aRXsveI6ctinNumRO7KcfsRgqeLkHgAZzpD
	 mVjN5qh4ov8KpeZhUxPqu2ySJyWuUSHIHkIcwHBqqFZHck12ip6Zs7otkIHKfu+C1VVve
	 3Ksbqz93C7ypYqLBwEfpAzDUjViSo+/9Eh1TMVWfWniAkJPLEwN+Kl+qStOlqj6gEGSVr
	 z2vFPRkcURg6iX3/2FSGX3zuimAY4WagVgHKW6dwAyOG1Kb7/q84IdtS6BeLTty3t42kt
	 64Y7cmAqCGz4AVrxvqvcT6hP0o17ttLcEk09XH89uNXBWTPxbhMexE+/1TYa2R9e1Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794661654;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=O67Sld1N23xdXCx6gIqCXwUsjQS8tlDbGqdMHZU/fNY=;
	b=zAmTzevY26uShmSQ+taugjHDxBeALpy9/Dn8BKUY3y9WqvFdrPNCgvnos1QbbLi+fDTG
	 HH+HNfbqHGg+pBK8Gifm2i+fIgrZaErhCLiYTJsG2NUMvAngGnGeuBD5GPs3e0led2zcr
	 h3JffzSgZ2E59bAf6AmT60PnBhOj5rFIYu5ou5PIRBSXv2CfM0Lv4oWeyICtUs1FjRxft
	 elp28ItGIxaJT/FQ2M9u8LgJGqPo7n9gqzQYa20VjN0Sy6KXSRvqXxNswbcgwrws7OPif
	 3oew5i0w9bnRAZEagGS5vDVOVcvrD1UmOd/SOMgWEhN91FnGCUtsPzrS9ty/t+j9iLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iAquH30K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EF5606D2BD
	for <linux-csky@vger.kernel.org>; Sat, 14 Nov 2026 13:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iAquH30K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DEF31F0092C
	for <linux-csky@vger.kernel.org>; Sat, 14 Nov 2026 13:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794661654;
	bh=O67Sld1N23xdXCx6gIqCXwUsjQS8tlDbGqdMHZU/fNY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iAquH30Khmvacvb33iblyujUgHVesD/yt9CYr5SmFcp1ApKO7T+J37/AyKkyTaSv/
	 EsWGut9q7KWd2gVEyBu/nITBODZA6MEasZBNx0yJah9iOvv4l2nbwnsrsyIklDiQir
	 vnJynlk0O1pmrm7PPFcunHu4Gq+bdPIoQO27xkEZwUlpTj5PAYVzwUf7vDdSUjZ2tn
	 pi647oQyFJF/9n5Oi3H2MjRredHD7BHUm5xS5M2h6NjsyuRzK4q3SlYuiPx3dSdoYf
	 XzKGmiMpZXUPQQCApGxPkLf1MaAmTU9qLoLldT34MGOwd3AerJ6SvgJ51qV1vY5qb9
	 XKyABiarnAsdw==
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4910b863b84so1694860f8f.0
        for <linux-csky@vger.kernel.org>; Sat, 14 Nov 2026 05:07:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGBuzQHS5TyFceR/F1DuYZUg651aO6PJXFILEAFIt/4oSfTB+/xFVj1AF5TPaQkCkFy8FLpEiL4KitD@vger.kernel.org
X-Gm-Message-State: APuU4Z++Eoz/SQKMgClF/2zIWLOBtfOKGCWT45E+gp1+4JMHfnqPjfGG
	6ffv5BOM9Z4/CoRgIbySEnJxlZQb3rez4lhygfod5et+UQBhcYVP+S8GJiYg122u+1/1IrMuYow
	jrLABYJAPEKAU/+ccKFjwhMtOoUJDBvY=
X-Received: by 2002:a05:6000:4202:b0:493:72f7:1d5b with SMTP id
 ffacd0b85a97d-49b03217678mr21427286f8f.29.1794661652676; Sat, 14 Nov 2026
 05:07:32 -0800 (PST)
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Post: <mailto:linux-csky@vger.kernel.org>
List-Help: <mailto:linux-csky+help@vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-csky+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn> <20261114-v861-v1-3-eb71ec3ee523@iscas.ac.cn>
In-Reply-To: <20261114-v861-v1-3-eb71ec3ee523@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 14 Nov 2026 21:07:19 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSCtecm6LsuEy_s2rS0hAFzjN61FPRkhdPXg9Vh+xqNpw@mail.gmail.com>
X-Gm-Features: AclHuK9gMmE7_2DKOWkhqnjhaQpkVZ3vMJCR5skQAuEE5nkS6qc3opH65-HdPes
Message-ID: <CAJF2gTSCtecm6LsuEy_s2rS0hAFzjN61FPRkhdPXg9Vh+xqNpw@mail.gmail.com>
Subject: Re: [PATCH 03/19] dt-bindings: interrupt-controller: add the
 Allwinner V861 PLIC
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
> The V861 uses the XuanTie C900 PLIC implementation, like the D1. Add an
> SoC-specific compatible with "thead,c900-plic" as the fallback.
It's allwinner,sun252i-v861-plic in the patch; please correct the commit lo=
g.

>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  .../devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml     =
 | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifiv=
e,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/=
sifive,plic-1.0.0.yaml
> index cde4bb691897..6178fea9bbdc 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-=
1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-=
1.0.0.yaml
> @@ -72,6 +72,7 @@ properties:
>        - items:
>            - enum:
>                - allwinner,sun20i-d1-plic
> +              - allwinner,sun252i-v861-plic
>                - canaan,k230-plic
>                - sophgo,cv1800b-plic
>                - sophgo,cv1812h-plic
>
> --
> 2.55.0
>
>


--=20
Best Regards
 Guo Ren
