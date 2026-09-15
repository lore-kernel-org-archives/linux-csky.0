Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402DE406269
	for <linux-csky@vger.kernel.org>; Tue, 15 Sep 2026 16:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789488670; cv=none; b=poy7bsjSP6lZNVcEYcaz4c85OCsnX2VIaIAV2g0tj9/d2ocTbC6jIfgJvuAv6EDVTZNpHC7eO03S2tBTNX6kKs+J+fiqRxorG8D4SeGdP6UMH686JdfrtRxlLAlkCCp0nwifgNO0VufrY5GSoQeFb1eB1B9G7hUDKjaok42zPhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789488670; c=relaxed/simple;
	bh=TaD3IKHcoZf0PQ+wUUh3mHvOgYZf6uXYuUZRFHNcE+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XbecqNdZDW4Jl0ALItTysS2T5JGfhPe0V13nYGTiUa0g7Q7LsuVzUpd9zXF7pQjQ9l5pWcdcq49u3m0peChA2IM9XuHez/C2lQqXXSEfSPBB+RbFv6TksbtUHt3C58wIFVmhjnWcZwEUj6ASfPQWqaVwxxd2qRq2E2+CyRjUUYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=b0acKyMK; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="b0acKyMK"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99cd5115bso5818269a12.3
        for <linux-csky@vger.kernel.org>; Tue, 15 Sep 2026 09:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789488665; x=1790093465; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cj8iWYGkmy9fr6Sp+MjBMi0cvssqzarl8Tgut8FUMEc=;
        b=b0acKyMKVAlCqxdlt795Gf9r3bbqHo3UlYWTKyBG8NPDEG2ADRmsKI1BekVUf4a+ei
         AfdUAj7tepsLavyVeqJYIEBWUQ7Tb+LuQK+JZKUIvK5vVf4W22Sil4Ozo8JVtgz1WEQi
         GBmHAkfaMF2l+r1rECj5BPct/x9X9mKJB4G/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789488665; x=1790093465;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cj8iWYGkmy9fr6Sp+MjBMi0cvssqzarl8Tgut8FUMEc=;
        b=M5jTaz6XnK8BOBm/iB59MCZjx1nvi6bciWFTlxIbm7Y+Y4puEKH+JJUun5TDEzupbS
         Y62XTlhuWfQEn43y+0iNmuOkS7P7l+Bu8PeE8GZdyhkSdcZ0Xegx48S0jOvTjlT52wdS
         2rXTQjZuxCeG2cbNhuO9Ixmf7s4Iz35NtylX06vRuONXap5ht3EzITyCTEfVC5+ZBLuO
         trMebf3k8KmLvIsb11s1vsYb0IwQE+//i2wJBzBpAZyFe2zbzWjA9MrAZLL0rHtWJWDJ
         EDlnOB8Vka9RFDviPSclcLQ0lJWgBw5oli8rlH2lvIGbt3ZVMNUCh2EfEvF85DmPT+oq
         hF8A==
X-Forwarded-Encrypted: i=1; AKwUvBy0O6K9IKn9l7UYWrQG/FMGX4N+QDpquGQR7zxXGdygfiMQtdKPe9XQCv9DrLeiRXnbu94YkNEDe5lJ@vger.kernel.org
X-Gm-Message-State: AFuF++nTi7TNHN24aCKKWnJD/ethZLb4YgfPFM1w9SWx8xq88xvnPVvC
	kZn2rp6FKTV6kqaqGdzjgVwY5/+k4NNFLyAeyvukAD1s73VE0qVeXwNDgWjl9VE8uR9Xoj399Ky
	i+hC4FPA=
