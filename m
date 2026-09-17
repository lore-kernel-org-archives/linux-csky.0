Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F145359A9B
	for <linux-csky@vger.kernel.org>; Thu, 17 Sep 2026 01:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789608746; cv=pass; b=uojAs/Q5hwWLmj8UKPzGZoxxtUpRNODywhv8TT9UZ9/nqesT6ZCWHNvHDvKr3WlgOakodiRGFk1yqr79HCq/kseykC1eqkwm9QbbaZ8G1lZNsLiw0k2I+78jpWs7i9HmiVGEve04JSP2k9m3QlByYD/OS2Zp4J7v3sXNiWJ1+8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789608746; c=relaxed/simple;
	bh=A+lyblawb+dgZi1Z+Fh12EBBr9ZxtiKYKrx5lLTeJY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BJWK06t7ddT/M5apw0JfmPwc77E9CETMEkSo8wFwV0c9cGMZHfiMAi9pocNYD9YTvkkSTOEv+yn8RVU1gbDOOJM0bMQBV+R4yTIiUoJA5keIYeFENzbK6bFztdRSTA1yMzSHXCDo86J5IlzgSZnNs6VMjX4zy1b0VgAnL3SRa/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0reQ/xI; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0reQ/xI"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910cc46c7so18768485a.3
        for <linux-csky@vger.kernel.org>; Wed, 16 Sep 2026 18:32:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789608741; cv=none;
        d=google.com; s=arc-20260327;
        b=WHnJmpz/EVGNIovvn910PMvYCVNIZuIJwgXlT0hMZn19l6FkOcGkK9NdPQOuwtkgmD
         HuzdGJql06NuT0BnjZI9ShXODtIYOYwFTCUbnfSYb7zaLTodZvPmvOsXJrRvyWp8wAh3
         zsDIeLsQ2+IVNMYSlGsYT1KV4B3djOg+2PW90Y2EYC8lekJQRvSjxSE2RZBQWWs4jYGg
         w84TldmZl73kscM0WkbS4Pj2XjhFJyMGXEoklVVfoEn2JKYmsGdlhJfRDAQ9G0y2/Vqd
         bKyt9jOFFRTr0XI84Xrq5H8xcOLTCsB++qkXlXsrWd2jm2R9rQPg8D5/7Ie12cpll0TU
         +qRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OQRUPW6YJQIkC46/KpIizzCCGCnEQ9KqApfgS7uijf8=;
        fh=RZgUpRyb83ZqAdEvpikVnK53kj21JkmdXvgB/QQUnSU=;
        b=eZxxV5ZXCSvXtlFWS0XkIfspMOuXBy2P/vXiKjj35s827a1KOgi3EIKZFomEYytZ4S
         iOqaFYe0f4P1zRViAjwUEtrHcTDlShcF9jhUzqoYmgp7K566DW3ZGKRLiMbfBO6OkK29
         tEYDqVYxNpml9Rf6/rhk/6btRR8jTpRulToVrJZSPGjMR29aHQDlckBamC1kPthKI44i
         a5X5zub2x8qT+K0d6sqYMSNp8o/dlU5kqRg4lq8yqw95l/ODUlYfbdWEQiTtcwZEtfze
         gXUzLE3RIck43GYiC7nx+sdIPDwF6scWVELzZl9gMvOYwUVa5rLeY0UV92i/s2bVEK5T
         EXBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789608741; x=1790213541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OQRUPW6YJQIkC46/KpIizzCCGCnEQ9KqApfgS7uijf8=;
        b=F0reQ/xItJ0VwokY3OtU4QLiubH1w2NzLbVOUcIFza0DztIZBwX5Ipa2CP5jFq60lI
         8L3gaEirKnzXT7NH1gMhsEv7yo+GB34NyhH7LkisZ6QjaxRsKzBl3rpCdLvLQ3+812rP
         /WMsfQdG2AyAQjkLcKcyfvusBhE2DVmO7DtVmiNdjvAkt1e8StYSgMzK6oOtVysYCaIt
         CpSIOW0yw9Bb6gbXF3l77t9zVubEMrr9sadXgUqzXBEP+lM7G7AT7WP46zrHwPNzaVmZ
         plbL7uPu0u+HMprcbH6yhlhrIG1DOwDhj7d5gsMehHLkZDhtklB0FvxLb/SfCwbrbi03
         PLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789608741; x=1790213541;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OQRUPW6YJQIkC46/KpIizzCCGCnEQ9KqApfgS7uijf8=;
        b=CYDoPTIw//TnxfyqPfv5/ToTB6IxKumi9Zab6Ox0bubvUB6PxqvXiOpe3UtigjOhRm
         2Cg5krWrnEe2WhrhoewtIdbe3YJ/QarjbRFt+HtiGEwB4fYF0vy5yw6AMsqQMtx3wMXf
         2eoF7jhAOKJ9calPasU6XKe2IoCrWiurYctXQCuvcQ41hAqJY2q3JpHqqhRO9q332f6t
         ZWSNtgI6FJr3SlSsuKTDNzGkxcyYnknc51qgNwsCIUbKai56dStPxgLEaDN/NjpyTLsF
         DfwHxqYshBNJAeTDjbXqCM8CxBIrcGeirpPQUFF47QzztfeJaV93tnKwen3eYqk0+wYI
         yjZQ==
