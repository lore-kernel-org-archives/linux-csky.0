Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB8B4BA1F3
	for <linux-csky@vger.kernel.org>; Fri, 18 Sep 2026 08:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789721985; cv=none; b=jRxVrg9LncHW39J72G8UzgvVQS6dQRqQYH1a8Y/Jb3BH/uJnM4ZGDe4jacSCvn6Bb9zlCPhVJ0LtKs8R54zRqH95egijiKDAQEJIsVCMeqUonNjSUUUczcqaB9odGVD3umY42wnljAavUEojowXwjI5L8j8ndXPV11BgM/JO6vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789721985; c=relaxed/simple;
	bh=ag8wHUMdvAkX5UXW/sgiiILfewkFHxwIL+3xC1CLLP0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SxbanVrZl2gHcvrzjPV+Z13cvg0L8I2lFIdoCaMzAfdXMgiIwsOWtXZByUmtisif4Jh2FexYbAMcEGKyjzD2XoJivuKNgnYaotPuxCn/n8Oo9XKE7EYaRoIeZ0z5qrY1Yop3d7dWPRAZE0p0J3RO1dvNLcEcjwv4GB7Qqhn7CXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tw7XcUZm; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tw7XcUZm"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48431648f33so652233f8f.0
        for <linux-csky@vger.kernel.org>; Fri, 18 Sep 2026 01:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789721980; x=1790326780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ebKeWW1b/FCTysKRCA2qCKC9jXPhUpw/tMxPeazltLI=;
        b=Tw7XcUZm0rC0dkuh5w5E/veMnAhHyo0i7FcBH07sfDYi3aAAUsIle064UkwLQIZSMe
         useq7JQAeSSaz08P4uG5jY5l10RZd7riLVIKipTE9RnSidBNPtYxPGEWSjBSnPqpNux2
         qVzVyMbACCUE/cE4CgY/Kec/zkb0hCVMAz/BXbqxKszI3bTE5A3+TFTczN13inT5sLFt
         Zm0WVYEHp4fl6PyZYQOO+yiI1UcBFS2DETFGYgkUW9tLY3uwCTRMSYNgt+A87U8/iJl8
         fF4FViJlCDt6G3SGpB1D06SoBeUUvIyOIhYkF8ejii0kdeyP+cV23dJ4736Kqzd0u1H8
         qbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789721980; x=1790326780;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ebKeWW1b/FCTysKRCA2qCKC9jXPhUpw/tMxPeazltLI=;
        b=q3yde0FsTi2C/OTWGef20A+1PC2ayi82ZZnlm2rJjqFGpjBLYu8S7TahlVcSDnUUdP
         2g4b4f0/zBquyoG5rhErUo8/FMlHl46gzvHwA2AAd72PaqbNLVD6xe6PTnGKGDNicUFS
         UZjJSi0XXuOtwOB1tD2WQqYXJ+Up+TAUfojGdoUMjfpazoqFKxHaIMdoazQuxuTqu+rd
         U8F+UHkchndEr2A1+Gm5JvF1A90s/+BKZp35NUWMgeDVhc3FJ4Z10TJBD+v2CxSmgRWk
         L8L6C6ORxnMhEmCkFJllf1eM8Q7xhmBYlg1WFujpkIAJsxKiJm8Lv0BD+21hgAhZ8+fK
         liUg==
X-Forwarded-Encrypted: i=1; AKwUvBzAwX4aNcrlbLA0wpFHzzUFr0spbqDnyOTOWj1/e6bsFB+oAEIgjt6XOOCiU+Wa6jhRbWdVRmifhvaV@vger.kernel.org
X-Gm-Message-State: AFuF++l408bsIG1BBw2SSeHByNyIdIQ4586fRvJWxJpnVsriNhUp4YyB
	eOFbh7KUX9Zz0oiY7dXsj05sfowtx9EvkDzJ+wQHMipRbOyXbwvA0dOE
X-Gm-Gg: AYBFou3GKq/N+x27Wi4fPhwQ2Hdj9JHyC8wIs1xXH1mx3hxy5nI9k0stMDJqWHtUxNZ
	2x7u5h60Q/Mug23Mfc3jgdBp5W1u6Io1Basg/z/AXsjBBACKW3GOcaj8lLbUnaaMZef0kS8OVVM
	9WqtroVMsz/A6fZ8o4sAlrLEoIj0CljrJJFC7OUvrrD5cT7uFiKj0rFahC/rRRCOIeGpy09IciP
	LSWAUHzuSDMZxkpOuKMcyGc6NHvWrZV2yJIyanK8oR53FZlExanqBSXUGwVe0IwlLa/e4rDsYTL
	egsWx2ktr70MPll9gcaSUynfc/iaFFzz0NebA8yoEHK/+D5M2SsZ7rhf7v7ZkJ402h2QWNTuCS+
	yTEUNQxKKKAyEDGDT4H821tvt5WpdR8w04krW+2GC+RF/xhUaLhixULwZtglTH3yfxAl0eW5dZv
	S/qveZ3vul8PVdb3kC7NF8mMaf6Qe4hrzmz8M3iz4/fsjokZ4/oq0JiThBKvJLPlFYr67ACS4Jz
	tl222a6SFaJXPRMJ7bv3WYKgZ5/Yyb4e/vO
