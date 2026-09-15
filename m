Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24247226D18
	for <linux-csky@vger.kernel.org>; Tue, 15 Sep 2026 22:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789510894; cv=pass; b=Dtn67k4vokgQ6YQZ13gKBcSCqhoQ5mhqLL5+qd1zN24N/MnlfPDkVO8+q+L3VM5hUeqq0klAPyprZqNw9vUS8FuvBPA4RNgBAxc4AIllKbUlEDtkAUaT0/9FcWfon3s33jJNm7tATpdY7YWme3tmanb6s4jVHZHTu4ivNOmEFJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789510894; c=relaxed/simple;
	bh=zMEH3dKvgIFeOLNgenpgNKtSSPQyo3I2Bi4hOFPx7Sw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hRjEY6GhYqeNtkIuoHAh48h39NdOEHEWD5TdcUWEB6SQs6iGQnyKRjJCkX2jC8ey/BZ2DUVNZdPfq+KfSHDyWbxcncMsv2XSZn+xs2IMlKdEOlZqJM+GuHbrjdt0QfvJmNDRisrzhm0bDexRKKyiEGE6rLJ1tYiJQtUfNk9YGso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IV/k2TQj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aB07AtjI; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IV/k2TQj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aB07AtjI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLZBIJ080114
	for <linux-csky@vger.kernel.org>; Tue, 15 Sep 2026 22:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=; b=IV
	/k2TQjkUrsTGpshqW8f1AkLpzgE6WqJLnJXyVNHKYz8mozA+vLQbIOpShvI99Nvk
	BGk11nj45xZQZMebNdo7NiYw/EO7W5wcvHVc8eAkRKtGrNMclkKkbe3unomYvdUd
	vFaT1byqggr1zubtRjDzuTG9pECEQdOzFAiv4kdIU3d7CXM0IsQ27dhrP8NvQBkU
	TlOdMgPnM8h4FF25SXM2n03VFD94RLvjnLlaGSHHxie20ptztZeSDX3B4EelrzMT
	n1DLEJiB1mKEp0dVH3Si7JCiMZpC8ZcIigaByfbQDV2F2ANWVcL1rru5kNRyAlZ9
	ag1DWjYpUlLQQuGalXdA==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqageh57f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-csky@vger.kernel.org>; Tue, 15 Sep 2026 22:21:31 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-45e83fd0663so6244512fac.1
        for <linux-csky@vger.kernel.org>; Tue, 15 Sep 2026 15:21:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789510891; cv=none;
        d=google.com; s=arc-20260327;
        b=cpnwwwFZxG/sWFP2jEJJMIzmoGx2dIybGg+xM3zkfqXwX50kcP95mxhwFfhVjY8Ar+
         Yj++Co40TuynDkayBqZYxMa6qri4StH+PRACwgra3Tpu+H+bDrYZv+F7l3Q44i/B6pxX
         a29Mj1A1U/gebb5th5uACFqQRoxa+S4tY7kSV/Us50Vdnhc7YWLGfNqrFt9YZ9+EKc1B
         WydQrWk3FMbsE6TJFAMAHAqyYnXTw/Z+gc/qV/PKtPweRQlg/p7hZvcmzvhg1NU5mYDw
         T92yP6pCUZdrFB7yQ5n0Ocwwqpl+gsp0vglxckNBsgU60Jw/0pDwU5z0/U6hfyqOZPs1
         q5UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=;
        fh=GAatiAET8ZLsPF8NER7p9AJihw6E+dwkfnNKYxsmyvg=;
        b=mn+DTpLMzrUtiGThDfbHH72moZCDWEJ4QltsytBaOL9zGMEnH0nU8k5OY6HIULoFh/
         +Miw/2+8G+KlHL/6AcXOBxZGPv7kn3XfRJ3mKKoXbC06ksqQiijcCjCBEb1GlYk0N2yc
         EDFIotn5d0rZ2Y4fc1FgJkDNFYLPG7tgvgORo3FVzybG5iGpIcVxqmIMi3rzuupGCX/2
         q2SWXQummMt1LghpHb5y9cpG11C7ecgxiBMLuKXWMjJbfaUL/7j1RHSVXDhXyjt0QlO9
         gerMaSpXjzgIaAnIPwGgMI1kNKCZ8l5ZZri4to65BsN/M7wrIy5TfvzuNhDEp7yiOfHC
         5DRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789510891; x=1790115691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=;
        b=aB07AtjIKjPYRGcvBSuVUhbZlxd1+55zy/NhIuvnz19m7qssQTpE/4jhghs82a98Dx
         rtzGuCLITyYJpv6qqsfwRyWf2V/rvp/BavfnHKk+3jeYdHSZJCYDfk5x4efzm884vIfW
         UjGKSA8ySqC+bc1butY/HkkuCwEw+HH62Uipjk8j8bjqvTXRubAdUvP+c5BJvALTKQeE
         2MFV1Wjr7h5QJcQaotkuVTv077nzlClUSJUJjEEq6X2ukv02bdE+qejZx/+uCM7gRcPt
         xEQKVpHKyQ6abdYF/Q1vdcAj2ZFa315JGdv0g44dh8zUZEwY87qYbRStthdyfxwDukm3
         Mbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789510891; x=1790115691;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=;
        b=N6CGHbtgP4IF8+P15CyuC4mYqN53l6OqT2ycM5D1wK3vKJ1ePSGPlzcj/o4LQWtAvz
         qPlxdXSGnja3O1O8SDYxrMGLvfOdhtFfNDpKH7xtv46G8qLmE24vN2tNOuu351yFWJzU
         wNjfgQSW9ezzmHjQ5zBGas0FJ/UQI06aKJb+jj39jLQWhMnTbHzB5OvRGs+AJe9vJqQH
         rvHuwxoplGSf3ZSgoivig8uWsxaPeAjyPJkWCM1ivqD6Hbu8c8OSg66/vUkuqpjouFNh
         7mIRTLMHKv2h6Jib44Wgx8i0eJ9Juj2JiqWERKWdropgTMGM1DhpTG2LhmVZ4qCvIPXt
         IJ/Q==
