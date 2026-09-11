Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4368321F5F
	for <linux-csky@vger.kernel.org>; Fri, 11 Sep 2026 22:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164623; cv=none; b=BkffW7s1TOVcQ+2UWuJwR8Bd0od5w47nEQSzPfw/ExMFVnV97cW7A+eMJJeWfYazfOOf+yfCJvZUYMj/uitUKBgBnaV8QL6CD3CYy5usVzRdDDN7j7VAAdvpxlPp2WSgcTKtlO8wKY2gnWUWNUdZnR+7h39nEsFqkQPQpvY0P+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164623; c=relaxed/simple;
	bh=wzOAT8P+HfggfOuW+tbV1rDr39BIeDu1f097JVhjors=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oq0Cs3kyYJAOYvqDNRJkOu0tex2d/6Q+bkrEHnYJAhju7S6ISxtXGx5eu6mwtbPF0+VIPCLUWn5AfGr2vyFvUUcC/oxrMqhF6JHzvP++en8wRycBOIfw/uwqTEmHPAlW9pl5Jf+OHq25+s3cEPp08qqUJNQRwXkWYeuyqhf0jIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8kPqdVL; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8kPqdVL"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso11143535e9.3
        for <linux-csky@vger.kernel.org>; Fri, 11 Sep 2026 15:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789164619; x=1789769419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1CitEInQG9IH8hFfkxw+Dy1+TcxOBHzYjUh6RK88Fgs=;
        b=V8kPqdVLxhbxYq/ndSOhh59EWr8wuK81XRGpgyG1cXj+UuOWKJMFJ2T2a2dgpFrdLa
         WkuVwWjHua6E0jDuliU9Xfih3FGXadW6+THWVrO6iOtCVXUCSCtYS+LVNXHxOpwM1s/Y
         /bOxgg+4FBx1y8MXDR1zhT3bH3ZKtN6CF8wJX8J7oMW/zGMtXic0VCWyi99/rWWjnfd/
         uuXLEKmMOpD1pjjTO6VRI6T6CUOYwvNYIghCxNP5Ys0xeNLSImT2vW7SH3c25q936lXU
         qUoUKrw/pjuOxzetQVpQHrvTyuVJAj49eK1mHFx/vB/wgw7+zJMHO9eiGbAO23VErWjb
         30HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164619; x=1789769419;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1CitEInQG9IH8hFfkxw+Dy1+TcxOBHzYjUh6RK88Fgs=;
        b=OL4/cBKVbxwbSPvtoW4LvwQH7PjBSJkt9R0LRnr2GQ0Hb+HSlOp0i1jW5ldwpJNsdE
         1raM1+jb5YP2Bu4Mi2KvZ9vT5csv+xPET/pCgFnPalbBKN6SG12HM1jvsRhTMXDxqWDI
         cfWBPhCDf9zlnMnN/cNcHgZzDFIaGfTgmgmqCb5Rt/AJojYZDsG8xUO1NPRiPsIuheRm
         PxHOan6yiSUWHv+GAEUiCERd6eZG+VOmYkBCjG2f0EDHd75alHRqXv5M3V9Q036Z+g1z
         8IL8vhcgIHuMOx1/T4Ke9u/yZQpU1dpsOKeL99iUBsCiesBDj6TZ0nNRUGnfar5qEpHh
         Vpvg==
X-Forwarded-Encrypted: i=1; AKwUvBxMFPQwD1yOkBRw+woXzY0P1n9JbFpB30N85w2Jn857W13EEQaAnxp0gtC9QSO3/SOylpjOTcW6KYAf@vger.kernel.org
X-Gm-Message-State: AFuF++kgCqMlJEzrZi4I+C2TA3UNC23eBNgQG8w2wzsqsgUmEduq9n9C
	Oce21rKvl3ZjhrOi/g0w6jc+JC46+/S41V0ygvXt9QD5CWO0dAxxxGrg
