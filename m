Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.214.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792514339;
	b=jjzXXniCLGAhk/a+J344tqbXq7Qi1Nxq/monNB8aFKhBMGIlBGBUnmnQpCWmLA2ldPT2
	 IFkEGjbbN5ck1y6P6cR0ezS79ofwLbkINX6k/KOKQGIEcX/PvrqFUDuMX24i5Hk09g017
	 rZ//hS2Ob9OdXD/+hO5g1HCJSX+Z3NvjAoq009DzU48eTlqgTUnPnj3PPB7pvgoMbtPlZ
	 +UuKzC3t5h4Z667YCXcMc6QuS9nEFaEKINO0hJXNDmgVZEPUmQhtum/dijbCEPwQTmKgk
	 dPLDG70tlgjWggZUXBo4eHNqyRIA6VqAwvLzsT1m/+W6SDGRxk2Z6NRscI412eBo9mw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5h6v8PMV52XAIibb0bLKm7PVGjK4muo/m4wCC4Oc5nw=;
	b=YoMrKnePdlV9N6NJgAwCaBYtqjQtIqQ7iueu0pRvucWvHdcs6YGQtc7THHPRCtlBvgTJ
	 4u3d6QLTA5GZLB4zmteJQazpfnRyT4wyBQM4dkwGkrcne+7khoAVx9MiSWnZUb8qmrQAR
	 PLHKv8Wuw7bep5oGq1Lyi4MjwO5wAOvHbltAqs/iQU58xUIktv5V3rYX5B4nRG212Yr1b
	 /shzBvTch+6kRxMe8OCb3gYNLkZzJmRxgSdatKjBJijBo2d0LhPdm6dG5llidpXtBiV5B
	 e8RCKLFQSdOr9aZB3IdXH17RaO+zqgd+VcBZTXpPxhG09j5CF45d8lW0fGn1QhdoqPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=bhrjRpWu;
	arc=fail smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9172C60A3838
	for <linux-csky@vger.kernel.org>; Tue, 20 Oct 2026 16:38:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9172C60A3838
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=bhrjRpWu
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e8b20a899fso17228035ad.1
        for <linux-csky@vger.kernel.org>; Tue, 20 Oct 2026 09:38:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792514338; cv=none;
        d=google.com; s=arc-20260327;
        b=O/i0pku9AEhVOYMPKsOASBjv24MNodEcLPLz4q7Spl5Hec+DR53yFzBoHRa/yW1Rtx
         eXjFKas+fL/xKVqd0F20dEMQ9ZnwkSmLqHFCJAsDnTq6p4BpkFzx3SOZ4RgDNMSAU3u+
         eTekELHFYb226Tus6shL2WrqLozUP8FBs39tYwrNEsq66U0ofr5ge5jdavLRQJFYjScB
         jjGA3G++64djnF1A7cPnTIlqV6QFplKqJT+B7FDb2BqqbmA6azD6eIQn8xED2qz03Thq
         u8D9iBSyDddA9R1y9gQSEdcsfRbXTs5muaKNFcboxApENdmPb4zJvDk02T4RskN5iuO0
         6fdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5h6v8PMV52XAIibb0bLKm7PVGjK4muo/m4wCC4Oc5nw=;
        fh=Ix04VEr+bwHCHT4yTyLr+LnTqrinJCxw6UcI2EqrRQ4=;
        b=aDAIo9EvFJzEok1c9/8azqAW5mjY5axiO7b/ZmSNwq3AV31XaLDTqvAZSxA7vAHX8e
         05RMaH5SPHUQVYRpbfx7pspqh9B60d+Zu1fBKiB2dvEqEvqopnwHyJfUBKgZGk/LlgJe
         dg2HW60uHvucY7FEY3Y9HlnF/jD9PSudnyDHqGI3/BhXZwhMcTZhSTZuxoAiIu0gjeMw
         I8caiQrXr3t+zHW8Q/2fC1OtYXLpwXzUymeX6fDrWAQeX7bgR/sh6DOKOM64cwKufbgS
         b/aODuCG7BQ7EJvUNtOKOfBGuKL5ldtTjegRldSFHwgkuR1jlspjdhW9jEqsq/DRaE7m
         P8ag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1792514338; x=1793119138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5h6v8PMV52XAIibb0bLKm7PVGjK4muo/m4wCC4Oc5nw=;
        b=bhrjRpWu0eGR0mE7t1R2EKK44MSLwYJnxjk1nLcJSyE/TvEcfeILcndt+mxPFeuKeB
         Df4RyXiHl/+WXMqlKsBueqEOOQ3aDIO/t7Xw0Z9sahm02g0cft37HjB7TVWezuXphO0z
         faGcorPxu4XbN6jQqDP57MOboPDy4HvG0Ph0CtCWlfANenPIWK0uxvDbNsdvH4ZAPghC
         cf/A2DTYknM0OTs4gGHIS9mTYwGeHIVQkY7KcXxSK1XvA/Nfi0WYjy6F4Vyd2quPZzMv
         xJ6EEn3y5cc9ObmLNEJjyfuZnuVMJyzTbo7CcXub186JnkbfzOkwdW6RLUFiF/dpGsTj
         WVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514338; x=1793119138;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5h6v8PMV52XAIibb0bLKm7PVGjK4muo/m4wCC4Oc5nw=;
        b=HBSDkVU8dJgfSPa3Go2PD40Jq2iaMR20mdH2VjXNXvdIJE6nbdxRVJsCOlV7BhrhdN
         7hidHFyNGFa9nCAowEZT7oPpM1wGEYljgOI9dJ0enYo+UulZEOxaZyuCkiCytJDt+5a9
         jZSgQQ6amNE3Mk2Jj7tv8fpt49Rn0WyjTPBbYYQEHojFJfDMCYXmphamAnXntuGvqOPO
         eFJuOuCaK3meFL5QyoZi6UZdr9Xlw/68sJ2cfbHoYy7j36BPHSMmLuhUUxxGfkb2yhhP
         v73jVy/ovv0CzoosO6OKvyZco8qYDdq0k5M42Dwf28YB7JsIAqWih/936npZfTBsJCv+
         v8dg==
