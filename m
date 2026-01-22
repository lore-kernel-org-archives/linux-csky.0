Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7898247A0AB
	for <linux-csky@vger.kernel.org>; Thu, 22 Jan 2026 05:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769060465; cv=pass; b=dDA09QgpCDsSVg+kERGgEi/qJFGUq3U64xyjSKFV8n2uaqI9A8C59yjPLBVYA/4KcF53QVmoSxX8cEzheA9vr/a7erH0U20c+tDu7rqgcEJNhbcqsPoOQiaoHRhs679JlyB10eCDx7mTXCqOhQNHlWtg5bLEd2P0zC/xmYAeP1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769060465; c=relaxed/simple;
	bh=cOozTo+3lUKQu9KAoTxlLehwMoE7lDxU17vd4cddZ1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pZEYHJvel35HSL4OpmehIS5Ouh+VeSjpWEsHrHc9fNLrre3zXd8iA8TxLPqEhk9B027EHBa/FA6qGIGOT3vQekh5tS0u4A7zGGcBIs5f9ZCl599bFv1DxLjsPwprNand+tRWSbu96qG6xOOYha2Ysyp2WTqisJ7O1Jz/YcwYz6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DB+/mAn2; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DB+/mAn2"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a1462573caso27835ad.0
        for <linux-csky@vger.kernel.org>; Wed, 21 Jan 2026 21:41:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769060460; cv=none;
        d=google.com; s=arc-20240605;
        b=UBSi5AMxsJ0W0PViLhOhwY6AidZk/LO4/KzwTsInRNUiWkkA7E54LPOvUoKWbpcUay
         eiey+AR09a+pG7aZ3kb/lmTn5uLPLPl/qo6ehCe9m/kVLgBLYesbpIqX8pHZoSO3gFEX
         8uSjnqb6BRseZF+F1WFLpuRPS3RSOiUJbX9A9p5Kn/2d1tumFMr9mzQ4upTSWcnKEx1c
         2SrNBwdMNSlq6yPDqLvK3tuUrnnIyT1JYmIY4x2w162srw46Lt3yxl5bcoWIJG0VSbMr
         A51MrkVJOc4CaGt4Ql+qGk79UdZmq5RxOjLkT/iUpHiO8hEZZe48MU6z/W+djlT68p6K
         6ojA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OdekFoLLrRUaUIQj2J1BBY4DUbn3hNGQzIwXIua7Ugc=;
        fh=1liaARwrWa09ZxoalUYeXvEWCpgJ0Hf2v7s+ACzG/+Q=;
        b=J317IPwfcJ54g/T0AUPj36YTxU7hH73pCq+XIhIV4FGuiljF4meGz7cun2dYwTZ0L3
         uFLC9bcu0OmKYAp7IaXvyRRp8hwxqX4EtxSljT8V517re5/YdKJOIt1yzJdrkscFO9oo
         Z8tfSI412L/leB3E4vVYqAJL2BD0pkJEzjxRl1zAvXuOrQE6cJ1QLhza6o+b6Sd6OGtp
         WgH4xvRKAMXtyNVDw5fpLYhk6Pcci9nKnhmpq1Hw6wYiDi1f/7bhJ1krakEWOrtaJCm+
         /fZmkkCLjsdlFWu1uhT3rDe1Pta27QgJZzZSeLcxTD8Td0SO0O3gGwd7Nv+e3v8W/ryb
         kWbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769060460; x=1769665260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdekFoLLrRUaUIQj2J1BBY4DUbn3hNGQzIwXIua7Ugc=;
        b=DB+/mAn2cvgz2dkaB15PkcmjPX+b2epyymf5cFbjSMph7Enz0N2A2pnMv6Ut/Zt65A
         M384wmjrkSbHv1xbsqfcU6+vS1EDB5Qz7pGhNUF3CydbeDAwm2xZ+P7MSASrGBAcFOsw
         rzEALJkc6KS7dytd3JLRJU4L93Auxb/2yGTO1vmkF3YsgNCo/bdhdk1qiCLPnZnZLK1Z
         ggr6cSSKrBCJJ7j2bpfdZy+UDQMxdjWn30RcX6UynDXGmD9IClxdBB5TWesLViKQpc7o
         zjVpfwJ+qNHwPUZLjxqF5dh8WNVLVv5jahtnKOK0iIZivXJNj6yIS7bStaB214IaIcq+
         +b0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769060460; x=1769665260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OdekFoLLrRUaUIQj2J1BBY4DUbn3hNGQzIwXIua7Ugc=;
        b=k7KToSGQO7PsiIn8TtrV5MmuGiNjKhzrt/voev/2XKo4d7+kUj/8igyHbd0FRsiAfe
         jjx23wifFgQXN6Y8GuZTepKgio4QcOs9af4aILnAShCR8EEbvb1SkO65oUIFd6OGl1ge
         9H4cv8SruH43KJgIJmShHLiy3a957FC+49jyF36tFWljQ2WZfBVVBBgt+57yo7VyriZo
         1EDE8ouc/0+TyKcfNugXOfAVpRufDtZcNMlRnDa9dm15NKMwnLb1iFjF+O46DQj0wT8j
         hjEOwwVRpYWstMoVj0Wa1IC5+l9PW2tmCh2hW0DdejzLCmMxwbd294nj0LR/v2w1ypg8
         uy0w==
X-Forwarded-Encrypted: i=1; AJvYcCUgv9WrxzPRrIrE6mwG0GS0mht+ysQGMHwxctzoUJ3JmMPV4NLVzjBOoWu0t9E0IACRNaanXkBrIGH8@vger.kernel.org
X-Gm-Message-State: AOJu0YzBoozAalcVlWMrtrFqfshP6+M0+FTgWq0jV3QNYMD+B+LSzHnj
	CXOwrLz+NpFsAGq2QMDdNQXFgnakuKSzJ9GCRwpbbnFWJFal8o/AqkKnQLQ+fyY8M/WCNfbyzR2
	IbGtyVMNda96Oya2FfnPid4ewIhYqN8Kr9PG7Md0p
