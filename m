Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB09D35DCF9
	for <linux-csky@vger.kernel.org>; Tue, 27 Jan 2026 16:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769530295; cv=pass; b=OOaVbDUfAnynkKss/5aD8Hq6Rgb1SC/kRcduEdNYuFieWQ9W7nbPbWLr3iAdYM6Ti88r4o/pihZEc5u8IyVZNg1kXQe/W/4oTXm+AJJLaLeLIrOdtIsvCa8kEj2oInP7xCcUBuN26oz3CpJJ4Naq5283XfHYmsRZmP/oWEE/3hg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769530295; c=relaxed/simple;
	bh=GvJu3aOsTnHupmWRfgd6HU0cCVtOB8EiB56nq3pcWkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J0RUVvMDMvHNCM6c7NVVbdt0dOfHStIixtILGxyjfhvAUMGXdbonL9s5YGdc76zqwpTbSfXyVk7bQtsrDoiTXQrjs/Vapl3zTHmz4sSF/P8ANHJcznYQ/nM/HMk4tDEVTUeLIFvaXkJuGECnFlY3MF2Dq+lSOSxXGOalDMH+G/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dnQ9xOdy; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dnQ9xOdy"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a1462573caso77795ad.0
        for <linux-csky@vger.kernel.org>; Tue, 27 Jan 2026 08:11:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769530293; cv=none;
        d=google.com; s=arc-20240605;
        b=LKpqvHmo0jQPCyaF3cSp4gSoxZVrespmCHWAdMbQt3q2I6nY813abXTACUfLy278sH
         bVZykTY7MawuQBbmAiEd6NI3m6qlSBR4IMNVtEXt0oIOVd/BJ3ott9Xwc3J70rxhD7Ah
         UZqHUA6PWs42j3zEzqQHQAiFbqBDBfJXbo84rvcFAafaH1EqKkuM8jGyRFXyD0qiKDYU
         HRvoO+vct+sXr2oauqCsZxrgN1i27UT3qf+uh8Vb3YOUy/uPhzmG3Uf81cPrrxyFMvXG
         OFOHjZT1WnwWOXN7QFkc/00oq3PhKlP+7hoBGjKkiwJKVMUMaVgwJMm/xrE56QPxUAti
         un6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A/mleTy9B4/UIaLOH3Gao4Wnx4rcDBQf6oq8eOX91jQ=;
        fh=k16VwEG3D2A3DhVrPs+4McDrKK0RtYWCFTBJYjverWU=;
        b=MZ7i3pzYkaphJX3uLZy/0AuMXVlR1CqakDBX6kdclEG+UA7XffDpuo6npoXq+7JeXr
         8AGM0LEvP9jTSBLprOBsv//MBoDIJeC+dy/tiA8OckSel5qSeaugBX7SFo3QGx72ngQp
         2+OdS03+7EQwwMP4uITveSVb+SS0USKD6l7sywv35YKiziFpt15W4g3i4nJEju+8XYiu
         Xseb9/sXpDZCXDhM2K+iWHA7+5OhHQfFsqzqLJenrQhlEgCFHXxxvehrSRuz2WLCtN2e
         elLfxBvW+SAhHI8I4mauhi4jbyFcPzcsnmaGD9UmbOeJee5vpteHMistf62pJvQ17PbZ
         3f/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769530293; x=1770135093; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/mleTy9B4/UIaLOH3Gao4Wnx4rcDBQf6oq8eOX91jQ=;
        b=dnQ9xOdy6kz7Tx6/F2Ysphbh2ZF6677NnZsP3FsQXKTM8fcW8Dc5JH3ZNNbCfann9Z
         JswA3q2b34b44lKDbFFrks/VYTvcHTwz8f4OgMn6tGVKA3+CCrMQUZIg3M+8cez2jwXd
         B7e3+I05suHaRGpWjAr6jGoGd12I+sGhqI+l/q71litXrIBU0SEB9l2lydQYd644ys3Y
         2nmBa9/bJ4UgSz5S5S7qBvNxupqfLzUZ8Ifb85USCZnEIIzwwAzXbYlFUwBnK4dKTCwT
         3LjBdZVcqzX3wGBtDEqH8UQMQ8j+y0UA6dQV3GL64KNlje7k5DJ3lsfp00mvTU9abgCk
         oqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769530293; x=1770135093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A/mleTy9B4/UIaLOH3Gao4Wnx4rcDBQf6oq8eOX91jQ=;
        b=hfepahpRwwiqqFBBez/IISAkusmblzCypK76lmgPcz3+fsqLbNls3L3C6OGfC3lXKu
         V1OzEaJ0TzOeVyiCQUbx5lRV28tfZo8WWib0+OGtoBrjfeOZIX5Q83FwZP/O+8t9kxVB
         HLTVABtzUxwfFS7o8yiG3wKiRC1uz6prLuOfVCtvyeIKzwndMWfpd4BgFG/UhbTR3tL+
         z476HIwVpv6qI+2GmNvbptX4HjgLkbqZLaNQ/UnPTmuG+JBq8bXg8ihf85duyqK+mA4G
         CXkj2tNJZ53uc9th3+QPjRpnuki6uTaGqLAZTJw4wc52kVChmRqEoOo9cL8sifRRrnoa
         rwZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/cj+y3Z4TItzozcB1o5iJqvb1hZ+nluF+Wro2BSPtcuysuwzxdrIBA3nabXLrSTJhwbXDf/naChtc@vger.kernel.org
