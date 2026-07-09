Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D646410D34
	for <linux-csky@vger.kernel.org>; Thu,  9 Jul 2026 11:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595588; cv=none; b=qOG3GeNV7f2/+PuJrAWw0QQ1jLRelNscs9BTbO1/GO4iNivYABes+1UMlMLsy8vk1bXhxI437qxz1FaztTLo8tu/brN6pYN0c4P6KVW7fuAl8HOzpyYM0U5sfcsoazWZMl1MeM06iazvjVMq3/nwIuU5QExipqEIUj2TzVMb7to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595588; c=relaxed/simple;
	bh=HqXh4BfYQkZLyAofgdtRXqw9mAcQUWbFiU48fKsf49U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Izl91W+p4p/RdPICEiSYwn84UtiqwSCqCOrO7vuqrdZquo5F/9JcPgrLnsRSfUFOiQ5hPLPQDdzFN64dqV7v0JntLz9kHK0sJE6m235LqB0UYA/wixApw9GlFgBNqDMmjlQH5LFGi3X/FB9CHVpvcGxELde1d2Q2YX5XurSTwaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jqvWJK8P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iG0CDJi3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jqvWJK8P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iG0CDJi3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Ax56s1570841
	for <linux-csky@vger.kernel.org>; Thu, 9 Jul 2026 11:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tx1kSZXz579iItxHsi1/8Nt3maK8vpLohSpfVXF4Ysw=; b=jqvWJK8PLEi8s+Po
	PkAhOcF1EZ0TGn8umnL5kgryJ/tFquXm2xFzKz63mEvAAckXJG2v/bBhmyd/J+vv
	w606gHPQkOOhu8auM9bbQnd68PLYN5DhMVRn/TQO3SYM9ZXEOEAB8F2FTaHvyyzL
	/gj6GXZOaZ7Kqn5MccKMlGU9Y/8NaD7WUS1XOInbClq4x0wSv71WFJfHopsmfL88
	joRiOO1NBxKuiVXV4p/tSPunQ9pAf4nwUwhwVoGhXqa2d3YUXy3NiFuuL84Sr5z0
	sFBM3VIfsHX5R32LvKrkWCid7sj7it6qPECFAQp6EaOHyXV68SwSVXRcZbVTi1ag
	vIF6OQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq34852-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-csky@vger.kernel.org>; Thu, 09 Jul 2026 11:13:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a8c689b5fso13213251cf.0
        for <linux-csky@vger.kernel.org>; Thu, 09 Jul 2026 04:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783595583; x=1784200383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tx1kSZXz579iItxHsi1/8Nt3maK8vpLohSpfVXF4Ysw=;
        b=iG0CDJi3fEdX0+CvpLHa3ZPfVRJBQiHYA56w/vMcyBgF2+hpy32q3CU1HZq6nPC6xy
         UmjDZFf4CwiqV+QRBUVkridGTJW9uiQzqQdFVGemCQ+fVOre4X736H4qF6HV/I/Mg0mm
         4mQQgA3UOxLee/+tn5H8iVMGP5DDnyDMYlMIM9yoA1vaqRiHEh4xDXOiyTrPenIWL3Xv
         eEl3zNhexfGNgmBPVd+rnFNzwmYjP+AaruVL6dHO/2bvZ+hVBZIQCV8e7So3Wmx1wRIW
         WODuJ0vTVTLLQ2w4X1BNziAAkXp95D3RtzBpcq8BLOHS2Nfw+jtRug1n/63Y//6MSIFB
         fkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783595583; x=1784200383;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tx1kSZXz579iItxHsi1/8Nt3maK8vpLohSpfVXF4Ysw=;
        b=SsydWnFPD7T4MkfBF/ZSCleZPp0RSinNo7iv7gbRuU10XLhK/Yv0d3cHXXmA7XBrG4
         KVh+4sTOOF9as7ty3AIhnB8pREZJg1JN7ov0vmeFx/3hpKQe6IbDWrpYA2sHa090dz48
         Q+ZyHMmKymcUEbHlH/41Qmv7MoVO291iE+Th+4E+RJZ0eShWjdl9umE/Kxk5q/ovHnKY
         KIoxa/9smrpp99kXunHVBYsWIJNUHyAEqMdIj8awmJ/O9goKD3grkYoWH5tP7mku4FwV
         invnCncVpsi6qp3WGdw+DuvWYmDMiFAvoqUSfjx+KuscNbmthRxe/9DcRjTmRmwdQ78y
         CUow==
X-Forwarded-Encrypted: i=1; AHgh+RpgcpA7yD2+u6I3XgCcC98Q8DSgTF/3D20I3PjFzAhF+elS75JegIY2UTxooCGuPMg89EWoi1kskS/r@vger.kernel.org
X-Gm-Message-State: AOJu0YwDEEFhArS8Pb33uSlpMAKJwxz9g+JcafgsyPsGyWcmrg6TvXbb
	S+SAA58vAbreTEMSx7nMnmu0RMQzZbYM+m2vhg4UmWl3RhRO1I/5Ltd9oDmp9h+3qwL7yO8QDEL
	tY6SO8TBEX1uwFd/sD8o47ez3IGFSLFNCcj98W145QnPSMiIHZGfZaAvrZCHkim2W
