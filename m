Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0A343B496
	for <linux-csky@vger.kernel.org>; Mon, 20 Jul 2026 22:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784584879; cv=pass; b=bZpJJZSpuD/ljsGVF4ezfbhOBKTohg2NlbhKtLB42hSyOvLFr+0dMOsKkPrJ6gHBsARPk6m7k1VmKrZKXW3DnEFCj4UcivplHjThzF8AX4I0Z389MjAROxbg8Yzn1bT2NUCP1wKxx2nba+QdHjwvVKTLkag+4df0snFx0pcoaPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784584879; c=relaxed/simple;
	bh=j/7Pu0goIzrDPISYd7UGXNeACZWMCvQbsT7AmxUh2RI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c7fkT10uo8fQfVOzj+v4+GU4sdVC1rhfoFUs56ELFFldLuQ3LEGw4xwrtqdXITmSZbHzbkCr/VBufMVNXSfQlecAsCtgz4IVxjqg/b2HVOLmjP4ItjxvtO5PitEjHZ7XMgDtrbTV09mBQDmhpvjPSGjqDhHDs72k1tWu1zZMnXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZMey3lva; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMey3lva"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-69a5ecbbfb2so11919600a12.2
        for <linux-csky@vger.kernel.org>; Mon, 20 Jul 2026 15:01:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784584875; cv=none;
        d=google.com; s=arc-20260327;
        b=s86QuyvnvXhaCAIzB577pRVYvaN4vu1TQFdMuFJmvzURTPvx+PSAELjLXCz7RbmYMh
         AKRHAEe/NLq/NFJ1zDRF3N9rk7zdMhvXF6UQH7VQ3ckZe1D5u8QnkxrIsdEqi2odcMyS
         /Uh0rBflGGG8W0CEUhwMircrUE3Lv8BwVKqfawsdjWGR+PNf86WqKlFOC+fDcTFCYrRL
         bzZZp9oqxsl1t7Eq3tS9/N+gq9jZC/vJEUBHMQQ2o/SJZ+zaAXww2YfCylQOu7kyy3gG
         I1AGDQ3yCELYnscO3FV9944cHScPOcmcT+/e7uHUDXW6mA1VFBxWgqEOB8Qvs9oOCQsj
         wkTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OFKHaLiuiIMT2s5Bf3SZwWbn7++lylaBZHxfNpeM7Fk=;
        fh=+MHIFfe0QVbNZkZ6e2uOoM+w3PvBd7y3rKNxiLqcdpQ=;
        b=qyyxkwoCgeNeJS3dXDvENDCEN03in67hD6Q5+v5SjFoeuLKxsB4pcFmrrB63roz9PI
         qV6eYpF27K8CVd3DRIsXWmmwF6Q1dr9D/pW+2YQAPCKZX+7y347oIlEeLr7EcJphsT+K
         uhpbsdtMZzvRaDeYS2RdWNClTShVTQaFQFYReJbWNszVkggVrvlJTwsujo7RBox1tNO3
         dEAH5l30atb+RScoXvdMyqIepHLpjokH36nVVg3/O9kMyuwEATL8kPC+OHHJlZMfTqUU
         FjsqnF3yVACOI/R2nIe3dqWqfiDnaXTLO4x0z4ZFbJlwmWIJVv8SQ8ShUvV2zAbSw3ZW
         Syyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784584875; x=1785189675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OFKHaLiuiIMT2s5Bf3SZwWbn7++lylaBZHxfNpeM7Fk=;
        b=ZMey3lvahqP+YPW9LamnWQzczRxQiZ4wg9gw2Nu7P3y1v17JUAuMM/AR3JTiQFFKU8
         d9noasqw2G++q5S+mCeWeywDA5kpg8MuVxJjECyua9/y3jlOjzMIOYlRYZqO13STHgxR
         WQ87V1/rMYJN18KwPy7Kt1f4oO1hp7OTlSg/lmBFsB1gkADDpu+GAYd81uYxtDWFgDYj
         g7E/fCVHIhWUawA3wQ30Wot0eYDovRLDP5gkADBspVyzhS4siR8fFKxsvW3/xg6aPXXq
         4tTUNL4YjCh2lps4QkQgZ6MAQbSDaAHnlH759VBDRh1kPBksK3QYu64fJW2a6dhpi8jy
         qpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784584875; x=1785189675;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OFKHaLiuiIMT2s5Bf3SZwWbn7++lylaBZHxfNpeM7Fk=;
        b=XOCwb2D8JvTi70ftmL1QMJsKiVHUGzskDnMGpmvONIXo/Wj0HPafTxFkxZdA52e6xc
         /CyQw6QNHseb7y3Fsln3eBWnR4tzAE/SKREf81Dw6sRyI24RHNr3EmDN7i3KCUR9/Rjm
         k5s4lo726s7jE0QlDAZUNh04hpuONzp+HVSvvTGi9leorSP6M55O4LM2e8ICkkzalhjW
         eh4Y5eSwIc04/ZZjzAlglUk3uIAkBary7KtnQ4HkDBFbPyl9cExYEFZ1d4fqG5qIqnXm
         C+myt5jKqoGHi8EkHbuAxbi66EizrJ6N0TThKv7GGhwU3HgjSnfscGAge+6Ya2tFhC1O
         OmZg==
