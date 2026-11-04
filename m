Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793799782;
	b=YBVYmlXuoMUoZBLXNiI2gbOayBDptl92G34XJItl+6t0hmz17Qp4UB6XqPuqGm9PAFEp
	 OZt4Gu3Ma1b3C8/JBPcRnHAvasvWJ+QpfGZHC0Eue6bfsMgHDhIKi1f4ujO0IMC+Rqg78
	 tIK3130t4TWORmDT9DZOVrdQSvX/m5bzx9utIilmBeG2zrH2kC+P9EU9JFeKdQuVlikSW
	 DtgKJEND+xLiK/VO9TKL+ZHNj9asXjeSaXebnprD5ddTrFnwaeAkDG13uoxu2O8stsB+e
	 +q7X5jIZLdDUjPFUZuSFb+2Aj0cyZ18AJQ+QR8N4z0Acl5H8OOmI2lgiubLtpI4hJlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799782;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=JLATmvImDg/5VrDBag7NLO/Ra27QQfElNkmu7cHAdiY=;
	b=wpT9mSV+NPzQ+nRMGOaREt1QbH6EseoBC/3rl8uuoOXFQzaBhoDuWhBT9iuf68Rj9CGp
	 xKgx32CZkayfgmwsMku3ZDAEIGdjU9EVyaKJz+0CykGFHpIRPfiOI8wzDoK0mD/vKEtcE
	 DaLm1wgYDujUnbhuB0qzsULiuVaPS/pnZohm7CRj1u4DJorGQ4K3gkay11g7E/yFTgP1z
	 +Q3UhTurnRCATwxwdTAEPrlxtmD1p/kItwgmka5FHTsIDiJgX/fOKtuhl8EqUweGFclRa
	 b8PQ2s4Umh9Xoq5178RqM5u5Tcux/YbM88UFmTRt5HsIH3cpMGVxQjQrFkAUU/eEaNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=apDpBAmV;
	dkim=temperror header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Mouu1XSq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89794606A330
	for <linux-csky@vger.kernel.org>; Wed,  4 Nov 2026 13:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89794606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=apDpBAmV;
	dkim=temperror header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Mouu1XSq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793799780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JLATmvImDg/5VrDBag7NLO/Ra27QQfElNkmu7cHAdiY=;
	b=apDpBAmVyHsE8c3Flsxy9Ca82GUT6I+55gzpzWCTdUXVsJI9n3ccEwuf4/Obnn4yWBkAem
	HqBD5dLRmJdJxj8R2GQC20jDlFRwYnvfSKyGcVECq60ENLzqVljorLRXl3T1yOpIX/xvrC
	d+bSQqkg0EFxXymI/5arWzTYgt9yAJo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-l3E5WbeBOD2lMLPmVpQ9ww-1; Wed, 04 Nov 2026 08:42:59 -0500
