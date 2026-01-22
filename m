Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E714C9569
	for <linux-csky@vger.kernel.org>; Thu, 22 Jan 2026 16:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769097983; cv=pass; b=cEWv2/f2+WYYcgRH+Zl9HCJ9W/KGasGmwpD3ysaZKDznwefJc4nNq8NArkp3PQN3vShobo0ZZcw/Oqe7VRk9sNlkoFhVdcQAk6D3AG2XUrbu4s3HoOsY62OV3HRg4EIkkve4h6BEQIWYBlNT5Rkhi1shxbjZGXJ1/qsa7DWwGFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769097983; c=relaxed/simple;
	bh=OC5tzLx0gvwMJXQ3DCnZrdeB3ov6NGEPUNw7jgsZanA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C2amkudBR/dNCVxckInX5MuMQw/T+DOHVrcLsV7DFw9wyeZAIKowNsgW0tLbzT1x3WE/RO3DmouhwPNnCDabaeYnuPJRz+zGi4buqWjAg2usqzLoaS0PpM5vDrJwEb19uGqkcyc7eWhd+4VwRrL2Cg+qNcTVpsT78QzL4VOfxUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YG8nbSom; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YG8nbSom"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a35ae38bdfso77575ad.1
        for <linux-csky@vger.kernel.org>; Thu, 22 Jan 2026 08:06:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769097971; cv=none;
        d=google.com; s=arc-20240605;
        b=Cpc3Ih8BcsFv+3S6/IS5hK8EKliMlXQX1QLAZveeI40OoKo75et/uyXu3skHhEuPIB
         uMLwR4TZBtpW428E17rFTgfis944BAqrJ+U13FqsA0QHM8qWQM46+beTAgild/AgF4HD
         +KbQ6BoJXJ+9tcSFdkMbiT3zl91D/vhp/osArQ7KAvqmaXpR0JDR//E7fZGLRWcaDOM9
         +B5zVhfuttvmFC9dYLTN86oBYTf+YtXSa3qQuQigJr41LfGzMaOfRs5TsTM9tEuqbg+j
         uCAa0lJTBfpvqM9LdWvBmcSeDdJGt6Rg5NvgEUQRyIMrbW7agxjzrsh07srMG4TJyjL4
         cB5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z+AIbIK3eQTohbEi9mUjrpLQdvDbJl+5v84GWpefTnM=;
        fh=1wrE5s3vdcvmQKXMvMQGDfyWEGQILZ1s+155sW2c7mg=;
        b=doZ1zl774p9es4KDDqScy/voCkhoETNrwdS877IBGbm6JcddUdnUmcQLmEzsaN6zrS
         zKc3JKCLAAOSewagFsoEgTRxqGQ7qpVjYNoHVqxxsHj9YmX+qcye1QF1rtaKpFYRd9Zy
         KF8RK8jkRR0KMu+pADGxI9Y7SCi4qYN4zVIivMu272DuZLGLVvKjcNUV2yRKZNiLNtUf
         z7MKnU0ULTyZOIVjY7Ds4lwTOz374hCUCinRfuL2onQmHFbJdR/+7A4l87JGel+GN147
         Rm9/EPMflFR8n5nmiSnvSebYM0NO39OjCmxDw8OunlsXla/0XcS01T2+6zgnR80sXPJI
         M5jA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769097971; x=1769702771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+AIbIK3eQTohbEi9mUjrpLQdvDbJl+5v84GWpefTnM=;
        b=YG8nbSomamH35BA+H5v3Eeaq+bSfQc+j08WhKtNjyig+q28O0H4GyvGWxYQFLpVG2g
         T2wacGSS10z4xbBU+y3l+eDRNGSoXAwi7LA9HY+roksmf8u9Yvq4c0RqXToeGxqX7rUa
         /jgLjE5WvV54/QdwYLv6fTvSwYVl29Gew3eXLK6lj/GyuW9EO2pFwj2dM7MrqTEjM5pk
         fraOD7a1cZDRQEh/oahlOrRTbyh/zpjwbCb5i2tNVEoiel0qvU/Ei/nRNZDNOwcKOrB7
         RpIokD5ig03EsHVOz6IK0oVt5qXCpLznN6L0OVGk3eIph4GZjuwbhXR3gD4lUxoXFTUD
         Ok7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769097971; x=1769702771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z+AIbIK3eQTohbEi9mUjrpLQdvDbJl+5v84GWpefTnM=;
        b=F7jUSBEEwL7dWPZSBIAh2q0WrZjZuGM9TjqC22i/+hAZHypAZsL4kLP/VPe2bThVMy
         HNiJxNmsldHhLSkxxj55pn+9bgrhxkgWjpD/lhvK8eIc7dbMrb9pRyocsH3z9d24JPzT
         JNJ8QpH0EFKOwZ0YPtMNuHe2xvbyDFWBRUKItjSDs+rOhXUmjInz9obnz0ceyR8eg2IB
         hT4qQtytESw1wqtsf1m8n7DgwMh01ayCNKMk4wwIDK+/+xnR4xzVrPry4n0vXVbidr80
         1PPAPHJ089w3KP9B7CD1GEkl0j+5ekcJWQ6QaaDvciD0Jpj6r+TB+/0lihvLGCATQD+/
         4Ihg==
