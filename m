Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D187D3FC5D9
	for <linux-csky@vger.kernel.org>; Thu,  9 Jul 2026 08:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783586537; cv=none; b=SdN5vxTPjC3EaOUyyz3yjEiotmLxeYHfk3yjQf6w8zHBZrG+hR4VOtqOyoZN+UT82ubJr6gUx4x6XyRaS8PF/ZgLtF64rwW9UQjUhgrSsQy9aZ9002zY49MQclO12/8p1+8zhUjzJfqVfEeN/D5UDAZpO/2wnTXt30Ri06NO9Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783586537; c=relaxed/simple;
	bh=vcIYcFn8wOu64JToHCd3V3ghUBsco6aWxPDuriYHfZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aXecg+GZ2o7wCpSJqxw9wqk1jdrYYTyLkaUUWvIu8mhzEA8lDtJbYrNa10bZq35O/vA1dBI15XAZCtfnB94jGlLOGiFQGFIlDhXZ4l8hM7SHWijTgLsCUH4hlRCQi7xObgk8amTaGE4376b0HAEfJQxQEpCBFh0vhHGU+6VoZJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9696319e14dso582264241.3
        for <linux-csky@vger.kernel.org>; Thu, 09 Jul 2026 01:42:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783586531; x=1784191331;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O3mkBNkViagFAJs3obyg41kBlrTMtmvpPUP/R2gZOPo=;
        b=g/DyIQR8cNyLwZTul8nJlpR0bJuF+SgyKNrw1JUr+GsXVJq+HGSsoYYYCOEiPy/mNw
         dwzvhOQrPG1CEYQIpYHum+lPiAmaGypV2DykLvGoVzcMLIuTuwhaTsNgG3OUaQgbp/iu
         LQEfq/kTTBWgtPIHLoOG3a6BL+vjIj+dSTLtBUHeGadSA2xZu3q2lVBOOGc1Gi/wNIKQ
         8Ard2O4rc4PjzKUO0qQzWH3N2yz2W0BkksqjhNGe0vJWinxijIFPXCAhiK8eu+0Cmx+n
         0ue1UhhD7FTbp7yVNJKv/qeWTkfIAWGcEBTfdV5Eq50Ql2FMwELFNOpTrUgua/D9H8qw
         Qoaw==
X-Forwarded-Encrypted: i=1; AHgh+Rr5gVMi+WODxgiaG1PYtLrTcbgiw9Irn77WK2lLTcUZD+PPM49ahzYucjjHWz8qX8PHn/nvwNQ40i9N@vger.kernel.org
X-Gm-Message-State: AOJu0YwJFfQTmElefkv15mCZoloRjwJJ4sCvXI0bYIp22O2cGGY+fxcl
	lu47UFdj58ySr6VTZwbQeh3y6J3sSLu5GhpwQXbotVNthmdJG2zbI29mavxlTyrGHCk=
X-Gm-Gg: AfdE7ckcGLZSUvpMAvyOmxi+/wHjNBhJH+v1IhRUd+GzeLuRmEWa3dMJehnGx+VvpfK
	n2Y3axrzOnkML0anZvITl9QU7Ou1n9vyY64W83l6cfVpATQpzlGM81YhiFd7vUL7ZHLEnS1xL5G
	+X6kUxnpBB/hYI8ZBbM+E7Ke8fmeQf1aJdlTTGgDMnc97ZC/idxEJ4p8V7sqwGpeh3bOrorTeAJ
	GGYF3+9weovt+xa9EFcHqChSViQb8kg3rbIhbPFxRf4c4G7jKd3LpdEyV02Ujc009GE0BsUmmon
	eU1i0iXU3FQzFUp3EvHw23SV67X3z9KpXnl/VTg/7BKDEwUBWbIg6jux9J0+Ym668rvJTK8+Bfc
	Y8OhKzTZHYW+HGR5mqEp61dukHhFIRvjVTfg6DCFSdf56upLUeHDDeNwKrQH+JUyXXkEIGBrpSV
	qkUHUt9CtKuXhgVomUEMqrMAK3HQ/kmrxisYYEKfUKCtdHTBTf8g==
X-Received: by 2002:a05:6102:6895:b0:738:9dd5:9b03 with SMTP id ada2fe7eead31-744e03a337dmr3307021137.20.1783586530831;
        Thu, 09 Jul 2026 01:42:10 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6a90d0csm3246424137.4.2026.07.09.01.42.08
        for <linux-csky@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 01:42:09 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-73770fd1cd9so649131137.3
        for <linux-csky@vger.kernel.org>; Thu, 09 Jul 2026 01:42:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoTNICfHcASmbfweNngsx+9/GRQi0CqsgCMHd2aRlT7Jcr3+zEFOyLu2+UDyOlGdaSeBj8kSyLPuQ/h@vger.kernel.org
X-Received: by 2002:a05:6102:6895:b0:738:9dd5:9b03 with SMTP id
 ada2fe7eead31-744e03a337dmr3306957137.20.1783586528282; Thu, 09 Jul 2026
 01:42:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707181957.433213175@kernel.org> <20260707190254.280015701@kernel.org>
In-Reply-To: <20260707190254.280015701@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 10:41:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWe1D0CZrav5h6EhDDbeJzgJcHvT89jrs6109Bdj-pdTw@mail.gmail.com>
X-Gm-Features: AUfX_mw8w2Kp5VuAYozzfDNS6gDbdKhQdYzfXsv-G72F3LS58UBytbGwOmplITc
Message-ID: <CAMuHMdWe1D0CZrav5h6EhDDbeJzgJcHvT89jrs6109Bdj-pdTw@mail.gmail.com>
Subject: Re: [patch 12/18] ptrace, treewide: Rename ptrace_report_syscall_entry()
 to ptrace_report_syscall_permit_entry()
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Helge Deller <deller@gmx.de>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Chris Zankel <chris@zankel.net>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Richard Weinberger <richard@nod.at>, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Jul 2026 at 21:06, Thomas Gleixner <tglx@kernel.org> wrote:
> The return value of that function is boolean and tells the caller whether
> to permit the syscall processing or not.
>
> Rename the function so the purpose is clear and make the return type bool.

>  arch/m68k/kernel/ptrace.c       |    2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
