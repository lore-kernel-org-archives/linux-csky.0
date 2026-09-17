Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609114A2633
	for <linux-csky@vger.kernel.org>; Thu, 17 Sep 2026 09:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789635882; cv=none; b=ov70WWBfcpS/RaH03s43OmFi1I+kXAHPg/BtIKqX6J+AOuY3EMUkvtIabcMh/8uhKAvQJ2uUiy7lY8BEnpa12x5+b0EZT4gCO3Ze7o0Mj4pOr2AMw2zgENAhBEMYrU+E3ECqv8HcDxyQrgfYZp1X+N+Iji6U58gE/f7K1/rNiTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789635882; c=relaxed/simple;
	bh=O2KQJ1oKfBO/5CnrRZnd83vrj2aJY4SGdqRh0iO7Yh0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qSUgipfv3byRPgiFwKTd24a29eDXGgIMBn2hxNyu6vppiPAD6x9L34Wzys+1i28mYE58sb2fcP0nceUni8fNR8ftd3vWv/NEBKVxk6hBisf3EADacdQeMUD49Ioc2B3qepNL9LqS2vgz7UxOsRU+YrskMsVE51Fw09Uydtq0JjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSBK39xX; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSBK39xX"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso5354345e9.3
        for <linux-csky@vger.kernel.org>; Thu, 17 Sep 2026 02:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789635878; x=1790240678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2k9dKahryNmpFDhF3eaPjWDHVr7V9Y/xYKcgApds+0s=;
        b=iSBK39xX/iIQsJwG59yvwujfCzQtHvDgVdprqro+xGlKvv63U1/5qGFdkpqecO3Kg3
         Vb6NwNbeDDM0lUHMAGdq1AbtYFfe9YBfaqMI913+9gZwtk11uRLkzuwaQ5kd3sEMpIx1
         wvgUJVJeH4m9+ixPhWycFZ9hYI1ZKLCnFapE2qJe9X2z8yzJ5UDORQpsRJF9hh/kDaYg
         4nC4f8ERpsJm+ohouVO3Oc43+euk4yENAS1wGTXBQ5F8cfz7wNfthfCp5MSG5lTEwYup
         QIuMC5W5UVzkO+LKRudpW7dy/grsmpDgpjD6GGyx20Uw1uha726T1DgrALDq7VC6kY8r
         fibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789635878; x=1790240678;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2k9dKahryNmpFDhF3eaPjWDHVr7V9Y/xYKcgApds+0s=;
        b=QOUxTpulGlzRXjU4b7S1nm1SR7dDrRUF0ud9/kTHIK5dakYJu/Y4L4i7Z7q5mR9FdK
         L8Dddp3CcBsLOFny+GOe3omWcldXNLTw3mDI0vYIG3dnnBPG/yMeRXrA6g2GFlvw01oU
         MUNNpUD/axfzp2toVeAlEpbmg6tkupT2FUL8VvqKCzmxxjykTu56um104n1TiE4zyDrP
         kI3VE5gQMTbC0RWpNR+p7KgWZ0R7cDi19H0sQDIa4T2x7kWrDTN9NtNYF1shTw7g5hCA
         8gGSfN+lhJBlxjxdcnNt8ftkaThZVlJpppVkkTMHu17O3H9Jan1jKi+64Owb6MbVd3oa
         y0tQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6IYuGok46dCBYBxwjRcQlPnnacBWGETJTX+1ZpKTFIu4RHja4blAswwGqe4gGPrTfTlPcgk9nZ2XI@vger.kernel.org
X-Gm-Message-State: AFuF++nTXvZrvUa3vWyZqehMQhPjnmh/RldIFZg7CGL/M3DDRiOvynhb
	vLeix+7NHFSqquc9XaiKPsfnccxcxim04PWXBEmmSHFBY+ARiwOgQb+J