X-MC-Unique: l3E5WbeBOD2lMLPmVpQ9ww-1
X-Mimecast-MFC-AGG-ID: l3E5WbeBOD2lMLPmVpQ9ww_1793799778
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c4d1684d1b3so57479066b.1
        for <linux-csky@vger.kernel.org>; Wed, 04 Nov 2026 05:42:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793799778; cv=none;
        d=google.com; s=arc-20260327;
        b=gI/vB4MHZu63UoAP74yfJaVJBvEXIEKG2wlUSRpJ2dClhU9R9LXYtAwI9/eD8DXl6T
         U0z2ag6y4p+fB1K2ccdLoUiRm6hV3yXGc1V7Z8vORqu0LM76LhaE1OHGtAWEoSMF84Vz
         f5D54BM2dtYAianf5UudTsfB3NZNr3GQbkdAJtDXFvRK6j5XToS378xAc0gdWtX3meFx
         gDQ5gSQD3cWJN+3y0Z7PPKUxpnUGdmClmrZHtNFkRbut9bd2L96TWCN/WKwvlqn8xXqS
         i7y5jOyx/caVr4YA+fiRZRfzFMBIh9i8MWYoGlmWsjMg2RAuNr3q78Vg3dB9aBT4Dq1A
         T15Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JLATmvImDg/5VrDBag7NLO/Ra27QQfElNkmu7cHAdiY=;
        fh=Pa1Qo3JSuCleHmGRGFxtU3sQhfZ0mZw0gPSs/1Oy8LA=;
        b=CQoFfcBWLGGB2lbtI8qNtXz+aADC2+kRq8pY0aAUO/WS0OzIkDABjKIwxU5IwlBrWl
         Mld36RnP5wXtsXgx3DYnNfZG8upvg0xvQvVHQyXOBLo6WOEPfGNKfPkiDuVPPvtRQTtl
         vzr9Ez9yJDsYld7Sb40jJBb57iN/jOXVOLCnC4CvgWg4fW/5MUP+VuOCvZuxDFLkN1u6
         pFxO8onPTasODxMZRMV7N0VPcbJcUkwpAFXxsxi2WyPPEq+tFA5eY5RqR9hNjKNqFgel
         Tc7NpuqmpheWbC1NJsIdB0MwjEa28nZ0QksGvHu3snjWepS5dHdHA1WgEUTS0+Me+023
         IIUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793799778; x=1794404578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JLATmvImDg/5VrDBag7NLO/Ra27QQfElNkmu7cHAdiY=;
        b=Mouu1XSquusTnpfBvStFzeTN87Vx2zKs0FoEY5SevuYiOSnWt13aiH+f4QP1nefFjN
         bwfvfwVDenTxSc8Ohnkem1H17b4LundNCijbYaIAUcQNAY3l9xb5ksqEC4f6Z0cL5fRA
         xNQeCDtNJvCH87SLQgARz7InVVv6L0tlELNSUxXik0wyk4894QFXRxG6ccRAtEW0LHKe
         THJnGdreJEIFTFpGet+lyfmvPE85xw5pgU74TXo42+1aVRehgiL3n4FUvqXowAs6156M
         o0mbE4QPzv8Fl1z8PH+X5bYTvPRcqdU8Fdi8z+HRncDyBsgEgiGZAnMawcFzMWiu0GGR
         D9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799778; x=1794404578;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JLATmvImDg/5VrDBag7NLO/Ra27QQfElNkmu7cHAdiY=;
        b=csRMxnmMI+SUOn0uMiozKbMvBism/uAhmLEVM5SYtge4ltoAYHsxl0QWjC8zEnCx7r
         3jkWnytBmDd4AnZfrKIUhqCsCPcXeZGpXtccbL4TUdwrcPBPrJOuRAQ2f2HrIWKuzcr3
         uUJ47AaeEdhjSeK+mHd6Lqap05vO+e8tg1azoM0MycTgB0Dae/sU98vkYCbCULOCD2Y8
         p1DfJA9XSJiH6LEEjW/ST5GqOx1coj5imeivUY0KkRH6xMXnV9xvirlpVga0S8q3Zkem
         FBjM5Se1Y2ux8Eimw3fiv04a7Ue37QzPv7ybwJ2xtKsG/RWOHIe++YX2JEJlWdkbZDzq
         U8zQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJMD457lSnuyLLoNjJQo7A/crqH0jKY31XgQueag9cefICRaORAUNeQyJLeCyPY5BB2/pbfpc4AFwK@vger.kernel.org
X-Gm-Message-State: APuU4Z8IEJZkBKfrPRe4Dg+20II5cJV/SRWye/ZMreOwxgiGWly606y7
	QGLrLrNHIJCxEDq71qux3VW6dKjFFoJ+M81IxhClSRvuGx64N2xlvt1Yzf5Csr2BwowY2dJFJHK
	96ugifGwavUEkZzz+om8D9GBO+kmnrIbgy/oKRTD2fXdTj7fs/gk8ttiJNhvRZCdZmlBK3fHTFs
	1sS9nNgqe/9bf0q0NN7kN8rF5H2CVkTAkCNYhMXg==
X-Gm-Gg: AYBFou1vIYHmFjpsi7xsDpC3mM/HXWFb2bckF5f3F1wOhnI1H9npikc0rvkfsz/Gh69
	04sJ7z6BNhyf89OtJ3LYCFLqAc6nQ2vY/6+iKlwEI0StXO6nDO04Hxchx9COSDB7o9jJouggFki
	GjABt4yc1aDe/7mGj8rGOupecasttWxK1oQZ90HYc/b1uk1QE84mI/h/nm1ky4cxbiJ6gPblP6T
	0ElaCBngcfdzn0sJFpSElNYOzgI/Esl+s9fV70qWS+ECg==
X-Received: by 2002:a17:907:1ca4:b0:c24:adf4:5c73 with SMTP id a640c23a62f3a-c4ca795d0cemr1327722166b.1.1793799778125;
        Wed, 04 Nov 2026 05:42:58 -0800 (PST)
