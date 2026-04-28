Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B6A39B498
	for <linux-csky@vger.kernel.org>; Tue, 28 Apr 2026 09:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368652; cv=none; b=VXMAHMoDwA7WKk4xypen1J7Fp7EFgg8zj+rvr2IOEnVFmpNkikR1o7AzS18b09Dr+8cd8cX8ivuKZqln6vrBwZqf+3/G9cZwyEcdEKIYorN58RBVnuYdrKygGtVBFpDMdhU7UzxfDC+u+74pXwvXfMi2AO+fRwE7kZdKTsheRpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368652; c=relaxed/simple;
	bh=WZ0dv++aH+AeLwkvbNXxLqu7wJ3mA6GpS63WG1N27Uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UGM2yY9dgKfROkFlBrpWrKINXIUu+6kV6Gsr0H83wFi/69GezuB4KM1eE5v8KKXHnw2inbTELrexIR92kB6IE55PWsZDJ93m1Ef+wItcuY4sb6m334lRnuamD816cBVKju8NI+6sEz99enznafqm7Wu0M7wuM7geKO2L8g7hqLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b9c01854477so766235766b.0
        for <linux-csky@vger.kernel.org>; Tue, 28 Apr 2026 02:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368649; x=1777973449;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Al22kA6RCf7FSEzj29cZLSkjdM9EgXxihmBX7/SeSVI=;
        b=SmnPfquTZlZxc05NGGEra+zr+vb1CrOSsT4soGeVMV/FvbKE8wzrRQYq4WzYImVAYO
         466//1sbzNd4ZPGLeNO9v/TBVY63V2lIaCF9qNzF3YN55corIqpeablB4yaUhxAVVMAP
         ymyYA/3CTEo2puitOLeEcyTU1Z3I3XNhvKlAlwmvTo/QOWv4YpV51sm53in0PERLVA5Y
         8sRPpe5OtJ2rxCZkaW6Bv4eGrtJHWbEWMSnpGRxbrVOdnsFR6KQ0iGVUcJvASA2mrM3Y
         QVbHBFCplbJiIA3crwN2Of0apraf1H0vVR0zHBSJKLqvZphR+Hdaz8kq0tm6Mjx0N7Aj
         jrTQ==
X-Forwarded-Encrypted: i=1; AFNElJ/6lJO4GfzNJ0rr/HXr3GOOR+SL2aIwmQ3kkxEpStRSI9m/4nj1gffLxVCuEydrROO/GLvm2tFcgyWY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1/33iRu8iMYPn0VA/GBi/T/U3tr/YSSaoowdNgIDGca1111Tp
	iebvo/jCGkydfm2YPoHc3vz2usY+Xy+07TlBT2BTrikaAUx6XzRmUFfrsaSGeGc0duw=
X-Gm-Gg: AeBDietrqNvmTYwPw57PZZmnGFQ7HYoMQjotoKRrDmyJmh1vJVW0MlJbH7xMp4sz8az
	ud3ijbXpdGpdr9Wd5wtqR3zevf6Gt0Ib507qMiV1sVi9S84pFro5s0FLPmn10o/5nRZJbo+vI3a
	YscFr1sMR3rtPpJcnkNdZh5oK4tKluG+CwjWJENXbAfpQZR6gcRx16Zq44evgQ+wprnKtdK7dzN
	OleD6WwSME9wuvaVWz27AOtUKwlNQDuecUmPuB2bIuxiRuR6oCbH7y1Y70gOX2IRxifS4TAy7z4
	KVqXSgdxP3GeoHx/sI8f+0eXfbW2fzD9Wsv0mV5adEeWgH9jEs8VpcWJ1sdnb41CGgGdvEXo0G4
	wL+LSjRoSDMN+rUrt/K9YI59xGB+lZzDeoBzryhn8R5mXZDzgEd18CoxeV9xm/CuHlc6u/Ib4yD
	a6OPgZc2RP5CDM7qP3agNSjxasDeq8QRaVvtovHvzisToAe0UxJ8x1zyV/IuO/RZ38yz/9TPWLy
	uKrD25ZFw==
X-Received: by 2002:a17:907:1c0d:b0:bad:f032:fc78 with SMTP id a640c23a62f3a-bb8020c94dcmr121571966b.1.1777368648420;
        Tue, 28 Apr 2026 02:30:48 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80bd9381esm73863466b.52.2026.04.28.02.30.48
        for <linux-csky@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:30:48 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b9c01854477so766231666b.0
        for <linux-csky@vger.kernel.org>; Tue, 28 Apr 2026 02:30:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/SmsLZQ6pz0w1+DmLWiVDU3ZTbLO8a+pEHUZebltLU3KPGXCm9Yf2ORO4YpwqCBz24P0BiTU+Y49nI@vger.kernel.org
X-Received: by 2002:a05:6402:5056:b0:676:d8a1:7a04 with SMTP id
 4fb4d7f45d1cf-679bb09a4admr915149a12.23.1777368324094; Tue, 28 Apr 2026
 02:25:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
In-Reply-To: <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 11:25:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
X-Gm-Features: AVHnY4JEWBVPw4tSjHgbQTia8gZd2WGJ1sv6qLdKJbtvs4hms1blpvc35yb0VWw
Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/9] uaccess: Introduce copy_{to/from}_user_partial()
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Yury Norov <ynorov@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, David Laight <david.laight.linux@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Christophe,

Thanks for your patch!

On Mon, 27 Apr 2026 at 19:18, Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
> Today there are approximately 3000 calls for copy_to_user() and
> 3000 calls to copy_from_user().
>
> The majority of callers of copy_{to/from}_user() don't care about the
> return value, they only check whether it is 0 or not, and when it is
> not 0 they handle it as a -EACCES.

I think the "a" can be dropped.

> In order to allow better optimisation of copy_{to/from}_user() when
> the size of the copy is known at build time, create new fonctions

functions

> named copy_{to/from}_user_partial() to be used by the few callers
> that are interested in partial copies and need to now how many

know

> bytes remain at the end of the copy.
>
> For the time being it is just the same as copy_{to/from}_user().
>
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