X-Gm-Gg: AYBFou3Rv6KISL84z73mE/ZC8eNTHFw6KlF9r31VOoesGGDiYigr0uL7+ujkAOw8M8I
	xBxUfRu04U8466EEWrCV/LJ+FZZsm0CVxWqSkuykJthZxnwNM6gON/LCIn1ufAMrxGibIoyml+d
	VO/PsSs9rJrK+NeitJ+wdoEXQmgVz5jbfsHcQjQtL5QxsMlyakQGiCH5Crj4LZMn6RSVwvMAm09
	LxDi7T21N1bTnKbvbaChGcxzEpNnmRTgUuFOWmS3AgKB4C9f/h7oCnqKJwyVxMPxQHdan9p67e5
	CQtgUh8BMhlx5RqreoBdR8gRPLD1dn957MVhztOf8kxCSJzItFYTZM9bnkE6tQX7/I5+CpWz1Jm
	Wn21lYhRi4qZnwZmGgHx6EX+fT37YqQDIE/5znrxtHEbxqsRdBRPL534iNo/K2iuYNoheny5ew8
	cOrozRMG/rLqf1KZy9sTdyfsNR9FnCxx6z4EVVjkZ80K/545CrTs0GimquyQV8DM8lNrYAz4+Em
	scGYfnHyaO76ud0sazMrRfz4XdLzjcEMRjF
X-Received: by 2002:a05:600c:1d29:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-49eb72fc10fmr71803655e9.15.1789635878139;
        Thu, 17 Sep 2026 02:04:38 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbbcf5277sm74911055e9.3.2026.09.17.02.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:04:37 -0700 (PDT)
Date: Thu, 17 Sep 2026 10:04:35 +0100
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
Subject: Re: [PATCH v2 3/5] csky: Emulate two-byte cmpxchg
Message-ID: <20260917100435.664cf00d@pumpkin>
In-Reply-To: <20260916200215.21774-4-brads@mainlining.org>
References: <20260916200215.21774-1-brads@mainlining.org>
	<20260916200215.21774-4-brads@mainlining.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Sep 2026 20:02:13 +0000
Bradley Morgan <brads@mainlining.org> wrote:

> CSKY has no two-byte atomic compare and swap, so the __cmpxchg()
> switches in cmpxchg.h let case 2 fall through to the undefined
> __cmpxchg_called_with_bad_pointer(), failing at link time. Route case
> 2 through the new cmpxchg_emu_u16(), which now takes natural u16
> arguments, so the (uintptr_t) casts on __old and __new become (u16)
> casts in all three switch instances.
> 
> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> ---
>  arch/csky/include/asm/cmpxchg.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/csky/include/asm/cmpxchg.h b/arch/csky/include/asm/cmpxchg.h
> index db6dda47184e..e53628268e8c 100644
> --- a/arch/csky/include/asm/cmpxchg.h
> +++ b/arch/csky/include/asm/cmpxchg.h
> @@ -65,6 +65,9 @@
>  	case 1:							\
>  		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>  		break;						\
> +	case 2:							\
> +		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (u16)__old, (u16)__new); \
> +		break;						\

Did you check that compiles?
It needs to compile without a warning when exchanging a pointer type.
I think it would be better to make both __old and __new 'unsigned long'
adding a cast in the definition/assignment to convert pointers.
aka:
	unsigned long __old = (unsigned long)(old);

(The cast on the call is separate from the type of the function parameters.)

Not a new bug, but there also doesn't seem to be a pointer-integer type
check here (there is probably one in another architecture).

I think that means these compile:
	int i;
	int *p;
	...
	cmpxchg(&p, 4, 5);
	cmpxchg(&i, p, 5);

Simplest fix is probably:
	unsigned long __old = (unsigned long)(0 ? *__ptr : (old));

David


>  	case 4:							\
>  		asm volatile (					\
>  		"1:	ldex.w		%0, (%3) \n"		\
> @@ -98,6 +101,9 @@
>  	case 1:							\
>  		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>  		break;						\
> +	case 2:							\
> +		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (u16)__old, (u16)__new); \
> +		break;						\
>  	case 4:							\
>  		asm volatile (					\
>  		"1:	ldex.w		%0, (%3) \n"		\
> @@ -132,6 +138,9 @@
>  	case 1:							\
>  		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>  		break;						\
> +	case 2:							\
> +		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (u16)__old, (u16)__new); \
> +		break;						\
>  	case 4:							\
>  		asm volatile (					\
>  		RELEASE_FENCE					\

