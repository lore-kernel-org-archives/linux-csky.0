Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A404541F35E
	for <linux-csky@vger.kernel.org>; Sat, 12 Sep 2026 09:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789205455; cv=none; b=jRACTdaB1TdvZXTE4nHNXlm+dezXRE7DE2h/MnGDpsWIiV0nr5Fwf5xNjWkqeijzeJkHVJy7VD9wpmwehALLH9MMR4DpaQJLy+nZM18He6tREWJtQ6d20S/UcJw++s4ePuk7GxGRPQ5MCvIH2GMOGIc09QNaUyB//KPa+jeq8B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789205455; c=relaxed/simple;
	bh=JFkNJfIWl4JBPhtIiMKJsDFXpmdvhj7ZI5ApqqlkfAs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WAO3yGKiW5eLBrcs/m6X5QxfEdhnZ8zmXJ+yHw9kOViIp/NHitohmBrMtrtFRB9suwDIS+oFAO9GQnNqqkVVmrRrfPkZGdWb+j75SOCQ9a1ZpnUf1CYmemA2rFKiu6hpWuB5Xh0srw1I0PMX0BtA7ZnGHRye/4UkLv/6W5X91I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2fsXHiu; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2fsXHiu"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7355e411so329255e9.1
        for <linux-csky@vger.kernel.org>; Sat, 12 Sep 2026 02:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789205449; x=1789810249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wIDaovYKooHqH78d/6XZ6tf1fVeqSDWOw5EQD+FAKCk=;
        b=Q2fsXHiukvnErotvdp8NVy6d8RV4/YZJCAqJyxu5qGJKDuzNNe5rPzUCLU8QT7RZs2
         bF+3ujmUnzXiDykLXUCDstyPmSpP+oBVos8pcXz7O9GbCq768nQE8CWTaiDLFUEvMOPq
         k5q2Bk0flpD8RBEd1ahQan5JvbOS3/mMRquT8BujuAOltom+uAMLwKh9/hWxdgpSr2nC
         biptUkQmVq90XJGr7q4rVjCME9FAAOnmx3dWcq9rywP51Cx8qKjUKp2j4p1WhTgGMXED
         Oz9gLam4h1S2cPxHZZXko/2MMEJ/azzGRey9y46+U1TB3pjCeT9w/wHx0zK8mJfr/Yih
         s/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789205449; x=1789810249;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wIDaovYKooHqH78d/6XZ6tf1fVeqSDWOw5EQD+FAKCk=;
        b=qjhUAE05Nj7/KTHW+jvJ5d9Czw9tGFtB3g/ELjaR56Ux3dxRsS3u8u1UeFP6llq2e9
         r7g2ak8Yfs7kFabXe9RJMqthyHiP9Eb1jtthw6dSuMwnxwKK7pgr+gifybW1Q8La7Eff
         Rd2eMH5PlRRjX1nDV1UIQ/O/JHz0QiTKM/hf+bNUBaWRx/wGPSjIDMv449I9n/ekV+5y
         WuxE10F2mIx5PJCTXMGRkcLpomnqKVvOsmNFJgrUujqXJHZ1/OllevYcGy8dD1dk6vh1
         idB+0hN1922PVPrEHRJGesQf5yToTcd5V8HOsKo4LUcJnxvGhoXemv8WogqzMK5Tmww0
         GxlA==
X-Forwarded-Encrypted: i=1; AKwUvBwTxkzXHn1Tyf96oA+1sk1cF8fwc70ZNO021tL36OwWZMOrLt0VO0C0yTntkmpMuAXg/VBV12KF7qYK@vger.kernel.org
X-Gm-Message-State: AFuF++nDWA8rZuyhbJWgr5Dr1PXdMOPmJfJgV/lGoD4HEePTtX2Az/34
	sw2zAWIw+Be9Su3HJLbR6bjs+ZEHXfCIiAlC0XDE1IYsAbiZlWeqQsqB
X-Gm-Gg: AYBFou3nUgAVmoW78YZsv1piZon5Ss5oqqMJAjmIf3XV4rB5xg/fmQ/0mTb4pTxWkqQ
	nAntFtZnbf7b5NCWUJxWYmEhWGmFZIXTlTs7JHrdfnmTDo1QQArZ5G0k2tLcwtTOpioOeweIK8f
	hWpCD9pSbzK6yBhMOZt9R97bKIFB/cBNrXiMGMOcikPFyY6B8KRvKEFfNAp9IUZUkrA3IkqKRyU
	jSAc479WKqnVRfEUPzKDi7FoMCeVHoFNRvGaks+mGZjb2VK3FvkfZW1Gc+2MmRvTyIpEhODdTz5
	pdW7UZJSHEOzGS34scSNvC3Mp7OXIe2g8fpH7WsRCjaP3ihr1OJtHSXVyvT9kSA5Csq3mM8JlA+
	zt+Lxv2EKMwfH9up/YmEfcHAGvDYxP+FCdh7bjR00g+A6y41RXEdZ14jZ6AJZ1LaZeLaOZ1Z2yh
	uuukzoV/qvVw0OJEWRCSfXXKXqszozf+AAlRPKyb6Et0O4RE+uaxLJfrxdrFbINRASIxjENeCgo
	1iO+wzPjgIj0RJ2Z7fJEoXlLlcTgY0OFyst
