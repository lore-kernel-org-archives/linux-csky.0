Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E4D356A0B
	for <linux-csky@vger.kernel.org>; Thu, 22 Jan 2026 11:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769082427; cv=pass; b=kI6k80tK1dq8SXSrz7UI56mwXStJwoWc9hVsA0tEAitXhPgMhERuUTJ9V1xmMg5DVSM7r3/6QcbGFd64wbisxp5Mq4ZNuC+08qBAuCp3oWvoyqbN0LeONmOdNFoLG697zz12DBdD/39ZzEK3ysdFq8TZDHsgEsDG57fht9Jwt8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769082427; c=relaxed/simple;
	bh=n4SQWlevJx/WdvMfV1rCMA1VgLwX7M282m1WRU8aY5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IaQK3BoaOQwWKGWno9DfsSbn1mFys0gMRQ6EU/BLI80VMLNuBF7bH06lPE2YTRDbZ48nKQvhMiyp3/CxaIkkcrr500/04vlC3T8+sHFZRCSNjtjkBySzBxU/8xh7ZM7M+gMOy8BrH6rfTPbwth+VCaXQgrfCFMcJLuS+QQFkiWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpYOiGHi; arc=pass smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpYOiGHi"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-45c7f550f46so282773b6e.3
        for <linux-csky@vger.kernel.org>; Thu, 22 Jan 2026 03:47:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769082424; cv=none;
        d=google.com; s=arc-20240605;
        b=G79nPTAsE1Yravr4T9xrTXP+Ltc5DtIZV4Abtf+ScBlUgROCieGctZekLcNjLhtW3e
         P3diWowWmxOK9Lx0izCThtRKYxJhX5tSNIcTFCp47RzW0o89ZrPB0zhKSrrrQIbLe4yk
         J+2lbvGXHtt8gzOL3dvGPc9VR72MQgorulf31eJ+pMaeZj8hurH2QjPFmv5/bif2RbXw
         RgGEfGCTozeE7YefmqhN73SvYNKkxjgLdfsNIvlQbgj1wNKRd3W0HYkkvXjdmyN/vPwA
         OO9NAH1CQPaVHqzido81ISB33daJk3G8UomPJ0nfikN7p1w2ycEMhy3N8HoKPaGLj6ND
         DSkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0GEdFKTShC0ZpJHoWL5oV3syGXTsJmRbqldb2CgIg7Y=;
        fh=gWw50vSzic/1h2N8o0tHLKQjM1dOzkfnAtLEC6jPEW0=;
        b=LfRC2AexQo5NLuZveaw9eKSVz9MdMsSUfCgVKs0mLDY+c2fzeyYkYdd5Qv4riG3dwq
         0KX6ExmyXNrQhNi2H3ySbgAuJV7CdqXVfYH/rdzCil2MNNwbMhXHZxFkT36e85UD9v/g
         IGkgm51+8pY6IyZWhjgVb3PMare38C4x7eQYgoSOISgWYBbgGqv9nq3uKu9Q5PnIjKUA
         NrL9pw5hjGsztSFtQQIqL3kVruoUHrv93W+njIpetwB0WdWKqMEsf+5C/oMPF+/MqhaD
         kajTHLItNEIBYiaqDg5sWOr7VYvflAThwVdC2aRk1oAYzOTRx9GUixlrjKV0m/BMXwec
         DVdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769082424; x=1769687224; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0GEdFKTShC0ZpJHoWL5oV3syGXTsJmRbqldb2CgIg7Y=;
        b=fpYOiGHifCl8ph3SG9opZlgEx7T1SAyKjcthXICsV1xbmLpgi9hcJ1dJR9E+S+pdVj
         N9+V6A9RqdfpAWPTlX7qIeDpRVXc/G9cxInH2weyt1bkVNaJ8DO940dMfYP6f7X7zLZy
         3WotOZkCP+LVjvbayRFg0B78hIAGNXqDGC28qCfUpF8rdcM4d8I8Oh9JJBdqK/xn5l8j
         M1qc+E/p2gq5hl7GIeA+P1cuyZYmNHb0+lBBR6AxQMap5f7Vp35gT1jVQmZiAwhxfetp
         Hfnj7gGPAjaP/dOgUgwBN4HQbbmtH646Mzb6svTlSACfgc/fMatNK6+NXVP6yWsaC9/t
         x+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769082424; x=1769687224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GEdFKTShC0ZpJHoWL5oV3syGXTsJmRbqldb2CgIg7Y=;
        b=tv/jnU95767L/+M/H3CiEE+kuzzFYNRyTsi75K2IfT7UAFgDjGuNXrzHswo4BSWTf6
         B7tjkKQHbs6IhssATNZK+CNpbE7ryXTYa0ZBBkg6OmIyglBHiOY03P60BB6/qIZOoRwI
         YFSmU/dcU/o2pctQT/rtVem7T2Vsamafg5gwekg9wWHaiggJldDX8jeTmI3myFv+xm0h
         9748DwKYuyJokvW78LAo+0eiC/GtgiY7ERhBNZFUlNjpjR93s9AcW06fjP+N3NY4UC3r
         ylPrwDeA3SBf18xpTQk11l9gC8JseYaKpfRDqO8RPBytVxthcvNMqnIm4SPNv/RQ3gXf
         Jfdw==