X-Gm-Gg: AfdE7cnQiaDTvHjQhelzOuzfQtQ6WnGn1HBhNXLgkuwsDFgBUN2HbnE5PEUeelC0LhN
	srTWr8aqQPTPsrQ5b2AACtRY2OPcYgh1xhg9FLAzTVBIxojS6CINWvI0UX7x0y7G2Rf1AMSxWZ/
	ZgIU962bhqTj/ssUIl1lUXOdVlnABqz0Gap5jDygqQyflNyd0tprGAvUp3MN2rlScwBUv3NPIEI
	570T1ynDESN5nNJA4HcCwtwTkZ25dnrBpZXhIPy6jVNJ2ZygZL1OuA6NdyfjWHgF0CunVpTGCVn
	ghLvMn4d5QrE5r7J8DBoeixbqvyAOVFgfzn6Jem3lqQw+W2yTiDf/FVWXWSL36P6nWecC5cbFJY
	ZO+Q0CkQI9p809ld+owT32rOCD/cQVqRFZly0nJVh8W1NQitsMlF86CifexiZyg==
X-Received: by 2002:ac8:7d14:0:b0:517:61d5:2f7b with SMTP id d75a77b69052e-51c8b4d596amr63974421cf.56.1783595582879;
        Thu, 09 Jul 2026 04:13:02 -0700 (PDT)
X-Received: by 2002:ac8:7d14:0:b0:517:61d5:2f7b with SMTP id d75a77b69052e-51c8b4d596amr63973951cf.56.1783595582395;
        Thu, 09 Jul 2026 04:13:02 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f213e8sm48543085f8f.34.2026.07.09.04.12.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:13:01 -0700 (PDT)
Message-ID: <835e2f62-3b66-45d4-a614-dc2198a715ad@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:12:57 +0200
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 01/18] powerpc: Move stack randomization after
 syscall_enter_from_user_mode()
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
        Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
        x86@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Jinjie Ruan <ruanjinjie@huawei.com>, Andy Lutomirski <luto@kernel.org>,
        Oleg Nesterov <oleg@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Helge Deller
 <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>,
        linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>,
        Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>,
        Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org,
        linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-arch@vger.kernel.org,
        =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20260707181957.433213175@kernel.org>
 <20260707190253.718191130@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707190253.718191130@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 81e2farplRmp4qdNw0bZudIsuWMWUMMw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX3lY4ID8+YLvW
 p+b8uc9ZLTMgya5dMi/5UXtAkTPYbgrZS4rbs2siqs1Fw2xhMnlZ/ZavUJzNryDQWmmdcLHnEZq
 Oz13lp4PoQ9zHK5M5RsupErSUYnl/8FgFyC9aYtu6cAyUxhG+LEawqMi1+8AS4Mu1NVKfTNfTx9
 NAsHcPzYpswwpT5UNLcoz/hw2cUMbGv5OTPEHr6g6VmKs1/j8tiudPcrEe/qJXZ6ZAAZ7kSElKs
 SnNOo37lgHitLcTfCksFHTtaomY96VK4preclSV5e0Hm6pWgl2bLuSo4GdNkgOA4K8BZ8+74FUw
 +BVMnlPpLy6uL11wEqZDYd2kHi8lKZsi8PCdRoTDPnoboXU9XZshezrvFkw5K29qWui4gEiA+Kl
 weR2MWiwg0Fn6MIzVkqHw7LxlKoMpS+8YOnmLK/xTReyU51e/VPw5OBJ/gcGRTKq71clIvCOJIE
 Yh5eyN0bdg8UqUCkdAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX4ld+cuuJY78l
 0DAnEEKrQLgdDLplEmvl2No6+ytb+2NoXG3AY7g20/YVWyz3AkZKaKDde8+2auBQAj3nF8+eAuW
 MwSRfcwmFmTegn8SPsR/cXB2Sxt9THI=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4f823f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=voM4FWlXAAAA:8 a=EUspDBNiAAAA:8
 a=63ny2n9c4_t8xnV3ltYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-GUID: 81e2farplRmp4qdNw0bZudIsuWMWUMMw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1011 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090108

On 7/7/26 21:05, Thomas Gleixner wrote:
> add_random_kstack_offset() is invoked before syscall_enter_from_user_mode()
> establishes state. That's wrong because add_random_kstack_offset() calls
> into instrumentable code.
> 
> Move it after syscall_enter_from_user_mode() to ensure that state is
> correctly established.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>   arch/powerpc/kernel/syscall.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/arch/powerpc/kernel/syscall.c
> +++ b/arch/powerpc/kernel/syscall.c
> @@ -19,8 +19,8 @@ notrace long system_call_exception(struc
>   	long ret;
>   	syscall_fn f;
>   
> -	add_random_kstack_offset();
>   	r0 = syscall_enter_from_user_mode(regs, r0);
> +	add_random_kstack_offset();
>   
>   	if (unlikely(r0 >= NR_syscalls)) {
>   		if (unlikely(trap_is_unsupported_scv(regs))) {
> 
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
