Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1867713777E
	for <linux-csky@vger.kernel.org>; Tue, 19 May 2026 00:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.195
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779149652; cv=pass; b=STcgkB4RE78Y92U8i0i6den3GOuOYw4CrFa45fl0rZkDaBObwkdMqgEpbsKad4ZGA1EsJlfi0pDD3ojMr+VaSnH4m7szys34z1pnu2msSd4PRU6NmDYmxgzmdHvV+RGXs8HaX+l4zlqyNXjIV2LGcfyCw5u9MEN1Jy5DydEGj6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779149652; c=relaxed/simple;
	bh=LPwsRaL3/VhQKGJMHLIVfCwqYVCTUXR7opK9047JBWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MJnhIsYmXKiVZTQuvsdqKTjHAdYBNJSDG+ArPG2CnyiLu6UjKPlXbDztpC+xdTsECd2xjtgJkAIwOkXRWjqmKAOKUPVgto1GRFCnmFFTFhObivvYzGruL8Ni8/9pwJQrdv8BIMzwgileVqMQfYIvmHtSlCueAEfhmVUxE3/pM48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d59lwcl8; arc=pass smtp.client-ip=209.85.222.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d59lwcl8"
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-913cc4d7c71so255424885a.2
        for <linux-csky@vger.kernel.org>; Mon, 18 May 2026 17:14:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779149649; cv=none;
        d=google.com; s=arc-20240605;
        b=BTWdgBFkiGYiWYjMZJjvPeW2mt6NRxZFZuaBamzAORxC4BT7bd8pqdySFh57nJHdzJ
         f13JuTLz5jiibESn+MTFqXMXOtPJ7ZdwoTv7ykg3UI+Vs9RT/w9nLpcHDkdkQvkwhQII
         d7j8cwbK2QV9R8qvNNc16eJHGCODj0bhdvZOIy62iy5LryexvNhZqu8gKJIeRB9M9aX/
         6CsyUOG8eHlxfoHh0HgbqCAvLZJUru6ZNphssF7YSx7PSz3KJ/rfMRkcO0+gkFG0NcSS
         Nl9iueKrUcOGLmbKuX0bavelZtqBkQXzsJqiXKztzw2J5n1ffzosTL1WNFWLGhO5lW47
         l0Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LPwsRaL3/VhQKGJMHLIVfCwqYVCTUXR7opK9047JBWk=;
        fh=2GRKuOc/2A6cOFt2mRukVrCTCYCMWS5P4fpsapDpDMc=;
        b=I7QlWAukMejRRgvMvkbxquA2MO2HYlVKXVcvuYaa4k45X2qav01+7Zeh7o/fVqltvx
         T/8oU+XRmmKBFDoxOlb7mCKgkjjwbUG44JXPp7/8/etAdVcuTQJYcex8zNoZj2wVLGf0
         jv1A3NaVdvQM1dBtiwSCTbTAsrZ4Qdqg2aMxIqMZuR23tAZ6tgH9dQiBkxlF8phHH43I
         CYsig/bZcMTY5OdmHDbg+rTe08diEEHC6cZM/hFBs6IHvcel9xpr0r3ktLL8crv65MQq
         6xVMf/SkVqwD6jWfLjMqni3XR0yxDEDRbta/eKX9OwO8lhvQmHU8sLL31sWVH9kIG+Fx
         zZJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779149649; x=1779754449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPwsRaL3/VhQKGJMHLIVfCwqYVCTUXR7opK9047JBWk=;
        b=d59lwcl8NvuOHlMwJ/jtLfvIVKwSl887jI0zUq+n+MokZhIz5kSNG+Q7m83cRRj++o
         7S3rzqts7N4yutIkInkFXV9kygWG7yxiMPc0JWryBnFhkU7pGX5375FZhqllLsu46QxD
         yqRXefPbKqpNqDqlvNkmKy9NH53MH/MzNhs5i0t6EGN/qbHwnG3z9w6y+vTpWbbm4ui8
         +Y/emkK8/ZzUeQNXSb3F20EcO2qGGKw0KLfo5yfAg9tQxjLb8ir1PQn5DJpL6n74Uv7I
         Kzy/KgWqFZU9F5z3/y0h3xh8lwac6mtJi6nFuR/ealUBmYZWKM9xgcZKuPtDs3lS0PL6
         E+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779149649; x=1779754449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LPwsRaL3/VhQKGJMHLIVfCwqYVCTUXR7opK9047JBWk=;
        b=d0ZnsK1sGeN76FE8dSMx7ZqOGSm8cA9xsXi1kZtGYr21ksMAVkdZV82IH1sCWgM8Dx
         SGcdpxBgCW3kjj4ov2hPbZgPp4bmsYtBry7iqKkI9SCxJFHdiB6M0N3fs8frWGWOp2Vn
         MSHqyvP1er5GZ/e/AsL34E1DD5y/IYTDeGU1vIRfmTlUMf4Bi4aQLk4d/xqjwjcH4xXA
         q41u5rWIpjt3wweepUqUGvtfgiyVAXwrYkR+tWmeS91EGVEh/rIUPub1DEEIg9EUcEr6
         9KInB47BqkEsY9qiIiQfOX6kpEAQy0svwDxv+avf4VJqKR0VxZa+cDFbJMdCq0Vzis6N
         wu0w==
