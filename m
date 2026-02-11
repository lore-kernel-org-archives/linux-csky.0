Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339DA356A2D
	for <linux-csky@vger.kernel.org>; Wed, 11 Feb 2026 20:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770840874; cv=pass; b=aafJ+RSDqvhkzNYX69MxahPi8zvpUhbYGFLcus1UnxFqNMDzmM61iB+lcRJNJlXAxMMrg04dYlNfiF0UaUc4kB8ShvYKGYGvODhruuo6G15KnLNhdFSRgIfDJET+vkIEdVJfNMBHlYOPNe0XMbwzLJau9O3IPOscQ4R+M/8fF04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770840874; c=relaxed/simple;
	bh=XTU0SZsxOmJ3FoM/DLxyJrm+s5UGvDwm08Uhn3BjVVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WJzoftSCTuqK4OcmIZC4C9JYELXlr9nWh9t/Zvb+2eorOK4mCZHdoWWm+I9iy8B1dtBGDRv9HeFN1//9JI+FzLG5NFp2RkKxsX9tvp8CPji2sNqxk+4yS4c7ohoGVrn60IbgBkZjx0fc8bMcHfdNjQgQl9HOTT7M1tI2QwIiK18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+BZmpwx; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+BZmpwx"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-65815ec51d3so9080294a12.2
        for <linux-csky@vger.kernel.org>; Wed, 11 Feb 2026 12:14:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770840872; cv=none;
        d=google.com; s=arc-20240605;
        b=E4I1Ak9Ea1yL6iPppu2snZLPXC8BBxdXW1O7x96PY/h+jVFZGVa+3ZGcB5tICTa7nc
         SoyDfFx13v/mPVJWX/VMqrJ3DW9VUM8bBD14jN8a5Im8zaIodC11LV3do66h6Novee9m
         /Ui2q4d67fglrfZbzJv0jF/Wws3gBm/JEGqVYG2m3q5d+5atiy8/ZrN+y/a0/c2CRety
         P/Ioo8pPPAb2AQ2y9kdo96Vzb6aDhSMxo0tynCwOuj+Y2qTo6RGJ2ax38v1wBZgsMqWM
         /WW2+cFiWuFXpo2oPAQxz95vMd3F1laatlTk11VynQB2HbKTmH/AFfesDfuRXSWD1HUh
         bJfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=28hr9LjidhOb4+7vDtUZiT7dYr2nuAMqMlceW5mXuOg=;
        fh=0D/tUpd+W09Vy7onYkxZo6g5zpQjWc/3pw/rG5k/mUw=;
        b=VxC56ymY/DFMQp+Q1rzDMSpn3Zfdz2YaOwz/ssRRwKgoFUI6MDnfPPrnS/GvfLmHEU
         +QxZPbSH3/ablqpyC8C1FiccCcnmzjQRG6pMxKGzB/pRLcpK+TzctDAPYnJZwcRUFf6U
         lYgZJw+uAc3ZNAJtwQfz3ONhXg4kgNBFkwTtoFNWqBgtm5c7FRKiv9kIJTOGU3EXawpc
         0x/jbywV5fP0ie7Z55CFKPLs5d86kOxg0JnAswBCkV5FIh6gcSgxRysqrPwLtFgMXpfZ
         yya/7KFW0z4s6ZcHSgfQTemu5DqvZZkH7dFtzdV8LjBXeXm/WW6lQvSzKAQLet6cA5Ea
         iQoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770840872; x=1771445672; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28hr9LjidhOb4+7vDtUZiT7dYr2nuAMqMlceW5mXuOg=;
        b=U+BZmpwxb0B+eJodBh5iYdwN9Lzp7irxUy8fs3NOdprJYIHxQZLf/1DzGuf6k2n3yz
         Bqv+t2b1ZZRzIznR4S0yQr7i2zx3aJqBieQ1f86k9HMjZFj/dfEHLBDtaTstMxv7EWQp
         YR9FxsBl0x40sGnnEMgNJdk0CxJBPCHqbOMyVk+DgEw5LuRp1PdLZs4NxAuyIfavGkqE
         LFRnlEdLPJoEs/JMEJ/a1hofx+sOOfaNGsIheA42ud+8y1lVeOPJX3kdVH82vSf/u/+k
         zej+c/QXWftNS1FLxD0wQx3seCFayTJlg1jmS/KXwiF3nbQTYjzTTR1tNBX14sdhNgpO
         QKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770840872; x=1771445672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=28hr9LjidhOb4+7vDtUZiT7dYr2nuAMqMlceW5mXuOg=;
        b=eUwb5PwLuxdRuLgoFcrRf523YrF8vSzWii45ft3YElbM53TEbD9udRz6h8XZwCGL9a
         weQUaqZZm+KivrzotMgJLqAL2DNXApx+So5cjSeKriUKS4yGmbsfdc4oIc+F9vq/W72R
         lZw8LJ2NSmSqNYp6xLBel2utAMGNaS4MAflIgmbxhkuje46NKyjERqX3sNcynI5dPkqx
         xwUuNFTZFtGllFlwuQZtyBgBWK2g3xv2CC41J1MmXFcx03A/lCQtZbG0z7PNOsnEOIPR
         s9JqyySFqKiOuNhFLKTREizwqF2YmpMxb8M6NkoTK4nu1AOMKqVvzht/a/tnnlDvzhvl
         7j7g==
