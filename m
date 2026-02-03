Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E1B2F39A1
	for <linux-csky@vger.kernel.org>; Tue,  3 Feb 2026 23:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770160007; cv=pass; b=NmtAKTjTR6aCy0KElO9rhzb6NAAPRMdLI70gNA6C1xu1hR0T+oPqCVJRILMlJehTcIilqvv4CbnmwWkgoZMtHjdIP5FtvxPMtah7JMJbmyCDaWbGxNRBwZIf+GQHfCwpCRY8HeO/JF7RLiPdArnl6j4Y+Fjf9tClHYX/wQ+MP0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770160007; c=relaxed/simple;
	bh=93ytCWhm+7HfW6uqJrrD6twD+UxPO31wPTRFzIBkefE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bshl9wtp2PS6kMxqVR4lvA+pqChX0Gc048E6c4V/F53MKujVI2VuqJH1BKSSV/nyxp9pvj7qP3zih67uZaIMfIPQ1GES4bC0yQofFscnjMYDxuY1XjoRW1KRFSuZYgyelE0lpEASdEfgbPoqUDChAnH1nObAjNMFkpqfyHaOG8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KheWY9Nv; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KheWY9Nv"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a885af8ee7so11715ad.1
        for <linux-csky@vger.kernel.org>; Tue, 03 Feb 2026 15:06:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770160005; cv=none;
        d=google.com; s=arc-20240605;
        b=UpbDAhkgaOKMaJFpORVlI/FvlvO7rj7Tp3pbpzB9Sv+XXBmN2wuQZeT5yeBzKC8hSi
         jGp13v6jyvOyharWN00SiWhlxsqwnnjeVSoTVfOKN6L8BkVoAe8UsgLvpdnbEZeuhsbj
         L8KU+at8tL7za+DeLDjl9OUW7ROGR1SLoz3M5dfEmzLxtK+IR7n42anLLU3dyp9FoIlz
         uKSprSaBDN6Y74y8sp410Epg4fHQd/PM5C/lA2b5H7NqFkjTwnZiEigYbxwnJAaprcut
         jsPk80Hke3h71fPm38ejub5g3NGc8ZofaZZ98BfDvVGQDT821WvpdRDeNZoKwLAMttXw
         U2yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WhW0Z5/bDcVlEnz8k3eYAJjeqv5PflWO94icC/kx//A=;
        fh=kvT1SDo8zTRVf2zIwwgXkPTWnDxkiMwNCm63CraVoRs=;
        b=G78ilhJgmolyBZIh6DIuLn/kVWHvF9PVgEGZ7z5FG1ACefW17HVk04AkaRVDyvLd6z
         aishCdvH+KXT6RMCu5LtyCocFpms7OhE4ebYhINYaoYkkEP72hS7ohG45TpVKXg1xb5b
         V1xe00kauE04TMvgnbVb7V2I+CsZKO59ScHDoKO6iwlwyOXPZ9Z1S548Ha6FHSJBzMyd
         2o0anURdCfvp4SBeL/ytx95edgXC91W8A3qwb2iaBRuJYHPdHj19JZOIHZTYzBLWJPWg
         X5AEpdnYEBoc6nU3zxM/k2rvNHAQMd82yV8OxRJs6Hg2UkaL3MklvfnDDFe2OQLt08/M
         gSow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770160005; x=1770764805; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhW0Z5/bDcVlEnz8k3eYAJjeqv5PflWO94icC/kx//A=;
        b=KheWY9Nv6hyOKrwUdJyXvPPlmnnPoFMV9MSo43gAd/JCQHRGhdqNb8AhuCubK3PawX
         dkmbCEMgl7EMno2eiBfuQV3rXRIhjGbaYi4+dTMPPKazY0YA8h6owylAJt122sU3GueY
         kbbUptKh5lLhPREUzp8LaSaJQkzBACZQ54uMmqshqgRhdqRrxVYw3DYh99eMHjgf4Kjc
         oXxmfkZ0cEBMIg5F/TU5cbORPkzu9asdy0V2dCWuK68bDxPVan2GJFZTtOLgCkamA8dZ
         y6ljD+9PFVAy6xJEf6LxTmtgwMHZxjJAuyzp9UYB/SWSLd5NaPlV9dLMudc/xsRphf0Z
         99Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770160005; x=1770764805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WhW0Z5/bDcVlEnz8k3eYAJjeqv5PflWO94icC/kx//A=;
        b=Be5bUVhVIH52R9eIJsET0LzOEpi44kQkl11WclnE+5prM3NQWK6EmHP5fYXEfzEnWR
         wLJU1TesXpaR7p9IpI3h/1xV0xJ5C3iEIPG69/y99Qb7caCgC6B0KeZjMHNFuw6DONL/
         MJKF9zCS0wkAoFcxi2XzJjQufgJdisP2fcRNmwaqPk7K+zFQwiy+ClBSVLPFfbzLf7Qf
         tjNVTEsp43bOGEp4Rfp8jpJ/BH3GVzpi9OLWjVNkGthRmuGPMK9lpmfhqJYt0G0OqK71
         DK/L2vpkXDGpoWC3fvKPgrRFpCuiqudZ0+xESUHJh3QNbomWsa59VUOWmhyWesCuW2G3
         sG6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWsimh0rhW+/5EydLshmJJdoY4VOOOuClA6cOAZYYErsOCPwQ2nqbJmcWnuso0wcg/cuNIeDG90VpYt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2lSzSfRb/fRbGv8jEMZlk6KzJfZVJ9xV4cYG/bU3Pp9klBXOA
	L54AnEozNv/gEcwku/mfu1PgrjqYfR+1itBqVaF+Lsqefgt3VnY2tARzBRJh2iUocXVArVzA2dg
	4Tj/9qPnhBHQDYcrRxfbZ/DFUgAI9UuntktZhGE94
