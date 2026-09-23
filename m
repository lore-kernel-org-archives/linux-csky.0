Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACF044C66B
	for <linux-csky@vger.kernel.org>; Wed, 23 Sep 2026 09:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790155971; cv=none; b=DzMH1G7Q0PiCOw+HD8qDAqBFxXtMoPjp37m7b8Bq68dwr1PxTjbFiRSOztBMapHmXWmTz99L9SrR9nSIB5Pd9qpVNcearr4e2P8qoTRz1KL+S+xpBbSwptZCcd8CGJfizQpMTXglR+Y8jxeJarYYM+5NL5X2/w/jpC7oQilJi5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790155971; c=relaxed/simple;
	bh=9yDvyN9MI78GMvcpn95njYuuU2JHgmS5aXoXqel5FDU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EnJK8ed21dyyJF96tHCs5X40TXOu+oNCkgI6wwnxUtHu37Kg/1SbQxG8+kLArEQh6j3VJp6o3sr9mCJRWzqV8DfT3GuVvuLbETTYs20ki6Iqm0qbcZqRGL41yB1Bu08LqdrD6v7rVpD3pWCGZItm3bgdKeIl5ifvWxP0s1lgPGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cS5l8ef1; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cS5l8ef1"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so3898395e9.3
        for <linux-csky@vger.kernel.org>; Wed, 23 Sep 2026 02:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790155967; x=1790760767; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N7ccE9C9Rji5d1/6O5twnMh1K4GrGyorEDQqGjRm4Rc=;
        b=cS5l8ef1wOMNXdri/eHBwDmah6pw0P+HjSHCpvKZLC5Yj7cBQYiVmx2Ce2l7CxYGpI
         j7Y7IQ8XCndKiVqdCOWDs34SvE1cszgRup3rKKvIPWuI3vTi9SX7gN1NoNkfMxZUF+Dd
         XudV1wGAxay0cCSGRGPfBXFKstWbBiOkqBUbiGP17MfT/b0b7+l1VvE52EV8LMBLtvUq
         CmB+613yqH4LPKpJo8ruDPFCS2jTne6g7k6RYfyFb+oLXHn/vEskWTqnRIhme/3TvZM9
         1dbouGeKTWPbXttOX+83Jg+/E1/bhrvG354Y/s+1qumz2cXQNBsJucxqoL8FSYDguY1H
         0JCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790155967; x=1790760767;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N7ccE9C9Rji5d1/6O5twnMh1K4GrGyorEDQqGjRm4Rc=;
        b=MOAW+7qWln7Rg2RuXWF5H9NqfquuUGe4qIR5yPKTz2BHvbOBPk73WjUzYbNuoQRX48
         LpitvlEeM4wSy5tT5tCWRgKnAC5d6ST1jdhxa4kQjzeM00O2o9Cw4iXMjR73qW/NJocQ
         d3eeYGkaONxyqqPtCVh179kl0w/d4Ipdxu15N1GhQ2lf/HNe16eqz/GFNa1oUZM0G/cs
         NgaTu9i46+HBml/nwxNwb2ZejqZAdpApnGl8ZejLQedj39tGtiAZOsoW/wqdNvlack8O
         NqMZ7gaZwaRJx+ysxrdkuPpAVjYnVBIZ2Vqm/87vatam0geKEpUXXNArZbzpnHNCcLRE
         Gabg==
X-Forwarded-Encrypted: i=1; AKwUvBwxI47g8FT3eUTUileHsSeJZMXzCQNbm12ZDk/4Lqr37l54zZtSi3o1dNDoUWf/+OWS2lkbULXmVfd+@vger.kernel.org
X-Gm-Message-State: AFuF++k5rF4P/+l0Oj4nhghSsOv4FOeQaq8d1KXc6pUL/U9pSIBJRbcV
	qw4wrxRDC83MGJHSK+l2Oxxf1UkYb58XwnAeQ2ogV+S2ETpv33Espy1U
