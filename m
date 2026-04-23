Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512B52F25F5
	for <linux-csky@vger.kernel.org>; Thu, 23 Apr 2026 09:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776935607; cv=none; b=DqG2g9Z2P768JFu9R5+knXEj7PGyTWf64rblLx02rrBTMO/BfPY7r6lhGS70Z2TBR5NGlA3cEfySk3FJIDBo0Y07OJa6ONTxEL9azrrYEFgJ1xm9i7rlaxPmjFmo9DCDSYbo2A69hEaW1KrKTNaD/VPPw91aEz4JChYwXjRE+Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776935607; c=relaxed/simple;
	bh=6T9IqlK5280psLkT3eMJmwYwDyICLVpbc7WfYWRFFiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t3+jXdEFRFCjsNBK4OJ3U+QuEgIrJWFhMU1c2BMKA5RPxLHg98CbIuDAwodiOymlRDQ90JQpSKhExSzBRaNpFj5GHDlnt6Zhbb9EVtvU4qUFPpXIcwTJ1JnttlfUbVUPsOn/j6/5+8/PtBse8GbyoG5p9X8CTyhRwdMV/79JNkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sGuGzt8O; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sGuGzt8O"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488b150559bso50870465e9.1
        for <linux-csky@vger.kernel.org>; Thu, 23 Apr 2026 02:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776935605; x=1777540405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iBZ9+FXv0tBiNwFRrrrMnD/CIzl1HaptSL4qAqgrjwM=;
        b=sGuGzt8OSxXHXuuQSOIbjM0yAZHsXrcsBG0ct0RqXYUgZDL2Md8h1h01TBdRYMtvJS
         gSAaBP/bBElP+I5fQ6XuYMCp1nSzXOO7/Sd1dmQAq5eHd+FCd3RqF8jIm3btI1DR6zbS
         BcLa3rrvHBebrEiaQbO5nVi8uDxEM+NvnqvPZ/TefJGvJWAudWHRWkVrgmNrxSAI2fLr
         0drhLCZA5yE7oaS6+d3GRSTMsEAshwGQX6Znhgt5y9jYTN4M9aYO94GWekxeUo/17rqY
         3BuxbiqaZLIpp6JLklQygli7DWihQLEVrspiYmCddhwJX3XNjfNyAWbVaMD8QY3LMB+y
         Vqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776935605; x=1777540405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iBZ9+FXv0tBiNwFRrrrMnD/CIzl1HaptSL4qAqgrjwM=;
        b=muaROnZxGrZRQWi3tDAig25laoIy6D53okWzRc+9pQBCQCdqNJ7s1ZU3jeOd68j1n2
         37tJAuFsQmmBGXJ3TLyS0ycNKGrenH8PDBPsnYYqR/87o4ylf2jkSCzMuxnBfVpswP9S
         iKAm6rlrfKitz5lEm323DQWvrsA7hEwJ50Jl903oHOGZ/C273SlYaSAlXmueQfbk9TwV
         f+CfLo8wDSks4fhajbFoHkMXefv/F0saPlMImOjS34gOoyNyGuH8gX8ukblviugJwe+L
         N+aKxmEELe9u++X0IUIhNWiJIT6a4ckmb6XfpdNN+TSE6C8F9Tjw1uCYXAeyR9e71p0Z
         qRGA==
X-Forwarded-Encrypted: i=1; AFNElJ/HfITR80UzXzxT33Zx+IyF5uQDQr/C+nJ+entARuQ/VJmGB4RwCsMZTbascAyxbvSva5E6eLMHomOb@vger.kernel.org
X-Gm-Message-State: AOJu0YyS3SvBcvBeVz7ImVIFI3AMMsVvnjiHGo318mwwVUoxuVNXraaG
	MaKKrc9wTb++1pJIOkynyKHcYC2L/Ucaw+I/FH1FDXaprfl5zUunIGqfijEAzkKFMMA=
X-Gm-Gg: AeBDieuiu4/G1qMEdbNJ1t8VuaDrz1A7UY2kZzCrhlG5b69iDctujloZ8TDaqZDev7U
	vGqu2s9XLQ94N8mqACG3Ludm2l4ZXa9P21pxGzqZoIf/sHG1vgcE8Af5cayipSMFNtFNzgzmwnX
	qpzy6jjbhnEJBS80oHc9Hs7W8+sPmp/aeIWQQdVLeVLSBsBNKX0mvuUIQKj1c83Vz6Rh1lCQP0X
	splc5v4FwZA8etkq/MtcEmizn+JJqhzA2pU1MNnSqLTfGnf18K2KQd8ymN36TmAVx9OuA5V1lPU
	GQ7VMtdCB0UgxnVnmOWyXvSjSNwklE6iN79l9CLbQ4ulCyEE0/FrUyfd/3AmOwhVvVelMS1PTDR
	kLsr5sJWzosvvTdWv8ZSCY85pF5imNcOypc5EoIauz+04WMNowf1Q4X/RGAWyp4lI0XBlrzzD/B
	N5Hu5X3sviTQV1PigUf40tZDw9EnpoPdvCojXpaFjsagw=
X-Received: by 2002:a05:600c:c10a:b0:483:2c98:4368 with SMTP id 5b1f17b1804b1-488fb771613mr293409705e9.18.1776935604727;
        Thu, 23 Apr 2026 02:13:24 -0700 (PDT)
Received: from [192.168.178.64] ([84.246.200.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a557412eesm85745545e9.9.2026.04.23.02.13.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 02:13:24 -0700 (PDT)
Message-ID: <204607f3-16fc-4be8-91ac-bf38c6dc31f9@linaro.org>
Date: Thu, 23 Apr 2026 10:13:22 +0100
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf dwarf-regs: Fix off by one in
 __get_dwarf_regnum_for_perf_regnum_csky()
To: Dan Carpenter <error27@gmail.com>, Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Guo Ren <guoren@kernel.org>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <aenDmXNIKdwdtMzn@stanley.mountain>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aenDmXNIKdwdtMzn@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/04/2026 08:00, Dan Carpenter wrote:
> Change the > comparison >= to prevent an out of bounds access of
> the dwarf_csky_regnumsp[] array.
> 
> Fixes: 8cac4013b0c2 ("perf dwarf-regs: Add csky perf to dwarf register number mapping functions")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> ---
>   tools/perf/util/dwarf-regs-arch/dwarf-regs-csky.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/dwarf-regs-arch/dwarf-regs-csky.c b/tools/perf/util/dwarf-regs-arch/dwarf-regs-csky.c
> index cb44b774f8d9..4c586a5cb763 100644
> --- a/tools/perf/util/dwarf-regs-arch/dwarf-regs-csky.c
> +++ b/tools/perf/util/dwarf-regs-arch/dwarf-regs-csky.c
> @@ -118,7 +118,7 @@ int __get_dwarf_regnum_for_perf_regnum_csky(int perf_regnum, unsigned int flags)
>   	if (flags & EF_CSKY_ABIV2)
>   		idx++;
>   
> -	if (perf_regnum <  0 || perf_regnum > (int)ARRAY_SIZE(dwarf_csky_regnums) ||
> +	if (perf_regnum <  0 || perf_regnum >= (int)ARRAY_SIZE(dwarf_csky_regnums) ||
>   	    dwarf_csky_regnums[perf_regnum][idx] == 0)
>   		return -ENOENT;
>   

Reviewed-by: James Clark <james.clark@linaro.org>