X-Gm-Message-State: AOJu0YwVGFD7ejAZ/Ykh9jDuLr4mB1tVoMiWxoyrfeyHJFVtCHMFJw2t
	ZttZfo8ZXWPqDzZsZCXCSDjPMLJLmNMjUbtSbL3un9mCQza2qNi5UFW5DitDGz69o0ZMFR+oUvl
	tI/mDYTNf3Desnz01RCcTRbP9OHTsf4iKzpb7F5dF
X-Gm-Gg: AZuq6aJZjuWcsWw/K1Rj9e7lY9G2oi9+Ce1uYDRzxGSzZxB6xCpE69Fn7l2P/hJAOZP
	O33DbKi3WEyTUbJ5ybXTpnQ8Bpt8EErg0ZzvuBnclzF9VxHJ7Q8dKV7Lpagl5Z9wvch6cMzfG6J
	tu4OIrjx4wLCZRQXvMwtB7p94Py9EvoDOhq8ydlfFxBMbBzsRaIkJ3oDJDjKuA6cKpZjJ664JUu
	oj3PyIKApBdRG5JA/ua1zHxAV+RWJMhXOWk8CCyLmflExWIO212lA2xrT+Dh3R/MmyeJDuOYwb/
	8SKVWGmd8qq+MUldnz53Cu59
X-Received: by 2002:a17:902:cecb:b0:2a1:3cdc:7720 with SMTP id
 d9443c01a7336-2a870b9a583mr2100165ad.21.1769530292678; Tue, 27 Jan 2026
 08:11:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127070259.2720468-1-dapeng1.mi@linux.intel.com>
 <20260127070259.2720468-2-dapeng1.mi@linux.intel.com> <a97ff1d6-7712-4315-95ff-4079ffc752f7@linux.intel.com>
In-Reply-To: <a97ff1d6-7712-4315-95ff-4079ffc752f7@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 27 Jan 2026 08:11:21 -0800
X-Gm-Features: AZwV_QjW0pwOnDUxPFtiXQXGGTFi90qXyv8gN_Wjk26BamAh3tH23kY_UBLKyTk
Message-ID: <CAP-5=fXW2KiHy+wT16nRgQK4xboTzcTH3pMEe3=En7dwUNGJPQ@mail.gmail.com>
Subject: Re: [Patch v2 1/3] perf arch: Update arch headers to use relative
 UAPI paths
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
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