X-Gm-Gg: AYBFou1KJhr3euUQ2Ci1kzboXQZKVdzBkwFnG55sSlLgi6ZieyQwivENA0QnRlaN6oE
	h7w3h8zY6thvDwNZtMmLIJB8VMQsCUuFOCQFzVoriv0GgWAArEX59X8SwKV/pZpW8cDbPB5fw+3
	oX2bQqtIV6r9XndvSvrNhCB1facMbc0wZbPg6CuJ72Q0HGywd6QTd15FHDPgaEfyr059qk0dimF
	8BgltdyvoZ3G1J712EpCbzt3Q+xdF0qOdUlGBnFLLg0ybVSp4oWejz+6PpKadMAY6Y+xAzAaxbJ
	fzobtwJavNu+Rw8/O4wa1OwF2Z+aGvSZ6YGXhiEgouoDkd1G/b3MGszvWIVvVkPROJDg+fEtR6j
	C1Zt9K4NIhS/OZeorLDi7yHdxOKrfiSmedQ9abZXMFfkLqC+eBnEfccVZi7hLh4lf3hFQpYOuyx
	xtRe+gEbIJaeXOO/5W48QEiMHh+p/LiYRZ/VCLM4fP+4EYP2CrOCqi63dtwcEFQpTCg95DppePM
	hON/pIyUnL+XE5EuH5beQkEWRfP8C2j3f43
X-Received: by 2002:a05:600c:8b41:b0:49b:d45:703e with SMTP id 5b1f17b1804b1-49e6198865dmr87033975e9.8.1789164618893;
        Fri, 11 Sep 2026 15:10:18 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a81943sm69553525e9.1.2026.09.11.15.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:10:18 -0700 (PDT)
Date: Fri, 11 Sep 2026 23:10:17 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, frederic@kernel.org,
 neeraj.upadhyay@kernel.org, boqun@kernel.org, joelagnelf@nvidia.com,
 rcu@vger.kernel.org, "Andrew Morton" <akpm@linux-foundation.org>, "Arnd
 Bergmann" <arnd@arndb.de>, linux-arch@vger.kernel.org, "Vineet Gupta"
 <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, "Russell King"
 <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, "Guo Ren"
 <guoren@kernel.org>, linux-csky@vger.kernel.org, "Yoshinori Sato"
 <ysato@users.sourceforge.jp>, "Rich Felker" <dalias@libc.org>, "John Paul
 Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>, linux-sh@vger.kernel.org,
 "Chris Zankel" <chris@zankel.net>, "Max Filippov" <jcmvbkbc@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] lib: Add two-byte cmpxchg emulation function
Message-ID: <20260911231017.550f8cd1@pumpkin>
In-Reply-To: <20260911192540.20983-2-brads@mainlining.org>
References: <20260911192540.20983-1-brads@mainlining.org>
	<20260911192540.20983-2-brads@mainlining.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 11 Sep 2026 19:25:34 +0000
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
> The Kconfig symbol gating this file is renamed from
> ARCH_NEED_CMPXCHG_1_EMU to ARCH_NEED_CMPXCHG_1_2_EMU, as it now
> selects both the one-byte and the two-byte emulation.
> 
> Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> ---
>  arch/Kconfig                |  2 +-
>  arch/arc/Kconfig            |  2 +-
>  arch/arm/Kconfig            |  2 +-
>  arch/csky/Kconfig           |  2 +-
>  arch/sh/Kconfig             |  2 +-
>  arch/xtensa/Kconfig         |  2 +-
>  include/linux/cmpxchg-emu.h |  1 +
>  lib/Makefile                |  2 +-
>  lib/cmpxchg-emu.c           | 35 ++++++++++++++++++++++++++++++++---
>  9 files changed, 40 insertions(+), 10 deletions(-)
> 
...
> diff --git a/include/linux/cmpxchg-emu.h b/include/linux/cmpxchg-emu.h
> index 998deec67740..fee8171fa05e 100644
> --- a/include/linux/cmpxchg-emu.h
> +++ b/include/linux/cmpxchg-emu.h
> @@ -11,5 +11,6 @@
>  #define __LINUX_CMPXCHG_EMU_H
>  
>  uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
> +uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);

Why uintptr_t? Shouldn't it just be u16?
(Which probably means the code would better if it was just 'unsigned int')

David

