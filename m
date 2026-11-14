Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794661003;
	b=HAsxodevKntvZdqcG+AZt1bJQqNrMDrRu7v8HdiE/I4gfof3vFe+rvq4P0t9396qVEvW
	 qS6cn6EOKe0vCpHGF/AEj/pt0v/67ntYKJ0x1AvQZ17fx9HqpcuyiV4LxLj/Du0CU/Pli
	 BDWf+waNwMhrrll7pSdon7IYJK61kff9I5uuyVs2PrU+i17KtGmv2Aue9P91Bb/ndNy6m
	 mZmAwa6eAUQuzXGRkhWbMcNmvNy6Ap1VGsaG82avn4m5DbpEoduY4gn8EYzvdNIAiAKke
	 jdhr0g9YV+PN8CSjTeo0CSckLU+g8EbvhShsc3LYJej1xfP2CAC1npTQdZPrZY2r0vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794661003;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CzDnQhxA2IGwG1S+MSyz5T4mghlVNlgfIGD03W+DjPU=;
	b=AHlEDlZmFzn5v7DFyveh0aaF0JPyk4Q7SceLi6M+lEgOeFJ9MtA85Q7WYvi40IMxCGnR
	 l3+Vex4p1rOFO8MbEoEnxnzEB7VVZzlUER5Q6/n/Bvo6cL2g60/LlgdifEDI3pHWuwU31
	 4/fp3EdhJKNWKBqsMQyiBENUTXEuN3ui+FyLc2UO6ehq7v6JHKKGMaONxQwRrR+qSSL+G
	 fNcukmyCaMLxvQXmBx9hP1rRzOUZZPE3ejteXK6ZRCyb8ZCk/PU3gN8N1gOqCUt+dhYt+
	 tDJ3C9eY4xsOszsX+S7ccc3pyfeKTSopk/P8f0iQdjiq2hilBvWSbuC9/5o/d8v1zgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RdO3Kv90;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D77606A329
	for <linux-csky@vger.kernel.org>; Sat, 14 Nov 2026 12:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RdO3Kv90
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D7CC1F000CE
	for <linux-csky@vger.kernel.org>; Sat, 14 Nov 2026 12:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794661003;
	bh=CzDnQhxA2IGwG1S+MSyz5T4mghlVNlgfIGD03W+DjPU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RdO3Kv90z56OxC2Mum/pVVxoCJ0GuuJdKlGU7yYQJRke20FgwpEj+W748Vp6QPjUr
	 Wd4LCOVX1UiBXzmxMxABGqTYbVV4jdueM9hoyYrxVEM0h7I0M3MCoo6dflSNjgq9pZ
	 wavchHG1HPsP6J8cJen+2c0KDhZMQ87PD78h06x/SWleCZ0AVhktojtUKWuPlaDEte
	 5tlCnkfYA3PwzYC6fje6dD7A93GWV+srski1PUYta0UlPCG/zlnkivP0/do4FV4FeT
	 EEbKIrXKgSsahJV81DXIk3q/IzR9JxgXW5mZcMb6ZY9PlJgLjnuxDNUmDYPIfxkeHJ
	 O82buXWPzGNUA==
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so25903445e9.0
        for <linux-csky@vger.kernel.org>; Sat, 14 Nov 2026 04:56:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGrnx5CUStmF4kFHSi9g/vxVKs9pZ4d/761LdmrPTHrVWLsRD2+weNLuSga1F2qwPKKrjh/uGANuyco@vger.kernel.org
X-Gm-Message-State: APuU4Z+Vjm3Y7Ff2u9jN5dsoLbrPGl22OY23mB8bcdFWq/5sTS5MhlD0
	NHLi31zIF+DTEt3K+IIHam1BcsNd1DTjP9oFWBPeLlqsQF0JAyHXLlfZA5nEWZpH7j1GAbF9NBm
	dpCcyTcznEQRSA+Xm+u5nPr2qQirTL84=
X-Received: by 2002:a05:600c:8b05:b0:4a4:4d57:8462 with SMTP id
 5b1f17b1804b1-4bb55a99ed0mr112169185e9.24.1794661001252; Sat, 14 Nov 2026
 04:56:41 -0800 (PST)
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Post: <mailto:linux-csky@vger.kernel.org>
List-Help: <mailto:linux-csky+help@vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-csky+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn> <20261114-v861-v1-2-eb71ec3ee523@iscas.ac.cn>
In-Reply-To: <20261114-v861-v1-2-eb71ec3ee523@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 14 Nov 2026 20:56:29 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSHBu3qVmqQDfmn4wfy2uGY-bGN3xKxqpO=ULVfoXD3-g@mail.gmail.com>
X-Gm-Features: AclHuK87BF-AIKO2shVxwQUjV8SpcPDdYGTchA_sgB49NmXU0PUHvZ5gp9vekk0
Message-ID: <CAJF2gTSHBu3qVmqQDfmn4wfy2uGY-bGN3xKxqpO=ULVfoXD3-g@mail.gmail.com>
Subject: Re: [PATCH 02/19] dt-bindings: riscv: cpus: add the XuanTie C907
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
> Add the XuanTie C907, used in the Allwinner V861.
>
> XuanTie is a brand of C-SKY Microsystems [1], whose JEP106 ID 0x5b7 [2]
> is what the C907 reports in mvendorid, so use the csky prefix rather
> than thead.
>
> [1] https://www.xrvm.com/declaration
> [2] https://www.jedec.org/standards-documents/docs/jep-106ab
>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index 0da219ae6769..bdb119ab8ee0 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -48,6 +48,7 @@ properties:
>                - amd,mbv64
>                - andestech,ax45mp
>                - canaan,k210
> +              - csky,c907
LGTM!

Reviewed-by: GUO Ren (XuanTie) <guoren@kernel.org>

--=20
Best Regards
 Guo Ren