X-Forwarded-Encrypted: i=1; AJvYcCVTvB8hfXSwjtvZZWAL6+eQFrYPw4/UVWVJSRzSypm1E8bzYbFdCvQk5B9S5gS770E8WFCuOiswmSw9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2M9JPHGinUFJEUwQc8g5f6ke3Op19/yGwVUrGgbkaWAYnEnDE
	ejaBwBvyAVtZmMlv1OFUZhKhyNPMYNFfUeS8AQRCaSUyTpNsu+/87h7DU7p8JJMPKZvGCR64xPj
	vk6WhcjLAN36RZC9nBLZF5xjVxIsZS4YckDgh86eH
X-Gm-Gg: AZuq6aIp5WCDuZWYkDFdbgz3ujDoEtPdMGw51ndDQ+r5XDLhp76NYQTFUYnJA8g8t85
	ZvTbMsIbQN2pd36p9T07Q4xZsKFqcnxxfU7XZjQyUH4t8k3BLwaf52lcZThG/qBYUih57vuy9iI
	ZnMgwZQo/yYaAah9i4Xeg+4Y2gd6BUrZJvcuRzAwtxOacMkNWPa43wqnLeKQQfwWAn98Nq6rCBP
	+kRyY+JWMS/ZbZXeUJAix3lzWvEdDtcKSEF6lTl+U2HnVczYVS5iL17eIfNp8DHCsH3Y55V4nl7
	F2FJ2rSC51Mp8s2r+mEPtS4abg==
X-Received: by 2002:a17:903:2b06:b0:29f:2563:7772 with SMTP id
 d9443c01a7336-2a7d417846bmr3095405ad.8.1769097970607; Thu, 22 Jan 2026
 08:06:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122073127.375139-1-irogers@google.com> <20260122073127.375139-3-irogers@google.com>
 <CAO9wTFh01Qzn9tAiXf8_eGd7AAJiKzjmHNw-hBBCzcYR9Mb8xg@mail.gmail.com>
In-Reply-To: <CAO9wTFh01Qzn9tAiXf8_eGd7AAJiKzjmHNw-hBBCzcYR9Mb8xg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 22 Jan 2026 08:05:58 -0800
X-Gm-Features: AZwV_QheLkTE1KRcO3TYQKQs82VaNUxHiDT9G3Jcm0FUvq93zpwYWIu1qRjGJAw
Message-ID: <CAP-5=fUg=Gna1=HyugczBijYE07SnFHOO9OPutYQa+s8QcXBmw@mail.gmail.com>
Subject: Re: [PATCH v1 02/11] perf annotate: Fix args leak of map_symbol
To: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, 
	Guo Ren <guoren@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Zecheng Li <zecheng@google.com>, Tianyou Li <tianyou.li@intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Julia Lawall <Julia.Lawall@inria.fr>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Howard Chu <howardchu95@gmail.com>, 
	=?UTF-8?Q?Krzysztof_=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Shimin Guo <shimin.guo@skydio.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 3:47=E2=80=AFAM Suchit Karunakaran
<suchitkarunakaran@gmail.com> wrote:
>
> > @@ -1119,7 +1121,7 @@ static int symbol__parse_objdump_line(struct symb=
ol *sym,
> >                                       struct annotate_args *args,
> >                                       char *parsed_line, int *line_nr, =
char **fileloc)
> >  {
> > -       struct map *map =3D args->ms.map;
> > +       struct map *map =3D args->ms->map;
> >         struct annotation *notes =3D symbol__annotation(sym);
> >         struct disasm_line *dl;
> >         char *tmp;
> > @@ -1151,7 +1153,7 @@ static int symbol__parse_objdump_line(struct symb=
ol *sym,
> >         args->line    =3D parsed_line;
> >         args->line_nr =3D *line_nr;
> >         args->fileloc =3D *fileloc;
> > -       args->ms.sym  =3D sym;
> > +       args->ms->sym  =3D sym;
> >
> >         dl =3D disasm_line__new(args);
> >         (*line_nr)++;
> > @@ -1172,7 +1174,7 @@ static int symbol__parse_objdump_line(struct symb=
ol *sym,
> >                         .ms =3D { .map =3D map, },
> >                 };
> >
> > -               if (!maps__find_ams(args->ms.maps, &target) &&
> > +               if (!maps__find_ams(args->ms->maps, &target) &&
> >                     target.ms.sym->start =3D=3D target.al_addr)
> >                         dl->ops.target.sym =3D target.ms.sym;
> >         }
>
> Hi, a noob here so please correct me if I'm wrong.
> Looking at symbol__parse_objdump_line(), shouldn't we be calling
> map__get() when initializing the target struct? Since maps__find_ams()
> now calls map__put() (after patch 1).
> struct addr_map_symbol target =3D {
>     .addr =3D dl->ops.target.addr,
>     .ms =3D { .map =3D map__get(map), },
> };
> This would match the pattern used in call__parse() and jump__parse()
> that were fixed in patch 2.

Agreed this is another problem. I'll add the missing put and
addr_map_symbol__exit missing here.

Thanks,
Ian