On Tue, Jan 27, 2026 at 4:38=E2=80=AFAM Mi, Dapeng <dapeng1.mi@linux.intel.=
com> wrote:
>
>
> On 1/27/2026 3:02 PM, Dapeng Mi wrote:
> > The architectural specific headers perf_regs.h currently rely on the
> > host architecture's 'asm/perf_regs.h'. This can lead to compilation
> > inconsistencies or failures when including and building perf for a
> > target architecture that differs from the host's architecture.
> >
> > Explicitly point to the UAPI headers within the tools source tree using
> > relative paths. This ensures that perf is always built against the
> > intended architecture.
> >
> > No functional changes are intended.
> >
> > Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
> > ---
> >  tools/perf/arch/arm/include/perf_regs.h       | 2 +-
> >  tools/perf/arch/arm64/include/perf_regs.h     | 2 +-
> >  tools/perf/arch/csky/include/perf_regs.h      | 1 +
> >  tools/perf/arch/loongarch/include/perf_regs.h | 2 +-
> >  tools/perf/arch/mips/include/perf_regs.h      | 2 +-
> >  tools/perf/arch/powerpc/include/perf_regs.h   | 2 +-
> >  tools/perf/arch/riscv/include/perf_regs.h     | 2 +-
> >  tools/perf/arch/s390/include/perf_regs.h      | 2 +-
> >  tools/perf/arch/x86/include/perf_regs.h       | 2 +-
> >  9 files changed, 9 insertions(+), 8 deletions(-)
> >
> > diff --git a/tools/perf/arch/arm/include/perf_regs.h b/tools/perf/arch/=
arm/include/perf_regs.h
> > index 75ce1c370114..20c54766e3a0 100644
> > --- a/tools/perf/arch/arm/include/perf_regs.h
> > +++ b/tools/perf/arch/arm/include/perf_regs.h
> > @@ -4,7 +4,7 @@
> >
> >  #include <stdlib.h>
> >  #include <linux/types.h>
> > -#include <asm/perf_regs.h>
> > +#include "../../../../arch/arm/include/uapi/asm/perf_regs.h"
> >
> >  void perf_regs_load(u64 *regs);
> >
> > diff --git a/tools/perf/arch/arm64/include/perf_regs.h b/tools/perf/arc=
h/arm64/include/perf_regs.h
> > index 58639ee9f7ea..372f2565a9dd 100644
> > --- a/tools/perf/arch/arm64/include/perf_regs.h
> > +++ b/tools/perf/arch/arm64/include/perf_regs.h
> > @@ -5,7 +5,7 @@
> >  #include <stdlib.h>
> >  #include <linux/types.h>
> >  #define perf_event_arm_regs perf_event_arm64_regs
> > -#include <asm/perf_regs.h>
> > +#include "../../../../arch/arm64/include/uapi/asm/perf_regs.h"
> >  #undef perf_event_arm_regs
> >
> >  void perf_regs_load(u64 *regs);
> > diff --git a/tools/perf/arch/csky/include/perf_regs.h b/tools/perf/arch=
/csky/include/perf_regs.h
> > index 076c7746c8a2..9520e6aa319e 100644
> > --- a/tools/perf/arch/csky/include/perf_regs.h
> > +++ b/tools/perf/arch/csky/include/perf_regs.h
> > @@ -7,6 +7,7 @@
> >  #include <stdlib.h>
> >  #include <linux/types.h>
> >  #include <asm/perf_regs.h>
>
> Oops, the above line was not removed. Would remove it in next version.

