Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D28039DBCF;
	Wed,  7 Oct 2026 15:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791388608; cv=none; b=t1UDgtKW4iJyOCQmxkxam9/JnkGZLIR4YclNfZYAF6LhvvxUZOAWLcCxV/OxM8VPcu80BLDdaVhzRnnCxL4ynCi9PFPXaaBIuP/Zfm2lanx3YpiBDM5Om8J1r/Xgwk5Gwi6N3OMGkBsMpRKm+bWFJdPBsyZikV3H1lLno5gc++o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791388608; c=relaxed/simple;
	bh=uyFcj9ADReEAVtSUyJRkd5dhtq4VdKpC1KFH2ysUxJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r86AgOJGIph4op10SDNOgOYh1xpoReHhWhzxLlp6Svo0m/Jy/b0gbUrYmS/VVBwjNfcva6Vkrc+gDn0Q1o0hauPBH6ZeKPurH3c2+Sw2zhQHaNhrCoJ6L+7K5/PProQhUM25pjNGbWevimS3yrgcMVdLJUHpN3X0aX5U8mdaASU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MVVGJXCQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MVVGJXCQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16CE91F000FF;
	Wed,  7 Oct 2026 15:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791388607;
	bh=yMhRXbcaDeB4n2+mH5Jk5sbZU+IqnTVA1slEIulptiU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=MVVGJXCQWWbY9TfcSpCe7rr88tctc9aZgvrOvRTdvunYHodclahwQdfCooID67JEs
	 gHnlYWr4Kyzg8SMgTn8+DSyIcCibBPS0MGjG5sttwOCg038edkQh1ouIvfgrj73P3F
	 /mI96/EDR+Tu+ZbwYBlNH8MXltrAaHPPp9PEBv23odVUzHxC71IQ+9Pjnl1zwVz2hi
	 liHGcNdZ5GGQ3zVav9ABzBmf84qaGQDzAlCT2vzoN8kWnyuR0O3TAv8sRhRSfzUylW
	 rbylcb7H8kQWvEco+ck2W/N2zYDGvuhtvHIsX1hAQOLos01O3EVgNFO/VoU5sH+UCF
	 SEspg0zFpN+2w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D045ACE0D79; Wed,  7 Oct 2026 08:56:46 -0700 (PDT)
Date: Wed, 7 Oct 2026 08:56:46 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Vineet Gupta <vgupta@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
	Bradley Morgan <brads@mainlining.org>, akpm@linux-foundation.org,
	guoren@kernel.org, chris@zankel.net, jcmvbkbc@gmail.com,
	oe-kbuild-all@lists.linux.dev, arnd@arndb.de,
	david.laight.linux@gmail.com, glaubitz@physik.fu-berlin.de,
	ysato@users.sourceforge.jp, dalias@libc.org,
	linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] xtensa: Emulate two-byte cmpxchg
Message-ID: <5937c722-ccc7-4f03-b4a6-bf357f2f3757@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20261005120700.383058-4-brads@mainlining.org>
 <202610061704.rvbolgPy-lkp@intel.com>
 <82aad69a-603c-41cd-876d-09772a1a7e6a@paulmck-laptop>
 <a8bc1396-fa38-4648-89c4-ac528fc1888b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8bc1396-fa38-4648-89c4-ac528fc1888b@kernel.org>

On Wed, Oct 07, 2026 at 10:24:28AM +0200, Vineet Gupta wrote:
> On 10/6/26 17:44, Paul E. McKenney wrote:
> > These patches need to be applied on top of my -rcu tree's "dev" branch,
> > which supplies cmpxchg_emu_u16().
> > 
> > Nevertheless, thank you for your testing efforts!
> 
> Sorry I don't have your tree is my git remotes. can u point me to the msg id
> of the series which was applied so i can fetch it and apply.
> At this point I can't ACK/Nack the patch since w/o the pre-req it just fails
> to build locally exactly as the kernel robot found.

I will resend the full series later today, Pacific Time.  In the meantime,
these commits in my -rcu tree [1] on the "dev" branch in "git log" order:

a29bf4d6dc4f3 xtensa: Emulate two-byte cmpxchg
10d67fa61f9f4 csky: Emulate two-byte cmpxchg
1decb1d05ef2e ARC: Emulate two-byte cmpxchg
887685c52e44c sh: Emulate two-byte cmpxchg
109f733202e32 lib: Add two-byte cmpxchg emulation function

							Thanx, Paul

[1]  git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
