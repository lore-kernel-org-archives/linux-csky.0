Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792759537;
	b=PTrRuDGFqsRF3yFodVTQToXIo0tFZOxFXuHPxXYYUzHhivf+PyEASg7Iq8aDbnwJv/nt
	 /YyufeLOVMj8ypT6IC87wdLaDCh0fu7WfXBZCGnynGikH4IIv8cQ+6AqQef0x1BcTfzWB
	 SofhXy4fVezC31g1vNofDDBemxMjB1HSqrgB6NXzAs3MwpspXlmS7Ct8HS0jLOkVHW42x
	 t+aWiTdqIE28W8FYIlQlE9RQencmp+SwH4rezOhte56mbjXbsMrj1FdnOq0Yj+zglvtnS
	 ggR8Uj/n28+h5uRbc0BULhqt7t1CrMNUr3+3AJzbbmxEMO7YmFavUXGya/ht8kDIgWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792759537;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Dw7ixUsZNlBi2ggGvaFZwX+nWP7PGBtWcR/4kzMhp/c=;
	b=KPYHs9clTM8nt3F+xoAbwp3AWLbXSu0hlJtoBh20gOHoERHbY2J+H67CRIG5j9vZHRFY
	 uA/aGA8D2DCFB4Z/Q7vvA86aucgy4VeF9BRbw7dMtbxDv//LPA0Lg6r6sc7LQLuH8H6GC
	 ZO9Z9QPQpDAiruJegayGIHeC8lg6lWkxYA0LAOklkRn221rfIBYRgcWVi5pJRL6UGcWYb
	 1rEUbiZSiuaVavQRRzQjSj1sunL0woh/NgfNEQdkcShamx/7lMkBpKuTyKH1crGPXD9wo
	 36fV4ahMwtPxOXF9OLdQKSnDYASQXTcheINPqJn8pAba4K4HrS9P6WnKpFzaxd6xWvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZsGDya+h;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kvNnk1JJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53595606A325
	for <linux-csky@vger.kernel.org>; Fri, 23 Oct 2026 12:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53595606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZsGDya+h;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kvNnk1JJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792759536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dw7ixUsZNlBi2ggGvaFZwX+nWP7PGBtWcR/4kzMhp/c=;
	b=ZsGDya+hYia2e4bY1OdxHKVGFldHwRjTpwI37YzaR2476cLuMRa2mnhCCEUJAmgKu1AXJp
	guRCCWVb/xhrL/iwSnsD46Mx4o5cyc9ayYgms2Fd+SGagERK1AlnSrT+Q5j/AqkHCw6srv
	iD/s+Dkf6dUyMf8eSR+IhxAohgVNSD8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-axwQ3HhKMXS9UkKmfrJ4kw-1; Fri, 23 Oct 2026 08:45:33 -0400
