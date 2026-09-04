Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D0B511E97
	for <linux-csky@vger.kernel.org>; Fri,  4 Sep 2026 17:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542483; cv=pass; b=iEW5CNrYzTvqyq/dgcW7wc3UOgq/LDnO+lW1RXflXTN3RFELMbiuyljH2pjoCaz0icraPd3L0QYbNTm1zhgVqz3MuRkc83J7SG4pGJX2hjSNLEwhhU8K9GPgMCa6x3k5ySGgroSZhEmVHsuwhai38B8xZr9yroboX/VGBxJ8lTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542483; c=relaxed/simple;
	bh=AFNBiWCRpUcEoXNChHss1VconiHm4hB8qaeZxdrK+Dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AoKadHeCu3dKqD0o1ySfBucVLfF/z0EJkj7vSmKFgEEUZVD7Luvz+XzDa32V4TH16lZf1eP8GYy+wjY9lJf0HPRKmaZq8AMKgitn78gJpSu0P+mmQkLzYxaI9vi4P+Vmw6sY/HRXMLcRa82lDtjEy9RwBA/Un5ZWm4qdjm78L14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+5ZMHHh; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+5ZMHHh"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a68aaf4840so2892850a12.0
        for <linux-csky@vger.kernel.org>; Fri, 04 Sep 2026 10:21:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788542480; cv=none;
        d=google.com; s=arc-20260327;
        b=g1t/eCJ2qI080XC8sw3ETQjQ59r63kcPM1+xesLYDG4xLkhC3ZGuHEaxmKDI7dbeaV
         am8bCVTEgFH2VcGhNw9fvhDzlyFOC+tNdB6qqUYyMiorFzv1EBNbLwONBmAwBgx5Sc5t
         Y2Fq3j7LZXip180QwU1hHS98U7ER7ZkNkpMJT+zqr233ycFocvLW/lQhBb9Hq3JyIZtM
         j3pnETAWGw8zM5rJ2HuyQ+c1TYfa9H4lnrhuGuApdACeGOssG/UEhKO2ksHiM5++4FP6
         rhfZb+qyudh5e+YPJyf611eWIoEnV1eC3dESjrtOXRx9tsxLs2hXIHlChvrz6ran+L09
         HA/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xbP84TB5YSyUcPTlSRXVzwOJ5KiLCluO2L3qZFE4rqU=;
        fh=PdIzpq2MQkR/zaSpqGJafJ4zNdELsFIliv9cmHu2QmI=;
        b=LK+Z2rZNAkoTC95wLE14G2EsTxLypNsuXXQjxM+D2y4QtuaNjk6gj/+OycAidGxZj2
         zJjHVQq1FD7FE8q7f4uhh2NyuxMTTSq89SGImiO8CjEYIiN53qv49CKV+IIfJXW//+G3
         4q2peurW+y6C3AHQuUQkuGkzb7LQ+keJ5HB1L7ZUfp5sbELwVF1CcW+p0rKSV4VoaXeO
         ZP+wuFPuIwiu+2gKFIARB2/AGRJueMsC/SnNnpxSqkFKztvnEEcL9s48a9dwZg4qE3DS
         IWwMS5t1MentyCnVhhJGrJFrTrqq5HlXy+ncifXcvznsG1X7fuGlckAJmcsZtv44r0Zn
         xXuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788542480; x=1789147280; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xbP84TB5YSyUcPTlSRXVzwOJ5KiLCluO2L3qZFE4rqU=;
        b=S+5ZMHHhfGjA+IdWmeugDDHgBwHG5bBYSPYfCEow+5chkn8MQle82UmWyVbxLiEN7d
         ijcv6053WNTu2RqyJ6VR+Q1MSk4Vxz4n7ZKFRrjYrPqEbaWeUeae4OgCiLykWRLNUDRA
         ZH/X93kZSKA1/wbKpcmxavHteq0Ow+JKUXYEkMsejbWI7AKmmLzp7rDEpD05dDMzdu05
         qx2RS3AgstzLvoN8v5AUqAPOvMKc+nz/J8n2Lte3Wf5wq5bPQVeGs2cRbGv15hnp0TgY
         EW5NlkkUE9iLPQcY1GiopKTuEm/IxQzvNCCThYHaycwvH5N4Y2kyLdCZ7Tyzs3tF5f6h
         EH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788542480; x=1789147280;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xbP84TB5YSyUcPTlSRXVzwOJ5KiLCluO2L3qZFE4rqU=;
        b=KsOZkUPhyEQ1tQXeFartpm4b1GjY6aA+bRacZ4tuzEDciVBZsLZ21tUYoL+aj2RboZ
         OA7Ps0/3U/9AId+gPJJOEs6ElxxFfUNZtlDlS2Usaq4CAubC7lrVVVQi3OEMYXAY3671
         y/kMsGr150sfGe6BsLb2gGZv0Xt2SxjpgyEBk7mHx6RWuUHUEVMeQVEVWNpPW6v0u90J
         HoKwGMGJsQ0GhRbkrNyfjRhaTfYL2VoiD4cj8V/37nIizGCyUXApv/BVFuTY/5kIOKBV
         BKvRvNKylSujDU8fpJhl7lDiRnESJH5PafQmXWFSydqqBvaCRrTnVzKk4zYyVpJO4Qvf
         07gQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+YBg6R6mMXsnPQTxSkmLjsJF14gNiWAnHtHl+BamlO60jQYVHwOtozlbwuKISWci/eMNb6GxGSJFP@vger.kernel.org