X-Gm-Gg: AZuq6aLdauzPgx340wpetdKX25UrcTkG2r8N6y0I3q6dVLe5NGGsTPg1HSjYWeJAMJ8
	Gpm0tKuWaq2iTdoP/CxFVyaLqUEQ2GaR9c4LT17YIFg1n92PDiiL7DdUbWy4iNWOnfpD5G8kD2g
	AqC38sSnKoG4jMCx3aqFfVp5INYDuXc0huLF945Bih+DvmZr9ACaEwRn7vfaC/Vw4ukHOIv9c9t
	xeO1/YN+SrLmBbNENzVwMC0Unqb6pb2dher0JPKjZRG2dOr40rwJdfTl3gGgtZLk6VwkpoSuctp
	6EdDWiNen9u43clSAseA8LN1Yw==
X-Received: by 2002:a17:902:e543:b0:2a7:7f07:340e with SMTP id
 d9443c01a7336-2a9344ae075mr1024005ad.4.1770160004714; Tue, 03 Feb 2026
 15:06:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203024356.444942-1-dapeng1.mi@linux.intel.com> <20260203024356.444942-2-dapeng1.mi@linux.intel.com>
In-Reply-To: <20260203024356.444942-2-dapeng1.mi@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 3 Feb 2026 15:06:33 -0800
X-Gm-Features: AZwV_QgPh6Zuh81ytCB2QhBaLQojIu2yqs-k71pIg-mHSzTgbaREXv2IKP173Cc
Message-ID: <CAP-5=fU7V2KT6Ce+mk5YbyHggxvRfsoiSzZk4g0CYcNK4NGT2A@mail.gmail.com>
Subject: Re: [Patch v3 1/4] perf regs: Fix abort for "-I" or "--user-regs" options
To: Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Zide Chen <zide.chen@intel.com>, Falcon Thomas <thomas.falcon@intel.com>, 
	Dapeng Mi <dapeng1.mi@intel.com>, Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 2, 2026 at 6:47=E2=80=AFPM Dapeng Mi <dapeng1.mi@linux.intel.co=
m> wrote:
>
> Fix an issue where the `perf` tool aborts unexpectedly when running the
> following command:
>
> ```
> perf record -e cycles -I -- true
>
>  Usage: perf record [<options>] [<command>]
>     or: perf record [<options>] -- <command> [<options>]
>
>     -I, --intr-regs[=3D<any register>]
>     sample selected machine registers on interrupt, use '-I?' to list reg=
ister names
> ```
>
> The usage of the `-I` or `--user-regs` options without specifying any
> registers should default to sampling all general-purpose registers.
> However, this currently causes an abnormal termination.
>
> The issue was introduced by commit 3d06db9bad1a ("perf regs: Refactor
>  use of arch__sample_reg_masks() to perf_reg_name()"). This patch
> resolves the problem, ensuring that the `-I` or `--user-regs` options
> work as intended without causing an abort.
>
> Fixes: 3d06db9bad1a ("perf regs: Refactor use of arch__sample_reg_masks()=
 to perf_reg_name()")
> Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/util/parse-regs-options.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/tools/perf/util/parse-regs-options.c b/tools/perf/util/parse=
-regs-options.c
> index 8dd35f50f644..b44b47d9059f 100644
> --- a/tools/perf/util/parse-regs-options.c
> +++ b/tools/perf/util/parse-regs-options.c
> @@ -66,12 +66,14 @@ __parse_regs(const struct option *opt, const char *st=
r, int unset, bool intr)
>         if (*mode)
>                 return -1;
>
> -       /* str may be NULL in case no arg is passed to -I */
> -       if (!str)
> -               return -1;
> -
>         mask =3D intr ? arch__intr_reg_mask() : arch__user_reg_mask();
>
> +       /* str may be NULL in case no arg is passed to -I */
> +       if (!str) {
> +               *mode =3D mask;
> +               return 0;
> +       }
> +
>         /* because str is read-only */
>         s =3D os =3D strdup(str);
>         if (!s)
> @@ -104,9 +106,6 @@ __parse_regs(const struct option *opt, const char *st=
r, int unset, bool intr)
>         }
>         ret =3D 0;
>
> -       /* default to all possible regs */
> -       if (*mode =3D=3D 0)
> -               *mode =3D mask;
>  error:
>         free(os);
>         return ret;
> --
> 2.34.1
>
