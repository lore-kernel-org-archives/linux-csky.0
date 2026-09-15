Received: from mail-ej2-f27.google.com (mail-ej2-f27.google.com [74.125.228.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CEF38CFED
	for <linux-csky@vger.kernel.org>; Tue, 15 Sep 2026 22:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789512918; cv=none; b=Qj70ELm9mCRDbfxiv36dG4rmXICktNI7anYOR1JaPtu3bGQRTe4iGAzbSgX9/FCV8yYHLJaYsIw3v4q0Lwf7LNO6Qaz27Bjv7HAiYMxTPgB3+Wu4QdcI2uHPeerNpmujDRsjzKbGRA0DNixG6xYwPyneDd24XMgGLElbS1lA0gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789512918; c=relaxed/simple;
	bh=ITz7hBythv5OWTbmQ9c4e1mzRPysX2+YTMbCrseTj6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f+olP/kGuX0yech4112j4MWeniuyA3Gl5pljWy+Xgoi04lcYtpYi5GzkAxo2IPJ4mAV9SrnQLkgNr+xS8BWS7zJ1ep4KPqCXkYBTy4W+QkCPzI8BONAXbxBsVKcvBk+NZwQMF64049J3aBTwtjpbGmAzQYt94DEQs2KBjpF4YLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=O8zInPWI; arc=none smtp.client-ip=74.125.228.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="O8zInPWI"
Received: by mail-ej2-f27.google.com with SMTP id a640c23a62f3a-c254f6c7a58so58012866b.2
        for <linux-csky@vger.kernel.org>; Tue, 15 Sep 2026 15:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789512914; x=1790117714; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NEEN5klK6sYQ7k8fj+V0z2WeSFVNwjy5fJJIdfiMPQ=;
        b=O8zInPWIdyxyOa5FLkMPUHA3YCGWIiELKOQ/L6484wNxxTf9lTsXdbe5Jtu55K7Q+P
         iy2mxlVKms3E8wCPHNo/6//rHBOqwkZxyHIA/DGNKVacM/d2k88mwpsHwLM215I56XFw
         eB0PiNUAr8DA6jrTxjB3eiFi8KrMYLE22XljE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789512914; x=1790117714;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7NEEN5klK6sYQ7k8fj+V0z2WeSFVNwjy5fJJIdfiMPQ=;
        b=L5NhVsyn/S9D3RlKTiXhE7cVIcf1xPsv4HJ8og+APHV2q6g6nNGP8o3/guyzWlhJDc
         2OUgfRGEP0SamMSfOCezW+C8U9ZUNLfnKPBaFubqAsCfyRlB+ojVczcsdLtvh+I/RTtY
         I9dbDUm6SEzVQhGctA1IRPBnQtikR0BB64nMRuloNdUfw4D/44hi2/bk3BJ2ShbX60a1
         /mhN/g/rj+Xd19g1B9qFUw3yiDKPX40jFKXImpuX/ScrWiGRYby9tzxRR5JWuii1Cfa+
         V/ecxUukAfQzQRLBiMimxVIk3aL57Gblrc+m2xcD+66IyfAODP2d0q+ZJRKyfp74H5UW
         WTQw==
X-Forwarded-Encrypted: i=1; AKwUvBym5ViNby9+5IDJsvUPsrBfysZqdvDjC19txWCTFsWxSulU2heuksZ2PIbVWcNhHZpE3R01t6VmqWBG@vger.kernel.org
X-Gm-Message-State: AFuF++l6VGpm269oWHKcm+wChfcbODBkOqclE/6CARtCafrUb+YgvU3U
	n6FFXu2Ra9DsSvy5IA9jIDjFZiNy/DtWE2Ql0NT57jOJPjuioG41nXpA8cwDmUIzGZmTcVuyaEM
	yaOjdj5tAYg==
X-Gm-Gg: AYBFou0FzNx9p8eqZuFZZa9stRB0Xfc+2yJdVsJB5oxtAGy0QEPA5EwOdESpEcfLHZE
	HiLVDKSJy79tAqRjCbj+LitxgD7jpSilrMatVYwATi+eWIe5MhwrJCA6B3pfU5QUrJ584gweRlW
	D/COiRYE9TztcUTTMHmJQYd52RPfvo0yoDeYzTJzm7dmsEpcom8NtS8u8I0mKg9BkWpXLxMNFhQ
	TyWNvamRNmt/wt2tIysvD2OW9j+IOFAb87OWN756B/BMlPNGkdaiTolbznjvrXFvuNhmPF4W2oN
	bJAosjBHU4Sdl8DM1vFvKeIN2rWfouYB53VZyns02/gntBnfvcMJQMc1aTSDVbKWoDBGiFEqKfS
	36Uu2bZFDcB3bEZCbB49Zw43lmjcxSPPKIctwbt6tjGryS8XBFanjDOe+jvhDdUzavKUCeOVoW/
	SnxBPR0G+ikFNu0D/JiGrO6t+vUtVUE6NgZ+hQNIr9Z+DwuVm46qclebT7XMaqExw0T3MMHBZjq
	zr+bR5ycPU2w9IBvNMSSruKdfrvTuKO7zQK0lRDguYnuntiIA==
X-Received: by 2002:a17:907:9621:b0:c29:4415:2ec6 with SMTP id a640c23a62f3a-c29e520778fmr9509266b.12.1789512914228;
        Tue, 15 Sep 2026 15:55:14 -0700 (PDT)
Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com. [74.125.228.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de48ce9csm32997566b.25.2026.09.15.15.55.14
        for <linux-csky@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 15:55:14 -0700 (PDT)
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a605844571so457267a12.3
        for <linux-csky@vger.kernel.org>; Tue, 15 Sep 2026 15:55:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzN7nags/JpPt1C6yBAi6cFcToRsN3QNZD9Ka3mJ08ltODNj+kC+pyUjRVKKytpRgkBeSbEBJFZqVYk@vger.kernel.org
X-Received: by 2002:a05:6402:5d1:b0:6a9:a6c0:e5ef with SMTP id
 4fb4d7f45d1cf-6aa2244ef06mr218172a12.37.1789512913950; Tue, 15 Sep 2026
 15:55:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com> <CACSVV028AdnTYa6OKDeoJYCau58uTkKMgEdqTn7crNSV8QZxOA@mail.gmail.com>
In-Reply-To: <CACSVV028AdnTYa6OKDeoJYCau58uTkKMgEdqTn7crNSV8QZxOA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 15:54:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjhJF91TCO0Zqeuf+caG2tQZ4AzbLr2qFmRmnMM4dbh4g@mail.gmail.com>
X-Gm-Features: AcwNN1Wx2MaYDtFtmeOlL6MnzYY7doY_FEPpziKatTBWbLOeKsjmritQ5JuAL3M
Message-ID: <CAHk-=wjhJF91TCO0Zqeuf+caG2tQZ4AzbLr2qFmRmnMM4dbh4g@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: rob.clark@oss.qualcomm.com
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jann Horn <jannh@google.com>, Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org, 
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

On Tue, 15 Sept 2026 at 15:21, Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>
> With fd's it is more than just about error rollback.. exposing an fd
> to userspace mid-way thru an ioctl is an easy security bug to write..

That isn't very common code. It's something that is done by a few
strange cases, and yes, those cases should just do it right.

But "those few cases should do it right" does not mean "make a whole
new subsystem for this thing that makes a simple "open" actually be
slower and stranger".

             Linus
