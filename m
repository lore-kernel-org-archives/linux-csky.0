Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7B9396B96
	for <linux-csky@vger.kernel.org>; Sun, 14 Jun 2026 10:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781432450; cv=none; b=NOatOlw6uY+qJya9WR4/ofLbARaxJKesaLrR1s4DVQ2ci0fJxQONtWvkpB0v3crTdYx4rF7KVZcyb2+G3OLF/g0EqYeavRf8ybnZgFilmlV9DszbxNThmlLongpRUc4IMi5GVGm1sQwDpt8u2YTFPsQeIcpfAORajtdSq/3XX0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781432450; c=relaxed/simple;
	bh=P9WTVt13A+935E2mxdpvug3SvHlQHYI+8G9Dd4+gNjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cwZQQewYrTL9k5F82lEh8yG5ZYJydDYi1tnpKv/Dj8hom4s3p/xwjPhjUXZuj4lIsc4Tgzlbe1btJsN9CuiodKb57NajbUdrFb1/XpgaxgPrVvhz1z6cIDB5hD6wB+mNru/3RGFpEfM64sEJrYArQiTlxKZfUkP6CL9AWYbx/fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YfvZtO8w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YfvZtO8w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B63D1F000E9
	for <linux-csky@vger.kernel.org>; Sun, 14 Jun 2026 10:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781432447;
	bh=3/9bs9fIwycprr6yJJHu37HZHor635FX4FUpn3mKQgI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YfvZtO8wLMBxKrW0b9KKrjiKFSJMlyZw9KtvM9RDPhTgp5QNJO8qkVhTs+9btfSrw
	 eD1OgOuRKf82p3SX/knxoC4Cv1CHWX5oIVzv+MdrbFd1TjOFQNmQ0X0n1ZaUChz9QV
	 1jbB8ugU72VVZqS5sCvQGOFzGnFsQzzY3cqeO9aAF+/nndJpVdAA28DKO5Is9/cn4k
	 MGzcbnU9mQL6lPSQ3i5zhrpERm68FDIVpqkatuYac6ElH/zNN4HodoGFULs9iK+lhE
	 9aAr8bLTpspiNmpR113bBIiX7uHljSQ8pr9Q5e8+wLYl+XVtBmrYh9hdFTHIJC3BIW
	 3cPwSHnBzg6Eg==
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45efb698ef2so1133216f8f.3
        for <linux-csky@vger.kernel.org>; Sun, 14 Jun 2026 03:20:47 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx3WRfLhfYZwOywPLw9c9ShnWhEqf6OL8bmFz6oKa4LK2UjVdO4
	EBCDO+Q1+s7doyn7DwknfiwQYIDMfMBeXpB0RGqwPufB4sOtdxnu/XQ8wc1DNRd4pybmdneetey
	TfKmwD49Yawc4Jw0AAPHVOxnen2dB/lQ=
X-Received: by 2002:a05:6000:25fc:b0:460:51ef:f81f with SMTP id
 ffacd0b85a97d-46074a5281cmr7325629f8f.6.1781432446009; Sun, 14 Jun 2026
 03:20:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609194331.147233-1-enelsonmoore@gmail.com>
In-Reply-To: <20260609194331.147233-1-enelsonmoore@gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 14 Jun 2026 12:20:32 +0200
X-Gmail-Original-Message-ID: <CAJF2gTSShakzfRgyYfpm3C62NGBT139QbiDWp+G72xP8B6A_TQ@mail.gmail.com>
X-Gm-Features: AVVi8CewJT2umkwibDTvTdmey2kUnWz-E7lfoJbwPqfsQ0qElOKeujfX70Zhkeg
Message-ID: <CAJF2gTSShakzfRgyYfpm3C62NGBT139QbiDWp+G72xP8B6A_TQ@mail.gmail.com>
Subject: Re: [PATCH] csky: abiv2: remove references to nonexistent
 CONFIG_OPEN_FPU_* options
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-csky@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 9:43=E2=80=AFPM Ethan Nelson-Moore
<enelsonmoore@gmail.com> wrote:
>
> CONFIG_OPEN_FPU_* options have never been defined by the kernel, but
> are referred to by arch/csky/abiv2/inc/abi/fpu.h. The *_STAT macros
> depending on them are also unused. Remove these references to eliminate
> dead code.
>
> Discovered while searching for CONFIG_* symbols referenced in code but
> not defined in any Kconfig file.
>
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> ---
>  arch/csky/abiv2/inc/abi/fpu.h | 36 -----------------------------------
>  1 file changed, 36 deletions(-)
>
> diff --git a/arch/csky/abiv2/inc/abi/fpu.h b/arch/csky/abiv2/inc/abi/fpu.=
h
> index aabb79355013..52c640ef797c 100644
> --- a/arch/csky/abiv2/inc/abi/fpu.h
> +++ b/arch/csky/abiv2/inc/abi/fpu.h
> @@ -27,40 +27,4 @@ void restore_from_user_fp(struct user_fp *user_fp);
>  #define  FPE_IOC   (1 << 0)     /* Invalid operation exception */
>  #define  FPE_REGULAR_EXCEPTION (FPE_IXC | FPE_UFC | FPE_OFC | FPE_DZC | =
FPE_IOC)
>
> -#ifdef CONFIG_OPEN_FPU_IDE
> -#define IDE_STAT   (1 << 5)
> -#else
> -#define IDE_STAT   0
> -#endif
> -
> -#ifdef CONFIG_OPEN_FPU_IXE
> -#define IXE_STAT   (1 << 4)
> -#else
> -#define IXE_STAT   0
> -#endif
> -
> -#ifdef CONFIG_OPEN_FPU_UFE
> -#define UFE_STAT   (1 << 3)
> -#else
> -#define UFE_STAT   0
> -#endif
> -
> -#ifdef CONFIG_OPEN_FPU_OFE
> -#define OFE_STAT   (1 << 2)
> -#else
> -#define OFE_STAT   0
> -#endif
> -
> -#ifdef CONFIG_OPEN_FPU_DZE
> -#define DZE_STAT   (1 << 1)
> -#else
> -#define DZE_STAT   0
> -#endif
> -
> -#ifdef CONFIG_OPEN_FPU_IOE
> -#define IOE_STAT   (1 << 0)
> -#else
> -#define IOE_STAT   0
> -#endif
> -
>  #endif /* __ASM_CSKY_FPU_H */
> --
> 2.43.0
>
Thanks for the cleanup, I'll apply it for the next version.

--=20
Best Regards
 Guo Ren