X-Gm-Gg: AZuq6aK52MXTX8MxfyQi/pNxsBsWOO68FB9JUEFzFbDnFjDMQ0GHNngARDFUyh/ulFO
	LqfcesXew/pRFuVPh30TIxbENoI9meqNWMbCC1P8DVm0jeieLwELwjkcBYsNJFOtdJU3ZpOp9Qo
	nK1OcbmHRgqjUbwqZ3PUXf1JV4NpeAd1rxyGtKwvL6MJehBgKXcqJ4HREJHFYsq6FuV6512WRRz
	McHnMDnC0/Zi7cjAdlMw2TCsMrOA6TIUNtwTjEB2DZgcr2/aRWJ7sjxVoX5xpSzyCd+MpY2Jj6r
	DSzvFZ+cSCd38OaFMHg9SdC7Mc61YNCIMoT7
X-Received: by 2002:a17:903:2a85:b0:2a7:7ca1:8622 with SMTP id
 d9443c01a7336-2a7d674749bmr1156025ad.11.1769060458968; Wed, 21 Jan 2026
 21:40:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121021735.3625244-1-irogers@google.com> <56bb6d4d-ad9e-485f-af15-e0f6fbc261c1@linux.intel.com>
 <CAP-5=fWS+1412_ZOca3QfbjLzsZRbrYoLh9zGHDx5G_ZpTdg6Q@mail.gmail.com> <e600bf85-c4f0-42fa-95fd-33000830f28d@linux.intel.com>
