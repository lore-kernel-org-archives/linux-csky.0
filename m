Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9697949B1F0;
	Tue,  6 Oct 2026 15:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791301455; cv=none; b=rvnCGMTyXTSfSXmShIY0qV/Nt0Kz5MYyHLJkmY9dgeVIanZxGqwinw3UFGPVLp0hR7MsvBnb+f4jApbxsr2fgkKo8SXRGrNspzBcpVA6usa8Gk7AmgeVhH9JjaHEHPuUFh/ougGtEKhCE614+6UxHvySPOaQjjKzbmVioRqyaB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791301455; c=relaxed/simple;
	bh=pADMW7DfkNoxo1ip2jKe3XqV0+n7swEMSzwgVIHkhRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bRzxrAeUtmaI9USaNbDmxAul0/hj3FIW2V/TGdNqegccBMFfIc6hLhABeAWfqOgr0XdAf0NJbz7xJ0Lb1oalLcWpnYou3a4cfovrzlh0DH0tQcpbfuQps32+1JRcR252JPLJpDcxdBLkugshhJdqiq5irCti4REXpFyuhbVtFiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1o9LzMZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1o9LzMZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 282771F0089B;
	Tue,  6 Oct 2026 15:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791301454;
	bh=mUrWQujljsMH/p/9Y5XMz/o7VHMyGKrumRnHLYhjLPQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=d1o9LzMZti0vMOfKz36Pg22wT2Jf6eXrxj6erZQKijnoy7IjyPP6zDnSOpXv91H0/
	 mI6nE6c/oDZXsfLA622qmVLRIASS2a0U85wOoHPBJ7tYP3x/Gy+uwkAurHy5JzYkce
	 4B1+Tr3zAA0wRUEOmPlOb7Fu7Q3s2TebB0tBmbIwHN0jXHBpOOZ0o8brmWfv93S2kQ
	 4vWpoKZIA+Lepa7w6ufuuy62yuwtRtWwUUAks9gbPWmtp6GjV3xlSe3aFPboP0UseB
	 8EdH88XHIs6hj4h5hg9a+j6FjlNQtnni2v/do3b44edYczxieNGMZj/TRabVuJv9Ch
	 OB48m0wsb9qHw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id C9F51CE0ACB; Tue,  6 Oct 2026 08:44:13 -0700 (PDT)
Date: Tue, 6 Oct 2026 08:44:13 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Bradley Morgan <brads@mainlining.org>, akpm@linux-foundation.org,
	vgupta@kernel.org, guoren@kernel.org, chris@zankel.net,
	jcmvbkbc@gmail.com, oe-kbuild-all@lists.linux.dev, arnd@arndb.de,
	david.laight.linux@gmail.com, glaubitz@physik.fu-berlin.de,
	ysato@users.sourceforge.jp, dalias@libc.org,
	linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] xtensa: Emulate two-byte cmpxchg
Message-ID: <82aad69a-603c-41cd-876d-09772a1a7e6a@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20261005120700.383058-4-brads@mainlining.org>
 <202610061704.rvbolgPy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610061704.rvbolgPy-lkp@intel.com>

On Tue, Oct 06, 2026 at 05:54:53PM +0800, kernel test robot wrote:
> Hi Bradley,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on akpm-mm/mm-everything]
> [also build test ERROR on vgupta-arc/for-curr jcmvbkbc-xtensa/xtensa-for-next linus/master v7.3-rc6 next-20261005]
> [cannot apply to vgupta-arc/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Bradley-Morgan/ARC-Emulate-two-byte-cmpxchg/20261005-120658
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20261005120700.383058-4-brads%40mainlining.org
> patch subject: [PATCH v5 3/3] xtensa: Emulate two-byte cmpxchg
> config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20261006/202610061704.rvbolgPy-lkp@intel.com/config)
> compiler: xtensa-linux-gcc (GCC) 16.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061704.rvbolgPy-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610061704.rvbolgPy-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):

These patches need to be applied on top of my -rcu tree's "dev" branch,
which supplies cmpxchg_emu_u16().

Nevertheless, thank you for your testing efforts!

							Thanx, Paul

>    In file included from arch/xtensa/include/asm/atomic.h:19,
>                     from include/linux/atomic.h:7,
>                     from include/asm-generic/bitops/atomic.h:5,
>                     from arch/xtensa/include/asm/bitops.h:192,
>                     from include/linux/bitops.h:67,
>                     from include/linux/log2.h:12,
>                     from kernel/bounds.c:14:
>    arch/xtensa/include/asm/cmpxchg.h: In function '__cmpxchg':
> >> arch/xtensa/include/asm/cmpxchg.h:79:25: error: implicit declaration of function 'cmpxchg_emu_u16'; did you mean 'cmpxchg_emu_u8'? [-Wimplicit-function-declaration]
>       79 |         case 2:  return cmpxchg_emu_u16(ptr, old, new);
>          |                         ^~~~~~~~~~~~~~~
>          |                         cmpxchg_emu_u8
>    make[3]: *** [scripts/Makefile.build:185: kernel/bounds.s] Error 1
>    make[3]: Target 'prepare' not remade because of errors.
>    make[2]: *** [Makefile:1405: prepare0] Error 2
>    make[2]: Target 'prepare' not remade because of errors.
>    make[1]: *** [Makefile:248: __sub-make] Error 2
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:248: __sub-make] Error 2
>    make: Target 'prepare' not remade because of errors.
> 
> 
> vim +79 arch/xtensa/include/asm/cmpxchg.h
> 
>     73	
>     74	static __inline__ unsigned long
>     75	__cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size)
>     76	{
>     77		switch (size) {
>     78		case 1:  return cmpxchg_emu_u8(ptr, old, new);
>   > 79		case 2:  return cmpxchg_emu_u16(ptr, old, new);
>     80		case 4:  return __cmpxchg_u32(ptr, old, new);
>     81		default: __cmpxchg_called_with_bad_pointer();
>     82			 return old;
>     83		}
>     84	}
>     85	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