X-Received: by 2002:a05:600c:8411:b0:49d:1e09:694a with SMTP id 5b1f17b1804b1-49e619f5049mr195258665e9.11.1789205448684;
        Sat, 12 Sep 2026 02:30:48 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e706d0c1fsm26523335e9.1.2026.09.12.02.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 02:30:48 -0700 (PDT)
Date: Sat, 12 Sep 2026 10:30:47 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Bradley Morgan <brads@mainlining.org>, frederic@kernel.org,
 neeraj.upadhyay@kernel.org, boqun@kernel.org, joelagnelf@nvidia.com,
 rcu@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Arnd
 Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, Vineet Gupta
 <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, Russell King
 <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-sh@vger.kernel.org,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] lib: Add two-byte cmpxchg emulation function
Message-ID: <20260912103047.1b95bb03@pumpkin>
In-Reply-To: <d0ef7beb-6952-49cc-9b33-e7542e831ba6@paulmck-laptop>
References: <20260911192540.20983-1-brads@mainlining.org>
	<20260911192540.20983-2-brads@mainlining.org>
	<20260911231017.550f8cd1@pumpkin>
	<d0ef7beb-6952-49cc-9b33-e7542e831ba6@paulmck-laptop>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 11 Sep 2026 16:09:16 -0700
"Paul E. McKenney" <paulmck@kernel.org> wrote:

> On Fri, Sep 11, 2026 at 11:10:17PM +0100, David Laight wrote:
> > On Fri, 11 Sep 2026 19:25:34 +0000
> > Bradley Morgan <brads@mainlining.org> wrote:
> >   
> > > cmpxchg_emu_u8() emulates one-byte cmpxchg() in terms of four-byte
> > > cmpxchg() for the architectures lacking native one-byte atomics.
> > > The same architectures also lack native two-byte cmpxchg(), where
> > > such an operation is not supported and either fails to compile via
> > > BUILD_BUG() or fails to link, because the bad pointer sentinels
> > > these architectures declare are never defined.
> > > 
> > > Add cmpxchg_emu_u16(), the two-byte sibling. It reads the enclosing
> > > word with READ_ONCE(), splices the two target bytes through a union
> > > and loops on cmpxchg() of the full word until the compare succeeds.
> > > Like cmpxchg_emu_u8() it is fully ordered.
> > > 
> > > The Kconfig symbol gating this file is renamed from
> > > ARCH_NEED_CMPXCHG_1_EMU to ARCH_NEED_CMPXCHG_1_2_EMU, as it now
> > > selects both the one-byte and the two-byte emulation.
> > > 
> > > Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> > > Signed-off-by: Bradley Morgan <brads@mainlining.org>
> > > ---
> > >  arch/Kconfig                |  2 +-
> > >  arch/arc/Kconfig            |  2 +-
> > >  arch/arm/Kconfig            |  2 +-
> > >  arch/csky/Kconfig           |  2 +-
> > >  arch/sh/Kconfig             |  2 +-
> > >  arch/xtensa/Kconfig         |  2 +-
> > >  include/linux/cmpxchg-emu.h |  1 +
> > >  lib/Makefile                |  2 +-
> > >  lib/cmpxchg-emu.c           | 35 ++++++++++++++++++++++++++++++++---
> > >  9 files changed, 40 insertions(+), 10 deletions(-)
> > >   
> > ...  
> > > diff --git a/include/linux/cmpxchg-emu.h b/include/linux/cmpxchg-emu.h
> > > index 998deec67740..fee8171fa05e 100644
> > > --- a/include/linux/cmpxchg-emu.h
> > > +++ b/include/linux/cmpxchg-emu.h
> > > @@ -11,5 +11,6 @@
> > >  #define __LINUX_CMPXCHG_EMU_H
> > >  
> > >  uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
> > > +uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);  
> > 
> > Why uintptr_t? Shouldn't it just be u16?
> > (Which probably means the code would better if it was just 'unsigned int')  
> 
> I suspect that Bradley is just following my cmpxchg_emu_u8() example,
> which also returns uintptr_t.
> 
> I remember that *something* broke when I made this be u8, but I cannot
> recall what the problem was.
> 
> Bradley, could you please try making it be u16 as David suggests just to
> see what happens?  Who knows?  Maybe it was a compiler issue that has
> since been fixed.  Or maybe the macros and asms using cmpxchg_emu_u8()
> need that uintptr_t for some reason.

I think the uintptr (unsigned long) cast is needed to stop a compile
error when exchanging pointers.
But that is an issue with the #define not the called functions.

Possibly changing the #define to have:
	unsigned long ul_old = (unsigned long)(old);
Or even, with the type check from:
	unsigned long ul_old = (unsigned long)(0 ? *(ptr) : (old));
(with the same for 'new')
and the removing all the casts where the value are used might be better.

David

> 
> 							Thanx, Paul

