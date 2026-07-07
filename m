Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A173420894
	for <linux-csky@vger.kernel.org>; Tue,  7 Jul 2026 03:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394133; cv=none; b=nvmuIsrOgXSBYCNiqKIVu91xhMVnfwRqOfktP1V1zoHyD7jSxaZJHLZSceStH4//SleRhqLmsUbXGiWm5+AdfDCVUH+V9C0/Didiqr98ETVz+gJDpQ6H5nXORbrgPDV57iR98/25IiFY5RxLaC0+Rgrl4z7D6nLU5HA9Q+csJHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394133; c=relaxed/simple;
	bh=KOO+bq4CdxG/gRvjSNKLfw4xd+/J4MXSQBE5xgy8ShM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K6bUYk0reL5FoLZliet4SIPqWrHESXBAgklxxuFGeSq5pKxuZuHBHDoh6fCxTv4qk0+7QU5w8P0h7uKjQv80Lrkd0dIXoHZg/LvvLEal87OV8kV4kkJYAf1pXkQhZnyV/p6DeNSOy1mV1AH4FrVTosuE2F1pxN5VxMOQcAnie+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TZOLu0CX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TZOLu0CX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D09DF1F000E9
	for <linux-csky@vger.kernel.org>; Tue,  7 Jul 2026 03:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783394131;
	bh=KOO+bq4CdxG/gRvjSNKLfw4xd+/J4MXSQBE5xgy8ShM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TZOLu0CXjyw8ohuxB7Bbc6rSSQZdG0bGylhJWEVjqREGlmxuSjF8lyIMvZcj2RltB
	 aXj2TsBF3h1NhO6pZaeW6vl7HD3sPyUUHHd7BDxVwWGZXgtsur8FUJkOgvEIQ+knUQ
	 ugV/A7ExJjWuQzF8M2xhn6J3PNsGo63wj0/2Tils1xtp5tXMI+z9lJ5BnKdgfmB5eC
	 ukXjzKqeSBIJflj7vSF9MXDvR7nAxouDfDsFJzvi0dxMujV9O2NwgdwSfVHToEm6Kf
	 1S1Hbur2Hg/wtLuN2RKPnNZb7OiNxWinZJjacFtVPQr/UvkuilJxzhiw2GPfX9z/5+
	 ZHMBK/CUHiM5w==
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so2298344f8f.2
        for <linux-csky@vger.kernel.org>; Mon, 06 Jul 2026 20:15:31 -0700 (PDT)
X-Gm-Message-State: AOJu0YzWzRFdjjUF8DxfZGznsv6r2S14bAms6dcOw5BugY/VYl/V87pC
	GbIZF90Z8CFdDxMKVM5J/E58+sfvrzKlFC7DPApLKPOD2Of6Wawtgx5GJXI01S2IgKzZ0BUK2m9
	BOwnWsHM3v6I4p77tNcxd4a3a0V1Ga/0=
X-Received: by 2002:a5d:670d:0:b0:470:2fb1:3dbc with SMTP id
 ffacd0b85a97d-47de66cdc70mr2240912f8f.35.1783394130436; Mon, 06 Jul 2026
 20:15:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623112438.33022-1-pgeorge8929@gmail.com> <20260706103932.20961-1-pgeorge8929@gmail.com>
In-Reply-To: <20260706103932.20961-1-pgeorge8929@gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 7 Jul 2026 11:15:18 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTExptWYfy7m-aMG6WtcOJhegZ7=obcf4PQ25-jpMHvSA@mail.gmail.com>
X-Gm-Features: AVVi8CfEme2pv6RaFCOSeuNyWBgYHCXSxI_IDqu8rrXo5282CryWwznMYdVB7zw
Message-ID: <CAJF2gTTExptWYfy7m-aMG6WtcOJhegZ7=obcf4PQ25-jpMHvSA@mail.gmail.com>
Subject: Re: [PATCH] csky: Fix ABIv2 memcmp() s1 alignment check
To: Hanlin Song <pgeorge8929@gmail.com>
Cc: linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Song,

On Mon, Jul 6, 2026 at 6:40=E2=80=AFPM Hanlin Song <pgeorge8929@gmail.com> =
wrote:
>
> Hi Guo Ren and C-SKY maintainers,
>
> Gentle ping on this patch.
>
> My understanding is that r3 holds the original s1 pointer after r0 is
> cleared, so the alignment check should use r3 instead of r0. I also
> tested this on a CK860f chip, and the patched version was faster in my
> unaligned memcmp test.
>
> I may be missing some C-SKY ABIv2 detail, so any feedback would be
> appreciated.
>

Thanks for the patch, but this code is intentional. The CK810 and
CK860 support misaligned load/store in their microarchitecture, so the
alignment-check path is effectively dead code that exists only to keep
this asm code. It has been carried over unchanged from the very first.


--=20
Best Regards
 Guo Ren
