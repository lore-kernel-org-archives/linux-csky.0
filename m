Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CD5450409
	for <linux-csky@vger.kernel.org>; Wed, 23 Sep 2026 09:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790155724; cv=none; b=eANQJW69DBNh+njou9HU54tjz26OgefIJRgQ4liX4E+Bf5SolB88QGa+PsFDOJRfgpfh51L50logU65a2Bf9YQmUhcKOkElr827SyBjJkJZTuhJBIolGspyC7U6B9Jlehtpe9S7HJxmZS94vz1W+CuVi8xIQKjfYpscl0euSdmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790155724; c=relaxed/simple;
	bh=eKQNdHt+hhAAjn5VJiqGyCUamYddAWI7/Er5YHSBndM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W9tUJdZNDMiXk2STwZw8B7RHjJS1M/kcKen0Re48E2VPUwoZPeJUskPXwcUWv84X41VMZ/lEEsc7Z+2g8p6iJ7plv6cZ80jNNOJpwFh3+HVZvMIlnSlVRben6KaQqfy/+LSyoCXaXDHUOvJ6XDhRce3mUBw2WXtJk/QnQI86V3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VK32VceR; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VK32VceR"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c3so599981f8f.1
        for <linux-csky@vger.kernel.org>; Wed, 23 Sep 2026 02:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790155720; x=1790760520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Op+1G3Jxi9SdULjib67/1vBJNLUR2DhfwMdslr3CGLI=;
        b=VK32VceR6fWNd4+HvsPwSwCtgcnAY9SMwCt64LPwFGxbvQmM+d4Fh5ciQJfnDY+adl
         o0JaduaeSBfU0xFVGltxsIJ8l7kK4qCPjQQgWQQKUpfsPpPew6CVRR5DhBqbA207cz/8
         WYMZ3p/AyjVTb9I7ilFqG+FD6Ypvij1AOhrCK7kZUcMFy4knCXUuuLvRw79lSlM3+ZuN
         JfqtG68XoxblIvawKrDcAfHK1Q4q5xZr3uZXLXTTsJhrkZ/WPEI48VBU8e2ZhDSa3TSI
         qEXcs9MYLe3tGG2Hc+CrQcaAeyL9TbNIBQKPNPtNCWhsACfHcVMT2SJuy+4tT9HHrJfK
         YmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790155720; x=1790760520;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Op+1G3Jxi9SdULjib67/1vBJNLUR2DhfwMdslr3CGLI=;
        b=sgkhAo9IujGg1SX6ZcBsEdTrvpLhxhr7asZLrUdIqnccxA+sjzJuCsK1Y3NVkiNvgR
         ZMOKO/YRljTnkWfmJUZ/dKSL9ybXciTEf3yazseUcLT+MjZtvtURfwCo5gdNcnZRqT5M
         N9AsqOKhRMzIp8OS4pDHChgAB2gZXiyRowjP6GS2xz7mIKdYyCSQg9SkokVp+ZfpaxhT
         oPVZmzvecyraOLbIBv8Kisjw2kAp+af0P85NqIfqGDk5P4+2IgL+DntL1E/VsFE52p03
         68Be1usb+46flQxNQkqp5ev3OXOVG6ABkVxbHTLnkZUxnUrXI6HV47+HINW+psl9YTPI
         fHmA==
X-Forwarded-Encrypted: i=1; AKwUvBxaIl4L4p0+M/Wil/TfiiVaoRBsSKnwCVsR+K8R6x67E99GNXQ/wLFGAio9Fr2HPPb2ffHBczoh7goU@vger.kernel.org
X-Gm-Message-State: AFuF++n4FZmsKk4jSpcsA1+e4yeURmugooigHb3D9LAKG7aGYCFuraZT
	Ut56YHD9QDesO9zUzQpr1fcoWXqGT53nFCzNq/iUDLVQo3rFyO9fRthd
