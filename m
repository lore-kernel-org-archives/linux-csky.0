Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616803A6B84
	for <linux-csky@vger.kernel.org>; Mon, 27 Apr 2026 21:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777327089; cv=none; b=TrvZXGiDXw6bMTreJtz6ncVNxew5Xfdd+FxL1yxi1t/waJfC2Yxr7WKxPAKqgrtTxAPbxl1FzKeuf3H1rIXQju5/pbo5ASMx283WkEZwhmPJ7QwBzmKqkq5AT0UQHqlVC7KqLrMRrb/QGRjdd1GxKr/bFCmKlhcFaFIYJYJQdAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777327089; c=relaxed/simple;
	bh=7P7VU36hQu4iMsGekLZKiPL3rBFQOW0TOaXA+fXfycA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dzHlxJjhiNZQ6BC2qAoI7X3e2wtn/slMUMeO4d3lz1kGFVWQHOPxIhjN0Iv5zAXkesHotQKzt1SJYT75cGigW/uEptlGZKRCZNgV+/CObkAus5P/UaNIhDtj+aMlnwjGZZj4BQyVIXcTatePmLem71sGaIWxz137zQwhSxCb2No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=V9kh4aK6; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="V9kh4aK6"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ba7a1cc0380so1770664066b.2
        for <linux-csky@vger.kernel.org>; Mon, 27 Apr 2026 14:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777327087; x=1777931887; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eodThUBj1SnOvacXe/3ftYxEWQMFbYqc4B0FCa9Alx4=;
        b=V9kh4aK6Jx4LV3ggXYVM0jcIYAbTD9ElLQkmxKZv1FiuJ/eKn1I60PAESatmdlWVvw
         H4CP94ULTxyNHGURRnO5UdCWvkYxsfAjsDsdhw9cvZ7NfMyk/xqP7vxf3nvBB2ScSnvJ
         PqdX/Zb0OgV6VaNREvwN8gns8R7kJjScR1IZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777327087; x=1777931887;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eodThUBj1SnOvacXe/3ftYxEWQMFbYqc4B0FCa9Alx4=;
        b=Vnc+rBHwU28OenIecrrKOqrnyHnSzB/sGl+JEPqDRXAOgaI7frzUa0zSeXV3KzE2Js
         6LrUdnIu6YyOuJfwFYiZ7RpzqAWICUEbF5mBU3rzcSK6azSDToHlPPSNlML5B2WPIwI5
         quY49BiBAGGOLfHfw/Xb2D2OIJZvE1ug6mu32+ldnl35Jg7A2CXVCrNis5Kxm4+4/9Z3
         CWin+efLc6adfVj5wRE8ntf+WJn4Y3z/ougsFHeFPQ1Lzzr9lfDUR3dnj4cS33V8mgn4
         jquFv1TLJUY6xHGpWKI8hrJzXctJSrd/rCxu7KxVhQgOW21gZ4xB0cVmESU9mvs1oRao
         tYbA==
X-Forwarded-Encrypted: i=1; AFNElJ8CE/paxaxmD6cIRFuQotqgqMpCOwKPh9lgNIcVcF/osDBFXsUgDacS4fWUZPfAOoW3wKq2AvZAX6T1@vger.kernel.org
X-Gm-Message-State: AOJu0YxUeVW0Ewag/uTQm09aHewnMMmhzhg+Wp8f2GYzULrQHFjuodHJ
	Rp3IxtTsxuuI0rf85wyxe53VzJXXNt9Vr1dSrry4kIp9H4pXbc7PWEC7ZLoqCJLI8Q+BCeseJ8v
	vaW1cDFtJEw==
X-Gm-Gg: AeBDietrxZyWfiO2Fm31O2S9due3VFXF0/gswa/LCQN0Ils50er5S9RSZMxLkr2WU1W
	7XkEcb4Gpn9YXECE+/LDqbJP4ivNAUMlAlUWsa1i1qbORncxoAs/SOkgAVN/6nWLW1clxIl3FDM
	yrOjioOT9Ks/DhV347ZHpXT9JeBn1lcfru34STpMM+KEd0JDBMe6Udkgl2w+hYg6qABVXVAoP8J
	0wJN26jN0kDFJOHGsNJB86mj7SeleyOQ24SEvlqf3wvAF4XHlTQT/U1dc3VxqjtW/3jS9aefVlL
	eqYOhZ9l+L3QVltKamemFZKChUcj/27H9fbDa2HUcQM2Pi1peJ8WEdfuXv/LM3M3aNxVdGqsojt
	MZroRllwdR7Dr3T/VVx9CjlYsQ4BZpq0b8yLPWTfszF8a8V6paI5lbjTpR3SgvxmXVGFSbBMJmr
	Yh+G8GGGvZqivc/IYM94GrW+qRqorh/Wsgmclv/ZxNV626/1gUh32q0UxNYc517qVB22LH0FwPF
	SAX5xy5D5Q=
X-Received: by 2002:a17:907:e84b:b0:ba5:dfa6:1e8e with SMTP id a640c23a62f3a-bb80100e719mr32301466b.5.1777327086493;
        Mon, 27 Apr 2026 14:58:06 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80c0828d0sm9859866b.56.2026.04.27.14.58.06
        for <linux-csky@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 14:58:06 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-676e62faf2bso10759332a12.1
        for <linux-csky@vger.kernel.org>; Mon, 27 Apr 2026 14:58:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9JiB1YIYjlF78+rvLsTiFAmJe2Ca5uFr2hr5BlG7Uy4mn+X1utO6uYKdlgy0jmVLsWnC9MO983dfwc@vger.kernel.org
X-Received: by 2002:a05:6402:35c2:b0:677:270f:6f4b with SMTP id
 4fb4d7f45d1cf-679bb04a8a7mr185115a12.1.1777326742385; Mon, 27 Apr 2026
 14:52:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <0ee46bb228d97163fbdc14f2a7c52b93d8bc34ce.1777306795.git.chleroy@kernel.org>
 <ae-j2_QirCySZD02@yury> <63a4d0f6-0eb3-48cd-9f98-bf7b223b2606@kernel.org> <ae-2yLWSGnfeTvh1@yury>
In-Reply-To: <ae-2yLWSGnfeTvh1@yury>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 14:52:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgPrLy0FR3sEWBYQuNAac1axDASYMnTuPuxEU0WytzL7w@mail.gmail.com>
X-Gm-Features: AVHnY4LQUFWo9ODz4M3q2vZC9Gn8nsdYr95Nd4ky5ERVHHxIyN_9ZXY5zjebfdc
Message-ID: <CAHk-=wgPrLy0FR3sEWBYQuNAac1axDASYMnTuPuxEU0WytzL7w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 7/9] x86: Add unsafe_copy_from_user()
To: Yury Norov <ynorov@nvidia.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Laight <david.laight.linux@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-alpha@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, 
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

On Mon, 27 Apr 2026 at 12:19, Yury Norov <ynorov@nvidia.com> wrote:
>
> This is what Linus said when added x86 implementation for copy_from_user()
> in c512c69187197:

Note that some things have happily changed in the six+ years since...

>   That's partly because we have no current users of it, but also partly
>   because the copy_from_user() case is slightly different and cannot
>   efficiently be implemented in terms of a unsafe_get_user() loop (because
>   gcc can't do asm goto with outputs).

now everybody can do asm goto with outputs.

Yes, it's disabled on older versions, so it's not *always* available,
but all modern versions do it. And if you care about performance, you
won't be using an old compiler.

             Linus
