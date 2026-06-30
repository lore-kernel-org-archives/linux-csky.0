Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8CC3D666A
	for <linux-csky@vger.kernel.org>; Tue, 30 Jun 2026 03:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782788792; cv=none; b=gWGsC7/5Uu6ihi8JqhRVra+YDse4kZlOXgQGGnD9uwK/nII8snYYgITJ2VpBZ1DmR8uFzQsWtgsPn1msdB/0PTRsXsPIqJsbPgPfXNBMpKtwF3nVFuGiLJGwhegebCK5SVsBi5E0Cy4c9VAfzbEdevn/DtFP8vMBJ349tPxhavU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782788792; c=relaxed/simple;
	bh=mR8DP2XZ/1StzxeHsy2i3aZNjuZlRnSSuFmoACgUkak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A1lMq9PdpKkQ6w5iFMO7ReGPXUJzfb9C2rZzBe3KYbGrrtbNWYiEFzKhwgDKO3grORTPvCgcXLTfEf7dPx1CiW6eSolQpZP5opIOZ1ErSRHmxGhJ7IFzgjjdW6mMLRgf/chacERbcnJc5JqfSZMvBVua2Tp4E7FcwQAoOKodY6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2zLVume; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2zLVume"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E85681F00A3D
	for <linux-csky@vger.kernel.org>; Tue, 30 Jun 2026 03:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782788781;
	bh=fzAepXvhPnU3RVO1srqzjPmRiEpd6yJalacgOF/VkH0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=U2zLVumemi5RyKZ/Er4lX1JcPSmWBY8+0UgYwin5Bay4lHHKvQp1iISEIp61FMlc7
	 tmjtG1H8ddTlX55LyydEVW1W3bIrXqoaqVFBBE0Wj9o+hsbRNKHPichpVAF13NcDFd
	 XaG+g/wwrXs5f370g1M+N/X1iN3J4JHgpcuw0ja7ON8RLFxagyt8D+6KeDyPfTWHrF
	 MxeeX/+Jah0pEhVsAhwBD5vTC3O5hYwy1CqigQPQsAx1PhH5hcwdMghsqTvTsg4/E/
	 mzCKcooz9M55dBb06apUrAwo1YVjZXlxokWiv/paEXPEVBc6FtX1L0f3vfp8D0QMzA
	 9/QOejrPJUqBQ==
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47231f1f8f3so3191163f8f.1
        for <linux-csky@vger.kernel.org>; Mon, 29 Jun 2026 20:06:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoJr7v4d+Nv3fWltYo6vLg7BXgHBKCXxrlHTOfNJ1weqFZS/oTxteeqFfFk8qwKc/ugDgFXm3RGep1s@vger.kernel.org
X-Gm-Message-State: AOJu0YytVYX9sqFx8Q0vt7QKEObL2KvT7LU0mm/FZgZCSueJ97zUtwgD
	IIxwsVx7dPW5a2/CxvspKGliYDN65FUxIV6BjQhwcPY7p2UX+44MaCdwIaqssUJrRGkP/3zCHM9
	IsgygSGGul8bjdFTKwBYbjCkEXbDDfl8=
X-Received: by 2002:a05:6000:3110:b0:475:806:c5e8 with SMTP id
 ffacd0b85a97d-475506e972cmr2367506f8f.9.1782788780671; Mon, 29 Jun 2026
 20:06:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202606291606.9h8aGniQ-lkp@intel.com> <20260629171909.1d6e96dd15a80b8f463bb68a@linux-foundation.org>
In-Reply-To: <20260629171909.1d6e96dd15a80b8f463bb68a@linux-foundation.org>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 30 Jun 2026 11:06:08 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT+Pz51u2ckYQGye_TNbfbvHHiEHb0Ned-k0MFCe4vgEg@mail.gmail.com>
X-Gm-Features: AVVi8CfpjiHAZxpIu9w2olplIGKjchfQBEYO-NTXILWsnMIEoAgT2ud8VKG7C3U
Message-ID: <CAJF2gTT+Pz51u2ckYQGye_TNbfbvHHiEHb0Ned-k0MFCe4vgEg@mail.gmail.com>
Subject: Re: [akpm-mm:mm-new 59/142] mm/vmalloc.c:3590:23: warning: unused
 variable 'start'
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, "Barry Song (Xiaomi)" <baohua@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	David Hildenbrand <david@kernel.org>, Linux Memory Management List <linux-mm@kvack.org>, mm-commits@vger.kernel.org, 
	Dev Jain <dev.jain@arm.com>, Wen Jiang <jiangwen6@xiaomi.com>, linux-csky@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 8:19=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Mon, 29 Jun 2026 16:58:34 +0800 kernel test robot <lkp@intel.com> wrot=
e:
>
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-=
new
> > head:   88cefc306c43b58d9bb65c9e96e284306710d961
> > commit: 80c453511b6ee1af0e4db83c3db0020215c4eaf0 [59/142] mm/vmalloc: m=
ap contiguous pages in batches for vmap() if possible
> > config: csky-allnoconfig (https://download.01.org/0day-ci/archive/20260=
629/202606291606.9h8aGniQ-lkp@intel.com/config)
> > compiler: csky-linux-gcc (GCC) 16.1.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260629/202606291606.9h8aGniQ-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202606291606.9h8aGniQ-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >    mm/vmalloc.c: In function 'vmap_batched':
> > >> mm/vmalloc.c:3590:23: warning: unused variable 'start' [-Wunused-var=
iable]
> >     3590 |         unsigned long start =3D addr, map_addr =3D addr;
> >          |                       ^~~~~
>
> Sigh.
>
>         unsigned long start =3D addr, map_addr =3D addr;
>         ...
>         flush_cache_vmap(start, end);
>
> See, this is our punishment for writing kernel code in CPP rather than
> in C.
>
> I'll queue (and test) the below.  It should be OK -
> arch/csky/abiv1/inc/abi/cacheflush.h directly includes asm/cache.h
> which declares cache_wbinv_all().
>
>
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: csky: implement flush_cache_vmap() in C
> Date: Mon Jun 29 05:07:51 PM PDT 2026
>
> To avoid getting an unused-var warning from
>
>         unsigned long start =3D something;
>         ...
>         flush_cache_vmap(start, ...);
>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Andrew Donnellan <ajd@linux.ibm.com>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: "Barry Song (Xiaomi)" <baohua@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Dev Jain <dev.jain@arm.com>
> Cc: Leo Yan <leo.yan@arm.com>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Uladzislau Rezki <urezki@gmail.com>
> Cc: Wen Jiang <jiangwen6@xiaomi.com>
> Cc: Wen Jiang <jiangwenxiaomi@gmail.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
>
>  arch/csky/abiv1/inc/abi/cacheflush.h |    7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> --- a/arch/csky/abiv1/inc/abi/cacheflush.h~csky-implement-flush_cache_vma=
p-in-c
> +++ a/arch/csky/abiv1/inc/abi/cacheflush.h
> @@ -42,7 +42,12 @@ static inline void flush_anon_page(struc
>   * Use cache_wbinv_all() here and need to be improved in future.
>   */
>  extern void flush_cache_range(struct vm_area_struct *vma, unsigned long =
start, unsigned long end);
> -#define flush_cache_vmap(start, end)           cache_wbinv_all()
> +
> +static inline void flush_cache_vmap(unsigned long start, unsigned long e=
nd)
> +{
> +       cache_wbinv_all();
> +}
> +
Thx for the fixup.

Reviewed-by: Guo Ren <guoren@kernel.org>

--=20
Best Regards
 Guo Ren
