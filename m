Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469C8423A72
	for <linux-csky@vger.kernel.org>; Wed, 21 Jan 2026 07:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768979417; cv=pass; b=f/pyGUGdlIWDe2wrZHiFF7YF2CXk+L6y5pDrssV1jTrrJllWvEHWYosXESiDA2BbTWm922pmnMTQrkBF/9OK+SsMHxALmG8DOtHjpb9Dus0hsG0EUhE22uEVGWAHjtUmH5po+jomo1BLdSwe/KcutS0xkJxhrsSIghZ9PFd56tc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768979417; c=relaxed/simple;
	bh=qf2rdxV+2bNdiBdM/cScn2LLwNY/bIbiz/3Fcc5fVRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=meY8QztMDcaU7uFRY0y+/f+NkC4LsbpCNyD/Ytf+XK7rsvvTutxCHqcacT52rnwREYYnohEDo8esAnIoBn5WMksGjB53Jfgzbn+y4D4hxtchpY6M/8WrQ+UO1LML11RUoT7qiMjT5MJc8cPZ/BhLHUoDRWWaZ5iwbiL3+KoHzFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lKmIqXLr; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lKmIqXLr"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a35ae38bdfso45055ad.1
        for <linux-csky@vger.kernel.org>; Tue, 20 Jan 2026 23:10:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768979414; cv=none;
        d=google.com; s=arc-20240605;
        b=EG1uLfpSxyFtjUubEtr3ZtKR3thVg/FUBRPLXHDK8zrTXSnlMqtCE7XzoyryvXd0Uy
         0RlFf/bIgXEnDFGyn4zxJNIk52zyzjzqucTqmVDTTiwFOPE+bW+0oEMEygpVcpz2+otC
         wceEiql9qN7PGnmx5pPWM+uigQtdGOh1YpVOQl9nmL65gZ3SyVlVD0NHGgE3t2NPKfPz
         89il5J+td0yZ8AORR5/9IRIY8NOIyuYwAFyWRskKgpqEndJjO3UWI88aVkfQThytdRce
         7KKQur74DKIMRKV4N1Q0zBgIXeAjA7TjJOY+QI9J8HG8CT/u+cHe1qkXfkXzkV3F/OhJ
         TREA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hJ81YcHVJUXCUDOSqTEo4fpneXYhzAyyqlg4VRJWSOc=;
        fh=uHiD8q06LPjS9pz+QcfF18izvmsQAzCplKvBKYLMrig=;
        b=Ej5KsR1KCBCzDzWNks4Q9bbYHU+ghVXjRdtvlbpKhePsFgN7FQxvHE0ChnO2GlrN+1
         JXRAttBflbhe3431f596m3m91v6yhIn04VlBMdfYl/Tujtg5jGA86iEngSVk3WvmlsNR
         +/dLwb20FhKznqUalVYGBxxv17PeliIttCaktmWaFoOe5MzkJhW+ncek8j3TOEzUYWri
         X/088Yq0p+xAWVigDmMvngn5YfxlqY6kX+ZFJmkhlOAqHnwMGXEL2ovtuPZUHhb6n5RX
         O1scXp2UhKK/AEmdwhOVkFIZgWvT1sjse+r82aee0Fqm/l85w87PaL9b8mzn8N9QUQLe
         aSdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768979414; x=1769584214; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJ81YcHVJUXCUDOSqTEo4fpneXYhzAyyqlg4VRJWSOc=;
        b=lKmIqXLrjReJdCpGRuKw+tU1E9xGbzDiOL8DNhUZCoHFVk8biP/+mLGqgEV1wcNZlr
         RdOmD9uPLnpQxGxcK6ZLSIufVKIn6rW91KbpXJqplkyiCJG5DtNpBtdg/MS0X5WiTJE9
         64/pYqNV1FgPd3vjPBwtAipt4e/9mkBkYOjMObm8lEw/QbeWQrF5gcte9sln83K+2D9Y
         07TekfhhdO5iI17eLsZ3673jyUkOgOQ0tDXBuz6rwkR5+hROoGVBAYKSC4n/0EqhDTaM
         rXaL1RW7HwgHDNO1YoC9hPdHY4qLN0jsF6ocoh6bnUAXQJ030f8pfPEOQOSVOqQTn6Rh
         e4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768979414; x=1769584214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hJ81YcHVJUXCUDOSqTEo4fpneXYhzAyyqlg4VRJWSOc=;
        b=aNCvEqRK8iTW+xbrBl40GKmEQvecN3SXkqvJJuIcoSV7ssMGlMfF09+5+eB45l1sH0
         KAZL46JeUG4IPUVCohx80IJHocmQKSMKjMnvpOsLjG02QaTHy0lrL/jji1A6a5F/bk1Q
         gnvUcow4mkbMSgHRfTSoqvWnPUKAvMidoDu1qzwbcNkrOzEXVqAogUaanNmMLWR0/CBv
         yxGZfWtNXkUVkxDwkP5vmvrXHeOcwAPP5AY5UFx2qIw95KD4ZNGbnljRtjcNsP7i+8fp
         UuBxkW5/EaN9kQPN4JBnZFwjztVXL9yJF+jvOptcd4VO6AW4rpFBpGpxAo5eIRRm0kek
         47Eg==
X-Forwarded-Encrypted: i=1; AJvYcCX6ZvsYJQdZ3Y0Q4NlqOWeM0iCTccCyakdw6630+5oL6LakpqFe+N1etrC+Ix9MIcR1+JYIzFeUJqa3@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjw0piCZgPO+C6QimGzplOZ3o8KHi3qWv8qCcN8SvbT8Jd6VEP
	jWVTdsoKjzaGxKoXzkE4zTkpsGSO4cxWt0x1pHCXlB4oDbDMdxNC6dVk8H/Y/wZQ6/X4wrIOLCx
	E/Ek9NGms32ZR+cLkLSQqGhPsq0Ok2WEx0eDNV2rM
