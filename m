Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFDA38B9B9
	for <linux-csky@vger.kernel.org>; Thu, 22 Jan 2026 19:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769109627; cv=pass; b=cdSAs1iIUYGNYgS1EfGbvT6ZpRYjxPOG8bRopQiaFcNdZCSDwJ2GGr7po1AY4WxHv0GzRwTqg+4BA+PMOjl3VwWuvWzZMzIJjCpOlBTXKHottHRTejtGwLsPeZFT1sSlu3tw8PlFmfYYZl64KH4KSKF8qhd5kdL/K1Ah27PZAhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769109627; c=relaxed/simple;
	bh=1eNNdvV/v7o4gjRqdxeJuqukuVyV5+H/ySQzg9oM2cE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q3iZlhS4markcNYeib5ZnsHJK5DXijX/p2zReKud7itbAH9jzVTglryO7IXdolOaM+zpK/tpdYm+BPLlHUgublm5OV4Hea16kp0OWH4g6KOpRSpCzlzbWCBeJZBhJ6jT0kX6I49xS6rOI1poJ6pBlIYHazKDtpP7dihs+B6W9i0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yfxHq1FC; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yfxHq1FC"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a35ae38bdfso10285ad.1
        for <linux-csky@vger.kernel.org>; Thu, 22 Jan 2026 11:20:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769109616; cv=none;
        d=google.com; s=arc-20240605;
        b=eAenwXZLFrvWGWuYPvlTg4+JBNl8fpX6aqJIeadNxe7CyB29gUTleZsztkxJkMAWUI
         kUixx9qsbtR3KwQ3phdCMAlJSjAZqwhPHnxm7wBa3/sUG9dg1RY7snJwu0VO1a7A86bB
         94IeIMtSydigZgIZBtwffAyOGMW7B4muqMKTwJ7O5s5tAbPZ44DrUIe9N/xs3t72aPMJ
         2iQx/4rEPHhaOC8Uj8FudjRdSCiZCmxxShbGl2vDWl3QGv+o7MUrlSh3iQuQ1oenQ4vC
         XorBn8wY4gXaikkfoxIcAdTwLMnMPnJGZTyA9eZTcDw9SCmr0cVyeZyQlnl7iAtxhcSF
         LNOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Od+DPMtD5to2A0BufNITjmJhKQ0ptW5p2YHxn8s3B8=;
        fh=bXUYlsB22EEvFxulpfou5HFguonZc+Aq0vKE26ajQRk=;
        b=LWsec74Wk0Uw1VVHm3Gg4xIiY/DGmb+K49wCpSfZsxFn3VlZ0PGy9SNfrP860y7aHH
         XACstURYY84R/91lcEcoJor7puhjYnaL69uvrkV05X1KCsmI4q5FM903Vy1Ix8Nur89C
         YnYxrk0hn7AJqhgtEufOoY84RP+IR58d39WjZVqyAebTJMZAGyXi6piM2oa+gITRmeyq
         sm1+gJN0wBLbUCgl9iD0FuSlRK+a3QQUf3AZCzpaOzWQE/6dw5G5q8Ygbr3XkFZlMHHV
         r1y2gzy1JeJrTbIQEngz2LCDRn1N3CvaKIjK02tceJioGCB8WXSKRQ7rEvfHUNmdRMWb
         n+Kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769109616; x=1769714416; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Od+DPMtD5to2A0BufNITjmJhKQ0ptW5p2YHxn8s3B8=;
        b=yfxHq1FCVmyMWocs+pJccnVpPFlLSlPNNQOdbdh3WRNUJRCEP2vKlpRJjbTth8WIHu
         e5JJWpS2Dbansd3iJw97sPtSU9dYPRBpzeIU7WuZjJZznFSaaSMTNgDlzACbIW+OxsYw
         CYgIqsRyjO8LjAmIjM2gelNZiNnhC8QxqB6hPhWF/1DNf+0umdudeTDEwnHvLyUH0v1E
         8gswQEOOrVjF8J1HWeYbu/9v3k/CNgmH0rbLBrf65/r/oH2KPViB1OO86B7fEo8Fb3kf
         aLJeJ3zVqRn23TpSCr7lmD7vy3dYw0P3cFCTDD8pn25TI5iVkqSSJsgk8vjKvCZeQVEc
         kXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769109616; x=1769714416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Od+DPMtD5to2A0BufNITjmJhKQ0ptW5p2YHxn8s3B8=;
        b=KC5VPfMYaSuN+KUBj67+NA+4AnGodC8yzdWxUl3TM4+Yr7pXdhUxdBWPWJx808jlo0
         IK13kGm+JRYkSrE9u4HcJSYkLcHboghgbFAUzS3z/Bqo6UoX4VSbu3OfB9xGfbUs4Hun
         lJKFX0SiGw94ToDabqN0hlB80vrnf0/OXHq+MFf51YkfpGzpPjeDxcgGdv5xSWTcqVqB
         6o8qJSoF2T93KDtau+UydJV+7lXULMSV4feI42RAiJ7+BakGcxkwJqhtDonFYk6l5Dmy
         m5/i1BomZx4H8QYcUgQahDXYf8ikasobVu93H6vXDCNgNAfADly6HtB/8NWDIeoEEkAN
         SrFA==