X-Forwarded-Encrypted: i=1; AKwUvByT5gxkkigJFBsq9vGGGlRw0caEUV5+Luvz7mwfjR1bAmaJbE0hGYHMPo4tBZuEOjuowFg97HerJjjW@vger.kernel.org
X-Gm-Message-State: AFuF++mI+y2YZVHJTQNsvpqk3AGQBbI0hj9yhu4eHih0yday6hkNdkRS
	MNWZNqcdlGAFXsZ7i/GBtqKsZNhCCpHragBqPRoO/WX2EQtikX3mQOi0Ca7VviuBFPWRAGVXuOd
	AFgD768x8U8X4aOAbfTAfFN/PgkQyx2E/XKUIDXuf6G/vKCqVAewTQGUqmW9KeLEEaQUIPK9DWW
	U0qGEG/bctMlvF2mGjtmnrNqe8RbIrPFC29sGfkiU=
X-Gm-Gg: AYBFou1y14v9hPGNVW6f9dlrNj3seF2drEvPA0bp62Lq0SfRO4UVAAAIk4ppN3thzVM
	Q9Rdt0CktsP5MEfhPS03xlJuqWHL+s2Z/ZbbI/xqLTQwOEQ3h3k4tQkxEIC7rm/3jBCBiNMKgLe
	Xze5E0J1Z9jRKTQA+RRTe43Kedb5FmQ5l8lFuACellCxvcAC+Ap4qGZ6qM
X-Received: by 2002:a05:6870:30f:b0:45e:2de4:95f1 with SMTP id 586e51a60fabf-4847584c51dmr189745fac.2.1789510890835;
        Tue, 15 Sep 2026 15:21:30 -0700 (PDT)
X-Received: by 2002:a05:6870:30f:b0:45e:2de4:95f1 with SMTP id
 586e51a60fabf-4847584c51dmr189724fac.2.1789510890430; Tue, 15 Sep 2026
 15:21:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
