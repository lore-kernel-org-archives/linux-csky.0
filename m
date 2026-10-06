Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514CC390CBF;
	Tue,  6 Oct 2026 18:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791310604; cv=none; b=aPb6zqeV+Mojgtnk8bYhkOUlamH0IfybPH8f5NdFwQukTRAGFYMKU6Vtms0IwsphUFptEzOJPkxKwKWaN6Z3kTxDFM2fJH2/u6Dg+VF4n7ASYN1PTOQAuduTD9ArIPBss9BxMS9BA/shvjPY5krys6hbeyVG0MNOFgKHQDQgS38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791310604; c=relaxed/simple;
	bh=7dyZETvO7O9fu7AHkkVrFM7ya11ERADwV8wWSpdA7q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NbJaP51zwA4Ls7oHxOkLUMfhOVajWI/Hm7p8vk27rq6UuP+MIjgoIbcJnzcrp2H4x34eZaKy5oAX4WYgvHKYj48+9hcFFT71TaDVzONmaAKrjpjiMujGjZ3f5cwIdcVHt919VfnFd/DYX131ky15C7m7tdeScUzKl8xl12wT14Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nV3+PNfB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nV3+PNfB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F1941F0089B;
	Tue,  6 Oct 2026 18:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791310603;
	bh=SOZ+aI+KSR1UAkYe0gazlY4BGayfc1zklSYDKuyOR0o=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=nV3+PNfB1rqBHlAapHoj1VOlOJmURxsIifQ5jciLn/K5aUBq+0HV4KdAfazxkutMb
	 UfJJBeugVtFOIkRGadW14XuzlTQn+QRr5DCe7uV4q6fkzHZoyo0kIbLVcPdqamnvFI
	 +uWh8NDP5WByahQ7vdbO/FbHbWrME5l2EbpFH4vl+wsC46R8gWp7QNZ4BKGA5IYYd5
	 nGI9Lz2XoBeIyy5cvq9RtL/9K8g+XzQW65NnCfzf6TL+5P7CdqOa4SsNDdRvSdTLXa
	 HAE4JyhL2+f+x2jREbzJzlJTvHHQreoLL154QM9z6JyQ12et0cNtEUk3WhbIDsCsM6
	 hNTgIFrOvE36A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id BD4F7CE3A08; Tue,  6 Oct 2026 11:16:42 -0700 (PDT)
Date: Tue, 6 Oct 2026 11:16:42 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Bradley Morgan <brads@mainlining.org>, akpm@linux-foundation.org,
	vgupta@kernel.org, guoren@kernel.org, chris@zankel.net,
	jcmvbkbc@gmail.com, arnd@arndb.de, glaubitz@physik.fu-berlin.de,
	ysato@users.sourceforge.jp, dalias@libc.org,
	linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] Add two-byte cmpxchg emulation and wire it into
 the architectures
Message-ID: <84b6f3c7-e498-4931-97c2-75ea5158b99a@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20261005120700.383058-1-brads@mainlining.org>
 <20261005190205.26f17469@pumpkin>
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005190205.26f17469@pumpkin>

On Mon, Oct 05, 2026 at 07:02:05PM +0100, David Laight wrote:
> On Mon,  5 Oct 2026 12:06:57 +0000
> Bradley Morgan <brads@mainlining.org> wrote:
> 
> > This is v5 of the two-byte cmpxchg emulation series, reduced to the
> > three architectures still missing after Paul McKenney queued the lib
> > and sh patches, ARC, csky and xtensa.
> > 
> > The v4 attempt at these folded in a type checking idiom,
> > (unsigned long)(0 ? *ptr : old), meant to make cmpxchg(&p, 4, 5) fail
> > to compile. The kernel test robot and Vineet Gupta showed that idiom
> > breaks real callers, fs/crypto/hooks.c passes a char * and an
> > unsigned char * to cmpxchg_release(),
> 
> That ought to be a bug...

Perhaps it is?  Here is the code:

	cmpxchg_release(&inode->i_link, NULL, pstr.name)

And inode is a struct inode, of which ->i_link is char*.  For its part,
pstr is a struct fscrypt_str, of which ->name is unsigned char *.

But this is either a 4-byte or 8-byte cmpxchg_release(), depending on
CONFIG_64BIT, which is orthogonal to this patch series, which provides
2-byte emulation.

Therefore, I see no reason to hold up these cmpxchg_emu_u16() patches.

But please let me know if I am missing something.

							Thanx, Paul

> David
> 
> > and the conditional expression
> > then has incompatible pointer types, which is a hard error on gcc 14
> > and newer. So this version only adds the case 2 dispatch, the
> > declarations the architectures already have are kept as is.
> > 
> > The ARC sizeof bug that v4 fixed along the way is in mainline
> > separately through Vineet's f050c3e61d2a ("ARC: arch_cmpxchg_relaxed
> > to use size of pointed type not pointer"), so the ARC patch here is
> > only the case 2 wiring on top of that.
> > 
> > On the why, RCU previously used single-byte cmpxchg(), which is what
> > motivated cmpxchg_emu_u8() in the first place, and Paul has now
> > queued cmpxchg_emu_u16(). Unused new code is frowned upon, so wiring
> > it into the architectures that need it is the missing half, and
> > there are existing workarounds for the missing two-byte cmpxchg() in
> > the tree, _Q_PENDING_BITS for one, that can make use of it.
> > 
> > Per Paul's suggestion each patch is standalone and can go in
> > independently, they only depend on the lib patch already queued.
> > Each one was build tested with the real cross toolchain, ARC with
> > arc-linux-gnu-gcc and csky and xtensa with the gcc 16.2 crosstool
> > builds Vineet pointed at, W=1, with the macro instantiated on
> > u8, u16, u32 and pointer types, confirming the new dispatch is
> > reached and no new warnings appear. The pointer instantiation
> > covers the fs/crypto/hooks.c case that broke v4.
> > 
> > Bradley Morgan (3):
> >   ARC: Emulate two-byte cmpxchg
> >   csky: Emulate two-byte cmpxchg
> >   xtensa: Emulate two-byte cmpxchg
> > 
> >  arch/arc/include/asm/cmpxchg.h    | 3 +++
> >  arch/csky/include/asm/cmpxchg.h   | 9 +++++++++
> >  arch/xtensa/include/asm/cmpxchg.h | 1 +
> >  3 files changed, 13 insertions(+)
> > 
> 