X-MC-Unique: axwQ3HhKMXS9UkKmfrJ4kw-1
X-Mimecast-MFC-AGG-ID: axwQ3HhKMXS9UkKmfrJ4kw_1792759532
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c2e8c76334fso75171166b.1
        for <linux-csky@vger.kernel.org>; Fri, 23 Oct 2026 05:45:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792759532; cv=none;
        d=google.com; s=arc-20260327;
        b=d68c5/SVXgAU0y+HmYxTlJeEoXwgAetYK4ZbyTRTH4rUG6IMOcQ18zPMw4/Ipgs9i7
         BPqLla9QgDXorbgwFFmNlsZ5Ttn7vR+iAi6NgSuq7YXmZvtsrGzKz22d/dCNwComSdwq
         tpNK5C9FrZ83FTAnxWL1xVimD+8XfQne82gWm6AvtnfkWaQHpNBmuJSE2CL6jnECF1Up
         FMc0m+Tad2iVCC7ppfqfjPy71juWyG2HbBdk9qCQaFcxX6XQH3kywQlSB8cCKYGNvPDr
         u3iaRCK5u+hYhT/5VVFv46nM3EO0IBBoW5mhqCewCwt3X05IOt9nFwk95jIyp9Fw12sW
         e7Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dw7ixUsZNlBi2ggGvaFZwX+nWP7PGBtWcR/4kzMhp/c=;
        fh=DrNa2Fmo6IXdfyT2rEeYrOJE2Om0Q9smoL9oTP/hZ6g=;
        b=e3BaJ4j65CY4hkWmS9yjTjIoZDH6Ig7dnX9AD/sDGH5exV7sjgZLIxP+L6BxFraYST
         JuhI8YhzGVqq6a7S7/PLvLENVefAEu75mn6IjdWoo8DxEG7hqLg2oQMfwbvQadg9aeUN
         T5sfr1AoNOU+uO0PZVDSovDdWcYTrRhJELJZnpt5gZwyJCTos/Xpc7l/K8wFjSEkvpvs
         HiNieqG6C6SKqu9PDTzi/onmcepwvfiVUfG81DkAPMaMy2HI3/hyt/hVuAcJlhibwSja
         4AeaFvi6+Ae8jlrHZ18JdEGtVQ6g/AtzRepFKmwi7q19DYhwQcpfpfskolUvCDG5NHGb
         rT2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792759532; x=1793364332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dw7ixUsZNlBi2ggGvaFZwX+nWP7PGBtWcR/4kzMhp/c=;
        b=kvNnk1JJq5fdRFGdNebQGgC7q5Z0qxP3L9LUL3H41Yth6fk3qBq/vZiBoiFYGjpoaa
         n0dKED8PrTcleCQwOwv7EZPUJSb5pjlDuNEjMabYepgzXz7C3LDzgy4bYbztjIZyxLVm
         9Xqzkh+s/Df+49IhCw6cb1qC+ZGFZ4Nq2c4DcUiiFr5dQqfAvw2NN8GjnWhsaGKkKTYY
         KzF7Id+sGWe/yi/p3xtqj3XYUidB030oWuXhAmSpJVfUlD5svLFMDnkRZ4hFBW84cWXH
         J5am/hwQZPE6DkBBvdYxtO+xDbckJ1JouoT4CQ4/tz5aQZvy3bGe6vJgFqQzFd7jFxWj
         dG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792759532; x=1793364332;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dw7ixUsZNlBi2ggGvaFZwX+nWP7PGBtWcR/4kzMhp/c=;
        b=L1wneZTDZJkSj/26NbfeOYQpssXAYEO0pVdzxm4ssOfSQ6R6G5bLZmg8ys0jo5NSSl
         DboptCg7vEm9Pu948aArshHmg7gBEgED6UrF04/DkuHUHzP+JNRIzSd4/kwJkbGaOfL+
         JgULcq6nWFLpUhpuScKxF6jPblTOouBDEjfW3A1S9XF+ZjOyCwDIFizp9EEP/Oc49xsG
         sqojePC7JcYdIPsQJ5fsajAzIhG07WltOlAC0xi1TZJzTUXTtnzBD+lIGULTl2/y3HLc
         Mmad6KLhLkUJUOQwd5GM2KzuN7qyjigaVML7USKX4cQq/vJNpGi+5V8uCT7yhp6jmKfu
         I20A==
X-Forwarded-Encrypted: i=1; AKwUvBw/SnVJ2GVCiBfK2X05Ommol5C1OJjYJkjI/FXvNyOX7aYS6nIJT5ICAOlpmA4NGcY2oJrq8YSXAQYa@vger.kernel.org
X-Gm-Message-State: AFq9FYKNgyd3Jhg9G53dYESNZCS3JTXqbQfzns7bqMGTT0L8+olzU2ff
	3+69g7pHI0czFrrCPXITYs/On5yEWrUIb3JhayJN+xOnhZgU0D/79vhdGs815gFacxmxVQ9GGeO
	/aTpbqNCu8eAmKQABTjHIyWbPD5kyQXnuJgDY5Ry9W0Un3Gf4oiDz4vSnoCmvXRq8qLrjzHgBGt
	J1oW4KzHD3RU3uouQA7Y9r7yZL7ifydx9A1/lqOw==