X-Received: by 2002:a5d:6f06:0:b0:485:8d9c:47d2 with SMTP id ffacd0b85a97d-48713c7ef38mr9129868f8f.30.1789721980248;
        Fri, 18 Sep 2026 01:59:40 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872008f34dsm2547841f8f.36.2026.09.18.01.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:59:39 -0700 (PDT)
Date: Fri, 18 Sep 2026 09:59:38 +0100
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
Subject: Re: [PATCH v3 1/5] lib: Add two-byte cmpxchg emulation function
Message-ID: <20260918095938.6082a31a@pumpkin>
In-Reply-To: <20260917163830.3748-2-brads@mainlining.org>
References: <20260917163830.3748-1-brads@mainlining.org>
	<20260917163830.3748-2-brads@mainlining.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Sep 2026 16:38:26 +0000
Bradley Morgan <brads@mainlining.org> wrote:

> cmpxchg_emu_u8() emulates one-byte cmpxchg() in terms of four-byte
> cmpxchg() for the architectures lacking native one-byte atomics.
> The same architectures also lack native two-byte cmpxchg(), where
> such an operation is not supported and either fails to compile via
> BUILD_BUG() or fails to link, because the bad pointer sentinels
> these architectures declare are never defined.
> 
> Add cmpxchg_emu_u16(), the two-byte sibling. It reads the enclosing
> word with READ_ONCE(), splices the two target bytes through a union
> and loops on cmpxchg() of the full word until the compare succeeds.
> Like cmpxchg_emu_u8() it is fully ordered.
> 
> Unlike cmpxchg_emu_u8() it casts the old and new values to u16
> internally and returns unsigned long, taking the old and new values
> as unsigned long, per the suggestion from David Laight. The switch
> statements in the architecture macros instantiate every size case,
> so a cmpxchg() on a pointer type checks the two-byte case as well,
> and a u16 parameter or return would make the macro casts and return
> conversions warn there. With unsigned long parameters and return the
> call sites need no narrowing casts, pointer exchanges compile warning
> free, and the function still compares and returns exactly the 16 bits
> the caller asked for, which matches the hardware cmpxchg r16
> behaviour where a 16-bit compare only looks at the low 16 bits of
> the register.
> 
> The Kconfig symbol gating this file is renamed from
> ARCH_NEED_CMPXCHG_1_EMU to ARCH_NEED_CMPXCHG_1_2_EMU, as it now
> selects both the one-byte and the two-byte emulation.
> 
> Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> ---
...
> diff --git a/lib/cmpxchg-emu.c b/lib/cmpxchg-emu.c
> index 27f6f97cb60d..ac1c84383887 100644
> --- a/lib/cmpxchg-emu.c
> +++ b/lib/cmpxchg-emu.c
> @@ -1,10 +1,11 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
> - * Emulated 1-byte cmpxchg operation for architectures lacking direct
> - * support for this size.  This is implemented in terms of 4-byte cmpxchg
> - * operations.
> + * Emulated 1-byte and 2-byte cmpxchg operations for architectures lacking
> + * direct support for these sizes.  These are implemented in terms of
> + * 4-byte cmpxchg operations.
>   *
> - * Copyright (C) 2024 Paul E. McKenney.
> + * Copyright (C) 2024 Paul E. McKenney <paulmck@kernel.org>
> + * Copyright (C) 2026 Bradley Morgan <brads@mainlining.org>
>   */
>  
>  #include <linux/types.h>
> @@ -40,6 +41,35 @@ uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new)
>  		instrument_atomic_read_write(p, 1);
>  		ret = data_race(cmpxchg(p32, old32.w, new32.w)); // Overridden above.
>  	} while (ret != old32.w);
> -	return old;
> +	return (u16)old;
>  }
>  EXPORT_SYMBOL_GPL(cmpxchg_emu_u8);

Where did the (u16) cast come from?
If you want to mask 'old' to 8 bits it would be more reasonable to change
the function prototype.
(Although I can never remember whether the caller or called code is
responsible for masking the value.)

David