X-Forwarded-Encrypted: i=1; AJvYcCWxoXBTJiZVrLZ+KQXfQkW3EDxh8xrepPSucZ3T8oKl8dp/vlld+Lb9lqP9U98Y4eo+2B7Bf3OQ7DjQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyiUx2eBaZQqzD/ijgOryenZfCHD2a0ZgUfW+HbCAZeNnpukk28
	b48MOiKN/TzaE+0pZoqIQUS6oJP7SuGQD7ojQ62FSFa0L9084kVcSPoEFGmMrpTLpjrz0Z0BeyB
	SmG63O1LGNn82pWEnNq/syBOk5BUrpn0=
X-Gm-Gg: AZuq6aIgINJ5FUNxkcfiqZE1vTSEO3n/3qiVGdcVHjRdUUpedzZfGd60JumUM/sUmlM
	keR3SoynzWJB8Y6kO6m2wCUHRy8FTAgBKceJKJ37evyPaXjaUctjWftYDATsmHgFTfFqbmSSSIe
	5PxljD01EgTcXmyhIodAWRbd470Xgapi/Qb8A6HadZf633W0a5rcqqegekKFgKjBeOGh9sulIvM
	/KT6KLFGjT1p07yci3yZO2bydoJsyxCOMgbtp1pgSiJ7V7z0fSQTF5jeGfvf3QQticmYmS43yZl
	JRdQzoSbpED/j2wNLeo042+u1ixInKwk3UtO5zTD/Q==
X-Received: by 2002:a17:907:a08a:b0:b8e:64e:1ed with SMTP id
 a640c23a62f3a-b8f8f72d91emr17643566b.50.1770840871149; Wed, 11 Feb 2026
 12:14:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211103141.3215197-1-rppt@kernel.org> <20260211103141.3215197-4-rppt@kernel.org>
In-Reply-To: <20260211103141.3215197-4-rppt@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 11 Feb 2026 21:14:19 +0100
X-Gm-Features: AZwV_QgdPAvH3hw0825YIt93LQPupYFvh_AV-2zMkwGhubC87cSa2iVxpdoZwag
Message-ID: <CA+=Fv5T07oBJweU3tURD4Nuh7VRWovsf0zjHtA1nDAVNmO=D2w@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arch, mm: consolidate empty_zero_page
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andreas Larsson <andreas@gaisler.com>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@kernel.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, 
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>, 
	Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, Vineet Gupta <vgupta@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2026 at 11:32=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wr=
ote:
>
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Reduce 22 declarations of empty_zero_page to 3 and 23 declarations of
> ZERO_PAGE() to 4.
>
> Every architecture defines empty_zero_page that way or another, but for t=
he
> most of them it is always a page aligned page in BSS and most definitions
> of ZERO_PAGE do virt_to_page(empty_zero_page).
>
> Move Linus vetted x86 definition of empty_zero_page and ZERO_PAGE() to th=
e
> core MM and drop these definitions in architectures that do not implement
> colored zero page (MIPS and s390).
>
> ZERO_PAGE() remains a macro because turning it to a wrapper for a static
> inline causes severe pain in header dependencies.
>
> For the most part the change is mechanical, with these being noteworthy:
>
> * alpha: aliased empty_zero_page with ZERO_PGE that was also used for boo=
t
>   parameters. Switching to a generic empty_zero_page removes the aliasing
>   and keeps ZERO_PGE for boot parameters only
> * arm64: uses __pa_symbol() in ZERO_PAGE() so that definition of
>   ZERO_PAGE() is kept intact.
> * m68k/parisc/um: allocated empty_zero_page from memblock,
>   although they do not support zero page coloring and having it in BSS
>   will work fine.
> * sparc64 can have empty_zero_page in BSS rather allocate it, but it
>   can't use virt_to_page() for BSS. Keep it's definition of ZERO_PAGE()
>   but instead of allocating it, make mem_map_zero point to
>   empty_zero_page.
> * sh: used empty_zero_page for boot parameters at the very early boot.
>   Rename the parameters page to boot_params_page and let sh use the gener=
ic
>   empty_zero_page.
> * hexagon: had an amusing comment about empty_zero_page
>
>         /* A handy thing to have if one has the RAM. Declared in head.S *=
/
>
>   that unfortunately had to go :)
>
> Acked-by: Helge Deller <deller@gmx.de>   # parisc
> Tested-by: Helge Deller <deller@gmx.de>  # parisc
> Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/alpha/include/asm/pgtable.h          |  6 ------

> diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pg=
table.h
> index 90e7a9539102..12a3c5f8ece8 100644
> --- a/arch/alpha/include/asm/pgtable.h
> +++ b/arch/alpha/include/asm/pgtable.h
> @@ -125,12 +125,6 @@ struct vm_area_struct;
>   */
>  #define pgprot_noncached(prot) (prot)
>
> -/*
> - * ZERO_PAGE is a global shared page that is always zero:  used
> - * for zero-mapped memory areas etc..
> - */
> -#define ZERO_PAGE(vaddr)       (virt_to_page(ZERO_PGE))
> -
>  /*
>   * On certain platforms whose physical address space can overlap KSEG,
>   * namely EV6 and above, we must re-twiddle the physaddr to restore the

This looks good from an Alpha perspective

Acked-by: Magnus Lindholm <linmag7@gmail.com>
