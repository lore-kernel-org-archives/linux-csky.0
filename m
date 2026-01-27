Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162B7221540
	for <linux-csky@vger.kernel.org>; Tue, 27 Jan 2026 18:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769537325; cv=pass; b=HsZYhum3dWuzeor/LuhEQlUJDKS8WPJX8xRHJchcVJ6pNNbsTt+nnXU5x8s5YbYZB4/1ThneMprPhYz8JPwB4qVE8QwVozz/CRMYIM4BbpuWv6/tfjmacl7AGAY00knfhcQqXscabioUBxjVMJUml0zGm4RHXpbomoZMVc3smDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769537325; c=relaxed/simple;
	bh=1dOOo8NQ4DafD9XkbSs1ACU0adhfNmtPmDSYYCT0h1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j2qNIO4GDNV6GQJ2+K78Fv4QIlY7hVEsAnINDuJC3TqwsSykVKv1kl37Jz9i46s1uEznf1DqH/1hKw5SYJaBZST6L6kmAZ9Pho7ezHiqFvWPVBDw/mqWQn5URbVFv5dKYW4hv/yjXq92uBUvlEUOUq6EcOza9Rf2RELwr65UVq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=07XIoGWl; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="07XIoGWl"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a885af8ee7so2315ad.1
        for <linux-csky@vger.kernel.org>; Tue, 27 Jan 2026 10:08:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769537323; cv=none;
        d=google.com; s=arc-20240605;
        b=LwkWryzNykq6Nwg5iEKGtZU/3HCOt2NRW4GefbD+pZhv8gWR70SB/4Lkr1ZyiXipNQ
         oEHOqIb/u8/qudgscUkaa2Lj6VBqihKWoCMGCYcAaPG768wy7eYqMZBltnaCqRvGvQEL
         3n7kSHD6UxdopkQZH7fel1aUwefzCOuqbUVbzkS/1jmNpmq4OW/NglUzis9YGzRycCQ1
         PBOtjCukaWDx3B3F0oJ5RInyJDGpsFyxXkhhPiNnuLD+x2Y9Tp/32U1+d1OSGf5k5wOc
         wuDAWDNiAjk1ABYhUAKjqOeYwFPELHvKEa+O+S/yhsK+A4WSlIYfiwml3pcFtktEoOcO
         dxMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1dOOo8NQ4DafD9XkbSs1ACU0adhfNmtPmDSYYCT0h1M=;
        fh=U+mWy3Qywirjf30tft6W1BxjZWEheqqBsvIHBDQ5whc=;
        b=OYp6DfOqS+QgDZjUhOLyIoO6bwcGwBJV1BrhaEK2UHhidJwp+9/qM9PLdWB8UdsL4j
         V1ee+Li9bttNrLzXg0SnznqwDHVNIQBTOI0tnbh/11W+mZg5tuk4bz/FV8jfOqh3nc+v
         67crKjbbH1MPQWrb3q50HDH42dYQJaKYXkqjjjx20dBCFXkCH37RxHFmJSiaVy2Ui6VK
         mYMwc/FRGbnNfj7PRU5MW0b9dSDeLMLN3XtRGgqceHMUOGRmLbhPUbUjHPPlckbID46S
         on3NXStHgJWnKw37h0P7DY1hb/vFW3cmTKTbewPj5UyOVgVztNdKudiJJsULExsKr+rO
         fACg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769537323; x=1770142123; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dOOo8NQ4DafD9XkbSs1ACU0adhfNmtPmDSYYCT0h1M=;
        b=07XIoGWlIyuaxHmzCvhBx2RQLcRXLNUrw8P3Yt3vrACpaB0jObYFwoREGnFGwYCyFb
         GSZcZ8ZzmYBBgeaY2pJYLSuv/gwZ4768HSFavurN7luHms4A9w+wV5KsaRSjXGtE0sRW
         yub2nNCP9+VUXVapxnI9vdt0QOI6lj2Yf6yfRGEkD6YERcS8qWyznxarEcVXOwjQX/2O
         t7E8nB2uVcp2cpYlwlTNt4XZYWDIwJiNM4WriF3TPQnYbn8aDqZmDRuHiI7Te97rod52
         bzU/0U+r9D/3P05LBjxcLYm30FuqmUrbtDifTOYBpTCy5syRuLoiHTPW8PW24pCjEctv
         qqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769537323; x=1770142123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1dOOo8NQ4DafD9XkbSs1ACU0adhfNmtPmDSYYCT0h1M=;
        b=KviKPy4dvdg1ZjoaFwsdpUybNdZ1cNO/U0iZ8BwaK2agNnZ8b8IS+KbgOa0uU+x++2
         V7sPJb/ainewsD3Bkb6XTvbUKzZZ2CrxEgL/HMIODS7T/cm3jeOXnFdHlOUtWol1i3UX
         Oq9cZmd/p6Msr2uMBBQW6CLFYblSLhK59EVDnCvhiigHL98sZwSKE8eIco5W3P1rwNk3
         +By+EQ8pamkGrAbJj0PBflFDKJpOhtbmJ4MQUEGWkmm30SCIRpJDYYFRtKlS9xE3di8l
         BN0iQQUDUIQnP+ouBlfXRwSlN5aKic4CGMBShf40UiGcUZSEvxTEBi6H/s4CUWiRX8z0
         7apw==
