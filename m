Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847A536F8F7
	for <linux-csky@vger.kernel.org>; Tue, 15 Sep 2026 17:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494729; cv=pass; b=EY63/WI7UYcGciKIL70BpGOEh2YiklgPu91aRHS2N+y0xruz9Bg5X30TRjwZl7F9/utO+28ZsisM27RBM56C8oCwsXcPR/Ni2v6oywl0USqcD5TEkt9Y5TV+HLxz3tH15ZfyD33Ira+kyjpKZPBc8EbitIDcHupSiWb2Zl03Mso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494729; c=relaxed/simple;
	bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wl7TMPFlJ8PPi2roC3Rx87K2x2ULHTKuVTh1/2F7eAdtQzKN91MOYGVEI6+ciWfY0qSMV8zPH0LB0SGf6FJYrCdCa7br8g10LF84WSzG6QajOQtxLtyLvezMXiU+F1buEcQWd+wXEhJH8Yu1FsOGMxTywxYniILVDPZDD1kY7LY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WPgx9Wh6; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WPgx9Wh6"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd4b917769so6905ad.1
        for <linux-csky@vger.kernel.org>; Tue, 15 Sep 2026 10:52:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789494727; cv=none;
        d=google.com; s=arc-20260327;
        b=iwLJYShDucibn5DkxuSa8sxuVs6IIa3Z264rve6zyPBlXMdt1KcE88oZHT5hDT8zEx
         yC4BKzp02+qFBqn5DE8twCZ9SB/LIeesOAdKj+g1H5kWV6vEg5JXRY66b8HLT6pRqgXb
         avbUkVYcSNdksNLokmzsCC/ge5GhuAGVAEPqV0unLi+nZQK3PX3nfPVJcc1NSU51Xk0u
         CbLiodi8VNIcq0VgzpG8YDF/K6C4QDTZbgsw7qlh45oAYsKEmD8GkHiEX2rCO9F993PB
         SmDPPkSIzWksvQjjfV2HvwsWJ8i7NrML67fkyfbKSiiddz/fOq0DJi9dJvwXapJrDNfd
         KP/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
        fh=/6VqNRkCV+Yi1W6vthmD7rL3ZWSKW+V9jxt8Fe2+VFg=;
        b=aCGDUHxb+anH4BSVgKpmp64LLcZ5ecd0zbt3XI+Fc4XlL5TB6JI0/zVNbWMUVvmV/3
         Vlh7hkOYV0caAvhR+EuPfFEwWzsUDpxueIN1qHQ7FBtqXftmcIYHTERHVsMpmsiNDsQk
         FVW7HS5kHPVdc9aYSCZRKXCJZYn3HcWAhG4xdyUXumzciwnhOMVQu6vnwdnTzkfXPngE
         qOe2b6wqB+H064tm4OVHQ/XVXsi1vS0xHiPAOdjHzesAFGiBSIvln3a/+ejhebhzoWPR
         uOGg2AC9thnqua9z0npCGxJVJk+mHHyfsFcz6ORHxzW0ZJ4pr1celjQ61CLuxSNaH/ig
         QlhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789494727; x=1790099527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
        b=WPgx9Wh6g8ehXMOaZf8ZSNtevHb9fzr3lXk5INKsJirqC99dpiARLSwTsIwHA4pbMW
         JbWx8MvBxDUFu6opqA60njTwuSet+XjH0Wga4OKXeEmVhOXoy61UWc3rqiL6EU8/l428
         EjMY1UqvowxmFEZiD+cpXVE0I3gM0Ssco82ZH8FSIs0h6jzSdSLoGG2b/9Ga+W+7Aup7
         R3Y2jKX2VRyqaVjVjF8po02JGQLWYioBTM31SQGX//CGOHsZjgwuKy0KaaC3tSzQflwo
         ISJi8sLOMT0xayOGlmIx3TnuUJAs8/tTEps0xY78QDJPw7a+XDrg4k1OSruo0M4Rr9uE
         eRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494727; x=1790099527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
        b=0DPzPr7bobMUVTQ3pk33zsRDNCVd3yBKcYjOGj7A8+yrp7Q/IhbMMLfU0plh3KB5HC
         YpmOlyF9ZPgops7O6BBHs6gQ/go3TiEGP3y3tHWbS4qVQIk8THZ/BiQ3GqMBgh+8emYz
         Vkty+8nCH+5+UDWgWqxK/fKXMxcjQc8rgbTvgDxDhNCxD1NiTFxI7k0g0yn3cuPrb2nC
         s3Ro5uV18n8ZpOVPZICNtR7uqh1VFRYP+AMmp5itwXfDaDZajvSUDc9NvXV/vhdV2XAi
         w0d2hEKoRhYtNEa5DSZ12Hs+ZE9cshYrlOWF0a1y2ha+i1Guhmej2AKRoq1BFcK3rtM8
         /5/g==
