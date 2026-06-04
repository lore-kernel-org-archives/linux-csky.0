Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2E33F1678
	for <linux-csky@vger.kernel.org>; Thu,  4 Jun 2026 11:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780573457; cv=none; b=eGPARU5dXFmamKcgFIEqykmERnt5RgrvjP6/D4gpsuJ67wjySggH9+pqdP8oR0Xe4d55s6EtVjIclW1d+vPX9dxcLjKyE2M2mCl2eExwPzVWG49PmHVqm22q48rY0XEz5vcV2Fafb4tBBLalstEDRke6x47X/kOLzHKPv0kPgdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780573457; c=relaxed/simple;
	bh=MWcDe4a2571gtZYlkckpYYzJUe4XBKoz+lA/+DkUZVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lPdMolQ7H9dA5Tt6/tlQXruzqs79WIiWRHHoRQ6qwnH3iz9ESLuRoHwertgSr66W+4bCcLYTkVAeiTNz6ykpzNckMAberFH1B/+h2m7U9tFPAoouBHYbekWLGeiJV8OGWmmKGY+ZNl1Ae7zpnW647OwB8JnGsuqK0VfSWDcGh3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ixrEnm6e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ixrEnm6e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496ED1F00898
	for <linux-csky@vger.kernel.org>; Thu,  4 Jun 2026 11:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780573456;
	bh=MWcDe4a2571gtZYlkckpYYzJUe4XBKoz+lA/+DkUZVE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ixrEnm6eXrhmB+TLNR69HWFm+ZPOyXxBkckIVrSNFthMIAahLKQ3eTL5XIoFMaWQ1
	 SPT4vCmNjSfP1SyCIPRukXgg4ED06/cweBNUfev1C4WhhqGcZ+lRoUc51va9qvxAJP
	 sdkBRqOw4/xR6JffSau7ODEMoCb7QQlXODxNkADML1NdIJscjVkre9tLOmre7T0Yqk
	 Kwb2ckDmUMgw296Gmw4XrXYvGajvgVy+r1RRfjXNQH7mDYefxnm5U+z/HCwsYvVP4l
	 +ZB282PGlzK5X1aeennMpURNx4nvH3dbqsQAeTCvJu2wWiJGVrAIoZvn0SlKk6jy/i
	 M4bhjQ2LbEhqg==
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490b64c8311so7535705e9.3
        for <linux-csky@vger.kernel.org>; Thu, 04 Jun 2026 04:44:16 -0700 (PDT)
X-Gm-Message-State: AOJu0YxST+mObVK8yTE/AWnP4Cp46AV+nX98G2zYYgzVHf0lQFOzjypA
	EeNYR7WNnVl7Tk2w2W1eWuw0OW3hNH70lER++JjUu3PlaHntDcVw6GHzSmGLh7EcMcgkbK8SMpT
	hu6xBY6+U5CWrRcuwY3ylsGvsgvFqd+U=
X-Received: by 2002:a05:600c:859b:b0:490:acb8:1490 with SMTP id
 5b1f17b1804b1-490b5e94e91mr105641485e9.4.1780573454970; Thu, 04 Jun 2026
 04:44:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522031824.22834-1-pgeorge8929@gmail.com> <20260604035928.43352-1-pgeorge8929@gmail.com>
In-Reply-To: <20260604035928.43352-1-pgeorge8929@gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 4 Jun 2026 19:44:02 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTw-sykwO==M=bBx7HXgrXz00DO6_qb_QxZxd4fMxsCdQ@mail.gmail.com>
X-Gm-Features: AVVi8CdGeeF0sw9D3Dr6LK-rKIbnZbGrEjVKCZAggg2nk0KMOl7Tl23xhPGQi0Q
Message-ID: <CAJF2gTTw-sykwO==M=bBx7HXgrXz00DO6_qb_QxZxd4fMxsCdQ@mail.gmail.com>
Subject: Re: [PATCH v3] csky: Fix a4/a5 restoration in syscall trace path
To: Hanlin Song <pgeorge8929@gmail.com>
Cc: linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied:

https://github.com/c-sky/csky-linux/commit/fe69c03143c2720f89659c9727e4f472=
b9cf24a0

On Thu, Jun 4, 2026 at 11:59=E2=80=AFAM Hanlin Song <pgeorge8929@gmail.com>=
 wrote:
>
> Hi Guo,
>
> Sorry to bother you.
>
> Just following up on this v3. This resend only updates the author and
> Signed-off-by name as requested; the code is unchanged from v2.
>
> Could you please let me know whether it is still queued, or if I should
> do anything else?
>
> Thanks,
> Hanlin



--=20
Best Regards
 Guo Ren
