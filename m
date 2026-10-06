Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369272D77F7;
	Tue,  6 Oct 2026 09:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791280518; cv=none; b=nTCaxORxm1Ww/igaX58VMMWtQJJOH8NyxQhLk+4TTgjOY5YtoathzaUJf3IcwfCmjC6PKNH4W8B/XJCDtSsBdOAnTpBm5hC3lDILiYsWYpQB8qzcdv2r0176ryx33Beg+lZY7hUWEK13mC6nzrThR+bF8YgKw9pTKLAl88fHrzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791280518; c=relaxed/simple;
	bh=PprG1zoTavpw3blbpMrw2Qfk/deLSjiCWxGPFyBWXnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QOGhVOXXtMZKThiueiP67bFGXkazVZJyZiUB5ovubLo/MS7rMtZkeOWVl+jYbMvY+H6EhiOrOAvgfff6XdQa588VwX7CWJjrlyd8byxx7EHtUCU//yK6/V18tgTl+M22LSDYYYYy5Avi7FB+nzrBIN+jAu5VcnMvXWcg7v5Pu5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vm4m60nR; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vm4m60nR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791280517; x=1822816517;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PprG1zoTavpw3blbpMrw2Qfk/deLSjiCWxGPFyBWXnA=;
  b=Vm4m60nRU1hndNQ6PgkArjwlgXxENN0vYV5Fve5Hq7kWP5zxKtM+GXvx
   ru5GRBokloxT6CgWt9TLGKwXqCC1BHvPWH4es0PvprB8D84wQS1RVzVkc
   h3aZ7Te4GWWotJX3jjiuJ6uVqYQ+ei8eohpJ+A3SWXN7TyAOWkLRQEs/q
   BlHrkmoN5kaK8Tb0R5fJQzbYfJhRl3n2uPJNdIiVms5PovsCX8b6w5xYy
   yPoUbt+UPNm6tr/pW0KqOLj/UEVt9X3Z6UB43YoBFk9IuA3JO5TZu8wY2
   xPpzXuTsbTWyVD1FllJAMzahfpc2ufU4sg/OH4soEv33rsQH2JgMVGali
   w==;
X-CSE-ConnectionGUID: YE3EgKHJQT+pLNSRGCWkag==
X-CSE-MsgGUID: qzKYvbg8SZqrCPBtlJgiLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="112880"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="112880"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 02:55:17 -0700
X-CSE-ConnectionGUID: 3CvIPXL/Tc2i1GM26q+rSA==
X-CSE-MsgGUID: NdjTDoNtQXq0SfBbj3gt+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="285008670"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Oct 2026 02:55:13 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE1t7-000000001Qi-36dv;
	Tue, 06 Oct 2026 09:55:09 +0000
Date: Tue, 6 Oct 2026 17:54:53 +0800
From: kernel test robot <lkp@intel.com>
To: Bradley Morgan <brads@mainlining.org>, akpm@linux-foundation.org,
	vgupta@kernel.org, guoren@kernel.org, chris@zankel.net,
	jcmvbkbc@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, arnd@arndb.de, paulmck@kernel.org,
	david.laight.linux@gmail.com, glaubitz@physik.fu-berlin.de,
	ysato@users.sourceforge.jp, dalias@libc.org,
	linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-kernel@vger.kernel.org, brads@mainlining.org
Subject: Re: [PATCH v5 3/3] xtensa: Emulate two-byte cmpxchg
Message-ID: <202610061704.rvbolgPy-lkp@intel.com>
References: <20261005120700.383058-4-brads@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005120700.383058-4-brads@mainlining.org>

Hi Bradley,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on vgupta-arc/for-curr jcmvbkbc-xtensa/xtensa-for-next linus/master v7.3-rc6 next-20261005]
[cannot apply to vgupta-arc/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bradley-Morgan/ARC-Emulate-two-byte-cmpxchg/20261005-120658
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20261005120700.383058-4-brads%40mainlining.org
patch subject: [PATCH v5 3/3] xtensa: Emulate two-byte cmpxchg
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20261006/202610061704.rvbolgPy-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061704.rvbolgPy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610061704.rvbolgPy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/xtensa/include/asm/atomic.h:19,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/xtensa/include/asm/bitops.h:192,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:14:
   arch/xtensa/include/asm/cmpxchg.h: In function '__cmpxchg':
>> arch/xtensa/include/asm/cmpxchg.h:79:25: error: implicit declaration of function 'cmpxchg_emu_u16'; did you mean 'cmpxchg_emu_u8'? [-Wimplicit-function-declaration]
      79 |         case 2:  return cmpxchg_emu_u16(ptr, old, new);
         |                         ^~~~~~~~~~~~~~~
         |                         cmpxchg_emu_u8
   make[3]: *** [scripts/Makefile.build:185: kernel/bounds.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1405: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +79 arch/xtensa/include/asm/cmpxchg.h

    73	
    74	static __inline__ unsigned long
    75	__cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size)
    76	{
    77		switch (size) {
    78		case 1:  return cmpxchg_emu_u8(ptr, old, new);
  > 79		case 2:  return cmpxchg_emu_u16(ptr, old, new);
    80		case 4:  return __cmpxchg_u32(ptr, old, new);
    81		default: __cmpxchg_called_with_bad_pointer();
    82			 return old;
    83		}
    84	}
    85	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