X-Received: by 2002:a17:907:1ca4:b0:c24:adf4:5c73 with SMTP id
 a640c23a62f3a-c4ca795d0cemr1327717466b.1.1793799777447; Wed, 04 Nov 2026
 05:42:57 -0800 (PST)
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
 <CAHC9VhROsmzbm+AP63Sm7mqCokgEy6Zu0AVMY0gxp8qY75Pqiw@mail.gmail.com>
 <CAABTaaBOrPknzdxc5S6L9hGu7hbFu2e1RZG=Sxjb_B1Cs4Sixw@mail.gmail.com> <CAHC9VhQ4U-Z2KkGurfMihJgzGgwD3miWSW4wWAjWvUdDxLpH7Q@mail.gmail.com>
In-Reply-To: <CAHC9VhQ4U-Z2KkGurfMihJgzGgwD3miWSW4wWAjWvUdDxLpH7Q@mail.gmail.com>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Wed, 4 Nov 2026 10:42:46 -0300
X-Gm-Features: AclHuK9fArBl2NqgMDWGc__kMOSMhBxMeP1FQYdilvQJHUxXbryD-TLWb0XsxW4
Message-ID: <CAABTaaAYn1oBwHSkoGm0a98c9YUZKf6ie=yUOtR4FQuSjrusjg@mail.gmail.com>
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

On Tue, Nov 3, 2026 at 9:41=E2=80=AFPM Paul Moore <paul@paul-moore.com> wro=
te:
>
> On Fri, Oct 23, 2026 at 8:45=E2=80=AFAM Ricardo Robaina <rrobaina@redhat.=
com> wrote:
> > On Tue, Oct 20, 2026 at 1:39=E2=80=AFPM Paul Moore <paul@paul-moore.com=
> wrote:
> > > On Tue, Oct 13, 2026 at 8:36=E2=80=AFAM Ricardo Robaina <rrobaina@red=
hat.com> wrote:
> > > > On Thu, Oct 1, 2026 at 6:06=E2=80=AFPM Paul Moore <paul@paul-moore.=
com> wrote:
> > > > > On Tue, Sep 22, 2026 at 3:21=E2=80=AFPM Ricardo Robaina <rrobaina=
@redhat.com> wrote:
> > >
> > > ...
> > >
> > > > > * As pointed out by Sashiko, when you were converting all of the
> > > > > arches, it looks like you missed alpha.  I took a quick look and =
it
> > > > > appears that it should be a pretty straightforward conversion lik=
e
> > > > > most of the others.
> > > >
> > > > I've actually dropped the alpha patch as per Magnus's request [1].
> > > >
> > > > [1] https://lore.kernel.org/audit/CA+=3DFv5T4826T2sd0Gbh-nfZsqcWK_p=
hdBKy4BLWOvDTt92t5Eg@mail.gmail.com/
> > >
> > > The problem is that as things stand, this patchset breaks the build o=
n
> > > Alpha.  Perhaps this gets resolved during the current merge window,
> > > but as you know we can't break the kernel build ...
> > >
> > > https://lore.kernel.org/oe-kbuild-all/202610041836.6TatRQSm-lkp@intel=
.com
> >
> > Of course, you're absolutely right that we can't break the build. I
> > was afraid that this dependency might cause trouble.
> >
> > I noticed Magnus posted a pull request a few days ago containing the
> > "alpha: enable GENERIC_ENTRY" series [1]. It seems this will get
> > resolved during the current merge window.
>
> ... and it has, or at least it appears to me to be resolved.  I
> rebased the audit/dev-staging branch against v7.4-rc1 and Alpha does
> indeed appear to be using the generic syscall entry/exit code in v7.4.
> I think we should be all set here wrt Alpha, thanks.

I'm happy to hear it.

>
> > For future reference, what's the best way to handle dependencies on
> > other subsystem changes like this?
>
> Generally speaking communication and coordination :)  Talk with the
> subsystem devs/maintainers to understand what they are doing, let them
> know what you want to do, and find the best way to order things so
> that it all lands in Linus' tree without making a mess.  In this
> particular case, with the syscall arg audit patchset not being ready
> (missing maintainer ACKs) and the Alpha changes going into v7.4 it
> turns out to be quite easy, which is an important lesson: sometimes it
> is better to defer a new feature for a release just to ease the
> coordination burden, enable better testing, etc.
>
> --
> paul-moore.com
>

Thanks, Paul!