X-Forwarded-Encrypted: i=1; AKwUvBzw/Pgsx1dML+SgkX3c9LLJBu02yjyLvqlQriNupeOVFw08A7enTRAdqr07/ravYh3eIQZ8aGekRoGL@vger.kernel.org
X-Gm-Message-State: AFq9FYL81q71HXDBjJtKXK3o/cJbmid3gIqpuDzZe/aK0+TmLCTY/S/N
	+NhCHwtDxqdMbVk+QQhm8ywyvSdCHpShmubUBJ0vFQBxCuaTznGcmH5q1vf56sbHv5mdr9qJTeT
	lwMiiS+tQTwNRXQMpKczjV+Uflw8tgpaIw+ySyh4u
X-Gm-Gg: AYBFou0cZLyV9Wum1EVQNPqRcGs2yBgDQVMuIszj2WpGWdcUHJpJbvzWArYi7lIqmRx
	nkcXfU/lnyWyikfbG6rrH4KvnxKEBcypJqWgH6selwtwbYN74N7rzf0iAKrSP7FnLTwumewq/x7
	APFnFzrlhT7e611WR1gC5EVzC+kWeGQgHwJ7nhPgykEMyQxn4PZr0AXqC+YRX+1ByjXRfoAVSQH
	Zka33kSNJR/TmRFwwQDItpUXt2uD2YnY4d5znFZAtmJsFeQo5/AHjf11cZDmAXDaH5utCcLvOnS
	joSewtmcmT2i75Wp/PCbb/O3GvizFcVVPfS20VcNlpbDynh8oi9uvX2A2IU3QtL3/mS0pqlJEpc
	sZ0xhKVMNtwo=
X-Received: by 2002:a17:903:1111:b0:2e6:dcce:8227 with SMTP id
 d9443c01a7336-2e9a6c1a30dmr99034965ad.37.1792514336247; Tue, 20 Oct 2026
 09:38:56 -0700 (PDT)
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Post: <mailto:linux-csky@vger.kernel.org>
List-Help: <mailto:linux-csky+help@vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-csky+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1790088067.git.rrobaina@redhat.com> <CAHC9VhQ=FFYVNmQdiMsqg+5KDDrSC3SZS+H2=r_GkhfwQox8tg@mail.gmail.com>
 <CAABTaaBL=TScs8Qqu3b8F6KZPGMyvwy6cBC3teDaBL6MGMucNg@mail.gmail.com>
In-Reply-To: <CAABTaaBL=TScs8Qqu3b8F6KZPGMyvwy6cBC3teDaBL6MGMucNg@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 20 Oct 2026 12:38:41 -0400
X-Gm-Features: AclHuK9ZakV6IFm9eD67kaqUic0iU1MgVPLS7VN6RgjPgTRZmZP6_X_XOYOX9ZU
Message-ID: <CAHC9VhROsmzbm+AP63Sm7mqCokgEy6Zu0AVMY0gxp8qY75Pqiw@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] audit: log all six syscall arguments in the
 SYSCALL record
To: Ricardo Robaina <rrobaina@redhat.com>
Cc: audit@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, bpf@vger.kernel.org, eparis@redhat.com, 
	sgrubb@redhat.com, oleg@redhat.com, richard.henderson@linaro.org, 
	mattst88@gmail.com, linmag7@gmail.com, linux@armlinux.org.uk, 
	catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, monstr@monstr.eu, 
	tsbogend@alpha.franken.de, jonas@southpole.se, 
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, chris@zankel.net, 
	jcmvbkbc@gmail.com, tglx@kernel.org, peterz@infradead.org, luto@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 8:36=E2=80=AFAM Ricardo Robaina <rrobaina@redhat.co=
m> wrote:
> On Thu, Oct 1, 2026 at 6:06=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
> > On Tue, Sep 22, 2026 at 3:21=E2=80=AFPM Ricardo Robaina <rrobaina@redha=
t.com> wrote:

...

> > * As pointed out by Sashiko, when you were converting all of the
> > arches, it looks like you missed alpha.  I took a quick look and it
> > appears that it should be a pretty straightforward conversion like
> > most of the others.
>
> I've actually dropped the alpha patch as per Magnus's request [1].
>
> [1] https://lore.kernel.org/audit/CA+=3DFv5T4826T2sd0Gbh-nfZsqcWK_phdBKy4=
BLWOvDTt92t5Eg@mail.gmail.com/

The problem is that as things stand, this patchset breaks the build on
Alpha.  Perhaps this gets resolved during the current merge window,
but as you know we can't break the kernel build ...

https://lore.kernel.org/oe-kbuild-all/202610041836.6TatRQSm-lkp@intel.com

--=20
paul-moore.com