X-Forwarded-Encrypted: i=1; AJvYcCX1MKFzWJpuErKpajL9KnUNyMj7iMiDPZ7uho59EJlgTG0n4G4X31Y3UrRm1qM3DGoaLm/1g2GAC/Ma@vger.kernel.org
X-Gm-Message-State: AOJu0YwNtzQoZbTT80i12qy08wu9kC4Qsc7E8hqMZZAu9DM9xlMWLL5d
	bxr52sXFkT9NeMGAIpQ+zak3kTRInyicdjuMu3TUeYNUqiw9U2nxLbArzNZ2ATZHDZkCIBb4gj5
	KvpnMU9vvix/T8a/UWFx0VLGcASWOFk/h0i9C9CeK
X-Gm-Gg: AZuq6aLM1rhBkrp4OLq9EhYRe3CxFjl3ZoiHrP8yThH/QHk6K9ds3cUGgpOK4lg+HIa
	qINp/GsdY95P7u71rE62D5+Q1ToxDPWgWY3Ohf7q9Tkj4VvjbrW2NO2Im10XVU1frLcSXRu7Efh
	+8jtm3zH4cSd3FchU5k523V34WMWgtJjfUzT5BBr20+8ktdddqk6ryew2INwokPTQIpIvmj3FEh
	ISbQPkX/G4UBOfBoBwCWHmNJUrPIrYIZgU+V2gbxCvba56S59PgFHSy+MoXCwvOuBNoHx9QltI+
	aUjV9qvfT8HnEDjOn99s7AxD
X-Received: by 2002:a17:902:d583:b0:2a7:6fd3:c11e with SMTP id
 d9443c01a7336-2a870b4f72fmr2715565ad.18.1769537323122; Tue, 27 Jan 2026
 10:08:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260117052849.2205545-23-irogers@google.com> <20260127174253.396766-1-serhei@serhei.io>
In-Reply-To: <20260127174253.396766-1-serhei@serhei.io>
From: Ian Rogers <irogers@google.com>
Date: Tue, 27 Jan 2026 10:08:30 -0800
X-Gm-Features: AZwV_QjigoQ4qTMNcTX7ebCm7Qdj2jAHNjthD9J6xiq7M99DqRJBY5IBrDFTDXk
Message-ID: <CAP-5=fWFXnmZZ2vh_oJM6PWYiJvOV1Etx1+FLzWQUhv7WYC6jg@mail.gmail.com>
Subject: Re: [PATCH v1 22/23] perf unwind-libdw: Don't discard loaded
 ELF/Dwarf after every unwind