X-Gm-Gg: AYBFou0iL22sNV9GQ7vOooKsDYNGCOf31sfmmCDUIB4cPWoWNiCtMf07tAWxWOmwzGP
	dUQMUAaLkv/wi591MOjH/Adr1ULuMwV5rRe1o/yMY8ReaoEj8NrI57v80WTEp56CLCopNbIYwSX
	hJORyQY2EAyeJFm3wX8C+Yv5UOfigWtTmf+m++/ndI3CHO6F72C+mSn3VEel3B6qMU8NHK9bCXD
	CPhs0JLzBc7Vg9/p5/UBeas1se6FLIshMUvQaof5qabcx50/xqbsA/+5HdGrSIl
X-Received: by 2002:a17:907:fd8a:b0:c2e:46d0:b802 with SMTP id a640c23a62f3a-c46a92ae6c0mr328356766b.40.1792759531896;
        Fri, 23 Oct 2026 05:45:31 -0700 (PDT)
X-Received: by 2002:a17:907:fd8a:b0:c2e:46d0:b802 with SMTP id
 a640c23a62f3a-c46a92ae6c0mr328354266b.40.1792759531460; Fri, 23 Oct 2026
 05:45:31 -0700 (PDT)
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
 <CAABTaaBL=TScs8Qqu3b8F6KZPGMyvwy6cBC3teDaBL6MGMucNg@mail.gmail.com> <CAHC9VhROsmzbm+AP63Sm7mqCokgEy6Zu0AVMY0gxp8qY75Pqiw@mail.gmail.com>
In-Reply-To: <CAHC9VhROsmzbm+AP63Sm7mqCokgEy6Zu0AVMY0gxp8qY75Pqiw@mail.gmail.com>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Fri, 23 Oct 2026 09:45:20 -0300
X-Gm-Features: AclHuK-AKUESe6iHVc-VzwOYib6sgRKlK0BCnAtM6wg5S60Ozyo0oOLLHvDr8CI
Message-ID: <CAABTaaBOrPknzdxc5S6L9hGu7hbFu2e1RZG=Sxjb_B1Cs4Sixw@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] audit: log all six syscall arguments in the
 SYSCALL record
To: Paul Moore <paul@paul-moore.com>
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

On Tue, Oct 20, 2026 at 1:39=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> On Tue, Oct 13, 2026 at 8:36=E2=80=AFAM Ricardo Robaina <rrobaina@redhat.=
com> wrote:
> > On Thu, Oct 1, 2026 at 6:06=E2=80=AFPM Paul Moore <paul@paul-moore.com>=
 wrote:
> > > On Tue, Sep 22, 2026 at 3:21=E2=80=AFPM Ricardo Robaina <rrobaina@red=
hat.com> wrote:
>
> ...
>
> > > * As pointed out by Sashiko, when you were converting all of the
> > > arches, it looks like you missed alpha.  I took a quick look and it
> > > appears that it should be a pretty straightforward conversion like
> > > most of the others.
> >
> > I've actually dropped the alpha patch as per Magnus's request [1].
> >
> > [1] https://lore.kernel.org/audit/CA+=3DFv5T4826T2sd0Gbh-nfZsqcWK_phdBK=
y4BLWOvDTt92t5Eg@mail.gmail.com/
>
> The problem is that as things stand, this patchset breaks the build on
> Alpha.  Perhaps this gets resolved during the current merge window,
> but as you know we can't break the kernel build ...
>
> https://lore.kernel.org/oe-kbuild-all/202610041836.6TatRQSm-lkp@intel.com

Of course, you're absolutely right that we can't break the build. I
was afraid that this dependency might cause trouble.

I noticed Magnus posted a pull request a few days ago containing the
"alpha: enable GENERIC_ENTRY" series [1]. It seems this will get
resolved during the current merge window.

For future reference, what's the best way to handle dependencies on
other subsystem changes like this?

[1] https://lore.kernel.org/linux-alpha/ataJlL6L7TrS3gWs@z440.darklands.se/

>
> --
> paul-moore.com
>

-Ricardo