X-Gm-Gg: AYBFou0dFVsqSyKezNCvGYQ6FWlAr7lmeKMXWNqPRJFVrv5f+tr92WOntekGy8edbT0
	wzaUn1SpOsmnM94Ca++Ik0tFNVeUI3jlL2wyR/NB0lTfZY+MQr7yyLBMVnStvBYyFvgwNmGATvF
	JcZCxTG0qd/9jGkuHu55kSXzXNI5mmFS/qRKd5zbGNvhkn0dzGW5pS6LQDcnIy+YH8a7C0L6sYi
	ujuYZKZoNk/GIrzIsTg4SG8pmZ5OwbMQWZ9xsQTCgwVEDgoaj9STCTxCkFISPGeZUMLIzifLxYH
	stH9uMW5ZnHoqeytKviR79PLuR5ai+d6APDbSNWqTn3dAgRMM4DhhL6ZvKJv4UmSloZ83Egib7C
	SvMyd66n9NzLyuoq5BEGhsfjjrOB/gcYfIX45ks4nS1htGimqhpFNQ7ysBCftXg8DcvfEjcRZRs
	yVrsz0k1R2o6vW44kDjMqufuGAb1PgkHEp2o7G2UmDBmUUtb1TUjRa7wuyLJotvVl9qmb49zijK
	l3MUb4TW46NeTSsI3NKR8VuCDK+G9qFJgdUYDhD9h3qrA==
X-Received: by 2002:a05:6000:3ce:b0:485:8c16:5ef6 with SMTP id ffacd0b85a97d-488670b342cmr3399764f8f.48.1790155719650;
        Wed, 23 Sep 2026 02:28:39 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c500sm5584975f8f.19.2026.09.23.02.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:28:39 -0700 (PDT)
Date: Wed, 23 Sep 2026 10:28:37 +0100
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
Subject: Re: [PATCH 3/5] sh: Emulate two-byte cmpxchg
Message-ID: <20260923102837.2b46d772@pumpkin>
In-Reply-To: <20260922173354.14404-4-brads@mainlining.org>
References: <20260922173354.14404-1-brads@mainlining.org>
	<20260922173354.14404-4-brads@mainlining.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 22 Sep 2026 17:33:52 +0000
Bradley Morgan <brads@mainlining.org> wrote:

You missed v4 from the subject line of all the patches.

> SH has no byte or halfword atomic memory operations, so the __cmpxchg()
> switch routes case 1 through cmpxchg_emu_u8() and lets case 2 fall
> through to __cmpxchg_called_with_bad_pointer(), which is declared but
> never defined, so a two-byte cmpxchg() fails at link time. Route case
> 2 through the new cmpxchg_emu_u16(), which takes the old and new
> values as unsigned long, so the (unsigned long) casts move off the
> call and into _old_ and _new_ declarations that type check the old
> and new arguments against *ptr through (unsigned long)(0 ? *ptr : _o_),
> the idiom David Laight suggested, so cmpxchg(&p, 4, 5) no longer
> compiles silently.
> 
> Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> ---
>  arch/sh/include/asm/cmpxchg.h | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/sh/include/asm/cmpxchg.h b/arch/sh/include/asm/cmpxchg.h
> index 1e5dc5ccf7bf..b87f59107b4e 100644
> --- a/arch/sh/include/asm/cmpxchg.h
> +++ b/arch/sh/include/asm/cmpxchg.h
> @@ -59,6 +59,8 @@ static inline unsigned long __cmpxchg(volatile void * ptr, unsigned long old,
>  	switch (size) {
>  	case 1:
>  		return cmpxchg_emu_u8(ptr, old, new);
> +	case 2:
> +		return cmpxchg_emu_u16(ptr, old, new);
>  	case 4:
>  		return __cmpxchg_u32(ptr, old, new);
>  	}
> @@ -70,8 +72,10 @@ static inline unsigned long __cmpxchg(volatile void * ptr, unsigned long old,
>    ({									 \
>       __typeof__(*(ptr)) _o_ = (o);					 \
>       __typeof__(*(ptr)) _n_ = (n);					 \
> -     (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,		 \
> -				    (unsigned long)_n_, sizeof(*(ptr))); \
> +     unsigned long _old_ = (unsigned long)(0 ? *ptr : _o_);	 \
> +     unsigned long _new_ = (unsigned long)(0 ? *ptr : _n_);	 \
> +     (__typeof__(*(ptr))) __cmpxchg((ptr), _old_,				 \
> +				    _new_, sizeof(*(ptr)));	 \

Minor niggle if you have to do these again...
That line doesn't look long enough to need splitting.
More generally if you add 'unsigned long _rval_' and put a final cast
at the bottom the the #define the code will probably look neater.

David

>    })
>  
>  #include <asm-generic/cmpxchg-local.h>

