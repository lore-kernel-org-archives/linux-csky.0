Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793245626;
	b=E+U47BU3cNqCR78gV21oaZxOeigd7zV6ciJTk1M+3hsyMVGwxGu1zl/IvZ/NTB8k7e72
	 wQKrq0Ngw+F8q8hxRwdn5oBs1+NLIfCfjMVlTcXYvImJ6ks+egE4ae/W+bPsG/xcsjwL3
	 S9ibJx8u+Q572ptBLfv4ZJGwWHoTlndcZ3cnhqAYP5SgUBCOStQM21pxHWFi4LAcYHuaj
	 LeiLEPqCUTj2W0TtS6MWyd5Hw7krM/Pe+qKOMPT3rJZNuOMZHygeFhCYyApBA7QFED+q/
	 LnXU9KJZuvJCqlTupsiCxSv/jkhl4/u/JaAL4zpJpJ9cEmBR364jn3VFu+0U39bt5qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793245626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h8kq6Pl9NTWK4dw0Rh3Cdb4b4qd62zLH0TTeqwKDwHY=;
	b=kIlUT/0SGZSDGdmgPABjrjqi7OSkdZq87dXuGHz+aTdFu7bQyVmBfD7K6DRbtViH3skh
	 yrRnpagF8lOm61XX/3gLwQhh1ELOE3U7T2FlUGiU1qTcz2WKuhJjMKsCUzIYFuLLRXIKX
	 sEiVtXvXWBWhtoTu6kWPT/lnTvyYXka64xdo9fLEJ04lbsx+EO+frrwSPcqQ8xV2yMevx
	 KDh3inCejR04af1r0Dh8ePoAv3yqRIoyTVu3mNYL0+LDJLtvLgYrcx8L00pE926YwJCSQ
	 q/Nd5YBX4pKIgyqaogcghZzfDn30e3KhVMe9HHJX/gXXM+f+TOPSIH/d9B8eGtYuAzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rdevqk10;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C655606A31D
	for <linux-csky@vger.kernel.org>; Thu, 29 Oct 2026 03:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C655606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rdevqk10
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e977109392so9889675ad.0
        for <linux-csky@vger.kernel.org>; Wed, 28 Oct 2026 20:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793245625; x=1793850425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h8kq6Pl9NTWK4dw0Rh3Cdb4b4qd62zLH0TTeqwKDwHY=;
        b=Rdevqk101cr+v9xciAZsil4BqLgOOYPJCQQU9UwUBlzdc78kr+WTAffXPya3G+p+Ra
         +dIw97dMpGxDRnaRgGttsVtThIKggdWJFJhkU0PfGEUEBSEE7JMoXNpZoU/uGn6AAkMQ
         RgAFeU/1qrGEav+3t+wxhuVVlRniLqpBA1Kg7nMLIpwYnZpMlYTwTqPDCshZKGmQ5LA0
         I/S1nZLdYhgeTsDCqR5qP/gixcwfhmB86L8hG9bqty+Clp136EgDpmYfDoMqcAmPwALF
         qmGNMpbeks1sSR+QQIyrPP18qTE3uF5X14cRzD6ZWMnkWS/WGvF6pqeughyFfalIFudR
         lVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793245625; x=1793850425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h8kq6Pl9NTWK4dw0Rh3Cdb4b4qd62zLH0TTeqwKDwHY=;
        b=Yo3BTKEKYhOhrjp0pd5P9llTrswAbMJoMECT0elxCQ07DT7AAylCOysQoWnHpEPlMS
         LQtJJlp5QvLHDvDHXLg9SpKofil9zHTz2QypYRo4Yn5mTh+v/VJY8FSa2Aqf6Xw/cCZL
         Wo0afHnU+T61iDZ5Uxg+sWQCUd81tSQ5blOr4CQR/qaMSv6jbf1XxkiYavlJvxcuiBcC
         BptxchpV4zt4H92kpaNTNQW2MHicagWnKNY8JpHQNdZLrbuqs+Jp5jzsZ7QyQn6sgEFe
         C5G9l5LFVJhNCxRvat7l2n6ucXVbbMoa0/YokWQMex+9gvmveK4Uwt84Zzx6wIovQ856
         04Iw==
