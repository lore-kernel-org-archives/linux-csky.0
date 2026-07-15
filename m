Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16767443311
	for <linux-csky@vger.kernel.org>; Wed, 15 Jul 2026 10:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784112025; cv=none; b=ZH8ZHkaHWH43s9sGPsvoka+wWpblXKzFD887hYlcB3W72+5GZsUb6MHf2f72ai/HM60aN8CSwy2K4JiI8wc8zA7B7uRIWYvjD+NCLCDekPKNvei6jWHMnzbee3Nawl2ZaFBtV7aRN9iN/YCZkzv1hGEQvUTsKLKAcIgz0nJmSzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784112025; c=relaxed/simple;
	bh=dYuyA6Dz/ajxhYT4dU+02MPd/j4lWQd1ctOD3UM1CNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lGvdIZul551NT1F57S21dbwjnSllY1+bOyaaxRm+xN8BDjWtapkQmo81MWMeg+l0waV9Ulmxetx5L5v7A9jor0AgIzmmMcm2eNjJ+L+7ef+BoVE0Id8TvIvi6WB6GrXiWHwVt3ItB9CIGApELIiRADGAZJ4m5cmMlfrTQ99drQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c1d487f2cso20472281cf.1
        for <linux-csky@vger.kernel.org>; Wed, 15 Jul 2026 03:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784112023; x=1784716823;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BcTdMoZv6JVy6M/fO3WdP9FofoXGw30zAP9bsFgIqfs=;
        b=EAHQvOfWlo+aqa7v63nWq6U+d63+12AHS/vR6dTQhD17zK6HGEUX6JjdpniB8zDGJA
         08KpT58IWlyOBccFyCOsDbw64GVrfBC2UF4iJXaonWFqXJhHQOZe5zCG9bkEflZOdYM+
         QaHK3EGnABEXKMhdrawIQ3QQuCTadP2/c/ViNNQP4z/6oekbBtA6RfzkPE5d4TNpGGBM
         n9vdeXEoL81tJPw+EI1PXGC2GgH8dQ7/8og7ItUAMaM6HwDDdWGn3r1C6kI/9vQSFCmw
         4+AHv87ZsnFOsBh3otH3JTwLvFtEMvdFXH0VqzwY8/JK1+DZ49Bx6dlnMRw3x+Eh5dPY
         DtIg==
X-Forwarded-Encrypted: i=1; AHgh+RqwQ4jTlY2DIP29ETww4upw2wY+GX1Apm8PSHJGZX9AVx+rlaxyV1khR/q2wEyirEBM++PEQkk4Jg+Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwID1R8sXUJgNLNvXIeZMR/khs462Vo+CEYGUEqpY7hd7K8Yjs6
	ZDwdRSGgiQ3heWw8C5+EoGjb4MDLLRyqaagZJBcda7lAcL12Z3JR4xEFFcGK/Ds/aM8=
X-Gm-Gg: AfdE7cnSMZAoaWQnIULbQKWqm8vYDiDPhjOT+LS6XHwQJQdmZtgBMT36Me3xUGg4NQh
	wgOUVfDgReGD2VgiZNj+o/rJy+P1EZjJ0v7AGZU77qEfMz2zX89bcTcBQnrDvQ9fd28fNgtuTZi
	eaImX5JbdUAHwsroeRA8atyT3avCI9njDr0xv3OggDhLVgYOIzWfPLGSj+pyjPDrkdhJGmLdYW3
	K90CawowX7o7QE7T3lJZ9NTdWcIve3lrwYvEv53AXWwlpvQvUU36KXW3ArfQTWvP8B1uVM/NfJK
	bwziRvh/++dpnbQ621LkeC2qHnUFFTh/594Mrb2eZ8aIHqps69y5MlHzxZbe6UwiR9Ny7M1L1QZ
	XriZO2ef6GP1ljd9WAfs4hbV+IttrPu1jr5+J6TJfsMR8YJR9AS+UW+YCnGOWVxop+EmwVlMXgI
	Gl9JvIb89n2EqfIQWqE80b+m/XJSve2pncd2OlI3/oiLPwlYMON/NwUA==
X-Received: by 2002:a05:622a:1115:b0:519:5680:1b5 with SMTP id d75a77b69052e-51cbf145f56mr165948901cf.21.1784112022776;
        Wed, 15 Jul 2026 03:40:22 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com. [209.85.160.180])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caacdacf7sm135639641cf.11.2026.07.15.03.40.22
        for <linux-csky@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:40:22 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51c1d487f2cso20472131cf.1
        for <linux-csky@vger.kernel.org>; Wed, 15 Jul 2026 03:40:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rps/YXKPblGlT8raq9yrInOx7gEm2BCGpnXHt6qf9Hd7EknNf0Y8SssAJTt2FAYe5kZHyNOOfsdQ3mx@vger.kernel.org