In-Reply-To: <e600bf85-c4f0-42fa-95fd-33000830f28d@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 21 Jan 2026 21:40:47 -0800
X-Gm-Features: AZwV_QgCVvE13mvlqZApndCbE8antRUMH3CI_SR2BKPhSHY4tSZpeBGlms2eHD4
Message-ID: <CAP-5=fU63giM0i-fN5-98R5jJYWHns-PNQjCXOk981HAeOahWg@mail.gmail.com>
Subject: Re: [PATCH v2] perf regs: Refactor use of arch__sample_reg_masks to perf_reg_name
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
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
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 6:05=E2=80=AFPM Mi, Dapeng <dapeng1.mi@linux.intel.=
com> wrote:
>
>
> On 1/21/2026 10:38 PM, Ian Rogers wrote:
> > On Wed, Jan 21, 2026 at 12:28=E2=80=AFAM Mi, Dapeng <dapeng1.mi@linux.i=
ntel.com> wrote:
> >>
> >> On 1/21/2026 10:17 AM, Ian Rogers wrote:
> >>> arch__sample_reg_masks isn't supported on ARM(32), csky, loongarch,
> >>> MIPS, RISC-V and s390. The table returned by the function just has th=
e
> >>> name of a register paired with the corresponding sample_regs_user mas=
k
> >>> value. For a given perf register we can compute the name with
> >>> perf_reg_name and the mask is just 1 left-shifted by the perf registe=
r
> >>> number. Change __parse_regs to use this method for finding registers
> >>> rather than arch__sample_reg_masks, thereby adding __parse_regs
> >>> support for ARM(32), csky, loongarch, MIPS, RISC-V and s390. As
> >>> arch__sample_reg_masks is then unused, remove the now unneeded
> >>> declarations.
> >>>
> >>> Signed-off-by: Ian Rogers <irogers@google.com>
> >>> ---
> >>> v2: Correct the setting of reg mask for registers that need >1 bit se=
t
> >>>     like XMMs.
> >>>
> >>> The idea for this patch came up in conversation with Dapeng Mi to
> >>> avoid additional functions and tables for x86 APX support:
> >>> https://lore.kernel.org/lkml/CAP-5=3DfWOsvAXuu8qx0tk9q8j8BoXPMJB3Gxto=
+iu6wf06i4cVA@mail.gmail.com/
> >>>
> >>> The patch is on top of the dwfl clean up patches that switch perf
> >>> register functions to using e_machine as an argument rather than the
> >>> arch string, this means that EM_HOST can be used with perf_reg_name:
> >>> https://lore.kernel.org/lkml/20260117052849.2205545-1-irogers@google.=
com/
> >>> ---
> >>>  tools/perf/arch/arm/util/perf_regs.c          |   9 --
> >>>  tools/perf/arch/arm64/util/machine.c          |  14 +--
> >>>  tools/perf/arch/arm64/util/perf_regs.c        |  45 +------
> >>>  tools/perf/arch/csky/util/perf_regs.c         |   9 --
> >>>  tools/perf/arch/loongarch/util/perf_regs.c    |   9 --
> >>>  tools/perf/arch/mips/util/perf_regs.c         |   9 --
> >>>  tools/perf/arch/powerpc/util/perf_regs.c      |  68 ----------
> >>>  tools/perf/arch/riscv/util/perf_regs.c        |   9 --
> >>>  tools/perf/arch/s390/util/perf_regs.c         |   9 --
> >>>  tools/perf/arch/x86/util/perf_regs.c          |  47 -------
> >>>  .../util/arm64-frame-pointer-unwind-support.c |   3 +-
> >>>  tools/perf/util/parse-regs-options.c          | 116 +++++++++++-----=
--
> >>>  tools/perf/util/perf_regs.c                   |   9 --
> >>>  tools/perf/util/perf_regs.h                   |  12 --
> >>>  14 files changed, 81 insertions(+), 287 deletions(-)
> >>>
> >>> diff --git a/tools/perf/arch/arm/util/perf_regs.c b/tools/perf/arch/a=
rm/util/perf_regs.c
> >>> index f94a0210c7b7..03a5bc0cf64c 100644
> >>> --- a/tools/perf/arch/arm/util/perf_regs.c
> >>> +++ b/tools/perf/arch/arm/util/perf_regs.c
> >>> @@ -2,10 +2,6 @@
> >>>  #include "perf_regs.h"
> >>>  #include "../../../util/perf_regs.h"
> >>>
> >>> -static const struct sample_reg sample_reg_masks[] =3D {
> >>> -     SMPL_REG_END
> >>> -};
> >>> -
> >>>  uint64_t arch__intr_reg_mask(void)
> >>>  {
> >>>       return PERF_REGS_MASK;
> >>> @@ -15,8 +11,3 @@ uint64_t arch__user_reg_mask(void)
> >>>  {
> >>>       return PERF_REGS_MASK;
> >>>  }
> >>> -
> >>> -const struct sample_reg *arch__sample_reg_masks(void)
> >>> -{
> >>> -     return sample_reg_masks;
> >>> -}
> >>> diff --git a/tools/perf/arch/arm64/util/machine.c b/tools/perf/arch/a=
rm64/util/machine.c
> >>> index aab1cc2bc283..80fb13c958d9 100644
> >>> --- a/tools/perf/arch/arm64/util/machine.c
> >>> +++ b/tools/perf/arch/arm64/util/machine.c
> >>> @@ -1,18 +1,12 @@
> >>>  // SPDX-License-Identifier: GPL-2.0
> >>>
> >>> -#include <inttypes.h>
> >>> -#include <stdio.h>
> >>> -#include <string.h>
> >>> -#include "debug.h"
> >>> -#include "symbol.h"
> >>> -#include "callchain.h"
> >>> +#include "callchain.h" // prototype of arch__add_leaf_frame_record_o=
pts
> >>>  #include "perf_regs.h"
> >>>  #include "record.h"
> >>> -#include "util/perf_regs.h"
> >>> +
> >>> +#define SMPL_REG_MASK(b) (1ULL << (b))
> >>>
> >>>  void arch__add_leaf_frame_record_opts(struct record_opts *opts)
> >>>  {
> >>> -     const struct sample_reg *sample_reg_masks =3D arch__sample_reg_=
masks();
> >>> -
> >>> -     opts->sample_user_regs |=3D sample_reg_masks[PERF_REG_ARM64_LR]=
.mask;
> >>> +     opts->sample_user_regs |=3D SMPL_REG_MASK(PERF_REG_ARM64_LR);
> >>>  }
> >>> diff --git a/tools/perf/arch/arm64/util/perf_regs.c b/tools/perf/arch=
/arm64/util/perf_regs.c
> >>> index 09308665e28a..9bb768e1bea1 100644
> >>> --- a/tools/perf/arch/arm64/util/perf_regs.c
> >>> +++ b/tools/perf/arch/arm64/util/perf_regs.c
> >>> @@ -12,48 +12,12 @@
> >>>  #include "../../../util/event.h"
> >>>  #include "../../../util/perf_regs.h"
> >>>
> >>> +#define SMPL_REG_MASK(b) (1ULL << (b))
> >>> +
> >>>  #ifndef HWCAP_SVE
> >>>  #define HWCAP_SVE    (1 << 22)
> >>>  #endif
> >>>
> >>> -static const struct sample_reg sample_reg_masks[] =3D {
> >>> -     SMPL_REG(x0, PERF_REG_ARM64_X0),
> >>> -     SMPL_REG(x1, PERF_REG_ARM64_X1),
> >>> -     SMPL_REG(x2, PERF_REG_ARM64_X2),
> >>> -     SMPL_REG(x3, PERF_REG_ARM64_X3),
> >>> -     SMPL_REG(x4, PERF_REG_ARM64_X4),
> >>> -     SMPL_REG(x5, PERF_REG_ARM64_X5),
> >>> -     SMPL_REG(x6, PERF_REG_ARM64_X6),
> >>> -     SMPL_REG(x7, PERF_REG_ARM64_X7),
> >>> -     SMPL_REG(x8, PERF_REG_ARM64_X8),
> >>> -     SMPL_REG(x9, PERF_REG_ARM64_X9),
> >>> -     SMPL_REG(x10, PERF_REG_ARM64_X10),
> >>> -     SMPL_REG(x11, PERF_REG_ARM64_X11),
> >>> -     SMPL_REG(x12, PERF_REG_ARM64_X12),
> >>> -     SMPL_REG(x13, PERF_REG_ARM64_X13),
> >>> -     SMPL_REG(x14, PERF_REG_ARM64_X14),
> >>> -     SMPL_REG(x15, PERF_REG_ARM64_X15),
> >>> -     SMPL_REG(x16, PERF_REG_ARM64_X16),
> >>> -     SMPL_REG(x17, PERF_REG_ARM64_X17),
> >>> -     SMPL_REG(x18, PERF_REG_ARM64_X18),
> >>> -     SMPL_REG(x19, PERF_REG_ARM64_X19),
> >>> -     SMPL_REG(x20, PERF_REG_ARM64_X20),
> >>> -     SMPL_REG(x21, PERF_REG_ARM64_X21),
> >>> -     SMPL_REG(x22, PERF_REG_ARM64_X22),
> >>> -     SMPL_REG(x23, PERF_REG_ARM64_X23),
> >>> -     SMPL_REG(x24, PERF_REG_ARM64_X24),
> >>> -     SMPL_REG(x25, PERF_REG_ARM64_X25),
> >>> -     SMPL_REG(x26, PERF_REG_ARM64_X26),
> >>> -     SMPL_REG(x27, PERF_REG_ARM64_X27),
> >>> -     SMPL_REG(x28, PERF_REG_ARM64_X28),
> >>> -     SMPL_REG(x29, PERF_REG_ARM64_X29),
> >>> -     SMPL_REG(lr, PERF_REG_ARM64_LR),
> >>> -     SMPL_REG(sp, PERF_REG_ARM64_SP),
> >>> -     SMPL_REG(pc, PERF_REG_ARM64_PC),
> >>> -     SMPL_REG(vg, PERF_REG_ARM64_VG),
> >>> -     SMPL_REG_END
> >>> -};
> >>> -
> >>>  /* %xNUM */
> >>>  #define SDT_OP_REGEX1  "^(x[1-2]?[0-9]|3[0-1])$"
> >>>
> >>> @@ -175,8 +139,3 @@ uint64_t arch__user_reg_mask(void)
> >>>       }
> >>>       return PERF_REGS_MASK;
> >>>  }
> >>> -
> >>> -const struct sample_reg *arch__sample_reg_masks(void)
> >>> -{
> >>> -     return sample_reg_masks;
> >>> -}
> >>> diff --git a/tools/perf/arch/csky/util/perf_regs.c b/tools/perf/arch/=
csky/util/perf_regs.c
> >>> index 6b1665f41180..2cf7a54106e0 100644
> >>> --- a/tools/perf/arch/csky/util/perf_regs.c
> >>> +++ b/tools/perf/arch/csky/util/perf_regs.c
> >>> @@ -2,10 +2,6 @@
> >>>  #include "perf_regs.h"
> >>>  #include "../../util/perf_regs.h"
> >>>
> >>> -static const struct sample_reg sample_reg_masks[] =3D {
> >>> -     SMPL_REG_END
> >>> -};
> >>> -
> >>>  uint64_t arch__intr_reg_mask(void)
> >>>  {
> >>>       return PERF_REGS_MASK;
> >>> @@ -15,8 +11,3 @@ uint64_t arch__user_reg_mask(void)
> >>>  {
> >>>       return PERF_REGS_MASK;
> >>>  }
> >>> -
> >>> -const struct sample_reg *arch__sample_reg_masks(void)
> >>> -{
> >>> -     return sample_reg_masks;
> >>> -}
> >>> diff --git a/tools/perf/arch/loongarch/util/perf_regs.c b/tools/perf/=
arch/loongarch/util/perf_regs.c
> >>> index f94a0210c7b7..03a5bc0cf64c 100644
> >>> --- a/tools/perf/arch/loongarch/util/perf_regs.c
> >>> +++ b/tools/perf/arch/loongarch/util/perf_regs.c
> >>> @@ -2,10 +2,6 @@
> >>>  #include "perf_regs.h"
> >>>  #include "../../../util/perf_regs.h"
> >>>
> >>> -static const struct sample_reg sample_reg_masks[] =3D {
> >>> -     SMPL_REG_END
> >>> -};
> >>> -
> >>>  uint64_t arch__intr_reg_mask(void)
> >>>  {
> >>>       return PERF_REGS_MASK;
> >>> @@ -15,8 +11,3 @@ uint64_t arch__user_reg_mask(void)
> >>>  {
> >>>       return PERF_REGS_MASK;
> >>>  }
> >>> -
> >>> -const struct sample_reg *arch__sample_reg_masks(void)
> >>> -{
> >>> -     return sample_reg_masks;
> >>> -}
> >>> diff --git a/tools/perf/arch/mips/util/perf_regs.c b/tools/perf/arch/=
mips/util/perf_regs.c
> >>> index 6b1665f41180..2cf7a54106e0 100644
> >>> --- a/tools/perf/arch/mips/util/perf_regs.c
> >>> +++ b/tools/perf/arch/mips/util/perf_regs.c
> >>> @@ -2,10 +2,6 @@
> >>>  #include "perf_regs.h"
> >>>  #include "../../util/perf_regs.h"
> >>>
> >>> -static const struct sample_reg sample_reg_masks[] =3D {
> >>> -     SMPL_REG_END
> >>> -};
> >>> -
> >>>  uint64_t arch__intr_reg_mask(void)
> >>>  {
> >>>       return PERF_REGS_MASK;
> >>> @@ -15,8 +11,3 @@ uint64_t arch__user_reg_mask(void)
> >>>  {
> >>>       return PERF_REGS_MASK;
> >>>  }
> >>> -
> >>> -const struct sample_reg *arch__sample_reg_masks(void)
> >>> -{
> >>> -     return sample_reg_masks;
> >>> -}
> >>> diff --git a/tools/perf/arch/powerpc/util/perf_regs.c b/tools/perf/ar=
ch/powerpc/util/perf_regs.c
> >>> index bd36cfd420a2..779073f7e992 100644
> >>> --- a/tools/perf/arch/powerpc/util/perf_regs.c
> >>> +++ b/tools/perf/arch/powerpc/util/perf_regs.c
> >>> @@ -18,69 +18,6 @@
> >>>  #define PVR_POWER10          0x0080
> >>>  #define PVR_POWER11          0x0082
> >>>
> >>> -static const struct sample_reg sample_reg_masks[] =3D {
> >>> -     SMPL_REG(r0, PERF_REG_POWERPC_R0),
> >>> -     SMPL_REG(r1, PERF_REG_POWERPC_R1),
> >>> -     SMPL_REG(r2, PERF_REG_POWERPC_R2),
> >>> -     SMPL_REG(r3, PERF_REG_POWERPC_R3),
> >>> -     SMPL_REG(r4, PERF_REG_POWERPC_R4),
> >>> -     SMPL_REG(r5, PERF_REG_POWERPC_R5),
> >>> -     SMPL_REG(r6, PERF_REG_POWERPC_R6),
> >>> -     SMPL_REG(r7, PERF_REG_POWERPC_R7),
> >>> -     SMPL_REG(r8, PERF_REG_POWERPC_R8),
> >>> -     SMPL_REG(r9, PERF_REG_POWERPC_R9),
> >>> -     SMPL_REG(r10, PERF_REG_POWERPC_R10),
> >>> -     SMPL_REG(r11, PERF_REG_POWERPC_R11),
> >>> -     SMPL_REG(r12, PERF_REG_POWERPC_R12),
> >>> -     SMPL_REG(r13, PERF_REG_POWERPC_R13),
> >>> -     SMPL_REG(r14, PERF_REG_POWERPC_R14),
> >>> -     SMPL_REG(r15, PERF_REG_POWERPC_R15),
> >>> -     SMPL_REG(r16, PERF_REG_POWERPC_R16),
> >>> -     SMPL_REG(r17, PERF_REG_POWERPC_R17),
> >>> -     SMPL_REG(r18, PERF_REG_POWERPC_R18),
> >>> -     SMPL_REG(r19, PERF_REG_POWERPC_R19),
> >>> -     SMPL_REG(r20, PERF_REG_POWERPC_R20),
> >>> -     SMPL_REG(r21, PERF_REG_POWERPC_R21),
> >>> -     SMPL_REG(r22, PERF_REG_POWERPC_R22),
> >>> -     SMPL_REG(r23, PERF_REG_POWERPC_R23),
> >>> -     SMPL_REG(r24, PERF_REG_POWERPC_R24),
> >>> -     SMPL_REG(r25, PERF_REG_POWERPC_R25),
> >>> -     SMPL_REG(r26, PERF_REG_POWERPC_R26),
> >>> -     SMPL_REG(r27, PERF_REG_POWERPC_R27),
> >>> -     SMPL_REG(r28, PERF_REG_POWERPC_R28),
> >>> -     SMPL_REG(r29, PERF_REG_POWERPC_R29),
> >>> -     SMPL_REG(r30, PERF_REG_POWERPC_R30),
> >>> -     SMPL_REG(r31, PERF_REG_POWERPC_R31),
> >>> -     SMPL_REG(nip, PERF_REG_POWERPC_NIP),
> >>> -     SMPL_REG(msr, PERF_REG_POWERPC_MSR),
> >>> -     SMPL_REG(orig_r3, PERF_REG_POWERPC_ORIG_R3),
> >>> -     SMPL_REG(ctr, PERF_REG_POWERPC_CTR),
> >>> -     SMPL_REG(link, PERF_REG_POWERPC_LINK),
> >>> -     SMPL_REG(xer, PERF_REG_POWERPC_XER),
> >>> -     SMPL_REG(ccr, PERF_REG_POWERPC_CCR),
> >>> -     SMPL_REG(softe, PERF_REG_POWERPC_SOFTE),
> >>> -     SMPL_REG(trap, PERF_REG_POWERPC_TRAP),
> >>> -     SMPL_REG(dar, PERF_REG_POWERPC_DAR),
> >>> -     SMPL_REG(dsisr, PERF_REG_POWERPC_DSISR),
> >>> -     SMPL_REG(sier, PERF_REG_POWERPC_SIER),
> >>> -     SMPL_REG(mmcra, PERF_REG_POWERPC_MMCRA),
> >>> -     SMPL_REG(mmcr0, PERF_REG_POWERPC_MMCR0),
> >>> -     SMPL_REG(mmcr1, PERF_REG_POWERPC_MMCR1),
> >>> -     SMPL_REG(mmcr2, PERF_REG_POWERPC_MMCR2),
> >>> -     SMPL_REG(mmcr3, PERF_REG_POWERPC_MMCR3),
> >>> -     SMPL_REG(sier2, PERF_REG_POWERPC_SIER2),
> >>> -     SMPL_REG(sier3, PERF_REG_POWERPC_SIER3),
> >>> -     SMPL_REG(pmc1, PERF_REG_POWERPC_PMC1),
> >>> -     SMPL_REG(pmc2, PERF_REG_POWERPC_PMC2),
> >>> -     SMPL_REG(pmc3, PERF_REG_POWERPC_PMC3),
> >>> -     SMPL_REG(pmc4, PERF_REG_POWERPC_PMC4),
> >>> -     SMPL_REG(pmc5, PERF_REG_POWERPC_PMC5),
> >>> -     SMPL_REG(pmc6, PERF_REG_POWERPC_PMC6),
> >>> -     SMPL_REG(sdar, PERF_REG_POWERPC_SDAR),
> >>> -     SMPL_REG(siar, PERF_REG_POWERPC_SIAR),
> >>> -     SMPL_REG_END
> >>> -};
> >>> -
> >>>  /* REG or %rREG */
> >>>  #define SDT_OP_REGEX1  "^(%r)?([1-2]?[0-9]|3[0-1])$"
> >>>
> >>> @@ -233,8 +170,3 @@ uint64_t arch__user_reg_mask(void)
> >>>  {
> >>>       return PERF_REGS_MASK;
> >>>  }
> >>> -
> >>> -const struct sample_reg *arch__sample_reg_masks(void)
> >>> -{
> >>> -     return sample_reg_masks;
> >>> -}
> >>> diff --git a/tools/perf/arch/riscv/util/perf_regs.c b/tools/perf/arch=
/riscv/util/perf_regs.c
> >>> index 6b1665f41180..2cf7a54106e0 100644
> >>> --- a/tools/perf/arch/riscv/util/perf_regs.c
> >>> +++ b/tools/perf/arch/riscv/util/perf_regs.c
> >>> @@ -2,10 +2,6 @@
> >>>  #include "perf_regs.h"
> >>>  #include "../../util/perf_regs.h"
> >>>
> >>> -static const struct sample_reg sample_reg_masks[] =3D {
> >>> -     SMPL_REG_END
> >>> -};
> >>> -
> >>>  uint64_t arch__intr_reg_mask(void)
> >>>  {
> >>>       return PERF_REGS_MASK;
> >>> @@ -15,8 +11,3 @@ uint64_t arch__user_reg_mask(void)
> >>>  {
> >>>       return PERF_REGS_MASK;
> >>>  }
> >>> -
> >>> -const struct sample_reg *arch__sample_reg_masks(void)
> >>> -{
> >>> -     return sample_reg_masks;
> >>> -}
> >>> diff --git a/tools/perf/arch/s390/util/perf_regs.c b/tools/perf/arch/=
s390/util/perf_regs.c
> >>> index 6b1665f41180..2cf7a54106e0 100644
> >>> --- a/tools/perf/arch/s390/util/perf_regs.c
> >>> +++ b/tools/perf/arch/s390/util/perf_regs.c
> >>> @@ -2,10 +2,6 @@
> >>>  #include "perf_regs.h"
> >>>  #include "../../util/perf_regs.h"
> >>>
> >>> -static const struct sample_reg sample_reg_masks[] =3D {
> >>> -     SMPL_REG_END
> >>> -};
> >>> -
> >>>  uint64_t arch__intr_reg_mask(void)
> >>>  {
> >>>       return PERF_REGS_MASK;
> >>> @@ -15,8 +11,3 @@ uint64_t arch__user_reg_mask(void)
> >>>  {
> >>>       return PERF_REGS_MASK;
> >>>  }
> >>> -
> >>> -const struct sample_reg *arch__sample_reg_masks(void)
> >>> -{
> >>> -     return sample_reg_masks;
> >>> -}
> >>> diff --git a/tools/perf/arch/x86/util/perf_regs.c b/tools/perf/arch/x=
86/util/perf_regs.c
> >>> index 12fd93f04802..a7ca4154fdf9 100644
> >>> --- a/tools/perf/arch/x86/util/perf_regs.c
> >>> +++ b/tools/perf/arch/x86/util/perf_regs.c
> >>> @@ -13,48 +13,6 @@
> >>>  #include "../../../util/pmu.h"
> >>>  #include "../../../util/pmus.h"
> >>>
> >>> -static const struct sample_reg sample_reg_masks[] =3D {
> >>> -     SMPL_REG(AX, PERF_REG_X86_AX),
> >>> -     SMPL_REG(BX, PERF_REG_X86_BX),
> >>> -     SMPL_REG(CX, PERF_REG_X86_CX),
> >>> -     SMPL_REG(DX, PERF_REG_X86_DX),
> >>> -     SMPL_REG(SI, PERF_REG_X86_SI),
> >>> -     SMPL_REG(DI, PERF_REG_X86_DI),
> >>> -     SMPL_REG(BP, PERF_REG_X86_BP),
> >>> -     SMPL_REG(SP, PERF_REG_X86_SP),
> >>> -     SMPL_REG(IP, PERF_REG_X86_IP),
> >>> -     SMPL_REG(FLAGS, PERF_REG_X86_FLAGS),
> >>> -     SMPL_REG(CS, PERF_REG_X86_CS),
> >>> -     SMPL_REG(SS, PERF_REG_X86_SS),
> >>> -#ifdef HAVE_ARCH_X86_64_SUPPORT
> >>> -     SMPL_REG(R8, PERF_REG_X86_R8),
> >>> -     SMPL_REG(R9, PERF_REG_X86_R9),
> >>> -     SMPL_REG(R10, PERF_REG_X86_R10),
> >>> -     SMPL_REG(R11, PERF_REG_X86_R11),
> >>> -     SMPL_REG(R12, PERF_REG_X86_R12),
> >>> -     SMPL_REG(R13, PERF_REG_X86_R13),
> >>> -     SMPL_REG(R14, PERF_REG_X86_R14),
> >>> -     SMPL_REG(R15, PERF_REG_X86_R15),
> >>> -#endif
> >>> -     SMPL_REG2(XMM0, PERF_REG_X86_XMM0),
> >>> -     SMPL_REG2(XMM1, PERF_REG_X86_XMM1),
> >>> -     SMPL_REG2(XMM2, PERF_REG_X86_XMM2),
> >>> -     SMPL_REG2(XMM3, PERF_REG_X86_XMM3),
> >>> -     SMPL_REG2(XMM4, PERF_REG_X86_XMM4),
> >>> -     SMPL_REG2(XMM5, PERF_REG_X86_XMM5),
> >>> -     SMPL_REG2(XMM6, PERF_REG_X86_XMM6),
> >>> -     SMPL_REG2(XMM7, PERF_REG_X86_XMM7),
> >>> -     SMPL_REG2(XMM8, PERF_REG_X86_XMM8),
> >>> -     SMPL_REG2(XMM9, PERF_REG_X86_XMM9),
> >>> -     SMPL_REG2(XMM10, PERF_REG_X86_XMM10),
> >>> -     SMPL_REG2(XMM11, PERF_REG_X86_XMM11),
> >>> -     SMPL_REG2(XMM12, PERF_REG_X86_XMM12),
> >>> -     SMPL_REG2(XMM13, PERF_REG_X86_XMM13),
> >>> -     SMPL_REG2(XMM14, PERF_REG_X86_XMM14),
> >>> -     SMPL_REG2(XMM15, PERF_REG_X86_XMM15),
> >>> -     SMPL_REG_END
> >>> -};
> >>> -
> >>>  struct sdt_name_reg {
> >>>       const char *sdt_name;
> >>>       const char *uprobe_name;
> >>> @@ -276,11 +234,6 @@ int arch_sdt_arg_parse_op(char *old_op, char **n=
ew_op)
> >>>       return SDT_ARG_VALID;
> >>>  }
> >>>
> >>> -const struct sample_reg *arch__sample_reg_masks(void)
> >>> -{
> >>> -     return sample_reg_masks;
> >>> -}
> >>> -
> >>>  uint64_t arch__intr_reg_mask(void)
> >>>  {
> >>>       struct perf_event_attr attr =3D {
> >>> diff --git a/tools/perf/util/arm64-frame-pointer-unwind-support.c b/t=
ools/perf/util/arm64-frame-pointer-unwind-support.c
> >>> index 958afe8b821e..858ce2b01812 100644
> >>> --- a/tools/perf/util/arm64-frame-pointer-unwind-support.c
> >>> +++ b/tools/perf/util/arm64-frame-pointer-unwind-support.c
> >>> @@ -2,7 +2,6 @@
> >>>  #include "arm64-frame-pointer-unwind-support.h"
> >>>  #include "callchain.h"
> >>>  #include "event.h"
> >>> -#include "perf_regs.h" // SMPL_REG_MASK
> >>>  #include "unwind.h"
> >>>  #include <string.h>
> >>>
> >>> @@ -15,6 +14,8 @@ struct entries {
> >>>       size_t length;
> >>>  };
> >>>
> >>> +#define SMPL_REG_MASK(b) (1ULL << (b))
> >>> +
> >>>  static bool get_leaf_frame_caller_enabled(struct perf_sample *sample=
)
> >>>  {
> >>>       struct regs_dump *regs;
> >>> diff --git a/tools/perf/util/parse-regs-options.c b/tools/perf/util/p=
arse-regs-options.c
> >>> index cda1c620968e..c0d0ef9fd495 100644
> >>> --- a/tools/perf/util/parse-regs-options.c
> >>> +++ b/tools/perf/util/parse-regs-options.c
> >>> @@ -5,15 +5,54 @@
> >>>  #include <string.h>
> >>>  #include <stdio.h>
> >>>  #include "util/debug.h"
> >>> +#include <dwarf-regs.h>
> >>>  #include <subcmd/parse-options.h>
> >>>  #include "util/perf_regs.h"
> >>>  #include "util/parse-regs-options.h"
> >>>
> >>> +static void list_perf_regs(FILE *fp, uint64_t mask)
> >>> +{
> >>> +     const char *last_name =3D NULL;
> >>> +
> >>> +     fprintf(fp, "available registers: ");
> >>> +     for (int reg =3D 0; reg < 64; reg++) {
> >> Could we not use the magic number 64? It's not safe, the supported GP
> >> register number could exceed 64 in the future, then the exceeded regis=
ter
> >> won't be iterated.
> > How will such a register appear in sample_regs_user/sample_regs_intr?
> > There's a requirement that perf registers be indices into the 64-bit
> > mask.
>
> In theory, if the GPRs exceeds 64, then sample_regs_user/sample_regs_intr
> could become an u64 array. So if the user missed to modify the magic numb=
er
> 64, then there would be something wrong. IMO, the below change looks safe=
r
> and I personally doesn't like the magic number. :)

Hmm.. I'm not sold. 64 vs "sizeof(mask) * BITS_PER_BYTE" means you
need to know the type of mask then work out the math. BITS_PER_U64
could be intention revealing but it is also just obviously a synonym
for 64, and the coding style guide says to keep things short:
https://docs.kernel.org/process/coding-style.html#naming

Thanks,
Ian

> >
> >> How about this?
> >>
> >> diff --git a/tools/perf/util/parse-regs-options.c
> >> b/tools/perf/util/parse-regs-options.c
> >> index c0d0ef9fd495..5177016a7ad4 100644
> >> --- a/tools/perf/util/parse-regs-options.c
> >> +++ b/tools/perf/util/parse-regs-options.c
> >> @@ -15,7 +15,7 @@ static void list_perf_regs(FILE *fp, uint64_t mask)
> >>         const char *last_name =3D NULL;
> >>
> >>         fprintf(fp, "available registers: ");
> >> -       for (int reg =3D 0; reg < 64; reg++) {
> >> +       for (unsigned long reg =3D 0; reg < sizeof(mask) * BITS_PER_BY=
TE;
> >> reg++) {
> >>                 const char *name;
> >>
> >>                 if (((1ULL << reg) & mask) =3D=3D 0)
> >>
> >>
> >>> +             const char *name;
> >>> +
> >>> +             if (((1ULL << reg) & mask) =3D=3D 0)
> >>> +                     continue;
> >>> +
> >>> +             name =3D perf_reg_name(reg, EM_HOST);
> >>> +             if (name && (!last_name || strcmp(last_name, name)))
> >>> +                     fprintf(fp, "%s%s", reg > 0 ? " " : "", name);
> >>> +             last_name =3D name;
> >>> +     }
> >>> +     fputc('\n', fp);
> >>> +}
> >>> +
> >>> +static uint64_t name_to_perf_reg_mask(const char *to_match, uint64_t=
 mask)
> >>> +{
> >>> +     uint64_t reg_mask =3D 0;
> >>> +
> >>> +     for (int reg =3D 0; reg < 64; reg++) {
> >> ditto.
> >>
> >>
> >>> +             const char *name;
> >>> +
> >>> +             if (((1ULL << reg) & mask) =3D=3D 0)
> >>> +                     continue;
> >>> +
> >>> +             name =3D perf_reg_name(reg, EM_HOST);
> >>> +             if (!name)
> >>> +                     continue;
> >>> +
> >>> +             if (!strcasecmp(to_match, name))
> >>> +                     reg_mask |=3D 1ULL << reg;
> >> How much register names are expected to match here? It seems the funct=
ion
> >> expects to match only one register name. If so, we can "break" here.
> > Registers like XMM0 double up so that they have two 64-bit slots in
> > the sample data. You need to match the name multiple times so that all
> > bits can be set in the mask.
>
> Oh, yes. I missed XMM registers. Thanks.
>
>
> >
> > Thanks,
> > Ian
> >
> >> Thanks.
> >>
> >>
> >>> +     }
> >>> +     return reg_mask;
> >>> +}
> >>> +
> >>>  static int
> >>>  __parse_regs(const struct option *opt, const char *str, int unset, b=
ool intr)
> >>>  {
> >>>       uint64_t *mode =3D (uint64_t *)opt->value;
> >>> -     const struct sample_reg *r =3D NULL;
> >>>       char *s, *os =3D NULL, *p;
> >>>       int ret =3D -1;
> >>>       uint64_t mask;
> >>> @@ -27,50 +66,41 @@ __parse_regs(const struct option *opt, const char=
 *str, int unset, bool intr)
> >>>       if (*mode)
> >>>               return -1;
> >>>
> >>> -     if (intr)
> >>> -             mask =3D arch__intr_reg_mask();
> >>> -     else
> >>> -             mask =3D arch__user_reg_mask();
> >>> -
> >>>       /* str may be NULL in case no arg is passed to -I */
> >>> -     if (str) {
> >>> -             /* because str is read-only */
> >>> -             s =3D os =3D strdup(str);
> >>> -             if (!s)
> >>> -                     return -1;
> >>> -
> >>> -             for (;;) {
> >>> -                     p =3D strchr(s, ',');
> >>> -                     if (p)
> >>> -                             *p =3D '\0';
> >>> -
> >>> -                     if (!strcmp(s, "?")) {
> >>> -                             fprintf(stderr, "available registers: "=
);
> >>> -                             for (r =3D arch__sample_reg_masks(); r-=
>name; r++) {
> >>> -                                     if (r->mask & mask)
> >>> -                                             fprintf(stderr, "%s ", =
r->name);
> >>> -                             }
> >>> -                             fputc('\n', stderr);
> >>> -                             /* just printing available regs */
> >>> -                             goto error;
> >>> -                     }
> >>> -                     for (r =3D arch__sample_reg_masks(); r->name; r=
++) {
> >>> -                             if ((r->mask & mask) && !strcasecmp(s, =
r->name))
> >>> -                                     break;
> >>> -                     }
> >>> -                     if (!r || !r->name) {
> >>> -                             ui__warning("Unknown register \"%s\", c=
heck man page or run \"perf record %s?\"\n",
> >>> -                                         s, intr ? "-I" : "--user-re=
gs=3D");
> >>> -                             goto error;
> >>> -                     }
> >>> -
> >>> -                     *mode |=3D r->mask;
> >>> -
> >>> -                     if (!p)
> >>> -                             break;
> >>> -
> >>> -                     s =3D p + 1;
> >>> +     if (!str)
> >>> +             return -1;
> >>> +
> >>> +     mask =3D intr ? arch__intr_reg_mask() : arch__user_reg_mask();
> >>> +
> >>> +     /* because str is read-only */
> >>> +     s =3D os =3D strdup(str);
> >>> +     if (!s)
> >>> +             return -1;
> >>> +
> >>> +     for (;;) {
> >>> +             uint64_t reg_mask;
> >>> +
> >>> +             p =3D strchr(s, ',');
> >>> +             if (p)
> >>> +                     *p =3D '\0';
> >>> +
> >>> +             if (!strcmp(s, "?")) {
> >>> +                     list_perf_regs(stderr, mask);
> >>> +                     goto error;
> >>> +             }
> >>> +
> >>> +             reg_mask =3D name_to_perf_reg_mask(s, mask);
> >>> +             if (reg_mask =3D=3D 0) {
> >>> +                     ui__warning("Unknown register \"%s\", check man=
 page or run \"perf record %s?\"\n",
> >>> +                             s, intr ? "-I" : "--user-regs=3D");
> >>> +                     goto error;
> >>>               }
> >>> +             *mode |=3D reg_mask;
> >>> +
> >>> +             if (!p)
> >>> +                     break;
> >>> +
> >>> +             s =3D p + 1;
> >>>       }
> >>>       ret =3D 0;
> >>>
> >>> diff --git a/tools/perf/util/perf_regs.c b/tools/perf/util/perf_regs.=
c
> >>> index b58d59b84fb1..ec602da1aeb6 100644
> >>> --- a/tools/perf/util/perf_regs.c
> >>> +++ b/tools/perf/util/perf_regs.c
> >>> @@ -22,15 +22,6 @@ uint64_t __weak arch__user_reg_mask(void)
> >>>       return 0;
> >>>  }
> >>>
> >>> -static const struct sample_reg sample_reg_masks[] =3D {
> >>> -     SMPL_REG_END
> >>> -};
> >>> -
> >>> -const struct sample_reg * __weak arch__sample_reg_masks(void)
> >>> -{
> >>> -     return sample_reg_masks;
> >>> -}
> >>> -
> >>>  const char *perf_reg_name(int id, uint16_t e_machine)
> >>>  {
> >>>       const char *reg_name =3D NULL;
> >>> diff --git a/tools/perf/util/perf_regs.h b/tools/perf/util/perf_regs.=
h
> >>> index 7bfc6a34c02b..2c2a8de6912d 100644
> >>> --- a/tools/perf/util/perf_regs.h
> >>> +++ b/tools/perf/util/perf_regs.h
> >>> @@ -7,17 +7,6 @@
> >>>
> >>>  struct regs_dump;
> >>>
> >>> -struct sample_reg {
> >>> -     const char *name;
> >>> -     uint64_t mask;
> >>> -};
> >>> -
> >>> -#define SMPL_REG_MASK(b) (1ULL << (b))
> >>> -#define SMPL_REG(n, b) { .name =3D #n, .mask =3D SMPL_REG_MASK(b) }
> >>> -#define SMPL_REG2_MASK(b) (3ULL << (b))
> >>> -#define SMPL_REG2(n, b) { .name =3D #n, .mask =3D SMPL_REG2_MASK(b) =
}
> >>> -#define SMPL_REG_END { .name =3D NULL }
> >>> -
> >>>  enum {
> >>>       SDT_ARG_VALID =3D 0,
> >>>       SDT_ARG_SKIP,
> >>> @@ -26,7 +15,6 @@ enum {
> >>>  int arch_sdt_arg_parse_op(char *old_op, char **new_op);
> >>>  uint64_t arch__intr_reg_mask(void);
> >>>  uint64_t arch__user_reg_mask(void);
> >>> -const struct sample_reg *arch__sample_reg_masks(void);
> >>>
> >>>  const char *perf_reg_name(int id, uint16_t e_machine);
> >>>  int perf_reg_value(u64 *valp, struct regs_dump *regs, int id);