To: Serhei Makarov <serhei@serhei.io>
Cc: acme@kernel.org, aditya.b1@linux.ibm.com, adrian.hunter@intel.com, 
	ak@linux.intel.com, alex@ghiti.fr, aou@eecs.berkeley.edu, 
	atrajeev@linux.ibm.com, ctshao@google.com, dvyukov@google.com, 
	guoren@kernel.org, haibo1.xu@intel.com, howardchu95@gmail.com, 
	james.clark@linaro.org, john.g.garry@oracle.com, jolsa@kernel.org, 
	krzysztof.m.lopatowski@gmail.com, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux@treblig.org, mark@klomp.org, 
	mingo@redhat.com, namhyung@kernel.org, palmer@dabbelt.com, 
	peterz@infradead.org, pjw@kernel.org, shimin.guo@skydio.com, slyich@gmail.com, 
	stephen.s.brennan@oracle.com, thomas.falcon@intel.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 9:43=E2=80=AFAM Serhei Makarov <serhei@serhei.io> w=
rote:
>
> > As removing the dwfl didn't prove possible, an alternative is to just n=
ot discard the dwfl when the unwind ends. The dwfl is valid for a process u=
nless a dso is loaded at the same address as a previous one. So keep the dw=
fl with the maps, invalidate it if a map is removed (in case a new map repl=
aces it) and recycle the dwfl in the unwinding code.
>
> Relevant note:
>
> I'm looking at whether elfutils libdwfl_stacktrace might further help wit=
h these issues. The libdwfl_stacktrace library is currently shipped as an e=
xperimental addon to libdwfl in elfutils 0.194, but I'm intending to stabil=
ize the API this year. There's code for some analogous functions: translati=
ng perf->dwarf register files, and caching Dwfl and Elf data to speed up un=
winding across multiple processes. (Thus, if unwinding a collection of perf=
_events from 16 processes that use libc, we don't need to load the CFI for =
libc.so 16 times.)
>
> I think once I've stabilized the libdwfl_stacktrace API and expanded the =
register support to a larger set of perf-supported architectures, it makes =
sense for me to author a corresponding set of patches for perf. I'll see if=
 it's worth adding more libdwflst functionality to elfutils 0.195 in antici=
pation of this.

Thanks Serhei, this would be really awesome! I've done my best wrt
trying to optimize around libdwfl, but I wasn't able to have a single
dwfl for the addr2line case with a dso and the stack unwinding code.
Just to give too many details :-)

With addr2line we have the dso and an offset into the dso of some
point in code. We want to get the symbol for that address and inline
information. The "bias" notion in dwfl was something of a speed bump
in writing that code and was broken in an early version:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/libdw.c?h=3Dperf-tools-next#n133
Just documenting libdw/libdwfl addresses better to say whether a bias
is or isn't necessary would be useful. Walking the inline information
is also (strangely to me) done outside of libdw, which makes me wonder
about support for things like partial compilation units:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/dwarf-aux.c?h=3Dperf-tools-next#n147

For the unwinding:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/unwind-libdw.c?h=3Dperf-tools-next#n407
I experimented with failing each unwind step so that then I could take
the return PC, make it an offset into a dso and reuse the dso dwfl.
This breaks many asserts in libdwfl and so I gave it up.

There's also the use of a dwfl for type profiling and probes in debuginfo:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/debuginfo.c?h=3Dperf-tools-next#n55

For making the code generic we needed mapping functions between perf
and dwarf numbering, as well as number and string mapping. A problem
with the generic code was that if a register was encoded that libdwfl
didn't support it broke libdwfl. This led to clipping the registers:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/dwarf-regs.c?h=3Dperf-tools-next#n157
but this feels like code that's going to bitrot, cause elfutil version
problems, etc.

Something I noticed is that there was a reduction in crashes from
0.192 to 0.194. I'm a little concerned that people may package perf
without updating elfutils and witness crashes because of these recent
perf changes. Hopefully distributions will move forward to 0.194 asap.

Thanks,
Ian

> -- Serhei Makarov
