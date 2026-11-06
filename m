Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946353;
	b=L9AgVfU8umE296Ruyj2IUt06FEWrujcGwlt3xaWpQDRoUI+08bQy+onscEJdjOCaVRTb
	 uqxqJ/GOmnP0mTFAK2tEQLsutbgAXpLCV1Iwd8QAGlqYe0yvL+GUw+FCc4P6ZrENfo1Fz
	 vVBZiiuFCPn0hLAO8G/H33LvUvkTLDCqORNlhUSuQy5gbhP4rMdt93Dk2JV6PmLLrFto4
	 SlTx/YkVbd4ITcy1GK7TVq/pvxAitBiTGz25BMEkXP1Db7LUi28nH3TEJ65QPxcvJSn7A
	 toFuziOHfd1nQYoVbR7MAdsVQQ2iU7Geyuxgw0R/QU7a2sgdmjdp6Y46PL5FRwk367Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946353;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LoE/Xr8/izYD4/vvIzcFkhBICKzSnsZ7xx4rOPMErw8=;
	b=KRm1Ho50ri/QnHvEsRrVa421L1YFA4Mw7Y0W4YllbNtU1qPv+MmvUPpVO8M7uNJcpfmW
	 HBzymIIvjVpl9za10ZzgZbmGdgl9K+V8d9hEarEsgbcUBABRCJ09hZp5idQ+wmz+iCH2z
	 TzmXp8mV/OngNMiH8z5i+4mHd+Po4HOenmGYU1USCcvBgNrH0Nsl3PvguUM7oKvoR8wct
	 f/xl+HYk+s+E4Zd6pnql7DY85EvKCtyWDg1sxzrEB4usAYfhe9sSbMGvLj94/mQtKx3fW
	 HGx6kbYJNs8mkdDbpA4KUDOtl5hGCi+PhWpdUVrwb8VMOTGuUO0CDl8YHC8luAdxYLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="cg84/qym";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38502606A32C
	for <linux-csky@vger.kernel.org>; Fri,  6 Nov 2026 06:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cg84/qym
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C73481F008AB
	for <linux-csky@vger.kernel.org>; Fri,  6 Nov 2026 06:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793946352;
	bh=LoE/Xr8/izYD4/vvIzcFkhBICKzSnsZ7xx4rOPMErw8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cg84/qyms/HGMkCLk6VHbbwNwI7UZ6H65kuE9y39NUV7MjmH7ymBMtoYvXnTNhQ4K
	 z5tNxKGMgxUV5XlswaeNQ0Tz09USqzhloxCkWBsANpzIG7mkeRFqiscaorPvaGKrZH
	 Jvwpa16WlpA780g0q6sK3tgKQKp7j9r8LW4tt1HQ5JYimmXUhuj2SNI4s5002hpV/r
	 vkDNQcg+SeNnuhs+lv6YR5eO8NJ3BtkAyBNuDezE+E5fTU71hrp9gII3ec7hBJXb9M
	 A95NpvZW/j24kKeWHphTddYltmbEucOE5l7YIPdet+p3n2kJ2Tg7RNkxoCIYN5MXbe
	 Sj2hK2Aosw73g==
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so8092045e9.0
        for <linux-csky@vger.kernel.org>; Thu, 05 Nov 2026 22:25:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxanFJ3rVwaWbOWkg0cx1dPBjXJ0wl3nmvmUEaQQP8EHGeyLMNYUJ1uXbWae0N/qz/AFCb7fThysjX0@vger.kernel.org
X-Gm-Message-State: APuU4Z+IOK1na06/pBNoXZwJOZ4nkoS3D1PAcyABMo6m7vqbi3VdJXdT
	APdC2k51k7/5civAg2a7ejcZXMyVE5HMyYhfGHya2GkafAhF6pyXL/4Nk3IEAGC4/CDo2jzIxG1
	7bXlenELv1Z54PrUb5MZfhC1LH7ueae0=
X-Received: by 2002:a05:600c:8b05:b0:4a1:efbe:529c with SMTP id
 5b1f17b1804b1-4b6dff855a6mr22203925e9.12.1793946351393; Thu, 05 Nov 2026
 22:25:51 -0800 (PST)
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Post: <mailto:linux-csky@vger.kernel.org>
List-Help: <mailto:linux-csky+help@vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-csky+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029202624.2685097-1-rdunlap@infradead.org> <20261029202624.2685097-3-rdunlap@infradead.org>
In-Reply-To: <20261029202624.2685097-3-rdunlap@infradead.org>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 6 Nov 2026 14:25:39 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRvP-SgEXawhWGX0aMWWRj_hKSCB6yuu6S4EdZep4BMzg@mail.gmail.com>
X-Gm-Features: AclHuK_Wj8uxCUf42AnyJ_yvgH6DQt83DCJaGh9EAPURAGDaKFJrE7Z36i3Sp_k
Message-ID: <CAJF2gTRvP-SgEXawhWGX0aMWWRj_hKSCB6yuu6S4EdZep4BMzg@mail.gmail.com>
Subject: Re: [PATCH 2/4] csky: perf_event: add missing prototypes
To: Randy Dunlap <rdunlap@infradead.org>
Cc: patches@lists.linux.dev, linux-csky@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 4:26=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Add missing perf_event prototypes to prevent build warnings:
>
> arch/csky/kernel/perf_event.c:90:10: warning: no previous prototype for '=
csky_pmu_read_cc' [-Wmissing-prototypes]
>    90 | uint64_t csky_pmu_read_cc(void)
> arch/csky/kernel/perf_event.c:878:6: warning: no previous prototype for '=
csky_pmu_event_set_period' [-Wmissing-prototypes]
>   878 | int  csky_pmu_event_set_period(struct perf_event *event)
> arch/csky/kernel/perf_event.c:1197:5: warning: no previous prototype for =
'init_hw_perf_events' [-Wmissing-prototypes]
>  1197 | int init_hw_perf_events(void)
> arch/csky/kernel/perf_event.c:1292:5: warning: no previous prototype for =
'csky_pmu_device_probe' [-Wmissing-prototypes]
>  1292 | int csky_pmu_device_probe(struct platform_device *pdev,
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Guo Ren <guoren@kernel.org>
> Cc: linux-csky@vger.kernel.org
>
>  arch/csky/include/asm/perf_event.h |   10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> --- linext-2026-1007.orig/arch/csky/include/asm/perf_event.h
> +++ linext-2026-1007/arch/csky/include/asm/perf_event.h
> @@ -11,4 +11,14 @@
>         asm volatile("mov %0, sp\n":"=3Dr"((regs)->usp)); \
>  }
>
> +struct perf_event;
> +struct platform_device;
> +struct of_device_id;
> +
> +uint64_t csky_pmu_read_cc(void);
> +int csky_pmu_event_set_period(struct perf_event *event);
> +int init_hw_perf_events(void);
> +int csky_pmu_device_probe(struct platform_device *pdev,
> +                         const struct of_device_id *of_table);
> +
>  #endif /* __ASM_PERF_EVENT_ELF_H */
Thanks, I will queue this patch.


--=20
Best Regards
 Guo Ren
