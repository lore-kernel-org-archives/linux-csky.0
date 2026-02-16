Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2F031283A
	for <linux-csky@vger.kernel.org>; Mon, 16 Feb 2026 15:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771255824; cv=none; b=OQxIMZDbHU3Bst84jXmGDMMH2Zp6gO2yjOVcPkz4V5Dh4PHYbbiGw4c1g99zlW3gCvkrmstyQNPJBbdxIwGY+nUIVaJf8ekIilsF0C5Gh1JGDYCZ8IEmTSurQU5qvhfaTWVtU3n17oG/sahmEa/kJ5+IDjGl+0CLhGinPoQMGIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771255824; c=relaxed/simple;
	bh=lUf+rD+zK85EaecIl+MRfVINlsxw2aj22zOZLlA0ty8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KPoW5M18J/uiJ/7gkgzBnfq2viKnLRqI+N4SLRJgzmhoZbDzPSUg+eA2QQ93eJ8DwOyYSM7zkYWiJBpaCtpG6/NoZnD1cDvNx6HAM4gW8crT2eTLjWbkVPyxmc03//qP2622fju0ztcjNertAX2ImUHKXncMf/dxPklsqQOoaQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8c9f6b78ca4so429999585a.0
        for <linux-csky@vger.kernel.org>; Mon, 16 Feb 2026 07:30:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771255822; x=1771860622;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+0W63J01pKV+NBFDfR20YFl2vlCDVBGClMHBExbTTc=;
        b=XGYG4fRtenkt5qLIQ/HlltzcoO9DjthFT/ucPFiSZHVcT5idAzn/DI+DxEQl8N8Any
         IZARpjMXl6NgJ+Hsp2cMQWJMTqotpBOMhiwpmGdnr4PjtyWigDY/BDWUyNmiuZh+H5Cf
         oSnGRDVsgnktDW1Q29kc1L8YglImjxzCqHYkZ/33zDONoRZI5mpU04D80ri62wdWwEg0
         KRqtFZbAYG34FqzvEyyLgUuZobfArUttoStnzPuHwKK4sRV7wBJkpa7Cq3CY8lQ8JqsF
         ocQI7PH4Guzylpp9E6mMGNF9Q6VyRFO2bGoR0a70ddFVmWSY66wAR7V96TEZNlds1rhq
         Uq3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVf6mi/2ekYx71Mv5YLGLdSrGCXq/XUeo8wB7mbKZ3wdJLziPbiCGErZEhBGcwKb/uwbGGibA8B93ZW@vger.kernel.org
X-Gm-Message-State: AOJu0YyoJTZUU24MmxjfkajXKGLOrrH0nc7OCX+fJ3tMT8qxblJL67fd
	GObG+RTQbnVnMHQsmVc9+Qi/EiR3FHl74Vd66uABcEv4yOj7G2LbKYAegOlVG87J
X-Gm-Gg: AZuq6aJe3jXEvmZdYFhc+UHEe3GpxIOptVrHTxXXfLwqWUmg4cEqIRc7TDSL5tfYi+u
	mVkhZbRjhl1APz408iVVq7fLTnkk1KXcqAoIprVEvSDJr3DULzm1LJyUyttvCBeTrNBx30ch5+l
	/eRDSy/lE248C8Ia6IbnohYU3ohuomuf6OfExBorWskpQZGJVQz5cmq0CsCEHkIE/THdHU5zYdh
	rdslHW/v3dFeKYSsudmqG7/BqrC/evCdZLUqQzZBkrd65ocAFKlzthCkVgWUN4svL5iageMm62d
	Sp62w4RhA/SMD3jeIpgPccLv1VU4nW7nnoDMwVpZeXfM/y26VBZ11a6eomFboltQ0tT7Ax7pGSW
	hY8+pMjIdiTPosWt8i7p6eSrxI1k/bGyVTtGfPfBTHAVHMv3DGxv2Sks2XBe36wH7jZB7V7iBeV
	kqu9qXH0wXXnDG5HyGJpNH+av7e1N6dN+BF/Cjd+LQcj79cSH4qxd4FCz6cpu9UTkV