X-Gm-Gg: AYBFou0oqUBdZVYRcqK3XYAIPzv+kbKq3IXTpW7dTLILZ5V30fcD3XTVu83R+ayjeiP
	thCm24P9UwRyeXmIG2bSIvPo2y+Gfma4LgUWQZOgUE+hf/esbPIdt39s5MIu8Yg5No1cKK2297u
	uczyCwHeqbEqriaPs4rrP82rUkTPPiCAwdy1bKYsghxtdyEpW7lPg6WFYLOvt/J3a3ojZzCaUhx
	DzLps3JKqOfgHfjQiP05VdnX/Mio+Vj+Rny0hsXNHqLjtnU16xPMKrA1SqjRgRDaz43J01DsIPO
	hEVy8YlqeWKEVspIMg//xKNqjP8fKkAJQnaWijrpkdDd4q/AXWraM3QoOPVn9iEfesOk41vZ/GL
	ej0FNpuY+tArEHGS+TD47hczPlo/szN2e5dawayHVhwuLio6GBer90Ek7mEuGzZ4wKkjZk+tuyT
	lrJNg8ocb4FkI+Ey+aYzgp4zpGYlqiy7f4fWMxxRDn+dZu11d7eIR1R5EO8L49vgQ+mmoEHEo4v
	LGcjIIJ+gSe2ayvwRpK1A5AMgImL006T6g=
X-Received: by 2002:a05:600c:4f4f:b0:499:bf8c:cfd1 with SMTP id 5b1f17b1804b1-49fdee0afadmr31059425e9.2.1790155967384;
        Wed, 23 Sep 2026 02:32:47 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1aca52sm64655025e9.14.2026.09.23.02.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:32:47 -0700 (PDT)
Date: Wed, 23 Sep 2026 10:32:45 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vineet Gupta
 <vgupta@kernel.org>, Guo Ren <guoren@kernel.org>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, Chris Zankel
 <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann
 <arnd@arndb.de>, "Paul E . McKenney" <paulmck@kernel.org>, John Paul Adrian
 Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/5] Add two-byte cmpxchg emulation and wire it into
 the architectures
Message-ID: <20260923103245.4c13e90d@pumpkin>
In-Reply-To: <20260922173354.14404-1-brads@mainlining.org>
References: <20260922173354.14404-1-brads@mainlining.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 22 Sep 2026 17:33:49 +0000
Bradley Morgan <brads@mainlining.org> wrote:

> This is v4 of the two byte cmpxchg emulation series, wiring
> cmpxchg_emu_u16() into arc, csky, sh and xtensa.

Apart from a minor niggle, for the series.
Reviewed-by: David Laight <david.laight.linux@gmail.com>

> 
> v3 had changed cmpxchg_emu_u8()'s success return to (u16)old, which was
> a 16-bit mask in the 8-bit function, and a dead one at that, since the
> compare guarantees the low 8 bits of old are the byte being returned.
> David Laight asked where that cast came from. v4 returns old unmasked,
> the exact behaviour the one-byte emulator always had, so nothing that
> uses cmpxchg_emu_u8() through the widened prototypes sees a change.
> 
> David also noted v3 extended the (unsigned long)(0 ? *ptr : (old)) type
> check to csky and sh but not arc and xtensa. v4 adds it there too, so a
> cmpxchg(&p, 4, 5) fails to compile on every architecture in the series,
> verified with each architecture's macro instantiated standalone.
> 
> While adding the type check to arc, the switch subject turned out to be
> sizeof((_p_)), the pointer, not sizeof(*(_p_)), the pointee. On 32-bit
> arc the switch was always 4, so the size 1 and size 2 cases were dead
> code and every sub-word cmpxchg() went through the 32-bit llock/scond
> pair, comparing whole words against sub-word values, so the compare
> almost never succeeded. The switch now tests the pointee, and the u8
> path it was always meant to dispatch actually runs, so the one-byte
> emulation works on arc for the first time since the sizeof bug landed
> with the original cmpxchg_emu_u8() wiring.
> 
> The host test of 972 cases across both halfword offsets against a byte
> level reference model still passes, and a 20000 case randomized run
> checking the masked compare and return against a hardware cmpxchg r16
> model passes with zero mismatches.
> 
> David pointed out on v1 that a u16 prototype does not compile warning
> free when exchanging a pointer type, because the switch statements in
> the architecture macros instantiate every size case, so a pointer
> cmpxchg() type checks the two byte case, and the (u16) casts there
> warn. v4 keeps taking the old and new values as unsigned long and
> casting to u16 inside the function, so the call sites need no narrowing
> casts and pointer exchanges compile clean. The function still compares
> and returns exactly the 16 bits the caller asked for, which matches
> hardware cmpxchg r16 behaviour.
> 
> The ARMv6 wiring stays dropped from v1, per Arnd Bergmann's offer to
> take the INTEGRATOR_CM1136JFS cleanup in his platform removal series.
> 
> Bradley Morgan (5):
>   lib: Add two-byte cmpxchg emulation function
>   ARC: Emulate two-byte cmpxchg
>   sh: Emulate two-byte cmpxchg
>   csky: Emulate two-byte cmpxchg
>   xtensa: Emulate two-byte cmpxchg

