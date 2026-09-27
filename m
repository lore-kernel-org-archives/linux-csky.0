Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB783B9D93
	for <linux-csky@vger.kernel.org>; Sun, 27 Sep 2026 06:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790491336; cv=none; b=Gck1eWND9PJ+UrkIqhPTs8Qo8m9t34MBBZAXr0OUC6v4jQ6VBDYdNLPJoDhv7YjQ6k9Yis1XyAqSYzYqkLCCfJSwfIDIHt1YxBYlvkSZieCyAoakQuZ8dhY6N8JBd01VPuzN/wPB8tT8cHOqyg8icQKBHZICOfBR+1jdf/+qUqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790491336; c=relaxed/simple;
	bh=NbYcvNxyS1M3EnUfN203T1BQ2U8g5FoakSyHhsLQDko=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TyXu4MLhbsYNCMrphTaElc2qFZoI89rlgUT9ksl4xL2gEBt+U0C1NLL4MSvVRt5vewQSgThIRgewSBQcFNebNhgy0ZZEyCBv65F8sCzHSucyFWcD22XB54sVp92IFPLsYyVF6fhj0nAWO2O1OpG5QX0Z376zhQVjylvKJBVa1h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8sEfPVY; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8sEfPVY"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so6061275e9.0
        for <linux-csky@vger.kernel.org>; Sat, 26 Sep 2026 23:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790491331; x=1791096131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BAKBnzLmCCesYaECKziOir8dgFXqR4aUrCK6q2PlUyI=;
        b=F8sEfPVYOCPy0itgdP3IiNdxf2CjfLU8xnaoqc3i9+xBfOtOAIh5aGxwZqQE5KQ3/D
         R/p832HJQUaksjWNOOzGI0j3hiirZFR2PEAWMuXgGMV3aN3wICkGFvtP9Cu/Xhf2L9ir
         c9O8E7kHDzAnpBRf1oumdCNsngra6EkKX58vP3jotEiCEfMRlSb1ZsK5viuC6cm9qx8A
         DR0jnEU+nvTg1tkF59quFNJIeTt+6X59oOI8aFBJLR9kOktmmLCdyhgXKUKTNCO7kMF6
         3yFRftcrnaRn62++Gx1Pq/rRUJDkNED+cYosWuAFan6hnAcEQULUxseZTTExrr8qjysv
         2+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790491331; x=1791096131;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BAKBnzLmCCesYaECKziOir8dgFXqR4aUrCK6q2PlUyI=;
        b=h6faZVpCCnS7hWXTXw0KvuOSr7kKomefOq8iu5xsKyBGMpvTYPMAR8vUocQPwr174S
         DlBiRanVe+upwkdPwWCr46IqIthnzoOMWIUECQChpkgIxO/h6f01kSny8uDJQl9g18IU
         8PLdY2jXNN0v8bD0SkWfFOnxSk/7bPTMdO2Joi7Rek7ja7GXeOavBEPdAyks4N+Xkzdc
         wBRJnZSdDfIuYe/Dg0FrTi6DgXbhv0xKMxuEmhmsARd7AUQycFVQFVEoTrCHQvQIU/zG
         USaBnr2p3zL6v2jDq+7iaV/G+dcMlSkWBbXcL+uHh8FYOfPYMj7vLiluWCXS9S9q25Be
         V1bg==
X-Forwarded-Encrypted: i=1; AKwUvBx/8iZ6pmq9X+y9EtREJ254MSNvvkXF8JQ5nlGLS8VrZXWkncyBPgIOFIZuBD6Fv9Zu1QuzDhYjTqcW@vger.kernel.org
X-Gm-Message-State: AFuF++lKAoc5k+ySRz63sOMN+1I2Uv5E54IP5bxvEKLnMOAe46Y8f6lk
	DeC/FcTtpbsbDZFR/4PugKpFzjCVjxZyG1kAn6+kTNbf3NwhSG9aiDLZ
X-Gm-Gg: AYBFou1uLdoXE5WhYWcOMVzll4oacygvhKefZTIc29vxGJhJ6HDJ2WLfw3M9XFmVdXF
	GjBJdpVVK5P+yVLbQhRty60mEfv42sSgBhDs6GSGaESv8U7H1MrcnQPkljhjG6upNmkdLo3uLpy
	p0NrYNQZGaB18nTra+wpJv30vXBXlBh+Q/RQki6SL00CvansOwn/AWgWUmnc9rdV0bnYK+PjuWT
	rw/A1S9RjXtNBKXueJGoODMX85usqlBUw9ciPaXG0vGX5+Pz2ZNRJDejaZnoIiAkiIiLBsFwt5m
	aoL0dLSG+HFaVBfFDEwvnpAa2l5WgptL9mQwWVfC6aWjeEtn4sZeYIw1zSj8cq5Qiy8EQ5TI0Kp
	uNv+OciU13YmNSXAWWW6Nk09jUNF4V2SrY1EfwkVt1kuN2fsY+/8152FORFKMscfBfCnqp8qhxP
	QGW452Wi5rDwcbl5G7jNbMeuqXTaS2E6oOj5RZBrTFFEkMLgkEwIKtBWNXe1AlegigcxVXR7TmD
	Ja9r+2hW//kRMYOoQMI824HQdXHWrD6BXc=