X-Forwarded-Encrypted: i=1; AKwUvByUaIx9fR8ec82c+K5/ZfBycuYYx0UcbYxJ+nQJLj395Aza9IauW+VveIM8MKtjnYQubZ4Ja0mSyJaW@vger.kernel.org
X-Gm-Message-State: AFuF++kPPzLIqbwwt6njvLF86jwWW/TKK1sNGcrb9NlOQaU0JKsf2k6H
	fZSNOxVpAcNL2CMkaDKTgnuP+8P0eZCJk2+CCTxgCf6nUQ+eUsgBzGZBAw2kBqYe+dK23mIMZOS
	oORjftPe/OsMKlHrvF3qiEuFxig7CfBo=
X-Gm-Gg: AYBFou0hBNoUwX3sGXp6dlGP4EHIOBo6xHllvADmOKLhRdUHz9euOAvvSZr7epijOv/
	dgRO62fxSQDBHP7fnXKnULtkGO/16UhiKcPmueOVK48P8dvTm2ZXKPTQXuB1Xlo/UKRQN18ocOh
	nAtk6ZISgkVbsB3aiMXwUNlsXIJw8Hao/yfJCKKk5icGmfAKcrrlrS2r3NIphPfddi2oAxtqlSZ
	KACj60EvQpb8G7fFfTQ5YTaJJgYNlaRomYwv84gMBhrq8nSaFCgWWudairLTWdDR6//YLcNtCaN
	6dNciuGz0zEAnnqtTMgVnU199T0m+qe8N+zcXV8Wxr8n7sm1bvRkeuBet9TUYq1cH4I1a6tks9d
	1b7V6vS+mTh7aqEk5COx6OwhzaUO2HIRUv1efxeRl1P22KwqqJh6mVBun2Aid3Am5fdkA8lcR6y
	eZY65StDl3
X-Received: by 2002:a05:620a:2b49:b0:939:10dd:9c01 with SMTP id
 af79cd13be357-93bb78ecc33mr880261085a.38.1789608740708; Wed, 16 Sep 2026
 18:32:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916200215.21774-1-brads@mainlining.org> <20260916200215.21774-6-brads@mainlining.org>
In-Reply-To: <20260916200215.21774-6-brads@mainlining.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 16 Sep 2026 18:32:08 -0700
X-Gm-Features: AcwNN1WCG_JOJrf2Xbrmh8jFY2fRzqOy5q6E4Cc5_T2BPoTD4KB-hY5Oy_mqGNs
Message-ID: <CAMo8BfLSWyDpxZuePsOdwRks9CuwXiUQBOR5ioSx4GHf_NeZAQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] xtensa: Emulate two-byte cmpxchg
To: Bradley Morgan <brads@mainlining.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vineet Gupta <vgupta@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, Chris Zankel <chris@zankel.net>, Arnd Bergmann <arnd@arndb.de>, 
	"Paul E . McKenney" <paulmck@kernel.org>, David Laight <david.laight.linux@gmail.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-snps-arc@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 1:02=E2=80=AFPM Bradley Morgan <brads@mainlining.or=
g> wrote:
>
> Xtensa has no two-byte atomic compare and swap, so the __cmpxchg()
> switch lets case 2 fall through to __cmpxchg_called_with_bad_pointer(),
> which is declared but never defined, so a two-byte cmpxchg() fails at
> link time. Route case 2 through the new cmpxchg_emu_u16(), which takes
> natural u16 arguments, so the unsigned long old and new narrow at the
> function boundary.
>
> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> ---
>  arch/xtensa/include/asm/cmpxchg.h | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max