X-Forwarded-Encrypted: i=1; AJvYcCUzsDN/NXbAJOEYMu8NP82cjTgQVKpTvrGoTEiYqmtCQy8vcO6Qa0c5hMgRJiZ+JHrr239Plzid42NG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8dT5f1jLTU+Bxb67EPprw1QsK1OM/VQiyyomSKIj32D0wXM9s
	+AqXAGWNyRUphIQRZUOXhNKHG0Fv+U7fNyQk9i1WiYgRHuA7tEfQVpLY+Bqj6+WkWLneVjxa9a6
	X2R7PVanxHP7Y6eixCrFvykI7Jh40ozE=
X-Gm-Gg: AZuq6aLzQm9d6lFJIUkM8NiYya+em+5jxp5ru9vw9dtrnpGC3KFrgBJZrpRbdVgslex
	0vjSg6QHibBwYS7FBGlDhy7y8Oonzq4XolR1Grokrz4sTgmEn1Grdzxn3wARJ3sb2W9FNOiQHJp
	iyjXe41YhoZy4NzjvCgYFWXX8cYBasp07a5l2gAccikfWEsc0TprI5gx/HZ+acXkuFzRRQ4no5i
	oITDPnC6WIKVDcZ9KQdaMDnimGwgFfWe85XkM2E4UUReBQRsUVaPX0p2RzxTWRQkZ9N+vOf
X-Received: by 2002:a05:6808:538d:b0:450:340:2693 with SMTP id
 5614622812f47-45e8aa24273mr3205271b6e.42.1769082424420; Thu, 22 Jan 2026
 03:47:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122073127.375139-1-irogers@google.com> <20260122073127.375139-3-irogers@google.com>
In-Reply-To: <20260122073127.375139-3-irogers@google.com>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Thu, 22 Jan 2026 17:16:52 +0530
X-Gm-Features: AZwV_QjrC7BYx4_l0qj0u58o9jMWpinoFh5JfqyMmM-71XKtG3yyoT8qR6m_7W0
Message-ID: <CAO9wTFh01Qzn9tAiXf8_eGd7AAJiKzjmHNw-hBBCzcYR9Mb8xg@mail.gmail.com>
Subject: Re: [PATCH v1 02/11] perf annotate: Fix args leak of map_symbol
To: Ian Rogers <irogers@google.com>
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

> @@ -1119,7 +1121,7 @@ static int symbol__parse_objdump_line(struct symbol *sym,
>                                       struct annotate_args *args,
>                                       char *parsed_line, int *line_nr, char **fileloc)
>  {
> -       struct map *map = args->ms.map;
> +       struct map *map = args->ms->map;
>         struct annotation *notes = symbol__annotation(sym);
>         struct disasm_line *dl;
>         char *tmp;
> @@ -1151,7 +1153,7 @@ static int symbol__parse_objdump_line(struct symbol *sym,
>         args->line    = parsed_line;
>         args->line_nr = *line_nr;
>         args->fileloc = *fileloc;
> -       args->ms.sym  = sym;
> +       args->ms->sym  = sym;
>
>         dl = disasm_line__new(args);
>         (*line_nr)++;
> @@ -1172,7 +1174,7 @@ static int symbol__parse_objdump_line(struct symbol *sym,
>                         .ms = { .map = map, },
>                 };
>
> -               if (!maps__find_ams(args->ms.maps, &target) &&
> +               if (!maps__find_ams(args->ms->maps, &target) &&
>                     target.ms.sym->start == target.al_addr)
>                         dl->ops.target.sym = target.ms.sym;
>         }

Hi, a noob here so please correct me if I'm wrong.
Looking at symbol__parse_objdump_line(), shouldn't we be calling
map__get() when initializing the target struct? Since maps__find_ams()
now calls map__put() (after patch 1).
struct addr_map_symbol target = {
    .addr = dl->ops.target.addr,
    .ms = { .map = map__get(map), },
};
This would match the pattern used in call__parse() and jump__parse()
that were fixed in patch 2.