X-Forwarded-Encrypted: i=1; AHgh+RoS5JovgbMJeDQ0ZXFbdzDlfBQaSkLo8LIA3uzV/6DP2+zA2FpwbrCVBF7zazosziux398UTkDEH769@vger.kernel.org
X-Gm-Message-State: AOJu0YyRXVsZ3Maxw3QWKrEGKXlD9SxN77qE+sjrYBRqX/deMX5rHXdY
	QQLSdusze2OAwdbwp1fDewoCdjRCpcb+t0su8dPyWC4bZ2In6EDa/Aa/s4vl0l4alqYgLJMTWQo
	9UzRZNzIgkJYfrDX251v3f/m4Nkw4KP4=
X-Gm-Gg: AR+sD13fiJMqfLE+sPK7wiUtYUclN5BWDsrnuxpnq1BeRxT6YkEwjBYGFtJx1KtAiXC
	VKlPk6c29NXp5/5800YRk5fn+BGUUnSuHqOQanp5aJdEG7HMCELXz9Fm2q8DSafD/eDocopeLnG
	P509Ufq/mFbmikq8EhkyrYHsXG+2f1ljD12MebpdTGBSsRpbqWdk0+2gsB1w4EGQsip7kciAMB2
	nkHkvJ02tlP91lHbbt7e5SCSVYXwgps5fzRqhoELnxfEJ/v9bcxq6dH0ZeyfDop/35qtQHVjfI9
	H3geEmrRZm+m3skxWfJYujFUhEdBZ9Y=
X-Received: by 2002:a05:6402:2356:b0:674:5b2c:d42c with SMTP id
 4fb4d7f45d1cf-69e6525c770mr6536246a12.3.1784584875096; Mon, 20 Jul 2026
 15:01:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707181957.433213175@kernel.org> <CA+=Fv5TDNH8+JAojV9_W36kUkEE68uiA00FQ7i0vJunebqs1sA@mail.gmail.com>
 <87wluplb6k.ffs@fw13>
In-Reply-To: <87wluplb6k.ffs@fw13>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 21 Jul 2026 00:01:03 +0200
X-Gm-Features: AUfX_mw5696pn_wiz_LjCaJHiFU9IchwhNNUbBWmuIdhtqSFIK3TJnj9-atYCBw
Message-ID: <CA+=Fv5Sd5+-K3-MOiEc2N8z_5CoLQPVPUwjiugSj3u8cBWJXXQ@mail.gmail.com>
Subject: Re: [patch 00/18] entry: Consolidate and rework syscall entry handling
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>, linux-arm-kernel@lists.infradead.org, 
	linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-arch@vger.kernel.org, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thomas,

On Mon, Jul 20, 2026 at 9:21=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> w=
rote:
>
>
> Similar to what Peter and me suggested in the related discussion
> vs. s390 which has a similar issue, you can just have a dedicated
> syscall_return member in your pt_regs struct, which is preset to -ENOSYS
> and operate on that. You have an unused padding entry there which means
> it won't even change the size.
>

Thanks, that makes sense in principle.

One complication is that my Alpha GENERIC_ENTRY branch already reuses that
former pt_regs padding slot, while keeping the pt_regs size and stack
alignment unchanged. The extra syscall-entry bookkeeping I needed so far li=
ves
in thread_info rather than adding more fields to pt_regs.

So the padding slot is not free in my current branch. I can still look at
whether a dedicated syscall_return scratch value would be cleaner, but the
tested version currently handles this by setting the default -ENOSYS result
only on the no-dispatch path, after generic entry processing, and only if
ptrace/seccomp/BPF did not already provide a return value.

>
> You were on CC for the V2, no?
>

Sorry, I must have missed that.

> The whole pile including Jinjie's seccomp bypass fix is in
>
>     git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/entry
>
> and is targeted for the 7.3 merge window.
>

Great!

> If you want to base your stuff on that for 7.3, I can add a tag which
> makes it immutable so it can be pulled into the alpha tree.
>

Yes, please. There is still some ongoing testing/review of my Alpha
GENERIC_ENTRY series, but assuming it is ready in time for the 7.3 merge
window, an immutable tag would be very helpful.

Magnus