X-Received: by 2002:a05:600c:46d4:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49fe6e35833mr171739985e9.6.1790491331541;
        Sat, 26 Sep 2026 23:42:11 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30bcc4sm19337580f8f.1.2026.09.26.23.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 23:42:11 -0700 (PDT)
Date: Sun, 27 Sep 2026 07:42:10 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Guo Ren <guoren@kernel.org>
Cc: Marco Elver <elver@google.com>, linux-csky@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] csky: Implement _THIS_IP_ using inline asm
Message-ID: <20260927074210.7495123a@pumpkin>
In-Reply-To: <CAJF2gTRr2pouJoj=NtofkCW1OgU08Jqoh2B8Guu=FheJMzEGyg@mail.gmail.com>
References: <20260925115128.362186-1-elver@google.com>
	<CAJF2gTRr2pouJoj=NtofkCW1OgU08Jqoh2B8Guu=FheJMzEGyg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 27 Sep 2026 10:15:11 +0800
Guo Ren <guoren@kernel.org> wrote:

> On Fri, Sep 25, 2026 at 7:51=E2=80=AFPM Marco Elver <elver@google.com> wr=
ote:
> >
> > Both GCC [1] and Clang [2] consider the generic version of _THIS_IP_ to
> > be broken:
> >
> >         #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)=
&&__here; })
> >
> > In particular, the address of a label is only expected to be used with a
> > computed goto.
> >
> > While the generic version more or less works today, it is known to be
> > brittle and may break with current and future optimizations. For
> > example, Clang -O2 always returns 1 when this function is inlined:
> >
> >         static inline unsigned long get_ip(void)
> >         { return ({ __label__ __here; __here: (unsigned long)&&__here; =
}); }
> >
> > Fix it by overriding _THIS_IP_ in <asm/linkage.h> (which is included by
> > <linux/instruction_pointer.h>) using an architecture-specific inline asm
> > version.
> >
> > This also fixes this GCC ICE [3]:
> >
> > sound/core/oss/mixer_oss.c: In function 'snd_mixer_oss_proc_write':
> > sound/core/oss/mixer_oss.c:1202:1: error: could not split insn
> >  1202 | }
> >       | ^
> > (insn 183 400 184 (set (reg:SI 0 a0 [orig:307 _55 ] [307])
> >         (xor:SI (reg:SI 3 a3 [orig:308 random_kmalloc_seed ] [308])
> >             (const:SI (plus:SI (symbol_ref:SI ("*.LANCHOR0") [flags 0x1=
82])
> >                     (const_int 132 [0x84]))))) "include/linux/slab.h":7=
59:52 288 {cskyv2_xorsi3}
> >      (expr_list:REG_DEAD (reg:SI 3 a3 [orig:308 random_kmalloc_seed ] [=
308])
> >         (nil)))
> > during RTL pass: final
> > sound/core/oss/mixer_oss.c:1202:1: internal compiler error: in final_sc=
an_insn_1, at final.cc:2813
> > 0x779b51e2a1c9 __libc_start_call_main
> >         ../sysdeps/nptl/libc_start_call_main.h:58
> > 0x779b51e2a28a __libc_start_main_impl
> >         ../csu/libc-start.c:360
> >
> > Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D120071 [1]
> > Link: https://github.com/llvm/llvm-project/issues/138272 [2]
> > Link: https://lore.kernel.org/all/6106aefa-47c7-4bda-a51f-8a2fba3bf715@=
roeck-us.net/ [3]
> > Tested-by: Guenter Roeck <linux@roeck-us.net>
> > Signed-off-by: Marco Elver <elver@google.com>
> > ---
> >  arch/csky/include/asm/linkage.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >  create mode 100644 arch/csky/include/asm/linkage.h
> >
> > diff --git a/arch/csky/include/asm/linkage.h b/arch/csky/include/asm/li=
nkage.h
> > new file mode 100644
> > index 000000000000..04afd3583e25
> > --- /dev/null
> > +++ b/arch/csky/include/asm/linkage.h
> > @@ -0,0 +1,7 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef __ASM_CSKY_LINKAGE_H
> > +#define __ASM_CSKY_LINKAGE_H
> > +
> > +#define _THIS_IP_ ({ unsigned long __ip; asm volatile("grs %0, ." : "=
=3Dr" (__ip)); __ip; }) =20
>=20
> Yes, this is the right fix.

Possibly "grs %0, 0" would be less obtuse.
I think "grs reg, label" is documented as being "grs reg, (label - .) >> 1".
The doc I found has some strange translations in it, grs is "Generate sign".

David

>=20
> csky has always used the generic label-address _THIS_IP_.  That is
> brittle, and on csky the compiler now crashes when that address is
> folded into an immediate.  `grs rz, .` materializes the current
> instruction address, so it is the correct replacement.
>=20
> Acked-by: GUO Ren (XuanTie) <guoren@kernel.org>
>=20
>=20
> > +
> > +#endif /* __ASM_CSKY_LINKAGE_H */
> > --
> > 2.56.0.rc1.315.gc6ed9934b7-goog
> > =20
>=20
>=20

