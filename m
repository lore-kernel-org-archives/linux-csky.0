Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EFD37CD50
	for <linux-csky@vger.kernel.org>; Mon, 27 Apr 2026 21:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777326378; cv=none; b=Z9BDXD38lhFmSM/mF4cEmn4Ff+mOAh4G5Bw6wlV9pRxiKGlpzLc2EETRnt7654hp8btAKQzZoLndc31rbDZhKsl1n6xOMWddXtIP3ONZCZQT27AM3ESRPCnz+TF+w9SFaTrney1z/geMDk+Q3d30UDPjHxK8Gb108XFef6gk5ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777326378; c=relaxed/simple;
	bh=i/k46YQbNxc6jmDhpSrBTZQploRe2hY24KQV/uGHVj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GN0qINjDF5fneK6ya11WEy/CQYi7Gfeklr9ZeKzMjRwy1ygHWGVsoO1lCm1hFRP6BgxvYVnMASYlUVI/4gXGcCi5U/VDvazhe9F9Jlar5Txm0iSU3CurTAvy9Pcc+3bTIazk8ZSZ+hW5DKhWbJoTaDxNPOFwoJIiyTAYa1HvMOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gdDhYFez; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gdDhYFez"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b8f97c626aaso849468766b.2
        for <linux-csky@vger.kernel.org>; Mon, 27 Apr 2026 14:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777326376; x=1777931176; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
        b=gdDhYFezjYxBwvcnMY1ja8e49gVGLoXUK9s2ohU4tJuvqPnZx8ZjpFQVx5fGu9Ovrs
         2Zq67yVetZAI/DSNiBuDsJmc+cGkfOMnj4XhqzK0uumDDCyLwNGGrV4n1WaFf4FV8LwW
         H5GwVT7N38OVNK3MqKNhy4hpoxDOUXriXTgCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326376; x=1777931176;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
        b=svKZmHODtRnm3nqBIJ+enRf9Kiw/BLLEIRRZdnZVE/TOuAWon2zWhpXHz7TKEHuAiU
         cvbYXobAVt3N9qxJTUrWQ+bQ4tMMkKGKHsL2RROOu58978r4ShW4BAldyl+AV5IBZ5KB
         GCefGsiryA44Fzd3ho+LnGYo2c2zo6YwIA7f60N8vCBrOWyE886CzoFIa3WPxQHQPt32
         dh1TSn0HsU5kGkUpMvKxV1I4vNeO8GbEnnbDMQ01lzt5D6L5dNdkBgvRVcM/KTh626SM
         loRHQ9kOzezWH3+g4prKPLycVqPz/fNAh20TKXabd/81+nc+v4psHmCOcq0A2Y3effMl
         +gzg==
X-Forwarded-Encrypted: i=1; AFNElJ8RXQEwQWVNySGOQvYl/nq8TmIak7Ps3/TdSEaQ0+jTVVGjku20KNBOAKM4ssLD+4sWWTbK3SJQryPq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2tV+CusD0fWZ25nJSghhi3eTzOa2CKQS89DmWQpejuGv5dyI/
	/XP7fenhI8jBuvcCNP7DKShnQXBW0FKqzsJCfw2m/lbO4Knz2xKO9zKaJ/LTo2PjkJKySZVpPTy
	plOcyXtxjtQ==
X-Gm-Gg: AeBDietTcaOtGB+MlFBa2l8QjPE2lZ0G8UQVDF6Rc852OJEBNAt5QiWazRoYNekEEdB
	ielBFBrbvKdotR4nfdGPCb9842h/gimcxArrOdUVkKc/jf+y4jsRCVIOh51Spqif7+KucwoAVgE
	gLvle+KQo0k/SAC3Q/6VFOULdEtq5YcvS6nw0Bz9sACF7T6bvZhVwq4wA3Lb0PLQvO/+8sqmd3w
	IzK3tLEVv7sLsh2Vgnfbq2yPSSkaaZj1gI4C5HOwGc1DBXTmYl7MMTQE2LsZuzLblBJMl4qgsgl
	Y6lvraJIm7Yzx69f2Hpxo+CSD2k7Grv8wtl7X4kVYDzjSwvF1FL650dQ9YXMg2NqKxZtuadgvhf
	euztSPUNd7zrpzC84pKV3UND3SyWBZ7NPB1QVnpZaO9xyxuF7miS9Akjptz1+/OQh7Sgz8n8RKh
	cstLuoniu1Nf1h6GEQDG4p/rT/lrEM3XbFlphS0nENndQhWF6KP+5DdWFlPDBUmDH8+mnzbD4wT
	Vf16cjNdso=
X-Received: by 2002:a17:907:7210:b0:ba8:cad1:f6e2 with SMTP id a640c23a62f3a-bb804728456mr29885466b.23.1777326375706;
        Mon, 27 Apr 2026 14:46:15 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb808a35decsm10421066b.18.2026.04.27.14.46.15
        for <linux-csky@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 14:46:15 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b886fc047d5so1921028966b.3
        for <linux-csky@vger.kernel.org>; Mon, 27 Apr 2026 14:46:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9wEckLv4bUriTGlPIfbIxmwPbHz2TClIuVZBJXududFRbahF00hPF6XvaEpz/pHQfhVp3RxbG4u3Fi@vger.kernel.org
X-Received: by 2002:a05:6402:5216:b0:679:1f4f:9d30 with SMTP id
 4fb4d7f45d1cf-679bb04c1a2mr179970a12.4.1777325976937; Mon, 27 Apr 2026
 14:39:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <289b424e243ba2c4139ea04009cf8b9c448a87ff.1777306795.git.chleroy@kernel.org>
 <CAHk-=whC1DZojwdMB1=sJWG2=dsCdfyU8N6tDE1qx50HRZ-WJQ@mail.gmail.com> <20260427222914.1cb2dd3b@pumpkin>
In-Reply-To: <20260427222914.1cb2dd3b@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 14:39:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
X-Gm-Features: AVHnY4I-AxqvQRk42MegvhKMp_z4sSEpEzhzpgw2GyV2bV8dezSPoI0JTlwB18Y
Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 5/9] uaccess: Switch to copy_{to/from}_user_partial()
 when relevant
To: David Laight <david.laight.linux@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Yury Norov <ynorov@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-fsi@lists.ozlabs.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, linux-wpan@vger.kernel.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-fsdevel@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	bpf@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Apr 2026 at 14:29, David Laight <david.laight.linux@gmail.com> wrote:
>
> I think there is a slight difference in that the normal copy_to_user()
> will determine the exact offset of the error by retrying with byte copies.

I have this dim memory that we decided that you can't reply on byte
exactness anyway, because not all architectures gave that guarantee
for the user copies.

But that thing came up many years ago, I might mis-remember.

            Linus
