Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2773F3D4138
	for <linux-csky@vger.kernel.org>; Tue,  6 Oct 2026 21:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791321951; cv=none; b=MkN9hKgmcCqWB+fih6FbDgvNk2hA/i99vNcT8Skxf/K+qmbkNz1KlSSdZ0uFC/2owHgSOfkcK2B3yO8ka/QgOyf3/+OfSYMmRxOpHxxo3OASPOxwKWU9MnPxM1BYtxxK0ieKowx71JFOXDH51ov/4qqF7YTjUKxFhg0AvZofrX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791321951; c=relaxed/simple;
	bh=Si78HOdTuh5br4pOEzzwuy+CScE3tTEM1svLlsWQ2Uc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IKxBMO6lCeJDlzSMNiXdNCtLc5mp1DzOiBWP1FuIVW+UMpDXGNH8OQFhUztoWNMcJjzumhvqzZjugfIhW+it6g94P7JohmvCrqt+K1F7PlO1DK5ZsPHrPoQ0tcGJivN4b24zAM5ggwepAOJ48bWh/u6ap0a+6sDZQR40TzMUMNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iZrbndYo; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZrbndYo"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49ff680331aso34424515e9.3
        for <linux-csky@vger.kernel.org>; Tue, 06 Oct 2026 14:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791321948; x=1791926748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AzistxaYnghCdHKPFD1L5qK7yOScebgk7YUgF/bSWzI=;
        b=iZrbndYoI/+9FWS4vMPgXAxkymOoMgUvl+ZRBmhnfuaFQKmCA3MlQ/IT4RvkC8hLGn
         B9wFU4WzmTZ9XoIaGRyJClHtuElFuwpa7Cjdg0YUGlrlx2IyQWrFhy50RV0zFFb1CwOD
         UPCkcEtqMNO5XuU5NXn1FaHTsnsbxRIzblxu0f5LMLyRCpvqVynplFbc4Asvd6JqbRNJ
         g7ZyGuAGCqFpIumDtElFAHkNtuIv0n6T+TSCqgxZpGvS+5L033E+T5EgX2YTIBYunZHP
         NlrA5EXKbM+J6pszGDEwz+FplvgYS79PziM7TkxvSrgLvDq1Pcp6Zlrls+gjT9udJNoF
         /nqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791321948; x=1791926748;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AzistxaYnghCdHKPFD1L5qK7yOScebgk7YUgF/bSWzI=;
        b=cxXOXSUsS8VV5u8qpymD5OvIWG7rbbd1ah3LpewnpdQQUEwsb1dU4MUvmOm1Zlf7YS
         yl+55J5+bE2BtkDJhvzgEjhm097gvNgF6GDp8kcfNUXwUlSEYWUAEjSeOlpxoACJUZ1X
         SNR/V0RqDG9ZESQu3+gKracRlYfIrn80zXtXgJwo4wOwJ6PWpiHReW3rXsg2LkOVktt3
         mAafss9XXaeyJ44iT5uFMZnahn37U9/BdR765QL8qpA/Sh04MGaaIzmiCUF/vsQo1gNn
         Yh4hzWFRC+ArwfAOCapL9tzLPa2M2nx0bEJ3yPECAPyV+N2SgzWC105HTK2B3MlkfxNb
         8y7g==
X-Forwarded-Encrypted: i=1; AKwUvBykWbl9s5SAi4dP8VUS6bsRWrJMXOmF1lzlNylUFP59hVywh/B26PONRtbSCv5adqA+gcQ2FTdpheSw@vger.kernel.org
X-Gm-Message-State: AFuF++nVkFHH3HGncAcGHdf42dIlBLvmGowSoraUD0j3n2CIt5R7x4Ow
	MPo8TAdnOBp2Vo6zDHdY6rmeq0M8XjNf2kxMzNJUxZ/TqvbmVuoOYkdFJxlQFgpo
X-Gm-Gg: AYBFou24Q2Uiig3n55E6c+Vva3RD/pAfK4hakY2LGEgWjTHJ5FWbm1kwLvk56mzQ1jc
	pocmErCm2czhH7UxOZczDK4gTM7v4ksxBP6lmNTGJb+ZskCreXikEGMYKGq3l6X9PGdTvu5vWS4
	YHgwDxuEcfbeHITrCaY7TSPu3P/rp1k3LatVVASvWaqNHtRYnkyQVtnHvv8yo3qo3vsE/Lzc/SR
	H/3X4MgY/FsLmlh+18hcHKJDXHSzzkQIsD0FWuT/Fo/A0E1b3U6zSmRVSluPwSOqr9ZVCKSKJey
	HjV5OnXQTUodtKe7fY6dSHrVN5CXpYDF4jZ5PW5KbQT9q6pUWBKiTbpyipiZ3wJ4lG+x4YTesCP
	if5fTigx/hPu936HlV0zJcGFuz9SDSc4yE0NjM8x4nePAjUWJTHFvgsRhRCgasZbrhL2MyG4gJz
	wvE5i7PjiNVwhp6suznNRzhaIvCxqZjqM0MF1FWF9uOBqYobCcAc0ChzVuwvszpEARCp4TEJ0GT
	ktwnaRP7mO036YWvfFVnYwjtRcNA0cTrpw=
