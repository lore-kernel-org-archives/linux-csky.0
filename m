Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.210.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793752869;
	b=R+YCesofxeO3VLRJF2Eo8ERaHfmDjkv4XN3lSxF8pdrtYu1UNUmbyT+kKf1KhkSttY61
	 vGr2QwOd0iYJUMzAGSh+tlJcc8l226nyV/UcbaWgs6KzfqW07rMQ3q7F/ItfNZN2LYylS
	 KOXLFV8qLnmzvzTmO4gMbEaGWy5bJsusnof4qLOyDmZYYfyea4ULrT0fqQFZGlAvgZCNo
	 rD1z1o+J6zHTOQWO7bIRKXElE6d0S11nDfXfYupAzJLLx1rm9zJl+rpo1js9KFkpqDs+f
	 qa8IlBhYUakHhT3xjl0zwJfSW/jR0J8naqN0W8Lp9noYjcfcdrsJS/zaSUmemOTffnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793752869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fPNnZyQIDXSKNoVkiNoUdoJZWsQu0g4dBkxCnrIJvKA=;
	b=MetZo8uZzRkrjVvv9NkCLxcmOnBn9hPWQG9nVvEpEjaW8BtryQZM/1yB8ZSj6dD6sKI6
	 xFuVu9hA3QfM8mMrNbuw5hYgKVAzEeTt6IVtM8gke7OHbde7XFwrhswNuf0DCvEW9yZa6
	 HF8OumGcepOKjTveyVz4ktNa5zXgtp59IjmVvf8THpB7q42z0f5k2YIz8fCKADKP/NaBL
	 CEaHyHzfCViqCmqUcWVNbWM1SZI4voP5LjyjvStDg7IcOrDVnW9HSHkzI6yXnP5HOamWv
	 Mx5NR636NThs0+k80ojymPnd6ooq0oHzufDmg5vsNzQtZ895CBI6xyvmgeK7Tqn5Lvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	arc=fail smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E184D606A32E
	for <linux-csky@vger.kernel.org>; Wed,  4 Nov 2026 00:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E184D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a05b210703so114366b3a.0
        for <linux-csky@vger.kernel.org>; Tue, 03 Nov 2026 16:41:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793752863; cv=none;
        d=google.com; s=arc-20260327;
        b=fB+INbMNTE3a4P+mUEaemKQuHzbtsUj7JlvEa+haN+ecmo/CkHVp+VLjv9NdjamVX1
         jUN4uBFIrOS0OrPLMeiSY7tu/gv1gI6dIPTTzKHvr8ljO+3ZbUXtBhGzFXPfTRddVvrv
         Z/TIMHASZaY7im0MoPcKhqJG06RhwvrHB+CHD4fKGS7uUiOtskP0FruJDmEACQyedvNf
         4nPyP74cpSeRYU9rqzenZkpNgJ2VfXgG4s6CvMTH7nSltF4Xdyylu0f/tPKz0UDP4OQo
         DUUJUvxncgeDm1aFzdVlWD9Xvpz50t4vWPmlwcx1Y9qxIIwUZjriJ061ZQPCaT0vPPh/
         OAoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fPNnZyQIDXSKNoVkiNoUdoJZWsQu0g4dBkxCnrIJvKA=;
        fh=9Z5GBm6bXKkCxjCsQgx25gZhC7Nq8qAABcqOpHBBDPU=;
        b=LLh94JlhwSUcsPJupMpVTQt72uSnD51MlvL+nJTYshn9EVA8/+xzdMwVt39wJV1+a0
         ZNLEvdJDLGhLj1kM7e8eFbdCLky3qhm48ybRIwhuN5QN6+FZ7d22dQ8jo0f/KqxdTb69
         ZIR3H4hNwRYIPeyBXBjjzTOg8Jm6GJea7BBWfKHM5G4i34EMXmQFEGORhekcUXfrF0UG
         DikQfzX5KtP8b1AH+OQZbdh7pANOMv6GEtKz3QKsDNI8eCu/wff2UDKtRJj9yCKBhL7b
         o9WMVFfkqR1+NihQinEZVKChhjqIxtsPIwhU9PrHr89GBtpmdx00UhC8E3RPvsShj3Ir
         IhyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1793752863; x=1794357663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fPNnZyQIDXSKNoVkiNoUdoJZWsQu0g4dBkxCnrIJvKA=;
        b=PTPniKxw8lSLWSxMbmhmXVodXffwfFqC3M3cDEPYPvY1SsBjNOjXXv95CLFg3rVQFu
         x1tdyRAr0bqYQ6HVqsjHpfPPU10/1FhE3kd/CHXKlKRa2s8Jf9/RWGaRvSd9s3tWp3+h
         Tji6Btj/3XlTUrwGPe+aphN7moDM3Ujmyews2MtwEsOdhWo9d1B27IQnIAXxeCj/AgoF
         TwCZd9YYNW98ENSoBC4GvFAhash4XN0WeHulLfX/snYculqtKEVgWcaAWPf68LjYBfvq
         i5NzGzwAog4kKLckyYK3n2IY4tOHLEWiT5cJSG6dbW9SW1FZ4MjXmEMstZ0yw7BaSVW5
         5qpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793752863; x=1794357663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fPNnZyQIDXSKNoVkiNoUdoJZWsQu0g4dBkxCnrIJvKA=;
        b=WVjy9v7UpMnJ9OmMgaHlMQI6A5diLefRC1TBf0ZTW5xo35LWvc6k9OsA39keGEtix7
         KOKjmjKTxF5+CdLD4Jf8e6hOJ2GPkj3Fe9tYlANqvFKqaxOd/f4f5n8lnZ02e7r/dnB5
         8Q0YzXPZ09K4O+6Bro2wB9lOgKlEnc7ICLDVaM4O9HVu/lVUmpayNW3EsS/MYYVTAQQl
         HGIvMth9ybv4Tw3YUV2Lq+soygBH6J966AF2pritg+101nIr4aU+qmgyUNmmaMMBYRP4
         daPJxvKJ2EnkMkd2UrncvzflPHB98U4ffSqpsP5i0i4smpOKzXLGVanWScXPPYe4Xtix
         TV7g==
