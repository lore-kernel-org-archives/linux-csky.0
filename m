Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F82048164F
	for <linux-csky@vger.kernel.org>; Tue, 19 May 2026 11:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779188883; cv=pass; b=AIPeHYVkLtzae6cLYdGi6CQiQZP+hFpqsrNVIbQLzK6k256lFI6GIKakvUTot8VuwnMQuRS+TQlmLbr+0TnT5bl37CI0w2mZF77mpBfJkRFJnwEoVk02ckIe8zGefxZFeJkBG6nCB5cJT5YroD1xdP7lGFD3HJT/vidQ8WoVZpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779188883; c=relaxed/simple;
	bh=nhTmhA7EtvBhVzOtpkjubbcdCBekT90z9FnlkG56Nt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n++nOzoGyz+X77yBHlW8Ed338LnseXCMAaKHIDD3Ar2Rf/kDWCxGP15hVx78K/3ILEGm13LNC8nGXJGyOyoDcvLwC50rZf7KR8v+UitmbJxadxArYcuNtspn5KSc0QE3Q99H7I2mhiMtvwWHEvr/CBjIY9N+0SVhsKLor/U2qm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NkzOT8mX; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NkzOT8mX"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2f24905306dso284657eec.2
        for <linux-csky@vger.kernel.org>; Tue, 19 May 2026 04:08:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779188879; cv=none;
        d=google.com; s=arc-20240605;
        b=XGcCUJkb6RMgw15c1UrUrBB5xI8PNqClIqoYqBcQoXwlHme4SEd9JBztt8Kc7jpXW2
         BVTAlyGjW7jYL6+e4wFsYicl2obpQfEUdaMvdWm9I1rWMMOoPUsd1i9hI1zsfkA5fJsw
         66NQz3o57ESa68BOqjJcFgkT3MheM8UzcdkpWLJBZLJKzMKL8ZhonLP5HCNqCO+b7Oyk
         rjfJbotw+O7KA919jLsvuYJFQmUEE23bZRIbWO+BvyIlQKoU5VderihJxll4eqcn7ALH
         bDdXwgt1j6zmMQ3NHyhsWPiqnsrU3WgVTuxw2nWah27c5UMPHkhJq+odU3CTW+2f1Iza
         e+bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nhTmhA7EtvBhVzOtpkjubbcdCBekT90z9FnlkG56Nt4=;
        fh=qgoJItg/1LJq0/ADl3wzE3LJmvstAAwMCxSzUAjUo3Q=;
        b=jX0I4uXADg54kwpL8t3IbUr1w3T9KS8yPB1ucqKffROA1dxoKgOdZaRRGzXKE1Agj9
         6fTM4plfcF69Orst4TlsBJYpyHHcnrrlP6/AilT55V427C52f2ZbiBXuUgKfqI7YCVdF
         M+GjEbxVqKVVc48Pc4/AOKE7Bs6sLtXI2I7CXASWI7hD/mRAfsQu2IEDpKl6N9PetwZQ
         6Z+EPV1nHd0hwtLXW0jyHW1/U9WNanuvH7E/vHc/lSIt16WuOkV1cbPWc/CUdUI/ngfl
         wj/PK5ltdhhA1JVUiOL22q7fyim0W+gW7k/sLlS67SIHC3suo5nF8/28gVrog3Voa/zU
         cHMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779188879; x=1779793679; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhTmhA7EtvBhVzOtpkjubbcdCBekT90z9FnlkG56Nt4=;
        b=NkzOT8mXh6bXhnJvqEtApaE4S4veNhy2u4ev1hghBlqH6x0n92yVBDsJ2dVI/ZJivu
         9A8hpggl+UV+EG+gZ3coLNVauocffm06kPS6Vsilr4oCfGSd+pU0V/7UWBN7MJ69Qwj4
         R1O1gypG77mvtOgIEZmtoiOoxIxx/0pznmMVmWyQ4agGZcSLDIFoxyo9RDUI+MxRlN+5
         IdgW+epOIw+p0gT6dT9gkmNG7DD8Tr7Gq7TAph8w2yFKfIgDr2gJ4ppcyT6UkCIFCNyf
         8Jw0CWqYMJEIAQUcdMZMca1DkDroniAfLQjNSAqdcZYDK/d8nqv1CAJ1GQZJXX93ZFJ9
         eCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779188879; x=1779793679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nhTmhA7EtvBhVzOtpkjubbcdCBekT90z9FnlkG56Nt4=;
        b=lTPiqirsNjUaz9TcBkfE0Knr1X81MJHtMXeOj3pTRQMHgKDN97AqWBp5OTyJD5IZ2O
         hadGdj9X8TvRmIOTKtAnbNnNhCUTOrnOvwqb0HOP0xXWd8cnk1PvZuADCc2HFkE/48oE
         ztwNQ92Naf3uTMAUg11y+VgoDw+B5Sr1Ym8cPz1WYSQZjuNzIcicFQlvZw18P9tz4US/
         r33LZGfW1CBddV9QetQS/dVH4pux9GH6qBjQNINsEsg6WneiUYLqor1m1T5h56n6hcVM
         vJXJtS8mLJjL8eq0r48bqKjKxxZXNgY0jwZKWDDStBeXGtL2GgqrrbuhIX25D7XTmx91
         Gttw==