X-Forwarded-Encrypted: i=1; AJvYcCVIymutmpNHqvtDAHbZkcOjZNNmvRWqRa2Rd7tFn0kCKh3hVEZB8AzduN5SJ3fTnyHH2TveuvF+f5G3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy29GmdmZDByuT1LVp1N6MD7uxtkPJgOHZL2P5OIfTMk0YpPHFg
	0vK5oodGyhrm8ybCZ+z0Iku50SlgcTI6Ha7LB0WJDZ53MmeeCQuQn8KoIowja4H2AcKvQIU1mbE
	WEg8oMy740rW889aLDx5yO1iAUpvGaRrUUI/TkqTn
X-Gm-Gg: AZuq6aKqTjkngV+Pn7jSKktjwcTXj8JV8A7u796GIR2LUpiB1Y64nQy1uuuuccR7k3o
	9UZJsK4NzahuEy5uwSTQsXRjhoFnslEnNg2IrfHa11HnFgYjuZFVQQSp/IWNFgiTIBP17DVf1Tu
	IESQ4KSRCmelKe7YQCWSpfYrwSZmdOJMvsAYdGe3aspWRr7z2qnP0+p0NjjY1l809eUnmUKKLZe
	Y05UyQN1aLCGqjraFKljNYRQDvduLKVsLpOV8WCevo2wGEIJpnLg71tKwPcnU3NmZCCs5AM2RNe
	qg4LV8kvop/NHVQQJaNTo8q60Q==
X-Received: by 2002:a17:903:28c:b0:298:45b1:6ef4 with SMTP id
 d9443c01a7336-2a8024db5cdmr326815ad.12.1769109615868; Thu, 22 Jan 2026
 11:20:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122165407.561888-1-irogers@google.com> <20260122165407.561888-12-irogers@google.com>
 <CAO9wTFjA8_YH+_VW4YHze3dUu-HisA-m_GzfpeS_L=ya7FC9uA@mail.gmail.com>
In-Reply-To: <CAO9wTFjA8_YH+_VW4YHze3dUu-HisA-m_GzfpeS_L=ya7FC9uA@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 22 Jan 2026 11:20:04 -0800
X-Gm-Features: AZwV_QhOWCsKoUPsWSGYxkhbT75uIENmhM4kJsBNx_hb2S0JYW2XYOxu90HvPh0
Message-ID: <CAP-5=fVS90cUNXbs2BD-_cEBb9c=1+UN1BvGF1kvtDKy-=O0ZA@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] perf disasm: Refactor arch__find and
 initialization of arch structs
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