X-Forwarded-Encrypted: i=1; AKwUvBwwzFsUalANuHSsIfchQUBu/1e9Z8S67Tcjr6TqnroL+GxQocBYupomdZEMB+4il0Wsxmx1AazGDPlZ@vger.kernel.org
X-Gm-Message-State: APuU4Z8aXb9gjuv8Lj9oOgta7IIVF17kYSWKMzrKFBPeQwM8Jc2UmLTA
	hIK9So+AvtYnSzEDOBHaVMYl5sBted+XR8gO/W7P0LiNUXUJsHiRCT28cumlh2LTMlpis97lj9o
	S06wuL8IjKGMAKowW/g4EafdA4cqXadULIgbXZw4L
X-Gm-Gg: AYBFou2p6AVJWaXQXjjLwUFoQ419HWtC6nleY4RDj1p4zGsqSSmOdn/5av8OxI6TDTh
	HIclOEV4vbLL8SCAJyt24d5Z5z704YCPYt6t2hyoBaJmKW9tbk9/Mw4zKuxluVE8+YX9B1F6b0/
	/u6+FqVCUwYXEI6pJwcXiX2GOWHSSeqDTQsKXl2wqI89+pbDlwCZXYZeGffpHQJpsgQvLOV0xub
	gVIzhZ0tmiUD5J6TIsMR1/mz2UsKfVkSBO/Meqirbn4S5QO0T2lpAO0j2ukXiC0aQkFRGKpKoba
	0SfV8L5NFg+7RApIPXpxZMZAg2cJDHbTIkvBjsklL1EHYDJfc0fgQFCSofmM931Te+gp1rThlFU
	syysOdbEXrpvEMv20ON0pxw6vqK/eAF1QptjalmlCoijQDQMuAaLU3evd18J8yUZi6Nn0