X-Received: by 2002:a05:6102:94c:b0:730:db02:1d08 with SMTP id
 ada2fe7eead31-74533c1eae8mr11245328137.10.1784111681255; Wed, 15 Jul 2026
 03:34:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3ea30f8a-bb29-4bf5-8400-1c4840d46a88@kernel.org>
 <7e84b200-25eb-43a6-b5e2-5f27f2d82a77@intel.com> <31988089-095a-4eed-b5e2-c677c70f79f6@kernel.org>
 <14e250db-1641-4085-8d13-02f819657d5f@intel.com> <d83c76b3-ea4d-4c41-b4c5-f5ae558ace55@kernel.org>
 <alYgMxKqRnF6_X0A@e129823.arm.com> <6df814c9-405c-48d8-96ea-929c4b28949b@intel.com>
 <alZe-Cu7yQw9qRXU@e129823.arm.com> <alZo9feSrSB_StfO@e129823.arm.com>
 <CAMuHMdUqL=vJFAzYgcRVNbD_VWWwhehwTuhTfwLt_yRR8c+B0g@mail.gmail.com> <aldV23PwIXnFloaN@e129823.arm.com>
In-Reply-To: <aldV23PwIXnFloaN@e129823.arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jul 2026 12:34:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOHm6MmP9QsNVvxLsGp1e0jC9u9RGb6+xee0ZBs4Zwfw@mail.gmail.com>
X-Gm-Features: AUfX_mxU0lxjO-fzCeQeNX344H_SVkvovWXaE8EEgaGKFYO5e9NLd2LkTofC79k
Message-ID: <CAMuHMdVOHm6MmP9QsNVvxLsGp1e0jC9u9RGb6+xee0ZBs4Zwfw@mail.gmail.com>
Subject: Re: [RFC PATCH 10/34] x86: mm: carve out the generic compile-time
 folded pgtable case in effective_prot()
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Dave Hansen <dave.hansen@intel.com>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-arch@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org, 
	kasan-dev@googlegroups.com, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org, 
	linux@armlinux.org.uk, akpm@linux-foundation.org, ankur.a.arora@oracle.com, 
	rppt@kernel.org, linmag7@gmail.com, chleroy@kernel.org, klarasmodin@gmail.com, 
	chenhuacai@kernel.org, kernel@xen0n.name, kas@kernel.org, 
	zhangtianyang@loongson.cn, wangyuli@aosc.io, tsbogend@alpha.franken.de, 
	ljs@kernel.org, jgg@ziepe.ca, catalin.marinas@arm.com, will@kernel.org, 
	arnd@arndb.de, ryan.roberts@arm.com, pasha.tatashin@soleen.com, 
	rmclure@linux.ibm.com, baolin.wang@linux.alibaba.com, tj@kernel.org, 
	kevin.brodsky@arm.com, anup@brainfault.org, atish.patra@linux.dev, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, 
	hannes@cmpxchg.org, mhocko@kernel.org, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, kasong@tencent.com, baohua@kernel.org, 
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, 
	ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com, 
	dvyukov@google.com, vincenzo.frascino@arm.com, anshuman.khandual@arm.com, 
	yang@os.amperecomputing.com, chaitanyas.prakash@arm.com, ardb@kernel.org, 
	guoren@kernel.org, yang.li85200@gmail.com, viro@zeniv.linux.org.uk, 
	dinguyen@kernel.org, schuster.simon@siemens-energy.com, 
	wangruikang@iscas.ac.cn, junhui.liu@pigmoral.tech, muchun.song@linux.dev, 
	vishal.moola@gmail.com, namcao@linutronix.de, pavel@kernel.org, 
	djbw@kernel.org, yu-cheng.yu@intel.com, baolu.lu@linux.intel.com, 
	Jonathan.Cameron@huawei.com, coxu@redhat.com, andreas@gaisler.com, 
	liam@infradead.org, vbabka@kernel.org, surenb@google.com, mhocko@suse.com, 
	shorne@gmail.com, jonas@southpole.se, stefan.kristiansson@saunalahti.fi
Content-Type: text/plain; charset="UTF-8"

Hi Yeoreum,

On Wed, 15 Jul 2026 at 11:42, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> > On Tue, 14 Jul 2026 at 18:51, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> > > --- a/mm/ptdump.c
> > > +++ b/mm/ptdump.c
> > > @@ -190,6 +190,23 @@ void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd)
> > >         st->note_page_flush(st);
> > >  }
> > >
> > > +bool pdtump_pt_level_first(struct mm_struct *mm, int level)
> > > +{
> > > +       if (!mm || level > CONFIG_PGTABLE_LEVELS)
> > > +               return false;
> > > +
> > > +       if (mm_pmd_folded(mm) && level == 3)
> > > +               return true;
> > > +       if (mm_pud_folded(mm) && level == 2)
> > > +               return true;
> > > +       if (mm_p4d_folded(mm) && level == 1)
> > > +               return true;
> >
> > Is this order (... && level == ...) the optimal order?
> > On arm64, mm_pud_folded() and mm_p4d_folded() perform several checks.
> >
> > > +       if (level == 0)
> > > +               return true;
> > > +
> > > +       return false;
> > > +}
>
> It is. since the purpose of ptdump_pt_level_first is designed to be used
> in the *callback* of pXd_entry(). IOW, if we check level 0 first,
> it always returns wrong return in folded case.

I meant the order inside the if () conditions.
E.g.
"if (mm_pud_folded(mm) && level == 2)" does the expensive check first.
"if (level == 2 && mm_pud_folded(mm))" does the cheap check first.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