X-Received: by 2002:a05:600c:1911:b0:4a1:7ed5:99e8 with SMTP id 5b1f17b1804b1-4a180661070mr1425175e9.22.1791321948177;
        Tue, 06 Oct 2026 14:25:48 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1802cea1csm3575155e9.3.2026.10.06.14.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 14:25:47 -0700 (PDT)
Date: Tue, 6 Oct 2026 22:25:46 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Bradley Morgan <brads@mainlining.org>, akpm@linux-foundation.org,
 vgupta@kernel.org, guoren@kernel.org, chris@zankel.net, jcmvbkbc@gmail.com,
 arnd@arndb.de, glaubitz@physik.fu-berlin.de, ysato@users.sourceforge.jp,
 dalias@libc.org, linux-snps-arc@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] Add two-byte cmpxchg emulation and wire it into
 the architectures
Message-ID: <20261006222546.6b667d1a@pumpkin>
In-Reply-To: <84b6f3c7-e498-4931-97c2-75ea5158b99a@paulmck-laptop>
References: <20261005120700.383058-1-brads@mainlining.org>
	<20261005190205.26f17469@pumpkin>
	<84b6f3c7-e498-4931-97c2-75ea5158b99a@paulmck-laptop>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 6 Oct 2026 11:16:42 -0700
"Paul E. McKenney" <paulmck@kernel.org> wrote:

> On Mon, Oct 05, 2026 at 07:02:05PM +0100, David Laight wrote:
> > On Mon,  5 Oct 2026 12:06:57 +0000
> > Bradley Morgan <brads@mainlining.org> wrote:
> >   
> > > This is v5 of the two-byte cmpxchg emulation series, reduced to the
> > > three architectures still missing after Paul McKenney queued the lib
> > > and sh patches, ARC, csky and xtensa.
> > > 
> > > The v4 attempt at these folded in a type checking idiom,
> > > (unsigned long)(0 ? *ptr : old), meant to make cmpxchg(&p, 4, 5) fail
> > > to compile. The kernel test robot and Vineet Gupta showed that idiom
> > > breaks real callers, fs/crypto/hooks.c passes a char * and an
> > > unsigned char * to cmpxchg_release(),  
> > 
> > That ought to be a bug...  
> 
> Perhaps it is?  Here is the code:
> 
> 	cmpxchg_release(&inode->i_link, NULL, pstr.name)
> 
> And inode is a struct inode, of which ->i_link is char*.  For its part,
> pstr is a struct fscrypt_str, of which ->name is unsigned char *.
> 
> But this is either a 4-byte or 8-byte cmpxchg_release(), depending on
> CONFIG_64BIT, which is orthogonal to this patch series, which provides
> 2-byte emulation.
> 
> Therefore, I see no reason to hold up these cmpxchg_emu_u16() patches.

True.

David

> 
> But please let me know if I am missing something.
> 
> 							Thanx, Paul
> 
> > David
> >   
> > > and the conditional expression
> > > then has incompatible pointer types, which is a hard error on gcc 14
> > > and newer. So this version only adds the case 2 dispatch, the
> > > declarations the architectures already have are kept as is.
> > > 
> > > The ARC sizeof bug that v4 fixed along the way is in mainline
> > > separately through Vineet's f050c3e61d2a ("ARC: arch_cmpxchg_relaxed
> > > to use size of pointed type not pointer"), so the ARC patch here is
> > > only the case 2 wiring on top of that.
> > > 
> > > On the why, RCU previously used single-byte cmpxchg(), which is what
> > > motivated cmpxchg_emu_u8() in the first place, and Paul has now
> > > queued cmpxchg_emu_u16(). Unused new code is frowned upon, so wiring
> > > it into the architectures that need it is the missing half, and
> > > there are existing workarounds for the missing two-byte cmpxchg() in
> > > the tree, _Q_PENDING_BITS for one, that can make use of it.
> > > 
> > > Per Paul's suggestion each patch is standalone and can go in
> > > independently, they only depend on the lib patch already queued.
> > > Each one was build tested with the real cross toolchain, ARC with
> > > arc-linux-gnu-gcc and csky and xtensa with the gcc 16.2 crosstool
> > > builds Vineet pointed at, W=1, with the macro instantiated on
> > > u8, u16, u32 and pointer types, confirming the new dispatch is
> > > reached and no new warnings appear. The pointer instantiation
> > > covers the fs/crypto/hooks.c case that broke v4.
> > > 
> > > Bradley Morgan (3):
> > >   ARC: Emulate two-byte cmpxchg
> > >   csky: Emulate two-byte cmpxchg
> > >   xtensa: Emulate two-byte cmpxchg
> > > 
> > >  arch/arc/include/asm/cmpxchg.h    | 3 +++
> > >  arch/csky/include/asm/cmpxchg.h   | 9 +++++++++
> > >  arch/xtensa/include/asm/cmpxchg.h | 1 +
> > >  3 files changed, 13 insertions(+)
> > >   
> >   

