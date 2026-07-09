Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87CD3ADBAF
	for <linux-csky@vger.kernel.org>; Thu,  9 Jul 2026 18:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622763; cv=none; b=OjgLZThZsatJZa4HKFMd0cj+5rmo6/aldkilBXUqmaCzMAJgADXzN+3jbP2u8u9mhx/RimZpIeeFfNy5oQkOtBX6Ubhp+swKD3UDlGOIizTGZbjvS6a1BsrsMf8sTNNT0lJQlFp8v5s4MKna5HjW+O0kUrkFP+a9wqfBcuR4eUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622763; c=relaxed/simple;
	bh=A1OBNebquFU3MF2aPZ7eZX3e0k19s823QYdyxywOM48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F2LXvybnQ8wA5NcSJ53CHeFlGo9CjJIylTH5EFP92P1mYu3bwyHUxW/ddngUttH2pUt9di7/D738r5fL/RuO7/hFaUoylJVcgptayvcXEt7Ld3HDfesUzV+p+glz8xLvp65rU1MF+10u8YcMJsaBYo7tgkOdF++Oh8wfEJT9/pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNgoNUke; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNgoNUke"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-37ff8e0ad0fso250879a91.2
        for <linux-csky@vger.kernel.org>; Thu, 09 Jul 2026 11:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783622760; x=1784227560; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QPf+9G20chtvWfhmlbsBAcrLn3a4nXZU9b8fTPixMo0=;
        b=nNgoNUke/f1MZ5eE+crHKM0YOQq5ZkBsh74PZgOJtE++G8mwAbJRsJXHYA6pS4Ye+t
         6oJopVEcBBEZFcOyxvAajuQUyVlsZamjwm4cmMEJY/ouTJQdkoncHR+XWP7ZiKrdkQwT
         xCCDQ5Qj+0oafpi4BzuTPhDEnFIDi3wCXbA9VwjqRNqNMqXk9tHW/AzvAQIRm1ZzOjb/
         BT+WEh7otPgSn46iQlZFdHyJ3cGlALOWD2ySPAwZ5fX0dVyROH+JOkNUXVEtNfkykTBl
         aMzvt3hqqmjz7PKW+CzW4lZ7qte1NOe1sHDZrarGCrGLIpfhV/9vyzzjAXKq8mOLNRqf
         +6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622760; x=1784227560;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QPf+9G20chtvWfhmlbsBAcrLn3a4nXZU9b8fTPixMo0=;
        b=pAhcgJE1T2mf/D3sPjmgfRLYupLgEcoccXJdqGdlVI7rQiSHAHWdm7m6tJasP1TMsF
         41HqCxoEr6opfycLEnUyW7LvfNX3CRkcgmDhJerI++9xVSazwatMIdMtci6qVtR67IDw
         8Xe4yv/9Vyacrvc4/AxosyLk8R2IJXo3PcFaQotraeyf5TjuM6Ouweqd9rjsimiFWP+f
         KIxpJ3RBx8ys+KL2XVPHCJCE/LSVqi8DktFs7s2sWWQD2y/877xkfPbNwTFyMVowS56L
         RPvTAX4FQW9wqrB6q2XqrDa7aiRQ5RpFfD2KT2jR5J5aZuS7TfLPxZAU0hmtED/8dhgF
         I1RA==
X-Forwarded-Encrypted: i=1; AHgh+Rp8uiDfL7j4CV7ON/y8HtLI4LzWsImyf/Q6B/YdSLAQ93d03ZeCYUVr9W7Gm2pCOkhe7nCWvt6cRr7+@vger.kernel.org
X-Gm-Message-State: AOJu0YwFxFS5TILN/YHxwH/VbjwjIBrqnhn6IpW2gfEi/L6YMM3i8CKK
	Ycbzyfm2M0vv/tK5+CYj/HQB4Tt29g7PfnVs/R95GWQr2pZ9GlulesJL
X-Gm-Gg: AfdE7cnAx46R6/A/nQoLmwIYOtjfpO9S1wZXtVSSuDiYa6AYHh1Wk3vFoDln8H6fFty
	+ePEDi5rEzoPH1HpjA986IHS+HihNDMf29CnVqh1ZeNrrqgHxHyFL1skNt4tjACxtBd+MpQQ2Dx
	E0j4AIE8ktKbas9QZaxa2qQ5VAuIO4+pWeWoKp+5lj4h5OXRqfyjLiNzsD+Yx+zyBVbsKo8DLW+
	6MQqVu8dukRBN59T+WWcvjye7BWMaEDMcA6qhiNYMNN6wqfC7pgau6SJmwzewHI5v1bVEuMQOh8
	EJ+D4xCMuHTWZQOxLwaUJhPw+WGRo/U2nZNtxUgcHcWoR5+4EXB4Tw5NCn36ys6/K0vj54CmZHO
	JQVKNF7602bf+aLESNX/zXJbhWeAA7VDy7f5i4e2OUZfcNceGjiVbDkgX8LFeQxYkcQJWNNlFJC
	mIMt1R4Z4/acc4k+cWhGGR2KpYl/SPOdLE7x/QCUGSL7ro7lT8Y9zy2LvnJjUw