In-Reply-To: <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 15:21:18 -0700
X-Gm-Features: AcwNN1UxxSxAxz0XPK7niSod0Tx_HsUs-C3mKdcqDSaFkh659BGkCorPygYZGHE
Message-ID: <CACSVV028AdnTYa6OKDeoJYCau58uTkKMgEdqTn7crNSV8QZxOA@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>, Jann Horn <jannh@google.com>,
        Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org,
        netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, bpf@vger.kernel.org,
        David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev,
        kvm@vger.kernel.org, kexec@lists.infradead.org,
        linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDMyNiBTYWx0ZWRfX+13Id/JzcuIs
 XaoYEg9B9Je8VcvcQ8rifdQ/zTafNpabYuecRiXqtnMj5qHWLwe7nvhQr27blwFkmnL4/Qcs4nL
 dpLhwhXAxVbv80fa0AKoBJ68VvezINk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDMyNiBTYWx0ZWRfX3yf+45EegcNm
 KFKf0PtxFeBW0UaZDsJM0/zFLHLBMS3IjYIiAgKdS8wPq9OTTmdjdR5TUbDCU+Ci2PI5cLpNd5v
 XiWd4Zx1g2CgLoHcD4NeUTWgax9p8j5/uPLOMJuM+otAsMpJDVWi/Fz+1k5v9dCPrxDHFHfGA1E
 3RXaR69PtkPLt0iXmZhpStUeosSHM3GlXuHXCFhSW5VUA6KEimGEWiSFmghXMCzBbrpTB2Iuj3r
 8iVx+hpBvrTEddlO0J7TafPY9ApQ8QbudvHQlP1UBT1+IeytsZbgM6xbnn6n0CT/R3TBAVy+9bo
 nW6xxyK72YIZy8AiBTZDTIT0p738mN2zC8PBHRi64/m6u0kX90DphgnZfLo8LMTLhmvvqNfmRPY
 fYT7DVTd/x3qEwst4n7Y+Mg1bQrzCgSyRq1ahLFtAOHGCmTCpQ+vkFeYtiFtNsR7bQo2/fY8gAG
 iSBnZBgjPZTbT4wMBmA==
X-Proofpoint-GUID: KLpcQg0gvnUt-fl9QXw_HfwSMKtw7j4L
X-Proofpoint-ORIG-GUID: KLpcQg0gvnUt-fl9QXw_HfwSMKtw7j4L
X-Authority-Analysis: v=2.4 cv=PcZqFShd c=1 sm=1 tr=0 ts=6aa9c4eb cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=Z4Rwk6OoAAAA:8 a=VwQbUJbxAAAA:8
 a=2Rxv5svHm-zNKBYa0PsA:9 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
 a=HkZW87K1Qel5hWWM3VKY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1011 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150326

On Tue, Sep 15, 2026 at 9:02=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 15 Sept 2026 at 04:31, Christian Brauner <brauner@kernel.org> wro=
te:
> >
> > TL;DR, this lets arch code handle fd install and cleanup. fd_prepare()
> > allocates a descriptor like get_unused_fd_flags() does and records it i=
n
> > a slot on the task. fd_stage() attaches the file to that slot and
> > returns the number.
>
> Honestly, I am *not* a fan. At all.
>
> I think this adds complexity rather than removing it.
>
> The diffstat tells a story:
>
> >  106 files changed, 962 insertions(+), 861 deletions(-)
>
> in how this adds a hundred lines more than it deletes.
>
> But to make things worse, it adds them in bad places: low-level
> architecture assembly code.
>
> Those extra lines are *not* making complicated code simpler. Quite the
> reverse. They are taking fairly straightforward "just deal with errors
> with normal cleanup in the place where it makes sense" and makes the
> *straightforward* case simpler, while making the big picture more
> complicated and subtle, and adding new code to places that are not
> simple and just blindly do somethign that makes no sense in that
> context.

With fd's it is more than just about error rollback.. exposing an fd
to userspace mid-way thru an ioctl is an easy security bug to write..

OTOH, "just use FD_PREPARE() / fd_publish()"..

BR,
-R