On Thu, Jan 22, 2026 at 10:45=E2=80=AFAM Suchit Karunakaran
<suchitkarunakaran@gmail.com> wrote:
> On Thu, 22 Jan 2026 at 22:24, Ian Rogers <irogers@google.com> wrote:
[snip]
> > --- a/tools/perf/util/annotate-arch/annotate-arm64.c
> > +++ b/tools/perf/util/annotate-arch/annotate-arm64.c
> > @@ -8,9 +8,10 @@
> >  #include "../annotate.h"
> >  #include "../disasm.h"
> >
> > -struct arm64_annotate {
> > -       regex_t call_insn,
> > -               jump_insn;
> > +struct arch_arm64 {
> > +       struct arch arch;
> > +       regex_t call_insn;
> > +       regex_t jump_insn;
> >  };
> >
> >  static int arm64_mov__parse(const struct arch *arch __maybe_unused,
> > @@ -70,7 +71,7 @@ static const struct ins_ops arm64_mov_ops =3D {
> >
> >  static const struct ins_ops *arm64__associate_instruction_ops(struct a=
rch *arch, const char *name)
> >  {
> > -       struct arm64_annotate *arm =3D arch->priv;
> > +       struct arch_arm64 *arm =3D container_of(arch, struct arch_arm64=
, arch);
> >         const struct ins_ops *ops;
> >         regmatch_t match[2];
> >
> > @@ -87,38 +88,44 @@ static const struct ins_ops *arm64__associate_instr=
uction_ops(struct arch *arch,
> >         return ops;
> >  }
> >
> > -int arm64__annotate_init(struct arch *arch, char *cpuid __maybe_unused=
)
> > +const struct arch *arch__new_arm64(const struct e_machine_and_e_flags =
*id,
> > +                                  const char *cpuid __maybe_unused)
> >  {
> > -       struct arm64_annotate *arm;
> >         int err;
> > +       struct arch_arm64 *arm =3D zalloc(sizeof(*arm));
> > +       struct arch *arch;
> >
> > -       if (arch->initialized)
> > -               return 0;
> > +       if (!arm)
> > +               return NULL;
> > +
> > +       arch =3D &arm->arch;
> > +       arch->name =3D "arm64";
> > +       arch->id =3D *id;
> > +       arch->objdump.comment_char        =3D '/';
> > +       arch->objdump.skip_functions_char =3D '+';
> > +       arch->associate_instruction_ops   =3D arm64__associate_instruct=
ion_ops;
> >
> >         arm =3D zalloc(sizeof(*arm));
> >         if (!arm)
> > -               return ENOMEM;
> > +               return NULL;
>
> Please correct me if I'm wrong, but I think there's double allocation
> here for the variable arm since we've already allocated memory for at
> the start of the function.

Yes, I will fix it in v3. Clearly I was working too late :-)

> >
> >         /* bl, blr */
> >         err =3D regcomp(&arm->call_insn, "^blr?$", REG_EXTENDED);
> >         if (err)
> >                 goto out_free_arm;
> > +
> >         /* b, b.cond, br, cbz/cbnz, tbz/tbnz */
> >         err =3D regcomp(&arm->jump_insn, "^[ct]?br?\\.?(cc|cs|eq|ge|gt|=
hi|hs|le|lo|ls|lt|mi|ne|pl|vc|vs)?n?z?$",
> >                       REG_EXTENDED);
> >         if (err)
> >                 goto out_free_call;
> >
> > -       arch->initialized =3D true;
> > -       arch->priv        =3D arm;
> > -       arch->associate_instruction_ops   =3D arm64__associate_instruct=
ion_ops;
> > -       arch->objdump.comment_char        =3D '/';
> > -       arch->objdump.skip_functions_char =3D '+';
> > -       return 0;
> > +       return arch;
> >
> >  out_free_call:
> >         regfree(&arm->call_insn);
> >  out_free_arm:
> >         free(arm);
> > -       return SYMBOL_ANNOTATE_ERRNO__ARCH_INIT_REGEXP;
> > +       errno =3D SYMBOL_ANNOTATE_ERRNO__ARCH_INIT_REGEXP;
> > +       return NULL;
> >  }
[snip]
> > diff --git a/tools/perf/util/annotate-arch/annotate-powerpc.c b/tools/p=
erf/util/annotate-arch/annotate-powerpc.c
> > index 593c138c8104..004e6137aa03 100644
> > --- a/tools/perf/util/annotate-arch/annotate-powerpc.c
> > +++ b/tools/perf/util/annotate-arch/annotate-powerpc.c
> > @@ -390,17 +390,21 @@ static void update_insn_state_powerpc(struct type=
_state *state,
> >  }
> >  #endif /* HAVE_LIBDW_SUPPORT */
> >
> > -int powerpc__annotate_init(struct arch *arch, char *cpuid __maybe_unus=
ed)
> > +const struct arch *arch__new_powerpc(const struct e_machine_and_e_flag=
s *id,
> > +                                    const char *cpuid __maybe_unused)
> >  {
> > -       if (!arch->initialized) {
> > -               arch->initialized =3D true;
> > -               arch->associate_instruction_ops =3D powerpc__associate_=
instruction_ops;
> > -               arch->objdump.comment_char      =3D '#';
> > -               annotate_opts.show_asm_raw =3D true;
> > +       struct arch *arch =3D zalloc(sizeof(*arch));
> > +
> > +       if (!arch)
> > +               return NULL;
> > +
> > +       arch->name =3D "powerpc";
> > +       arch->id =3D *id;
> > +       arch->objdump.comment_char =3D '#';
> > +       annotate_opts.show_asm_raw =3D true;
> > +       arch->associate_instruction_ops =3D powerpc__associate_instruct=
ion_ops;
> >  #ifdef HAVE_LIBDW_SUPPORT
> > -               arch->update_insn_state =3D update_insn_state_powerpc;
> > +       arch->update_insn_state =3D update_insn_state_powerpc;
> >  #endif
> > -       }
> > -
> >         return 0;
>
> Shouldn't we return arch here?

Agreed.

> >  }
[snip]
> > diff --git a/tools/perf/util/annotate-arch/annotate-sparc.c b/tools/per=
f/util/annotate-arch/annotate-sparc.c
> > index 66a0174376dd..fe7a37966261 100644
> > --- a/tools/perf/util/annotate-arch/annotate-sparc.c
> > +++ b/tools/perf/util/annotate-arch/annotate-sparc.c
> > @@ -1,6 +1,7 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  #include <string.h>
> >  #include <linux/compiler.h>
> > +#include <linux/zalloc.h>
> >  #include "../../util/disasm.h"
> >
> >  static int is_branch_cond(const char *cond)
> > @@ -160,13 +161,17 @@ static const struct ins_ops *sparc__associate_ins=
truction_ops(struct arch *arch,
> >         return ops;
> >  }
> >
> > -int sparc__annotate_init(struct arch *arch, char *cpuid __maybe_unused=
)
> > +const struct arch *arch__new_sparc(const struct e_machine_and_e_flags =
*id,
> > +                                  const char *cpuid __maybe_unused)
> >  {
> > -       if (!arch->initialized) {
> > -               arch->initialized =3D true;
> > -               arch->associate_instruction_ops =3D sparc__associate_in=
struction_ops;
> > -               arch->objdump.comment_char =3D '#';
> > -       }
> > +       struct arch *arch =3D zalloc(sizeof(*arch));
> > +
> > +       if (!arch)
> > +               return NULL;
> >
> > +       arch->name =3D "sparc";
> > +       arch->id =3D *id;
> > +       arch->associate_instruction_ops =3D sparc__associate_instructio=
n_ops;
> > +       arch->objdump.comment_char =3D '#';
> >         return 0;
>
> Same here as well, 0 is returned instead of the arch pointer.

Agreed.

Thanks,
Ian
