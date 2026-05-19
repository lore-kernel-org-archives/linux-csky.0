Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6837340DFDE
	for <linux-csky@vger.kernel.org>; Tue, 19 May 2026 09:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184168; cv=none; b=QZ5IeTab1ML55OZMmBvU1dTcITyQAKjsqtzBTbnaDcKRQ5CZNtlsWp//4Lvvw1YP4aij8gNc7dNF6nh+c3E5a/VFpyGo9Ua9g9y2JTcfv6Mc/6d8Ax/wyRRzVxKtXIeb6Bws6tMX5IygdtNnfOJeKS/jdPXDs8PvMF9YIs0JQT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184168; c=relaxed/simple;
	bh=VV0WQeCgbPqBTi7yab+uEYQeq6u9LFtTUX4clbsM2Vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hwTy8Hm70rwegAvv60FtCEfEoHrcJYSs8tz22FsPMZoQLUy8IYIoS+UHAmpNzEzDI1ar9mZe8vSZplia9kXNKRm/RcadApmIYwulSQeqnOSJ9O5CU7wZHgKYP5XRnY+rECx3f1KCx/N3WBX4M2VMiMuwrw0iwC5vtMqfRE2PoiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4042905015cso2865274fac.0
        for <linux-csky@vger.kernel.org>; Tue, 19 May 2026 02:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779184166; x=1779788966;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+2SZGl9spcuw3ZVraVsNeWL62/l5e6HnqNdDh6fCso=;
        b=CingYfPLDMZA3gBbYMVGWAu+xeqp/TWY/7LQhqvGG7WPFzDA6zmPInDq3oj4NrcTms
         S8MraYXgTgwUoutFMA5/cVQe5S4F6Yd7JpLyA7F0lkztdCzvyp70G1HTi07bpzxSoHj1
         mh/yBLvhALUXDUZ+AJWAOesSjI/+68gR1yYEMpdp/mUcX+5jExGGYtstVjALMJKTk6JB
         AOejssSZZb5rzLccEwIz2l6fyDUA3WTlTBRqznRbsr6JiDK+WkiedM1nQFoFl5FIMVy6
         PrR8MXFEyzNBr4YOTdzGzAateYtTRF1bDZ/Ht8juTzfqzAnBx8rEpV9B1WsVS7+0WClQ
         YtyA==
X-Forwarded-Encrypted: i=1; AFNElJ9lKmQMcdPFUiSp5c1ZTGMCw374DC+YC0/g5RpA9TI9qhU8QCY8zdUuvVcczGHUwxpddKvv7NjCpIHN@vger.kernel.org
X-Gm-Message-State: AOJu0YwK80FX4iHYvMcuSlStIKl4apeYDFzkp9fW2EX8b2qzafvQ5ZfS
	AjPJu3L0p+vWmr44/VDsaN2MAk/ixjc9ws3e3YwjVxSwl6V2yufZg8t1jDhYSBED
X-Gm-Gg: Acq92OFMpsPMRIo+jm2hJz6wycGX+85F9FbMqeK2Qx5aVW8Ti7Jhv9V4OgHCc8PuXUQ
	1Pl1H3SuCN46oq0MH3D5HsLHretXVPgwjBTT4aypLoEDtWQZl1eRsW4SA5g/JdPCSJi3qGhurAO
	iT6Frb1MJp9/9XEptdF437UEEg+tkSk2zszdcc82zbyLRD8mYVi7Q+nW0nA82AnvkY+lyBGUBzU
	nX/ynXpnx3jvNLTud7gFJCDVnKzA7qq5k3A+1gy1wBaPP5nVoGITIHE3p9lPtusoyC705gwreL8
	xL6yHjxJNVynZ577VKlOFV7/FX28BeRmtHqpHbIG8ORr4w010GqECINCkEioEvLUzbQxJ1iMHVY
	mjY3k99pRDBlsETxr5aEAK5GQ+2ubVvT22rTxMWI/lFYQJThgVHNjIcfk+cuSwjcQf6WW8fcZEr
	gjFeEuMGEeV3YbcEoC0KT5kDyruIb4ThpPfdnAFlYxO4zR83F5TQEF71eSfOGy
X-Received: by 2002:a05:6870:2896:b0:430:246f:3a2 with SMTP id 586e51a60fabf-43a2dcc71e7mr11795137fac.17.1779184166159;
        Tue, 19 May 2026 02:49:26 -0700 (PDT)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com. [209.85.210.53])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a9576cdb2sm6529254fac.16.2026.05.19.02.49.25
        for <linux-csky@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 02:49:25 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7dea20cf21aso3399188a34.1
        for <linux-csky@vger.kernel.org>; Tue, 19 May 2026 02:49:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9KzrPxibmWn/WQj/qnR7MyeFshDmDIdU8PQJQRtEsOoxoJdjKnMyy4r9OBlDLr4HovM/Kt1NhjDo9Z@vger.kernel.org
X-Received: by 2002:a05:6102:511f:b0:634:d42d:15e2 with SMTP id
 ada2fe7eead31-63a403ac9a2mr7077474137.26.1779183821499; Tue, 19 May 2026
 02:43:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518042833.272221-1-enelsonmoore@gmail.com> <20260519094820.1f05ab8e@pumpkin>
In-Reply-To: <20260519094820.1f05ab8e@pumpkin>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 May 2026 11:43:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVw349EBZUuYZAns3FnTndx0A=PHbznxarYuAQr8nbqDQ@mail.gmail.com>
X-Gm-Features: AVHnY4Lfn8Mcrjf-CZtgFTL8ilhwbGlXFwz-O3Z8xcIZpla9SRL4d3C994HiNs4
Message-ID: <CAMuHMdVw349EBZUuYZAns3FnTndx0A=PHbznxarYuAQr8nbqDQ@mail.gmail.com>
Subject: Re: [PATCH] nios2: remove the architecture
To: David Laight <david.laight.linux@gmail.com>
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, workflows@vger.kernel.org, 
	linux-arch@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, netdev@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-csky@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Hu Haowen <2023002089@link.tyut.edu.cn>, Dinh Nguyen <dinguyen@kernel.org>, 
	Kees Cook <kees@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Dave Penkler <dpenkler@gmail.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Tue, 19 May 2026 at 10:55, David Laight <david.laight.linux@gmail.com> wrote:
> The company I used to work for used 4 NIOS II inside an fpga.
> The instruction timing for one is pretty critical, it has some code that
> has to complete in 122 clocks (worst case).
> Our solution was to spend a few man-weeks writing a compatible cpu!
> I think it came out with fewer pipeline stalls (in particular it 'lost'
> the one for a (predicted) taken branch).
> The maximum clock frequency might be lower; but it is ok at 62.5MHz and the
> higher 125MHz in just impossible for all sorts of reasons.
>
> OTOH I really wouldn't run Linux on it!

Sounds similar to what CoreSemi is doing with J2 (nommu, also for
predictable latency), but their products do run Linux.
See the video from the LPC session at
https://lpc.events/event/19/contributions/2097/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
