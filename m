Received: from mail-wr2-f38.google.com (mail-wr2-f38.google.com [74.125.225.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432F539B4A5
	for <linux-csky@vger.kernel.org>; Fri, 18 Sep 2026 09:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722610; cv=none; b=hbloq3rYnvO0+xxFesZfvt2ZVVZ2VLvqBL8+GDVlfSY/8FFxlmcOszlCN3TqZsK3SGrhfjEFiopv2XuOLHIwTXUWf18H0JhBGKhCJQ3T17p+n9kouCxiDSsznpRwdRPPM1nT9vs96PPjRecskgTcmOyWEWoeWuXY/ySQcV3F7pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722610; c=relaxed/simple;
	bh=5KphqyRcDRyQsFPoykPOf4gJm5upFtblvDJSgHIJlNU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mXWFt2q9YGQWGsxkDLwqQ7eOM7lbzUmIqxQlFaLJNBq9SaeSRiZIm/qaI1ge9C8MZEsk8YnqqlaVnjZ4ATTa5MoW7j/Z/2zCAIaDmwveX/TnFO7NiLVrz+Ig7jDOdqFERLn1LKq9bR1GzQxeKnUv5BPHk9rm7cXatSuh+6bAvTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LqSXrERL; arc=none smtp.client-ip=74.125.225.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LqSXrERL"
Received: by mail-wr2-f38.google.com with SMTP id ffacd0b85a97d-482f6350f89so271497f8f.3
        for <linux-csky@vger.kernel.org>; Fri, 18 Sep 2026 02:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789722607; x=1790327407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NEA9aek5vNuu7I8nEFfi0rFdQ9PD9h+hnZ3KY6uKWvs=;
        b=LqSXrERLgtZpC7gvAspaFFbEPse4UBtzL+dpqIbDhwaW5ccJHLv6IwvjSQBc+vhYeN
         T2kkaAq6RSV6tMicKasFuvue+lk68K2oM3wsmnyP4T/Mjq762KCmQ/cpr/uiFje279Dl
         2sZok8mIMEYEZ0aAkLbdDfcv42EYB7mwu7h3B6vFuEtpfX2hl2q3KOKwfFvnktFCVTWh
         qngquhBRvE0+JjV/uY1xhW26Nv9aL/eWMa86t8mTlgUtNDpQejBTgdzTK62Dq35iEisi
         MdkbsXM6nBauk2t/vABF9sB0zbvZCw2/uKJHoYOwAB4NgOgN0VX/dVdlHng2a51vUX3R
         qsyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789722607; x=1790327407;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NEA9aek5vNuu7I8nEFfi0rFdQ9PD9h+hnZ3KY6uKWvs=;
        b=KDbZRGc6HQyerNzkePpnVr8saIEZEdd3Nmkd39jmaA4ESJkTq8GlGuYipp0K6anCj8
         Jx0xOKHb+5qixTclGEb7AU9j+4N90ePlWOb1Fm2TOsYNvTHv+iNbFe00A0oaCTXvaimn
         RxdFtKVKznahejbb0mLjyw47FgOyLQgZ/hlHEZFfoAkGx+s1qisJuqe1saKipIcPH+b8
         2Xrnq8I3oyQnSNFVg1ySvcDH8od2BCk52V9sLt6x/CKadyFg8W9e6yjSUw6ANV5Z9WOK
         O324Dmewdszcz+qMbAD/QVqzoRClAZZGmvuEFqCBzTYEwzgolpgYv/3wBOMpqw8piOt3
         QJGA==
X-Forwarded-Encrypted: i=1; AKwUvBy+qBdqP0LeGOAl+i5Uz3DmMZDhmx6g7cvYd2XP9suTUVysC3QTaGvcl0rwVDMd6IMhIctbZOE9KNlp@vger.kernel.org
X-Gm-Message-State: AFuF++lPG0Ez6WPl4GZU/opmoBpxrrDZBZWhxtIjxOc2V07/bufYe+in
	T7HFbPuFnmb1Wyog+WIOmLblCwUBjElRt0bq2/KxpE0UAIYvqyrHGqZg
X-Gm-Gg: AYBFou1VZRe5cq65Ert3aSRZQxj0ltTWdYjOhmeqH8YNbW32PVd5jOLe+92EOXGPH52
	/iZwif7K5jimFZnbjz6geDDTyOM+Z1E+5MoyyQWZQNrreL7PFhjDWm2+vMMxkQ1LH2qcHKvYWBX
	uASodA7ydNez5LZ5gs8rrt/PtTHq4tC+6Qx8cZ9tJBRlJIbZhmx8sUfH6AHbZ523grNzjbG6DDT
	0qObbPiE/5jHwsOtRoYV0M1v1V9V/TxnZQiYW5s8o5bDcCDDM0ELSZ58ZaNhF5ZQ+nR0UxEupxr
	YzuKobUY7Hjdgz7/5ZH4NsDmdX5GOjX058AezQ7ydPOf9ycu2ip/TeXa+aQ0sCd6SwcUCwfzrfv
	YXHe3NmUmSLITjYt0buaRT4RKVZtuFf1YFNhRbA5BsBrYXCse4Zbv6cwUFZPz2BZB1oSFf2xZ6s
	1Ly6uQt34C+6gpRH/q3to2BA/lVWLIibA6zpFTZcQpqWCRE9n/3rlwXibSmNOyVHJ0l4OMQGzWq
	FPhctWqsUf1eXs0WdNFg7qv5jAo16eETWx/
X-Received: by 2002:a05:600c:3f0b:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-49fc5750c61mr18187915e9.21.1789722607156;
        Fri, 18 Sep 2026 02:10:07 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56aab7csm31503375e9.1.2026.09.18.02.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:10:06 -0700 (PDT)
Date: Fri, 18 Sep 2026 10:10:04 +0100
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
Subject: Re: [PATCH v3 0/5] Add two-byte cmpxchg emulation and wire it into
 the architectures
Message-ID: <20260918101004.731bf2e5@pumpkin>
In-Reply-To: <20260917163830.3748-1-brads@mainlining.org>
References: <20260917163830.3748-1-brads@mainlining.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Sep 2026 16:38:25 +0000
Bradley Morgan <brads@mainlining.org> wrote:

> This is v3 of the two byte cmpxchg emulation series, wiring
> cmpxchg_emu_u16() into arc, csky, sh and xtensa.
> 
> v2 tried u16 as the parameter type. David Laight pointed out that
> this does not compile warning free when exchanging a pointer type,
> because the switch statements in the architecture macros instantiate
> every size case, so a pointer cmpxchg() type checks the two byte
> case, and the (u16) casts there warn. v3 takes the old and new
> values as unsigned long and casts to u16 inside the function, so the
> call sites need no narrowing casts and pointer exchanges compile
> clean. The function still compares and returns exactly the 16 bits
> of the emulated halfword, which matches hardware cmpxchg r16
> behaviour, and a host test of 972 cases across both halfword offsets
> against a byte level reference model still passes.
> 
> David also noted the missing pointer to integer type check in some
> of the macros, so cmpxchg(&p, 4, 5) compiled silently. The csky
> macros typed __old and __new through __typeof__(old), which skips
> the check, and sh had none either. Both now type check through
> (unsigned long)(0 ? *(ptr) : (old)), the idiom David suggested,
> which keeps the pointer to integer conversion explicit while making
> the compiler reject mismatched types. Both of his test cases now
> fail to compile on every macro shape.

You fixed csky but not the others.
I guess that could be a separate patch (maybe series).

David

> 
> The ARMv6 wiring stays dropped from v1, per Arnd Bergmann's offer to
> take the INTEGRATOR_CM1136JFS cleanup in his platform removal series.
> 
> Thank you, Paul McKenney for suggesting this, and David Laight and
> Arnd Bergmann for the review that shaped all three revisions.
> 
> Bradley Morgan (5):
>   lib: Add two-byte cmpxchg emulation function
>   ARC: Emulate two-byte cmpxchg
>   csky: Emulate two-byte cmpxchg
>   sh: Emulate two-byte cmpxchg
>   xtensa: Emulate two-byte cmpxchg

