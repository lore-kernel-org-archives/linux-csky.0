Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E432C3257
	for <linux-csky@vger.kernel.org>; Tue, 11 Aug 2026 06:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786431000; cv=none; b=MhBXAMsBKCMR80pinUNyizBKvM/MRolXHxuf5TW3T9lN4SAMdUq88qj4R6y9CPiyml1SyxTs4mMp1zCr4T2KrDXN+KcaEsF04fkMOZY7PrVk+l+WfWp2BlEseLOzb0sFGOeQ6z9EEsYxZZ1i0t71FtVHhVmPtA/lri2rARKkHy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786431000; c=relaxed/simple;
	bh=tZZLV6eyiwcGv5N3oyI6rD0AMUqGK1dWtQ5SUdhqr2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GK/MZnPeVD/96lMdSyqQXtjpFBzHC+GN03fvSQEceMqVCTHW2ZtLccTSc0XkbUcbnI6ZI2hXX4VHCNVdYAGtiVfJ4XefAPF3kJYBK95t2JiFAhl1BP6I1NZmPgGsJp1rBpO5t3aQW90s5evIeBrPtIMbJiutZf9Y2IWjeUhenLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-979fd43810dso474158241.1
        for <linux-csky@vger.kernel.org>; Mon, 10 Aug 2026 23:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786430996; x=1787035796;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0iZRfAdzYvTsaTTh/J3ab87cNtJMKi7JiQC3Jqumorg=;
        b=X99CYf2WFhaNGIMAvZZlr/nlHgZxKH26L2r/hPp0COlWVOJ5td1xCZFO2b6iFlXKwf
         MWLi2+3QbkxjzxHOEksGEDd4YCzPiwY7OWdNPY5Vg2JRLHjs2/LfHJK4u0ZAjOiys6Cw
         arFRyO8gXPlbsWZUAnu7h2IQ0X96qvmWfVW14Z0VBZ9phOfLku9XywuF8ME2NzQ4sL1r
         y+JeaifKRyFJ4AWhs9M+eCrWpOu+tye2zsoUVhk/BKtEb60zQfQ2fOfPFmR6MiTB4cHg
         n+Tx1QHn+Gk8soZ8ig+zC3YD315FBowxoFiKxWpA4KvYVnbimthEQK7dfgoIdn+hevi+
         Q1BQ==
X-Forwarded-Encrypted: i=1; AHgh+Rop0hdUS9hXdOs2cHK4dOjkWgOBwi3V0gTLNu0k4L2BdON+StMupy2c/BAPZSiscOQ5pObVudjcnGR7@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyve74LRPTiiZFvg+vyLvoVjXljCZiKWY+LMZiHhJfUY7rgQhK
	yy/kdbhh1xbvFD8LuIR1xbqR3b+MS56liOQpOqutGAQpTtUnW7sUM789Pj9z/MQt
X-Gm-Gg: AR+sD12EJJEi3dR5graXThzGTJmeew0JBZkEBBEFxVkr+r9XmSDCEAzYFKiUfdxotf5
	MZc8tag0iI8/GOzaWY9ZXXzHWtwEb3qIovD6T3NR6C18wMMpFLoYVVFHoiun93v2ixOXiRTRREC
	cd3EPrOsWgUY2KdUh11D6piUCPA5AUNUFF7F9XwgWLUvIeaeFFqi/IK4OiGeH5bLeLKlLm8vezZ
	pbdDkCxfjmYXDX4Te0UrGcK7opYrgJIwBmhiZdDuWrdRKp9QQ8sXYSJngGNBPPlyoFQF8p+/7iw
	Sw0ZdRRxF89JSO3NtBGOCdHJse+5vyFoFe7M3ICvERpafXbn84bD2huDHhA9o8Nzo9ckP5hI85F
	FVpdK9qsH87iOOM7ZYDaeU1aQ9YmcVjZKrM5m/aZ1r1tiwts3u/E6BKZ/BMTASulbQn6z3yxRYy
	9rb91A3KzfBLp5glWwT7smI45tTyYUh4jND9295cx235MCyEhvkMjQWH5Ac4+grT4XYRd0K3uQN
	XxCXNMWhZzqMow/iUkah/cnfw==
X-Received: by 2002:a05:6102:f95:b0:737:4cac:52f8 with SMTP id ada2fe7eead31-76b54f87261mr306538137.4.1786430995932;
        Mon, 10 Aug 2026 23:49:55 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76b655b8285sm186985137.9.2026.08.10.23.49.55
        for <linux-csky@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 23:49:55 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-74ac3ea9c60so675599137.1
        for <linux-csky@vger.kernel.org>; Mon, 10 Aug 2026 23:49:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoIYzKBDdYU+jLw8nLmlyzRUySSHHkRV2GnpVeW4XsilrgNLN7x+WBKUeGz1aXijwWPue+Nif4+bUVO@vger.kernel.org
X-Received: by 2002:a05:6102:c4a:b0:738:ecd7:1984 with SMTP id
 ada2fe7eead31-76b54a7a17fmr283026137.3.1786430995503; Mon, 10 Aug 2026
 23:49:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811042119.3652929-1-anshuman.khandual@arm.com> <20260811042119.3652929-7-anshuman.khandual@arm.com>
In-Reply-To: <20260811042119.3652929-7-anshuman.khandual@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Aug 2026 08:49:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXfpkpYzZWGVb0fQrdn3uYHU3pyCkyAX9o2ux_Jj=2ByA@mail.gmail.com>
X-Gm-Features: AUfX_mwgji-OqM2d70As4nCfmG84npBMa5IuhuEcV5XEKzcXYS3fe_Pqx16lD20
Message-ID: <CAMuHMdXfpkpYzZWGVb0fQrdn3uYHU3pyCkyAX9o2ux_Jj=2ByA@mail.gmail.com>
Subject: Re: [RFC V2 6/6] mm: Drop pxd_ERROR()
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, david@kernel.org, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Anshuman,

Thanks for your patch!

On Tue, 11 Aug 2026 at 06:22, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
> pxd_ERROR() has been used in generic mm just to print the page table entry
> in pxd_clear_bad() before clearing those out with pxd_clear() later. These
> pxd_ERROR() macros have been provided by all platforms which basically did
> the same thing.
>
> Make pxd_clear_bad() use recently added ptval_to_str() instead for printing
> page table entries thus completely dropping dependency on platform provided
> pxd_ERROR() macros which can then be dropped off. First move all required
> helpers in core MM into a header file which could then be used else where.

Oh, the "x" in "pxd" is a wildcard?
Except that is not, as it does not match "pte" ;-)

> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

>  arch/m68k/include/asm/mcf_pgtable.h           |  6 ---
>  arch/m68k/include/asm/motorola_pgtable.h      |  8 ----
>  arch/m68k/include/asm/sun3_pgtable.h          |  7 ----

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