X-Gm-Gg: AZuq6aKXhObodMJBhYoJ5ydMdIvR5l68m+Xvg6l+JhxGky0BqCuUekqqKenF2L7uhKC
	dIuvnjURtWBynmSXCKuEFBajJPtIWz0fCkZYjI34iWGKrXgUF1JJZftg7TC9VgH4yL5ZS090oEa
	UtsI4fgif3AKnQYz6GuT1W79J4H/LjiZcAOZ2zyqjBhLRalrefADRBX2pw3XxGVadX2MlRDzp1M
	byOAXgVr5oaB01+NinaUx+zf9JYWNpLjAgFDiqXNZvaPa3PkTpBgycDxaSwMtYEdMtEWZWTl7X7
	lgNFSAk=
X-Received: by 2002:a17:902:e746:b0:290:8ecf:e9f9 with SMTP id
 d9443c01a7336-2a7a2443b58mr1503495ad.7.1768979413636; Tue, 20 Jan 2026
 23:10:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260117052849.2205545-1-irogers@google.com> <20260117052849.2205545-9-irogers@google.com>
 <aW_OV72q5rAVrgRE@x1> <8c1fefd6-4f4c-42a7-9007-5c9df3975080@linux.intel.com>
In-Reply-To: <8c1fefd6-4f4c-42a7-9007-5c9df3975080@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 20 Jan 2026 23:10:01 -0800
X-Gm-Features: AZwV_Qg0iOIpO5Pzoy2b7YabxBnL-fqXhU8D44tCtQG-FBoEqke8sFeoam8z8tY
Message-ID: <CAP-5=fXUw=LLXX6Pzrab37TTrVrMdHJim1QOnvbP9gXsRQZFUg@mail.gmail.com>
Subject: Re: [PATCH v1 08/23] perf perf_regs: Switch from arch string to int e_machine
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, 
	Guo Ren <guoren@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Shimin Guo <shimin.guo@skydio.com>, Athira Rajeev <atrajeev@linux.ibm.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Howard Chu <howardchu95@gmail.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Andi Kleen <ak@linux.intel.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Dmitry Vyukov <dvyukov@google.com>, 
	=?UTF-8?Q?Krzysztof_=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>, 
	Chun-Tse Shao <ctshao@google.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Haibo Xu <haibo1.xu@intel.com>, Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Wielaard <mark@klomp.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 10:58=E2=80=AFPM Mi, Dapeng <dapeng1.mi@linux.intel=
.com> wrote:
>
>
> On 1/21/2026 2:49 AM, Arnaldo Carvalho de Melo wrote:
> > On Fri, Jan 16, 2026 at 09:28:34PM -0800, Ian Rogers wrote:
> >> The arch string requires multiple strcmp to identify things like the
> >> IP and SP. Switch to passing in an e_machine that in the bulk of cases
> >> is computed using a current thread load. The e_machine also allows
> >> identification of 32-bit vs 64-bit processes.
> >>
> >> Signed-off-by: Ian Rogers <irogers@google.com>
> >> ---
> >>  tools/perf/builtin-script.c                   |  17 ++-
> >>  tools/perf/util/evsel.c                       |  14 ++-
> >>  tools/perf/util/perf_regs.c                   | 105 +++++++++++------=
-
> > [ Include dwarf-regs.h to get conditional defines for EM_CSKY and EM_LO=
ONGARCH, not available in old distros ]
> >
> > - Arnaldo
>
> Seems the change would introduce the below building error.
>
> util/perf_regs.c: In function =E2=80=98perf_reg_name=E2=80=99:
> util/perf_regs.c:48:14: error: =E2=80=98EM_LOONGARCH=E2=80=99 undeclared =
(first use in this
> function)
>    48 |         case EM_LOONGARCH:
>       |              ^~~~~~~~~~~~
> util/perf_regs.c:48:14: note: each undeclared identifier is reported only
> once for each function it appears in
> util/perf_regs.c: In function =E2=80=98perf_arch_reg_ip=E2=80=99:
> util/perf_regs.c:114:14: error: =E2=80=98EM_LOONGARCH=E2=80=99 undeclared=
 (first use in
> this function)
>   114 |         case EM_LOONGARCH:
>       |              ^~~~~~~~~~~~
> util/perf_regs.c: In function =E2=80=98perf_arch_reg_sp=E2=80=99:
> util/perf_regs.c:143:14: error: =E2=80=98EM_LOONGARCH=E2=80=99 undeclared=
 (first use in
> this function)
>   143 |         case EM_LOONGARCH:
>       |              ^~~~~~~~~~~~
>
> It looks EM_LOONGARCH is not defined in the <elf.h> header file, not sure
> which one is better, include  dwarf-regs.h suggested by Arnaldo or direct
> add the define,
>
> diff --git a/tools/perf/util/perf_regs.c b/tools/perf/util/perf_regs.c
> index b58d59b84fb1..ce839df19fa3 100644
> --- a/tools/perf/util/perf_regs.c
> +++ b/tools/perf/util/perf_regs.c
> @@ -6,6 +6,10 @@
>  #include "util/sample.h"
>  #include "debug.h"
>
> +#ifndef EM_LOONGARCH
> +#define EM_LOONGARCH           258
> +#endif

Or #include <dwarf-regs.h> which I think is the fix Arnaldo is
carrying at the moment.

Thanks,
Ian

> +
>  int __weak arch_sdt_arg_parse_op(char *old_op __maybe_unused,
>                                  char **new_op __maybe_unused)
>  {
>
>
> >