X-Forwarded-Encrypted: i=1; AKwUvBzq6Jqw+p/QTmzq+3zqAYv1/7+PWDJaBGEMvhLUAQE7iF+l5xCsa3ZnEnmUJg4djSh4rOCzjE4rtLRx@vger.kernel.org
X-Gm-Message-State: AFuF++kct4weDFy+zvkxl7JoD11BQ9T3v8XfeJixLyNtu+inYgF8zfMQ
	pOoyW46Ah5piZA3+RHk+7p0YQ9cas635lxnUKwtO0csPAgasRvKHpeuHWzmF8agRUtipdx6FOMB
	RMKxg+KBOUYjQ5YqCwkQAn1l6tTg7xEs7u6SC4enH
X-Gm-Gg: AYBFou2HNO9VfU60oOYHnyO/VYeQg9ftdaBl91emHOqrRkSDy/s3RbLn+7Xodhpvjv0
	kbu0csLPU2C9TKKgSAaxAsD1a1TAcKSa10Hh9ww+tDEtwxtCTWosleLaX+4GfDtI4GaQOMZO4qN
	dQ08LVZ5MjX72L/qWQ4MQAUsQ3MH4VDPGJ9yO7BSVk5vSAeokrq/8yb4lEP0Zoyeo9mF1vV9uUx
	m7reAgBqjDW2NxwefWS3YxGCLdb7A7kwszqnviaflq3JESTUvPq0+TIN3wcsSse0dUZI7U015ID
	47SiSqTFm4CpeSXoYCDghMsDZLpzQ5f4LTN91ixrHwPwRi5lPYL0bLYfGyHmewO+CK80CLeHeih
	gcCStlRxUNrrQCGzrkpNKZYYK+LTGeltLp2cKq/MfRyIu3lRe5Eo=
X-Received: by 2002:a17:902:f612:b0:2dd:5363:31ec with SMTP id
 d9443c01a7336-2dd89c0c38amr177395ad.14.1789494726332; Tue, 15 Sep 2026
 10:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Tue, 15 Sep 2026 19:51:27 +0200
X-Gm-Features: AcwNN1Vhgv53PI2-XyXtJBbVzCNkGiiWjtvOE2b-8zHim7-UybJ3H2xniPj1VUE
Message-ID: <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Christian Brauner <brauner@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
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
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 1:31=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
> TL;DR, this lets arch code handle fd install and cleanup. fd_prepare()
> allocates a descriptor like get_unused_fd_flags() does and records it in
> a slot on the task. fd_stage() attaches the file to that slot and
> returns the number.

I'm not really a fan but I feel like if you want to do this, you
should be using task_work so you don't have to touch the entry/exit
paths directly? (And if task_work is too inefficient somehow, you
could tinker with the task_work implementation.)

> When the syscall returns success the exit path installs every staged
> file. When it returns an error it drops the descriptors and the files.

Is this mainly about stuff like "we installed a file descriptor and
then the following put_user() failed"? Because if so, I think a nicer
fix would be to have a policy of "if userspace provides unwritable
memory to a syscall, just keep going and pretend the access worked",
and maybe have a sysctl that kills the process when this happens to
emphasize that userspace should not be doing this.