X-Received: by 2002:a05:6a00:2d96:b0:88d:4b30:1c11 with SMTP id
 d2e1a72fcca58-8a9ba703bc9mr11394030b3a.6.1793752863107; Tue, 03 Nov 2026
 16:41:03 -0800 (PST)
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
 <CAHC9VhROsmzbm+AP63Sm7mqCokgEy6Zu0AVMY0gxp8qY75Pqiw@mail.gmail.com> <CAABTaaBOrPknzdxc5S6L9hGu7hbFu2e1RZG=Sxjb_B1Cs4Sixw@mail.gmail.com>
In-Reply-To: <CAABTaaBOrPknzdxc5S6L9hGu7hbFu2e1RZG=Sxjb_B1Cs4Sixw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 3 Nov 2026 19:40:51 -0500
X-Gm-Features: AclHuK_mzIhdjHPxjnkTYRthyfMgrzjS55JZuNf6mZPYYsQQvO81kKGlvJUv8_0
Message-ID: <CAHC9VhQ4U-Z2KkGurfMihJgzGgwD3miWSW4wWAjWvUdDxLpH7Q@mail.gmail.com>
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

On Fri, Oct 23, 2026 at 8:45=E2=80=AFAM Ricardo Robaina <rrobaina@redhat.co=
m> wrote:
> On Tue, Oct 20, 2026 at 1:39=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> > On Tue, Oct 13, 2026 at 8:36=E2=80=AFAM Ricardo Robaina <rrobaina@redha=
t.com> wrote:
> > > On Thu, Oct 1, 2026 at 6:06=E2=80=AFPM Paul Moore <paul@paul-moore.co=
m> wrote:
> > > > On Tue, Sep 22, 2026 at 3:21=E2=80=AFPM Ricardo Robaina <rrobaina@r=
edhat.com> wrote:
> >
> > ...
> >
> > > > * As pointed out by Sashiko, when you were converting all of the
> > > > arches, it looks like you missed alpha.  I took a quick look and it
> > > > appears that it should be a pretty straightforward conversion like
> > > > most of the others.
> > >
> > > I've actually dropped the alpha patch as per Magnus's request [1].
> > >
> > > [1] https://lore.kernel.org/audit/CA+=3DFv5T4826T2sd0Gbh-nfZsqcWK_phd=
BKy4BLWOvDTt92t5Eg@mail.gmail.com/
> >
> > The problem is that as things stand, this patchset breaks the build on
> > Alpha.  Perhaps this gets resolved during the current merge window,
> > but as you know we can't break the kernel build ...
> >
> > https://lore.kernel.org/oe-kbuild-all/202610041836.6TatRQSm-lkp@intel.c=
om
>
> Of course, you're absolutely right that we can't break the build. I
> was afraid that this dependency might cause trouble.
>
> I noticed Magnus posted a pull request a few days ago containing the
> "alpha: enable GENERIC_ENTRY" series [1]. It seems this will get
> resolved during the current merge window.

... and it has, or at least it appears to me to be resolved.  I
rebased the audit/dev-staging branch against v7.4-rc1 and Alpha does
indeed appear to be using the generic syscall entry/exit code in v7.4.
I think we should be all set here wrt Alpha, thanks.

> For future reference, what's the best way to handle dependencies on
> other subsystem changes like this?

Generally speaking communication and coordination :)  Talk with the
subsystem devs/maintainers to understand what they are doing, let them
know what you want to do, and find the best way to order things so
that it all lands in Linus' tree without making a mess.  In this
particular case, with the syscall arg audit patchset not being ready
(missing maintainer ACKs) and the Alpha changes going into v7.4 it
turns out to be quite easy, which is an important lesson: sometimes it
is better to defer a new feature for a release just to ease the
coordination burden, enable better testing, etc.

--=20
paul-moore.com
