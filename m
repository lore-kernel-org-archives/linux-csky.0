Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686A44CE66B
	for <linux-csky@vger.kernel.org>; Tue, 15 Sep 2026 19:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499360; cv=none; b=Upe7h3NDIUNJ96OiC5p7rpd8EPiZf9eSVrNAxPqe10LPuCgl2Ik0jQ0ynpYhD+4M/KMSRK+RYP4/FfI7G92+FBSOTO0AfZYuFSdJnYcoaBtjiTt1wR4nk+EVcYIJRZe10zHMJv/EzBkKiHFMluk13vrtG2w1eLlqzSMNQ8wZ4qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499360; c=relaxed/simple;
	bh=AGk4y8oFpNibhByHKIxcRS7KnQx6z20Q8VC6dFl1tNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hnIAgyP1zJWwMh+oASX7eBNLG2/uXWWdbsJ3eWkPmftfkCcgZ2LdPrlJ+L63lYr/96dpt5Ap2H1iwqcqmox3XRJ2x17anLsmoaQadw2fIafBZ9aAdqAuedwbPFSqMa/FDibQka4yomUPIKUwHGnqbNivGhuHVozmesnQbGJsH7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CSrtt9Un; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CSrtt9Un"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6063d7dc4so254721a12.3
        for <linux-csky@vger.kernel.org>; Tue, 15 Sep 2026 12:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789499357; x=1790104157; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XFFk9jJtDswBQpA8QWIooO6lLG4HdlvPT/LqykRjG+U=;
        b=CSrtt9Unpbm2RA3J8D1Piu8PqBvT7/aa/KZ5CE3c3D++Q65F+8LC8PQhJ+YAQkLRZF
         FOCbEfcedihMauvO8i4QEZYDfsgCMc/AU6Y/5BuRF/k4i643ZbHqsUyNas20hZQzkd2E
         0RZUaMtkje/C5faG2xlXImdyEwn4T014v7tJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499357; x=1790104157;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XFFk9jJtDswBQpA8QWIooO6lLG4HdlvPT/LqykRjG+U=;
        b=gDtn7qZaqgf4H8Q/5iMpLg+YrKbH+KOhnZ96eHQ2ieJyyS7W4pBuhPCc92XH/3gBYO
         6msUES8llXyo1uBO6joDePmc+sgOoDbESq5NqXFisJ89zzQ8EDEnRpeT1fyTU4p4xpS7
         pgj+E5dmJem6J20lvcMOYvYakRWSTAJQY7yH0oDOOBiRRGxcjzZSU0fiJpYLky0cIbbc
         3vRxmy9TzJGiK+B8BYTBZo0vaUUBOHXbtZPYDbKOf8Ucglvh8o0+ZPlZMABnjh+/sCWJ
         f6RufBGNrHpEU/NQ1KXAjSYdpaSDkH8OyeWigjG+2qBQYHlRHQhJwcXPqRUT1BseV8eh
         FUrA==
X-Forwarded-Encrypted: i=1; AKwUvByauhBypvw7AXa3z1LOu3YuQcxlGYSKl3ju02ako2KH+z4TbvUDz880P8Z6cHn/6XnDLnaLJoQ4WpW3@vger.kernel.org
X-Gm-Message-State: AFuF++nrxbjZst4RfKWnOEUbwNiuKMF9njP60OdOZZiRi9FzUgiLmYWU
	lyFKKlGaK6DQOhASYxhkZ20m2D0IoiTPZi9ET4C3bgE/ct7+vUlZhEWvIFB+7MT43a6rQZeTZ9+
	+BKVjuL4=
X-Gm-Gg: AYBFou1pmocoTJE+glaU3nyLD3PCXGQbATBATsJicnxpYA/tjPfcaNKX8HT5BOFCsk6
	RpY8vkHs8clX68wnSj7BYJBJJkEJua4PYWRD8n5vFfJTQqVGBr5NYGgtYFqg3s6S0v1vS5TpW/C
	0L2bjaFzx7yiV1nhxioDaUc+9gMJEkBrCfBrgBz89Ualrg3gbgMqfaONSBomlIWNJKiE6x1WCil
	2hFBMgvCpE2oLoS6hTzMZKlxMLqDGbt2Wc62rsSqdpaiBnKkPkHpgV8ha8UOosadAYlzgxmsUPf
	RRW47gnjc4hGy56hXuXj2QCxr6vB3e6GC7Ayf/sID2KbSBIql298XVaurppcE6LOOst47yHqgLV
	MpFZOdosCsRJNOuPnCpscMR+RdQUEMLWeD+PEz9p9usGf6Xg9vYc1j7BVG9gy8plS1RPXUHT20H
	VWGyM9a8Hk+heoKyZbgdpiOlVEp5WxP2RAida8y4wRykBoZ9y4PaPBzfq4iFalsJQl03fZZwfFF
	ZYMWzolmH7Ik+xtsGpO91m7FkY6AgN2fKTllOuEOo04tkaxgA==
X-Received: by 2002:a05:6402:4617:b0:6a5:f4eb:df3 with SMTP id 4fb4d7f45d1cf-6a9f61e4e87mr11439524a12.2.1789499356678;
        Tue, 15 Sep 2026 12:09:16 -0700 (PDT)
Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com. [74.125.228.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1cfe0570sm151277a12.4.2026.09.15.12.09.15
        for <linux-csky@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 12:09:16 -0700 (PDT)
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c254fa663bfso33743866b.1
        for <linux-csky@vger.kernel.org>; Tue, 15 Sep 2026 12:09:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBydGDj7YY8AgxJilzRn1N36dDOzuwi073JYV8+gFgTgZb31ux8lQ4cud0X1h0nz8dUxJRMseqLx+27o@vger.kernel.org
X-Received: by 2002:a17:906:7309:b0:c25:47a4:fedc with SMTP id
 a640c23a62f3a-c29b839a057mr1176039766b.2.1789499355710; Tue, 15 Sep 2026
 12:09:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
In-Reply-To: <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 12:08:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi3Kkqgfg6zUTHpQoZNL2VOB4vYqpi6RX0WNO++29UtyQ@mail.gmail.com>
X-Gm-Features: AcwNN1VCm0LMG7z3Jned014oJh6WBcf4uOx0OBk98_hrtHKbrhcQiMMJ_A-fmB0
Message-ID: <CAHk-=wi3Kkqgfg6zUTHpQoZNL2VOB4vYqpi6RX0WNO++29UtyQ@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Jann Horn <jannh@google.com>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
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

On Tue, 15 Sept 2026 at 10:52, Jann Horn <jannh@google.com> wrote:
>
> Is this mainly about stuff like "we installed a file descriptor and
> then the following put_user() failed"? Because if so, I think a nicer
> fix would be to have a policy of "if userspace provides unwritable
> memory to a syscall, just keep going and pretend the access worked",
> and maybe have a sysctl that kills the process when this happens to
> emphasize that userspace should not be doing this.

We've done that before, where we just ignore put_user() errors and the
user gets whatever the user gets.

It is maybe not optimal, but it's fine. You can find quite a lot of
unchecked put_user() calls with a pattern like

        git grep '^[[:space:]]*put_user(.*);'

and some of them are in core code - see the two in kernel/fork.c, for example.

One of them says "if userspace has not set up a proper pointer then
tough luck". The other one doesn't even bother with a comment.

The scheduler has two cases too, although one of them is admittedly
for another error case.

So yes, saying "if you pass bogus arguments, you get what you get" is
a valid model. It's perhaps not the *preferred* model, but it's not
wrong.

It *would* be wrong to take code that already has error handling and
remove the error handling, though.

                  Linus