X-Gm-Message-State: AFuF++mhYobFKvX24Wjb0EqPLhlDr+QButqMncMTb6posrJ8B0oJH7fF
	UOZ13HeOpcekalhmwF7+s1wypvHbY81UWclE2WCegKv+J/JdUqkdb9lXx1JKCDhcTNAlvCs9Zmq
	S/UVFSIiZuAWnQSam4AcfmnDd/za+GmQ=
X-Gm-Gg: AYBFou3yv8L3cumXc6TZ7Tw2uJHqFJkb2Q5G1daQvMY3ml8Zcz+5F07gA/Ka4sumPOs
	LkNna1w6aLRbUKmHvCWX1nl9KVIg1vNRkjL+CpJpJNl3PtDftGEvz6JO8fUJwYsAzJga1nyFt5c
	maOev6Bhw8cBGi2faX4iwYR+jTO3i/4S8jell+WrlMzDNafzdrt+8hgMCh+wp+AUlTJ3WbP3ZAA
	OZIg5+U6YMJiEais51KuA2yKOHILyiZrGd8LE09gVmXQ0bhCsGOLzxopvy0D6xPfKRQuku6TWdt
	f7Slu2vcYKCYOo2iRCmzaUAMe8fGAtkw7Tf1JC8GdAmQGwJ4AQoknQkcaq/2ACSC4YAukoaTyVL
	C1S4T1ZexxWxGgI7k/MBPBHCbm6Dlw0E=
X-Received: by 2002:a05:6402:a252:20b0:6a6:9368:73a0 with SMTP id
 4fb4d7f45d1cf-6a696a73aa1mr4363499a12.6.1788542479338; Fri, 04 Sep 2026
 10:21:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788351089.git.rrobaina@redhat.com> <4ada9fcbb93af8d5c1c9bfe2c83d94fc10bfe327.1788351089.git.rrobaina@redhat.com>
In-Reply-To: <4ada9fcbb93af8d5c1c9bfe2c83d94fc10bfe327.1788351089.git.rrobaina@redhat.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 4 Sep 2026 19:21:07 +0200
X-Gm-Features: AcwNN1WpEQ0Y6eKbtA6wNzDHeYOBs1Tconhq7C15XjRhFKDXvjk4jMYrR9OFExk
Message-ID: <CA+=Fv5T4826T2sd0Gbh-nfZsqcWK_phdBKy4BLWOvDTt92t5Eg@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] alpha: pass pt_regs to audit_syscall_entry()
To: Ricardo Robaina <rrobaina@redhat.com>
Cc: audit@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, bpf@vger.kernel.org, paul@paul-moore.com, 
	eparis@redhat.com, sgrubb@redhat.com, oleg@redhat.com, 
	richard.henderson@linaro.org, mattst88@gmail.com, linux@armlinux.org.uk, 
	catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, monstr@monstr.eu, 
	tsbogend@alpha.franken.de, jonas@southpole.se, 
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, chris@zankel.net, 
	jcmvbkbc@gmail.com, tglx@kernel.org, peterz@infradead.org, luto@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ricardo,

On Wed, Sep 2, 2026 at 4:44=E2=80=AFPM Ricardo Robaina <rrobaina@redhat.com=
> wrote:
>
> audit_syscall_entry() now takes a pointer to pt_regs and extracts
> the syscall arguments itself via syscall_get_arguments(). Drop the
> individual argument registers from the call and pass regs instead.
>
> Signed-off-by: Ricardo Robaina <rrobaina@redhat.com>
> ---
>  arch/alpha/kernel/ptrace.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/alpha/kernel/ptrace.c b/arch/alpha/kernel/ptrace.c
> index fc8f6cedbb28..8a39c0473297 100644
> --- a/arch/alpha/kernel/ptrace.c
> +++ b/arch/alpha/kernel/ptrace.c
> @@ -496,8 +496,7 @@ asmlinkage unsigned long syscall_trace_enter(void)
>         }
>
>  #ifdef CONFIG_AUDITSYSCALL
> -       audit_syscall_entry(syscall_get_nr(current, regs),
> -               regs->r16, regs->r17, regs->r18, regs->r19);
> +       audit_syscall_entry(syscall_get_nr(current, regs), regs);
>  #endif
>         return syscall_get_nr(current, regs);
>  }
> --
> 2.55.0
>
This doesn't apply on top of my "alpha: enable GENERIC_ENTRY" series

https://lore.kernel.org/linux-alpha/20260902184058.198679-1-linmag7@gmail.c=
om/T/#t

That series moves alpha's syscall entry onto the generic entry
framework and removes syscall_trace_enter() and its direct
audit_syscall_entry() call entirely - verified with git am against
GENERIC_ENTRY applied, it fails at exactly this hunk.
You don't need a replacement alpha patch, though. Once GENERIC_ENTRY
lands, alpha's syscall entry goes through
syscall_enter_from_user_mode_randomize_stack(), which already calls
syscall_enter_audit() as part of the shared entry helpers
(include/linux/entry-common.h). I applied patch 1/13 alone on top of
GENERIC_ENTRY and confirmed alpha's entry path already routes through
the updated __audit_syscall_entry() - no alpha-specific code needed.
So for alpha, you can drop this patch in the next revision rather
than rebase it.

Regards
Magnus