X-Gm-Message-State: AFq9FYJwXP4wMVtxCz270Gtj8JtfezclEgPZOlgQb1AUsz6CHHf+eqdA
	6fUFf6chcS85Cz4pSfNsBxVgueHordojVZh6g+N0A2ZAGMNfAGBeSCFO
X-Gm-Gg: AYBFou1maJc1+lG/ZlCZffEzx3iAz/eoZDFW2bLzc2c6+vyp8i2pqcGgET+H6smitKn
	iDBXe5llhaHL2cG92/JaOyYcTNaFgLntzAPYz3UPKxkWTmOra1SZs5x0eu9lEdk8B4g+uDj3doM
	tenuwgG5K96Uss8yBGhmW+5RsHrJRN3o+uY3HgzzHojI0+u9IrH+QuH4uPWgcBXanPQ2zgEvMsJ
	ze3P9TbgIv6Uq45sVhPTzxR2zKL27eqZgFvmod+zwxJdTSctVGWOqQ+dUD67aymzNrJJ/IaIYsM
	S0meDGFFwopZ+axuQfMM6rbqYbuAyFTW1Sf1j1dcveNVi3hI5TqbAGYGZsmCoEdK+b7Hjsm34e8
	8hHcfQjyy3potjPmwQkvSkSwaa07XCEoA0u1HKItfkvBN6TF1GpAYpQjemZhKU1Ws0zJZWsyexl
	4+fmuSglBzZT2lKlyjj87XOiYNwx9Mx8ig9m0vWj8MRGB/uaAxTPO1seJvW7n8SLxE1MyvoSViH
	ZIaRekCSlWYNi8tiK2JTU9edQWhqM9omkDUfgy94+yty6HAswKZ9zzUDrLRrrpSH+KrWPsgqzB/
	a1yhRYLI0MzOjNdJGsbrXDWFPom02I//ADvcmg5DMuGOhlqr5UPRc7k=
X-Received: by 2002:a17:903:144f:b0:2ea:4c42:573c with SMTP id d9443c01a7336-2eb0054f6aemr38499215ad.51.1793245625415;
        Wed, 28 Oct 2026 20:47:05 -0700 (PDT)
Received: from arm-a100.. ([140.112.28.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b76df7sm28619815ad.14.2026.10.28.20.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:47:04 -0700 (PDT)
From: Tzu-Ching Yang <shingekinocore@gmail.com>
To: Yury Norov <ynorov@nvidia.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-csky@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] csky: bitops: Use the compiler builtin for __fls()
Date: Thu, 29 Oct 2026 11:46:58 +0800
Message-Id: <20261029034658.3137810-1-shingekinocore@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <auIQ2RI89C374je2@yury>
References: <20261022115922.1210342-1-shingekinocore@gmail.com> <atpm00m6KYhXo6Wi@yury> <20261023140806.1367050-1-shingekinocore@gmail.com> <atuBH6-LHueXYbFy@yury> <20261027062319.1700461-1-shingekinocore@gmail.com> <auIQ2RI89C374je2@yury>
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Post: <mailto:linux-csky@vger.kernel.org>
List-Help: <mailto:linux-csky+help@vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-csky+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Oct 28, 2026 at 11:12:45AM -0400, Yury Norov wrote:
> I wonder why the older GCC works better... Can you make sure its the
> same kernel version and the config?

Same tree and config: both tables compare csky/linux-next at
abb81e5ce7d9 before and after the patch, with csky defconfig (CK807),
built with kernel.org GCC 12.5 for one table and GCC 16.2 for the other.
The .config files are identical except for the toolchain-derived symbols
(CONFIG_CC_VERSION_TEXT, CONFIG_GCC_VERSION, CONFIG_AS_VERSION,
CONFIG_LD_VERSION and CONFIG_CC_HAS_*).

The Before totals differ because GCC 16 emits more code than GCC 12 for
this config, with or without the patch. __fls() itself compiles to the
same 4 instructions (8 bytes) with GCC 9 to 16, before and after.

> Anyways the numbers show that the switch to the generic implementation
> is worth to try. I've added the numbers to the commit message and
> pushed in bitmap-for-next for testing.
> 
> Conditionally on the (so far, missing) csky engineers feedback.

Thanks for picking it up.

Tzu-Ching
