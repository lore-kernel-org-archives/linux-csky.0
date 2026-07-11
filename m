Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31723C3BFF
	for <linux-csky@vger.kernel.org>; Sat, 11 Jul 2026 12:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783772968; cv=pass; b=KG5Wngt8JdbjqT/FkjHgsCzYCrd8mOaovplgqUQ/5jIjTAeaCLdclp7XIYjN/H4tRSZLpXvZkUDlJR7NwbjE6/wz2rcf21X2pIgEr/mkNpvwRIs3xv1se5CyLdas9/pZTFYxuVn6LMs7ZNSibXdQ20yJlP0bHrAwFaqxv6cKzw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783772968; c=relaxed/simple;
	bh=lgplXt8OmmYK0O5s0vGlPCfavq5E5GB8C7ljQ3QichI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PfjSMY4/cKeMDZ44GcXdaCdKqUAu2L6XiLewWQJHJhwGvRDmr39z7eqSc69sE6YIXOL/jO9SZrQAt7HaOM1zkKR8WxPBY/jzaSI3VZAydZvYvdkj6pXMSvN3JIu1zliH/M/wV6ViNxmLM/5/Y4tTzbbeWX+tKB1waXVnfzf1vyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhVAsJnP; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhVAsJnP"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-698bf053053so2732018a12.3
        for <linux-csky@vger.kernel.org>; Sat, 11 Jul 2026 05:29:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783772964; cv=none;
        d=google.com; s=arc-20260327;
        b=rThQ874jvjmMw3jV6JUww3qjCCtwVihJXWfI/5DAeJEJ8BrcyZuLCyNGA/ZFgDUxb9
         55J1c2PJdA5Ed937S3FolLDcZgL3jKfm6Tht7brUSnf64K1WVTeh1rtiN+0ZUbwnpbzT
         IhPBZjf5MPEzo8gE2phnlin1/aC+hemdts46BAaKRRgLWnpLB+N+Y9NWdshtCl8NMU29
         k1LYtSjvXHR+ZAqB77oJ8p4PD/ezAVqLQRQ6gMqUVcrOV+YehtRSXl3oFWw5sC9YNG78
         LVMBYFaFAHf7JBhCX+tp09kpAWZaiRmmmNqb7qMJP+bvQB7nsD34/fhpcWN5/bzr1ZKi
         ytcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=83oOaaTreHaoFIhiDoHcddDWSjKDujW9xu9zE75la/o=;
        fh=DtsEUtSqvszrHouIK8+YTZvLONvTo1F+dFagzQfvXdU=;
        b=a3bmxiBwM9XNRlBsk5L9vIAcGsBHoB99GaWOtHGAgK4LoBHLjXmNjkA7sEp34SJj8I
         tp0rUxIj0i72QikQAD0R07aRuorcmpfxtD0EK+1f7W13n8m9qIskIUEoE8CP626VYMPU
         kpWpaE/PcgEwtfzBuWDdjXguhiWVZVHryzMCY5d24yZdbg52nOeLC2zIKAy6ZKYl0hJF
         n5rvbhw5zBF04eGQ+RbPZ4PWdC8D4z8w/qbpl6mU+N3bvzvvEwU+AzHJsmIS/DeHnAS6
         zmenkc9rbCp7SAVHDry5bXgrMMX9VHMA0ljKCOV5ZT0u2qkaD+z55qTki7dxDZSWfhob
         1iag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783772964; x=1784377764; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=83oOaaTreHaoFIhiDoHcddDWSjKDujW9xu9zE75la/o=;
        b=KhVAsJnPccLQtlT6BW0pZOI6M33Kq5peNIi+brKc9mXt9N7FYBNxZiwumx0gXF4fIo
         sAO6rzobNlVEoIHs9Nr5Ud7Pqw06Wde6xz1P1K2kPK3YZyfFF/QcLy13zXrkpb8v6zCE
         wa1FryKea8CiALQ/FW+b66R5gxrKvaJKvQ5Z1BuPJv6JghHzUORCw6XB09TKL/k9s/1r
         i0N8avEwa/AHjCgBU1q0AZKoEW1/H84E5Jz1kEDp/nKMXzLRh+UDioLCoc7tRKEjgsZq
         3/2AvXjdSUp8fEKFVNQm320lqiCV3PxeKpLmb2suZXyxqugmSpsqzHjcuuYpicZfDTox
         leNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783772964; x=1784377764;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=83oOaaTreHaoFIhiDoHcddDWSjKDujW9xu9zE75la/o=;
        b=bcwhGc7vygSrAIhbQo2uEABIAAejdUytH9gvYNFfce+TGooPnuxpt9dFOm4HJQfrXk
         eMgvnoelUTpH5gxDIjv/CiIkDR+Zaax69RKL8GTw4Sc5f2kllx9G/NogC6bHvvrcqs/z
         w25LEA2qH3IhiDW6RbNizHJE7grsxxzRRSUIJNp8rQjjrypTgJTKZRSuORLVYooZDWY/
         LT3QnSyu7BTsCkWy7QjgZUSPciOuACAru7s1JE8TDn4fqyMCzkRPcWnUN5a93yoFRsT8
         6HGgoED0To+XsEDmvECLaqGtkcM7QGdBqbu6dqbmB7dk56JslGO5samyMVtm89oR/BdL
         55sg==
