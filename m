Return-Path: <SRS0=6qp2=XN=gmail.com=bahdja213000@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8641C4CEC4
	for <linux-csky@archiver.kernel.org>; Wed, 18 Sep 2019 10:59:00 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5490F218AF
	for <linux-csky@archiver.kernel.org>; Wed, 18 Sep 2019 10:59:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7lCLSUS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5490F218AF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bahdja213000@gmail.com
Received: by mail-qt1-f174.google.com with SMTP id n7so8311386qtb.6
        for <linux-csky@archiver.kernel.org>; Wed, 18 Sep 2019 03:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=1MaCbxUQyW2nEXO/HydYARyyQ10Y620bTUxXYMw0TIU=;
        b=l7lCLSUS5nz6Fw2mbZ2So4GXMD2C2elaxTXf2Uur1q8aS6UVt1xA1UDJ9/5EylkXzF
         /S1vyi92o1SO+uaCYGpj1Slbb3ggsWMh8TfjjeRbA6mGytMsU0p+54ttx0Ae9Be9eEXC
         V9+Xg+h09QYfgr1OsoArp6YzHiwWoqdvCNQB0U0U8eMO2tdqxgtytGWE9McYSeMLudua
         vqvs8qSqy4F1dCxKcXewPlcBGADR3m5oKOv/DOA0zEqmnX4bglVMk5WQ2l7PsIxwF18p
         ie8AWqP9qrOh8HnuSI3sgTrJqVpkvWlqSWtuUdzyzTTIMj1L2ho3FVHLh2mLE1SVdl9i
         eRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=1MaCbxUQyW2nEXO/HydYARyyQ10Y620bTUxXYMw0TIU=;
        b=TRPRErzBun3+QrIOeWnZdXjBqPtWfOVNt42TXNipBG5tCy+0Cb3FaEs/iTvN2DyJSW
         BtbUXbQvcY3Ynfj5it6e1OgEpZXkoSrPmVzn4KUnInU0akoyMYoxOa458pSqBsc1RKEQ
         D6wyYRMISQDZdLAegyS+jZK8Jxz+9dy1cqrR/uJqtQJ4GAl9IjQhp2dlcGEt3dK66Sf3
         WzWOSdAqEIw1bvSVRVGgfow9+85RI+yNJTmsBEiF7JdVOYqib0SSAlkiym5vUwAbknEW
         K9SSqrN4T9BIURqfLDn+gilI5jTCX/zNqkOOvOINGZZtPYVLCAv8yHlrt07Ys4qaabHk
         FnSg==
X-Gm-Message-State: APjAAAXIQIJOBuoa9YsR0Q8dC3hECxIqNJaxttlRzLM0J1hqQ66UyIAm
	ac+vWZCLNaBBhTYICe/87MnjhXG603WMrCgXXV9CgQ==
X-Google-Smtp-Source: APXvYqyRINPu2NAffCzbq5ferVNfvVVLMLg/R0t3MqaBsfFYvIPrXqo2xQe+hJsgooGSZHqD7gSG56kicpkqNjjdS2Q=
X-Received: by 2002:a0c:add6:: with SMTP id x22mr2627344qvc.203.1568804339002;
 Wed, 18 Sep 2019 03:58:59 -0700 (PDT)
MIME-Version: 1.0
From: Bahdja Bahdja <bahdja213000@gmail.com>
Date: Wed, 18 Sep 2019 12:58:48 +0200
Message-ID: <CAH1cjhS_zE87xq_+oYLVc+6eNSDLCQ6j+FdOqEjzLfdXzr_90g@mail.gmail.com>
Subject: information and help
To: linux-csky@archiver.kernel.org
Content-Type: multipart/alternative; boundary="00000000000059319a0592d1b930"
List-Id: <linux-csky.vger.kernel.org>

--00000000000059319a0592d1b930
Content-Type: text/plain; charset="UTF-8"

Hi sir.
dear/
i have kernel "romfs" i want to compresse with lzo algorithm to add it in
my sw.
i try many time with lzo oberhumer but i cant make it.
If you have any information or documents and video how to make it, please
send it to me.
please accept my best congratulation.

best regards

--00000000000059319a0592d1b930
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"rtl"><div dir=3D"ltr">Hi sir.</div><div dir=3D"ltr">dear/</div>=
<div dir=3D"ltr">i have kernel &quot;romfs&quot; i want to compresse with l=
zo algorithm to add it in my sw.</div><div dir=3D"ltr">i try many time with=
 lzo oberhumer but i cant make it.</div><div dir=3D"ltr">If you have any in=
formation or documents and video how to make it, please send=C2=A0it to me.=
</div><div dir=3D"ltr">please accept my best congratulation.</div><div dir=
=3D"ltr"><br></div><div dir=3D"ltr">best regards</div><div dir=3D"ltr"><br>=
</div></div>

--00000000000059319a0592d1b930--