X-Gm-Gg: AYBFou3aHoCmXF/1Vf5/l1KjcIPTIgbxZOIuULMntZa0impIOf6IxL51jjQLqX/WtPJ
	2VIN4jIyUh9SPXcr6CyE8i6llWWy2O0Zqw/d8xUWCyCijYDSpE0fKDjmbD/3zzfO6OerjIvkS9H
	SKfFurJ9kcdoXHpBP/kr2Ds6ycxHbTEyLnYdR6Do8YX2l+1WQlaUT03uSjpXC7XEuMW+Rj2tBIt
	Be2uc5qZ6eyn7a+G2IRENklwn8tLATRL4K+fM94ctFCSeHk2BD5mA2s/HOaVJeeJj5f+pSK9zcQ
	AwdBLAPUmpvk2g95rmWW4UfpsRXkQ+O+b4uOaegwYvrW94+WsonysMlmImixBP0EMv9kxGaTEGB
	+6OtU0Sh0wQPyOpezuJJCJtoUY763qlJ4LvAVdQWaVaNE5B9BUau3rG3ylimPlZPUbm4BGJNkUN
	iHSDSc9o5hqPvcWxFFrh3GgFH4EKijO70geN2QFVOfsuIvyDYTp0h19rH0D5WEWX0dQrGsvWDWu
	dN6x7NaDrxrE5cnMU62CvRfhn0fx87ZOpEGZbju8a7hk2aQjA==
X-Received: by 2002:a05:6402:4609:b0:6a7:ee55:dccd with SMTP id 4fb4d7f45d1cf-6a9f63d3ff7mr4708752a12.28.1789488664915;
        Tue, 15 Sep 2026 09:11:04 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9db27593esm4169467a12.30.2026.09.15.09.11.04
        for <linux-csky@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 09:11:04 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c264788fd58so555788966b.1
        for <linux-csky@vger.kernel.org>; Tue, 15 Sep 2026 09:11:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxpsRXSerm27kLX4X7u1MYZBaFvvp/xJtUBHUcWc/dHXP94z4L4zxnYomPf8ob/WrdKMG6NrsJmjaMd@vger.kernel.org
X-Received: by 2002:a17:907:cd0d:b0:c29:439b:d5c1 with SMTP id
 a640c23a62f3a-c29b86141b9mr553591866b.16.1789488168046; Tue, 15 Sep 2026
 09:02:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 09:02:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
X-Gm-Features: AcwNN1WK06t9f9BcKFBIanysXcyUXK4eRICuH4x14s60AdlpF6ijCATIYaYAAvQ
Message-ID: <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jann Horn <jannh@google.com>, Jan Kara <jack@suse.cz>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, 
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, bpf@vger.kernel.org, 
	David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	kexec@lists.infradead.org, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sept 2026 at 04:31, Christian Brauner <brauner@kernel.org> wrote:
>
> TL;DR, this lets arch code handle fd install and cleanup. fd_prepare()
> allocates a descriptor like get_unused_fd_flags() does and records it in
> a slot on the task. fd_stage() attaches the file to that slot and
> returns the number.

Honestly, I am *not* a fan. At all.

I think this adds complexity rather than removing it.

The diffstat tells a story:

>  106 files changed, 962 insertions(+), 861 deletions(-)

in how this adds a hundred lines more than it deletes.

But to make things worse, it adds them in bad places: low-level
architecture assembly code.

Those extra lines are *not* making complicated code simpler. Quite the
reverse. They are taking fairly straightforward "just deal with errors
with normal cleanup in the place where it makes sense" and makes the
*straightforward* case simpler, while making the big picture more
complicated and subtle, and adding new code to places that are not
simple and just blindly do somethign that makes no sense in that
context.

IOW: it's more code, and it's more abstraction, and it DOES NOT HELP.

And yes, most of the well-maintained modern platforms (read: x86 and
arm64) use the generic infrastructure and they don't show that
low-level asm effect. So for those cases, it's mainly just  that added
conceptual complexity and a new odd rule - and makes a *successful*
system call go through that "extra work" and indirection phase that it
didn't use to go through.

So it just spreads out the work, and moves it to a less obvious place.

All for the very questionable advantage that you can now randomly add
a file descriptor without the few lines of fairly straightforward
rollback.

IOW, I do not see a single real upside to this, and I see immediate
downsides to it, and a more abstract complicated machinery.

I do *not* see why we woudl want to make this be a "every system call
exit" kind of thing. If there are places that think it's complicated
to do, they could have *their* local little stack of fd's pending. Why
force it onto the low-level system call entry for every system call
when there are only a small handful of actual real cases (the vfs
itself, and random ioctl's by odd driver subsystems).

              Linus