X-Received: by 2002:a05:6102:3054:b0:5f5:266a:d8ac with SMTP id ada2fe7eead31-5fe2b0309bbmr2440212137.45.1771248506864;
        Mon, 16 Feb 2026 05:28:26 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5fde8adf700sm7742390137.12.2026.02.16.05.28.25
        for <linux-csky@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 05:28:25 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5664340e14fso1166443e0c.1
        for <linux-csky@vger.kernel.org>; Mon, 16 Feb 2026 05:28:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWUYWSdqGPenX/lDRJ+i8a4JkmjzL8A6NXC7azKgMpQzP+8miB0w0kaoSbZRC0bf+4eHRPuytk+qibE@vger.kernel.org
X-Received: by 2002:a05:6122:4f83:b0:567:4722:66a3 with SMTP id
 71dfb90a1353d-56889ba5013mr1919672e0c.8.1771248505602; Mon, 16 Feb 2026
 05:28:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214005825.3665084-1-sashal@kernel.org> <CAMuHMdVeGv=f-Oo1=GQLghn_hwpe2YN5OS79fQsy2uccwyVUZg@mail.gmail.com>
 <aZMXwfvJjG0YkuF5@laps>
In-Reply-To: <aZMXwfvJjG0YkuF5@laps>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Feb 2026 14:28:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX1Mdqp7+Oz9dqe3b2VqMzpp5L7AvBJxRZuUjb0vY6gCw@mail.gmail.com>
X-Gm-Features: AaiRm51__ksjmZ0Ow9FHNfsDCOhP3Z--ENwDCnxogABgCRny5CijpedZP6Vlq9U
Message-ID: <CAMuHMdX1Mdqp7+Oz9dqe3b2VqMzpp5L7AvBJxRZuUjb0vY6gCw@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.19-5.10] parisc: Prevent interrupts during reboot
To: Sasha Levin <sashal@kernel.org>
Cc: patches@lists.linux.dev, stable@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, guoren@kernel.org, neil.armstrong@linaro.org, 
	brauner@kernel.org, yelangyan@huaqin.corp-partner.google.com, 
	schuster.simon@siemens-energy.com, linux-csky@vger.kernel.org, 
	Parisc List <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Sasha,

On Mon, 16 Feb 2026 at 14:12, Sasha Levin <sashal@kernel.org> wrote:
> On Mon, Feb 16, 2026 at 11:21:25AM +0100, Geert Uytterhoeven wrote:
> >Cc linux-parisc
> >
> >How did you (or the LLM?) came up with that CC list?!?
>
> Interesting...
>
> $ ~/linux/scripts/get_maintainer.pl --pattern-depth=1 --no-rolestats --nor --nos 0001-parisc-Prevent-interrupts-during-reboot.patch
> Neil Armstrong <neil.armstrong@linaro.org>
> "Guo Ren (Alibaba Damo Academy)" <guoren@kernel.org>
> Christian Brauner <brauner@kernel.org>
> Geert Uytterhoeven <geert@linux-m68k.org>
> Andreas Larsson <andreas@gaisler.com>
> Helge Deller <deller@gmx.de>
> Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> Simon Schuster <schuster.simon@siemens-energy.com>

Still doesn't explain linux-csky?

> I think that I'll fix it by replacing --pattern-depth with --nogit --nogit-fallback:
>
> $ ~/linux/scripts/get_maintainer.pl --no-git --nogit-fallback --no-rolestats --nor --nos 0001-parisc-Prevent-interrupts-during-reboot.patch
> "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Helge Deller <deller@gmx.de>
> linux-parisc@vger.kernel.org
> linux-kernel@vger.kernel.org

Much better!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