X-Forwarded-Encrypted: i=1; AHgh+RrXY02s8J+1fgK/6SBH9BH+o59i30L88txqMhOOEvacLhB23gdFoHZzlAzV3pUGCa10UxbDcFvWqi+R@vger.kernel.org
X-Gm-Message-State: AOJu0YyYtUf18drOxYpDNx5iR/sX9/yL2nu+aGaiT6QwAhL4UJS5DRom
	lPQh/83i+izxiFVNpZRQLvlTNZ2G3H4qu+7iev8BnO7jiJyHX/7V7xbxo9zOYt86pUPHo5pFF4z
	L/XIB16L4nkIs2yEeuSsqOZKlpYlbgJM=
X-Gm-Gg: AfdE7clA8uT09NxoefT/ikbobCzW5eON9K12OthdRGuH1hdfQ5we1IymaxCxbrOfR75
	HKOftC/2xZgbhRF8Xir6z9n6SNXlHx9AvHtWMaZCLn/V50182i18gqSfeEWdT+v555Bb2cb7R7x
	0DzAQHUUCEamjAu9qYnqoK71ooOqsbtz1jN56KCKHpgZQu9vfe+qUxFs1ECaYj/KIghtIOYy/EH
	GE7wpWuTOWsg3BKXpugp+P8Ry6qFKoRQXjnLUKn0ufEnbFN1F7Cl1DKYjqLOE6hT3UZf3BAh9tb
	9G09aGZTbDMy9y9fc8/zot+hgteGsYHgs7iWlOW5fsuAGN55I3YTQKoeA+9kKW4=
X-Received: by 2002:a05:6402:3512:b0:699:728e:48b9 with SMTP id
 4fb4d7f45d1cf-69c5edb9cb3mr1210325a12.0.1783772963919; Sat, 11 Jul 2026
 05:29:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707181957.433213175@kernel.org>
In-Reply-To: <20260707181957.433213175@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 11 Jul 2026 14:29:12 +0200
X-Gm-Features: AUfX_mzOlRB8ana7x7qPQc4frMU9J060tNH0Z2GPCNvL1LYqDKQBjM-XzHbrvno
Message-ID: <CA+=Fv5RpgQ-UeGAT+VcLufte2gAp0H=J5GqZEFR_SuQsmnzy=A@mail.gmail.com>
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

>
> With that all architectures using the generic syscall entry code follow the
> same scheme, apply stack randomization at the correct and earliest possible
> place and skip syscall processing depending on the boolean return value of
> syscall_enter_from_user_mode[_work]().
>
> There should be no functional changes, at least there are none intended.
>
> The resulting text size for the syscall entry code on x8664 is slightly
> smaller than before these changes.
>
> Testing syscall heavy workloads and micro benchmarks shows a small
> performance gain for the general rework, but the last patch, which changes
> the logic to be more understandable has no measurable impact in either
> direction.
>
> The series applies on Linus tree and is also available from git:
>
>         git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git entry-rework-v1
>


Hi Thomas,

Thanks for the series.

I have an Alpha GENERIC_ENTRY series posted and planned for the next
merge window:

https://lore.kernel.org/linux-alpha/20260706170019.2941459-1-linmag7@gmail.com/T/#t

Only its final patch intersects with this work.

That patch removes Alpha's architecture-specific syscall_trace_enter()
and syscall_trace_leave() implementations, so the Alpha changes in
patches 11 and 12 will disappear once the GENERIC_ENTRY conversion is
applied.

It also currently uses syscall_enter_from_user_mode(), so I will need to
rebase it onto the new entry interface introduced by this series. I
expect the integration to be confined to the final GENERIC_ENTRY patch.

The Alpha-specific changes in patches 11 and 12 look correct to me.

Acked-by: Magnus Lindholm <linmag7@gmail.com>