X-Forwarded-Encrypted: i=1; AFNElJ/18hozVZrbz7yh0YQnJL8H4/BMnLvqoKgUJCf5df5j768wGww/GQZQMy2EFiTlUdt7YAf8H//RSr5z@vger.kernel.org
X-Gm-Message-State: AOJu0YwcDdDI2Ixc4jFoapztweONAHvS4c2ys9e+/z021V3T+4ByoLZ2
	g3CTzu8q4wwBocBWGkrPgGqV4xZ32EyG1LnlsM46fmLlMHbLGzPbILP3L0KYjFpAmy3WmhwbmmR
	36ccyXGEXuiSGYe1Rr9g1o7NJDsBJPwY=
X-Gm-Gg: Acq92OHp/HACq9Y9DlSgceslQzzMJetdOGWdNYrduAntATTaipobSfaT/3LcotFk+zd
	Q5GPldmCRBEKJb3qdTlzZpCHgFZpK5trbUhElneuVYVcaO1B8jB8dPzYhBgfmbD22Sjq8GX6w8C
	Nk5msaRpuwyoiQAwZMH28s0TXRKu9UUNTBk1gj2e+DUsgPqepmUE6BdpCCEUUKlTGcCvzKLGMtM
	Q03vo5wUg/3MLjKQdykRMh5K+R1BR1Y64qTcBSjRIhuC1BDu26hOHVnX1EuO8OOkrHyo+0tAJ5d
	W0WgcVP7oUho9TCxo+lOIWVz1DiLdZMRH61W6FS6L7VKaVgRv925chf9HjAgOvXtbLN317rDXYi
	SVFM=
X-Received: by 2002:a05:622a:d0e:b0:516:707a:cf8 with SMTP id
 d75a77b69052e-516707a0e9amr149948671cf.44.1779149648695; Mon, 18 May 2026
 17:14:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518042833.272221-1-enelsonmoore@gmail.com>
 <d40b1e80-37fc-4c88-9d7f-dae6458efe6c@app.fastmail.com> <20260518105735.GW3126523@noisy.programming.kicks-ass.net>
 <20260518172444.zyd47mcagrcwu7wt@dev-vm-schuster>
In-Reply-To: <20260518172444.zyd47mcagrcwu7wt@dev-vm-schuster>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Mon, 18 May 2026 17:13:58 -0700
X-Gm-Features: AVHnY4ICd7H9-70Xucdx9uJAfA9u6BhUaXyRyteuNE6Jo8mNtePRuTvmeSFjqyQ
Message-ID: <CADkSEUjhq6HSdg4ignzbuJiN5uXATsTdxFbRJ3BMxs5=WUWLDg@mail.gmail.com>
Subject: Re: [PATCH] nios2: remove the architecture
To: Simon Schuster <schuster.simon@siemens-energy.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
	workflows@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, 
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-iio@vger.kernel.org, Netdev <netdev@vger.kernel.org>, 
	linux-pci@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Hu Haowen <2023002089@link.tyut.edu.cn>, Kees Cook <kees@kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Dave Penkler <dpenkler@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof WilczyDski <kwilczynski@kernel.org>, 
	Andreas Oetken <andreas.oetken@siemens-energy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Simon,

Thank you for notifying us of your continued use of the Nios II architectur=
e.

On Mon, May 18, 2026 at 10:24=E2=80=AFAM Simon Schuster
<schuster.simon@siemens-energy.com> wrote:
> Unfortunately, as we are an infrastructure provider for civil energy
> infrastructure, the refurbishment cycle is a bit slower than for
> traditional consumer systems. This implies that the traditional LTS
> support duration (max. Dec 2028 as of writing [1]) is rather short, and
> we would be glad if we could keep the architecture in mainline for at
> least 5 years and only then "decay" to LTS.

Your reasoning makes complete sense. However, there is an alternative
to maintaining the architecture in mainline.

The Civil Infrastructure Platform project maintains super-LTS kernels
(and a set of base Debian packages) for 10 years. They are intended to
be used for exactly these kinds of devices.
See here: https://wiki.linuxfoundation.org/civilinfrastructureplatform/star=
t#kernel_maintainership
and here: https://cip-project.org/about/linux-kernel-core-packages

CIP will maintain kernel 6.12 until 2035. Is this long enough for your
lifecycle? What kernel are you currently using? If it's newer than
6.12, we can easily wait until the next CIP SLTS release to remove
Nios II support to avoid a downgrade.

One important thing to note is that the default CIP kernel branches
are not equivalent to standard LTS branches and include new hardware
support, which has a higher likelihood of introducing regressions.
However, the -st branches do not include these changes and follow the
same patch acceptance rules as standard LTS, so they are likely a
better fit for your use case.

Also, CIP focuses on architectures used by CIP members - currently I
think they are x86 (32 and 64-bit), ARM (32 and 64-bit) and RISC-V.
Since Siemens is already a CIP member, you can simply ask them to add
Nios II to the list, and you can assist them with testing and directly
submit patches to them once the standard 6.12 LTS period ends.

I hope this information helps you decide on the best course of action.

Ethan