X-Forwarded-Encrypted: i=1; AFNElJ82BYLnM8543PRmR2bTRLXa6L6hScphV5m2Mw97O/zZIrKnsu3kbbBO/VRhCSL6xMsxsgqVnA8mjmdY@vger.kernel.org
X-Gm-Message-State: AOJu0YyA5r4Jemsy7KyJSt+oWQQIfAfl8HU5//JDK/HRZZ8etew0kB8c
	DH9v2kaTNSj/RlyKRI+sZFlsAKJTDQWE7Gkd07h9QbkjQwUU9wII+HuZHcHj1ukc0JF8PCt7PpI
	IjnAAj6wi4fjNDCGzQGYYDFFS0KanIHI=
X-Gm-Gg: Acq92OFkREpArEdriywlCsEiCi0WW9JnuaFgCJbc/KpxguKK1t+iE5hdj1lg9e4sIvg
	EgHLgwlBxW7aQajZ9B2ZFw8nKqb1n1hLnZJDmvFoAfZcpCOLESACEyP6QHpV/4hYog6/J8Fqg22
	Cf0D7MXuNSNQ2if+6saQN+xiLxcEBlBkxQEUFHQqf6NJKk1OsVEWMDIbaD2PgcX2LNujtXgBpvl
	3HyU6VWoEibHlM/GJzBFVrCfRevaTaIvdBHE28IeWYpX0PZ7kCaAIPwsftHygxeiB+rsZoIVyF3
	mDrPt2/gTda1mFrUZgAZv1WWF7v1xPycQupklu1gycmW1xiYrCDGsvNTvyvAaPYPOxpTt8JSHxI
	KiT+r1wbBxo8gGrPE+8DwyWg=
X-Received: by 2002:a05:7301:6785:b0:2f3:3835:2010 with SMTP id
 5a478bee46e88-3039870650cmr4323491eec.6.1779188879399; Tue, 19 May 2026
 04:07:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518042833.272221-1-enelsonmoore@gmail.com>
 <d40b1e80-37fc-4c88-9d7f-dae6458efe6c@app.fastmail.com> <20260518105735.GW3126523@noisy.programming.kicks-ass.net>
 <20260518172444.zyd47mcagrcwu7wt@dev-vm-schuster> <CADkSEUjhq6HSdg4ignzbuJiN5uXATsTdxFbRJ3BMxs5=WUWLDg@mail.gmail.com>
 <20260519103012.blot4bssgiqfer6p@dev-vm-schuster>
In-Reply-To: <20260519103012.blot4bssgiqfer6p@dev-vm-schuster>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 19 May 2026 13:07:46 +0200
X-Gm-Features: AVHnY4KWOiWEY77zuE66kq3xKsBRyVSkUGj1e6jCXaPb6QA3ygej9CY3aqSmM8c
Message-ID: <CANiq72=6oYtHf0Q1NaLXZ+25uQyYbej2xnvUhtgpHyvozhP7_Q@mail.gmail.com>
Subject: Re: [PATCH] nios2: remove the architecture
To: Simon Schuster <schuster.simon@siemens-energy.com>
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Dinh Nguyen <dinguyen@kernel.org>, 
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
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

On Tue, May 19, 2026 at 12:41=E2=80=AFPM Simon Schuster
<schuster.simon@siemens-energy.com> wrote:
>
> Sure, I'd be glad to do so, but so far I refrained from it as I was a bit
> unsure about the netiquette (can I simply do so by self-proclamation? At
> least the git history seems to suggest so...).

Up to the existing maintainer, in general.

I would also suggest changing the support level to "Supported",
instead of "Maintained" -- that would help justify keeping it in
mainline.

I hope that helps a bit...

Cheers,
Miguel