Aside from this:
Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> > +#include "../../../../arch/csky/include/uapi/asm/perf_regs.h"
> >
> >  #define PERF_REGS_MASK       ((1ULL << PERF_REG_CSKY_MAX) - 1)
> >  #define PERF_REGS_MAX        PERF_REG_CSKY_MAX
> > diff --git a/tools/perf/arch/loongarch/include/perf_regs.h b/tools/perf=
/arch/loongarch/include/perf_regs.h
> > index 45c799fa5330..b86078a55e90 100644
> > --- a/tools/perf/arch/loongarch/include/perf_regs.h
> > +++ b/tools/perf/arch/loongarch/include/perf_regs.h
> > @@ -4,7 +4,7 @@
> >
> >  #include <stdlib.h>
> >  #include <linux/types.h>
> > -#include <asm/perf_regs.h>
> > +#include "../../../../arch/loongarch/include/uapi/asm/perf_regs.h"
> >
> >  #define PERF_REGS_MAX PERF_REG_LOONGARCH_MAX
> >
> > diff --git a/tools/perf/arch/mips/include/perf_regs.h b/tools/perf/arch=
/mips/include/perf_regs.h
> > index 7082e91e0ed1..66655f0c4fea 100644
> > --- a/tools/perf/arch/mips/include/perf_regs.h
> > +++ b/tools/perf/arch/mips/include/perf_regs.h
> > @@ -4,7 +4,7 @@
> >
> >  #include <stdlib.h>
> >  #include <linux/types.h>
> > -#include <asm/perf_regs.h>
> > +#include "../../../../arch/mips/include/uapi/asm/perf_regs.h"
> >
> >  #define PERF_REGS_MAX PERF_REG_MIPS_MAX
> >
> > diff --git a/tools/perf/arch/powerpc/include/perf_regs.h b/tools/perf/a=
rch/powerpc/include/perf_regs.h
> > index 1c66f6ba6773..22b492a3dd58 100644
> > --- a/tools/perf/arch/powerpc/include/perf_regs.h
> > +++ b/tools/perf/arch/powerpc/include/perf_regs.h
> > @@ -4,7 +4,7 @@
> >
> >  #include <stdlib.h>
> >  #include <linux/types.h>
> > -#include <asm/perf_regs.h>
> > +#include "../../../../arch/powerpc/include/uapi/asm/perf_regs.h"
> >
> >  void perf_regs_load(u64 *regs);
> >
> > diff --git a/tools/perf/arch/riscv/include/perf_regs.h b/tools/perf/arc=
h/riscv/include/perf_regs.h
> > index d482edb413e5..89d5bbb8d2b8 100644
> > --- a/tools/perf/arch/riscv/include/perf_regs.h
> > +++ b/tools/perf/arch/riscv/include/perf_regs.h
> > @@ -6,7 +6,7 @@
> >
> >  #include <stdlib.h>
> >  #include <linux/types.h>
> > -#include <asm/perf_regs.h>
> > +#include "../../../../arch/riscv/include/uapi/asm/perf_regs.h"
> >
> >  #define PERF_REGS_MASK       ((1ULL << PERF_REG_RISCV_MAX) - 1)
> >  #define PERF_REGS_MAX        PERF_REG_RISCV_MAX
> > diff --git a/tools/perf/arch/s390/include/perf_regs.h b/tools/perf/arch=
/s390/include/perf_regs.h
> > index 130dfad2b96a..9c95589965fe 100644
> > --- a/tools/perf/arch/s390/include/perf_regs.h
> > +++ b/tools/perf/arch/s390/include/perf_regs.h
> > @@ -3,7 +3,7 @@
> >
> >  #include <stdlib.h>
> >  #include <linux/types.h>
> > -#include <asm/perf_regs.h>
> > +#include "../../../../arch/s390/include/uapi/asm/perf_regs.h"
> >
> >  void perf_regs_load(u64 *regs);
> >
> > diff --git a/tools/perf/arch/x86/include/perf_regs.h b/tools/perf/arch/=
x86/include/perf_regs.h
> > index f209ce2c1dd9..5495e5ca7cdc 100644
> > --- a/tools/perf/arch/x86/include/perf_regs.h
> > +++ b/tools/perf/arch/x86/include/perf_regs.h
> > @@ -4,7 +4,7 @@
> >
> >  #include <stdlib.h>
> >  #include <linux/types.h>
> > -#include <asm/perf_regs.h>
> > +#include "../../../../arch/x86/include/uapi/asm/perf_regs.h"
> >
> >  void perf_regs_load(u64 *regs);
> >