X-Received: by 2002:a05:6a20:430b:b0:3bf:ae43:4d26 with SMTP id adf61e73a8af0-3c0bcf49cacmr9958974637.5.1783622760038;
        Thu, 09 Jul 2026 11:46:00 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f596asm33384231eec.2.2026.07.09.11.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:45:59 -0700 (PDT)
Date: Fri, 10 Jul 2026 00:15:39 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Andy Lutomirski <luto@kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, 
	Chris Zankel <chris@zankel.net>, linux-arm-kernel@lists.infradead.org, 
	linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>, 
	Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, Michal Simek <monstr@monstr.eu>, 
	Dinh Nguyen <dinguyen@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, linux-snps-arc@lists.infradead.org, 
	linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-arch@vger.kernel.org, Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [patch 08/18] x86/syscall: Use
 [syscall_]enter_from_user_mode_randomize_stack()
Message-ID: <ak_sOt1kr8nrVCju@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.079478122@kernel.org>
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707190254.079478122@kernel.org>

On Tue, Jul 07, 2026 at 09:06:27PM +0200, Thomas Gleixner wrote:
> These functions integrate the stack randomization.
> 
> syscall_enter_from_user_mode_randomize_stack() has the advantage that the
> randomization happens early right after enter_from_user_mode().
> 
> In both cases also the overhead of get/put_cpu_var() in
> add_random_kstack_offset() is avoided.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: x86@kernel.org
> ---
>  arch/x86/entry/syscall_32.c         |   19 +++++--------------
>  arch/x86/entry/syscall_64.c         |    3 +--
>  arch/x86/include/asm/entry-common.h |    1 -
>  3 files changed, 6 insertions(+), 17 deletions(-)
> 
> --- a/arch/x86/entry/syscall_32.c
> +++ b/arch/x86/entry/syscall_32.c
> @@ -142,10 +142,9 @@ static __always_inline bool int80_is_ext
>  	 * int80_is_external() below which calls into the APIC driver.
>  	 * Identical for soft and external interrupts.
>  	 */
> -	enter_from_user_mode(regs);
> +	enter_from_user_mode_randomize_stack(regs);
>  
>  	instrumentation_begin();
> -	add_random_kstack_offset();
>  
>  	/* Validate that this is a soft interrupt to the extent possible */
>  	if (unlikely(int80_is_external()))
> @@ -210,11 +209,9 @@ DEFINE_FREDENTRY_RAW(int80_emulation)
>  {
>  	int nr;
>  
> -	enter_from_user_mode(regs);
> +	enter_from_user_mode_randomize_stack(regs);
>  
>  	instrumentation_begin();
> -	add_random_kstack_offset();
> -
>  	/*
>  	 * FRED pushed 0 into regs::orig_ax and regs::ax contains the
>  	 * syscall number.
> @@ -252,10 +249,10 @@ DEFINE_FREDENTRY_RAW(int80_emulation)
>  	 * orig_ax, the int return value truncates it. This matches
>  	 * the semantics of syscall_get_nr().
>  	 */
> -	nr = syscall_enter_from_user_mode(regs, nr);
> +	nr = syscall_enter_from_user_mode_randomize_stack(regs, nr);
> +
>  	instrumentation_begin();
>  
> -	add_random_kstack_offset();
>  	do_syscall_32_irqs_on(regs, nr);
>  
>  	instrumentation_end();
> @@ -268,15 +265,9 @@ static noinstr bool __do_fast_syscall_32
>  	int nr = syscall_32_enter(regs);
>  	int res;
>  
> -	/*
> -	 * This cannot use syscall_enter_from_user_mode() as it has to
> -	 * fetch EBP before invoking any of the syscall entry work
> -	 * functions.
> -	 */
> -	enter_from_user_mode(regs);
> +	enter_from_user_mode_randomize_stack(regs);
>  
>  	instrumentation_begin();
> -	add_random_kstack_offset();
>  	local_irq_enable();
>  	/* Fetch EBP from where the vDSO stashed it. */
>  	if (IS_ENABLED(CONFIG_X86_64)) {
> --- a/arch/x86/entry/syscall_64.c
> +++ b/arch/x86/entry/syscall_64.c
> @@ -86,10 +86,9 @@ static __always_inline bool do_syscall_x
>  /* Returns true to return using SYSRET, or false to use IRET */
>  __visible noinstr bool do_syscall_64(struct pt_regs *regs, int nr)
>  {
> -	nr = syscall_enter_from_user_mode(regs, nr);
> +	nr = syscall_enter_from_user_mode_randomize_stack(regs, nr);
>  
>  	instrumentation_begin();
> -	add_random_kstack_offset();
>  
>  	if (!do_syscall_x64(regs, nr) && !do_syscall_x32(regs, nr) && nr != -1) {
>  		/* Invalid system call, but still a system call. */
> --- a/arch/x86/include/asm/entry-common.h
> +++ b/arch/x86/include/asm/entry-common.h
> @@ -2,7 +2,6 @@
>  #ifndef _ASM_X86_ENTRY_COMMON_H
>  #define _ASM_X86_ENTRY_COMMON_H
>  
> -#include <linux/randomize_kstack.h>
>  #include <linux/user-return-notifier.h>
>  
>  #include <asm/nospec-branch.h>
> 
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
