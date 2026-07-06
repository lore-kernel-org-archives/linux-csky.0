Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA243BFAD1
	for <linux-csky@vger.kernel.org>; Mon,  6 Jul 2026 10:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783334406; cv=none; b=gkusBnI1xX+bDdi2Oqu3OJdyWoK6s96pkEWzD1hS8lJsjs6G22jv+9PspRagDh1p8qC+jN3XXtfKvye4J4/1GtLPEjxBQVccCBuN3uQAAseXM7QG1P40Bv9pQlk/mMjpISQCQ+ryoK6HSQVkdTFWAiNrJ1CuLoyT+jFbichHYl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783334406; c=relaxed/simple;
	bh=A/TD/tEkEOEmdP5+CrYAyvFP4V7D8kv2/uvBeE3lkT0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b8bWZgcfh0KUdRS/LJJh2XL7/HpTTveMtRn9DL/n738E6qBZgT4/GFaaYlXGc7kIXdP+u6pWAFWx/67eYckbAVywJSKnKO2jtifnI9WGCWaODeaAOrJX13OBrw6eQtLprj8JnWsUOctnBbqgmookkKBGTkfZdvWh3oCsYUbmM68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHK+vkmE; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHK+vkmE"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cc80b585bfso10324725ad.0
        for <linux-csky@vger.kernel.org>; Mon, 06 Jul 2026 03:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783334405; x=1783939205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/TD/tEkEOEmdP5+CrYAyvFP4V7D8kv2/uvBeE3lkT0=;
        b=cHK+vkmE1g0pUngQDy/UVFHgB4m4UVHWvnMNyQuOnR4NB5ZxASF9y6bq8mQkj4HvSg
         Zs05yncb5Zmy9o1kCfRuas2LKUTALVzVO87RKZ5rtuhzgGp+tJ+S3jDKY4ps7WkVS9on
         P3o9sWJ/jq01OTEOzeURxWAGx1xAWQFzXs6qz9JbKPPUjTYNcNKnk8Mc3mmEAqi8iTF7
         ChLjxTNlI2hdbzD2xrEVftJjx6UxFX0DFZvtua7105YGTVDr4pO5WIb0dVGWE3Z00HQD
         fSHbGU2/PyjCPQv7+mPBG2hnO2NK1mY1L0fY/zfV+X4VEGZRoc6Nl/Nffy/NEmv3PyTF
         t6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783334405; x=1783939205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A/TD/tEkEOEmdP5+CrYAyvFP4V7D8kv2/uvBeE3lkT0=;
        b=Tps0eESYf8sGwt7XPMYN/FB3wcB6uRZtdKigaCsxuFVrPXCek9z5ZXrt0YZbajPRrU
         7mHixutCO1TF0S5XckKhnsaqVDiBpXykJlxNWyamL4n4uFrMa2MiwUG6L1O770FbzBOP
         PK90FkOe93Y2tH5prZMHAZQmLsu9Buco2iYo/ba6MaX83RxT3bsYb57oLPy2WzWDR5u5
         IF2Z1wZZpQfQqpu+O8JFlcvo8X+QN98lYIWeQL4MaMSvORjxw6dE3T9LHffEZqGXhQuW
         DGTH15GMq4r5F3nnhYjJMbqkFHq+ytbcLK9mesQxiXxlcRRc4eMHJCvEm99M7VrdIoed
         CZtA==
X-Forwarded-Encrypted: i=1; AHgh+RpXKMNXrJx1Cm6J7Uy2wx4aMN0bvNl+tAro/UgKUui+9U1qsIV60A18iMrJS4oiKBHL82D0MFWnW3hN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0AqR10pB/fJtwGPaFEBJOinWFLoLqiWD1KFpnxf8JUOcyKa3J
	k3srlAYT+L+2R17rA6uyYNcN76A0ZoSuVFcIl8U2q/cogIAFKyuGAHPO
X-Gm-Gg: AfdE7cksW083xtlshGk6mDij3kPr6a8/GLJEPZWpPCmGalc/oiEsAyKQj3ZO4QjUNb5
	D3+xvuv3j7uelPxdxGWWowdCQhOIUBMCAKetlUcm6xkoblrkb8wPiG0W5aW84MJ1ftVb13ovdr1
	f972tpd+Q4f5h15Dc8Pv7OTr1DRTtXke2bXKVIUMh5jmWHXavT5+UzpJX0EhQC69w1kVtCQp9K0
	g7UOqr4NBSIgoLTIhCZQb7vfbgYpcKJHUTjqu7DtJ44+TjAu4QNfdS3VaJTjx6CPHcixtz1pLTs
	7MoWXvmM+Szc9nBVLmgiQRlQgyBozFy1f6PHa/r8+Sf4eypaFeeuMCt/wXhqPwPLmmevQoQtWOD
	BCrEcSOem8Q06eRcfJouYh53UUHLIvPS1rk2iT1vJzwXSdAr2scpkdg16JgaV+zgyZYdPABFP5S
	N5en8=
X-Received: by 2002:a17:902:ccd2:b0:2c9:fbde:ab66 with SMTP id d9443c01a7336-2cbb9f1642emr95465825ad.37.1783334404696;
        Mon, 06 Jul 2026 03:40:04 -0700 (PDT)
Received: from gmail.com ([209.9.200.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad712706esm47741855ad.20.2026.07.06.03.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:40:04 -0700 (PDT)
From: Hanlin Song <pgeorge8929@gmail.com>
To: guoren@kernel.org
Cc: Hanlin Song <pgeorge8929@gmail.com>,
	linux-csky@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] csky: Fix ABIv2 memcmp() s1 alignment check
Date: Mon,  6 Jul 2026 18:39:32 +0800
Message-Id: <20260706103932.20961-1-pgeorge8929@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260623112438.33022-1-pgeorge8929@gmail.com>
References: <20260623112438.33022-1-pgeorge8929@gmail.com>
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Guo Ren and C-SKY maintainers,=0D
=0D
Gentle ping on this patch.=0D
=0D
My understanding is that r3 holds the original s1 pointer after r0 is=0D
cleared, so the alignment check should use r3 instead of r0. I also=0D
tested this on a CK860f chip, and the patched version was faster in my=0D
unaligned memcmp test.=0D
=0D
I may be missing some C-SKY ABIv2 detail, so any feedback would be=0D
appreciated.=0D
=0D
Thanks,=0D
Hanlin=0D
