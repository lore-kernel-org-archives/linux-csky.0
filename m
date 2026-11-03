Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.188.251
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793733903;
	b=WHCgBxo9w6fiwF3BaYjCHHrZO2SijFOXmcYugBrXQRt1cn/7cGwVjwctcAGiwrjH48NU
	 SDaTXXNrwFnb92ivw/MNM+MQDY0Txkjr1TXQyCoT2tss7vQ+pEr7vS92frFZh33SZCCs+
	 u367QU1gxFWzv3imGiluKh/g5kxGogin8PsVcdqp/WMq3zAR3QZb6ImdGJjLAdHY3W4bw
	 9lXBtRlOm1053CHssP3ZbVNopcHbTt5V1HI/WhSN94UbH0CYUJkx9TCmn06IJWgm6+TGF
	 Dyl/ioDIoHcJ2acLwWWGR6hJlyqBsw1etJh/0jAxH0mJb+8ZMreuw4p4wUY6fNZji6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793733903;
	h=DMARC-Filter:DKIM-Signature:Received:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
	 Content-Type:Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Get-Message-Sender-Via:
	 X-Authenticated-Sender:X-Source:X-Source-Args:X-Source-Dir;
	bh=wcb3bWMUj3e7lsiSyQYgdqE5DrimAu75dhwLPQwp9h4=;
	b=N4Mz0GUoYbqBK91WBy49fgyHPrVM72Dagj4XaogLQ7Uo8SSYGBs/AxhNNibzIOVYynGg
	 aDHJ1zHQpZUHMiNMnGWRUbyyPGZqb4XTa77Cb6IV26J1ZBJYnPJQgBFURWRxj3VwYykLQ
	 QQivr33eFRM8ICjE6R+2UV8ZJuPhQxPrh26G3Xx4MqGCk+7OWJRQukv9Ke9XYy7Oivlng
	 6zrK14N4O/DM8dEhFQjPbyRCIldqa/xX0czoBunDD47XFHZRZXyU/65DlodIme69VfzPE
	 Mj+/KQQnAx0lnVaw/NRA94NbywBl18CILeEQE0RhWb6S79zk43vdRDTs2iEeO2NWEhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.cyber.gouv.fr;
	spf=pass smtp.mailfrom=oss.cyber.gouv.fr;
	dkim=pass header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.a=rsa-sha256 header.s=default header.b=CyQ4mgf0;
	arc=none smtp.remote-ip=51.159.188.251
Received: from oss.cyber.gouv.fr (oss.cyber.gouv.fr [51.159.188.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06EE606A31B
	for <linux-csky@vger.kernel.org>; Tue,  3 Nov 2026 19:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A06EE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.a=rsa-sha256 header.s=default header.b=CyQ4mgf0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oss.cyber.gouv.fr; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:
	Reply-To:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=wcb3bWMUj3e7lsiSyQYgdqE5DrimAu75dhwLPQwp9h4=; b=CyQ4mgf06a8pBg0P/Mjdz+KfUp
	1sZ8azHwONTssP97rhEsnzLX0Wen9sP1wScWE85jdH3ryyfQwviu1OuW4hxJacroo33J/V2n6mWii
	XPaSSNUWq5sJmCnJ2J0CYJekTBXc/+ENuy8z1e2GK9TEWLDPzI+nIYwe2vLULXHBb3mtP9caRgNod
	3Hi+Mz/9e2cGjb7lZBUXnTWYtIVn73J7QsFutiKRz3s456QanOBUtC3cKnhY0t1nm2SoClHi8K/0O
	SQJE09wQQmisGbvjy6nl8QVvnF2DqbqbujGrSy34h6RzUFn7emQaPJ53dhEKZ8BR1nE9HbzKPm8fj
	Dk+Xjfgw==;
Received: from [::1] (port=49402 helo=pf-012.whm.fr-par.scw.cloud)
	by pf-012.whm.fr-par.scw.cloud with esmtpa (Exim 4.100.1)
	(envelope-from <jeremy.jean@oss.cyber.gouv.fr>)
	id 1xOK7x-0000000AS43-2Mh6;
	Tue, 03 Nov 2026 20:25:00 +0100
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Post: <mailto:linux-csky@vger.kernel.org>
List-Help: <mailto:linux-csky+help@vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-csky+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 03 Nov 2026 20:25:00 +0100
From: =?UTF-8?Q?J=C3=A9r=C3=A9my_Jean?= <jeremy.jean@oss.cyber.gouv.fr>
To: =?UTF-8?Q?J=C3=A9r=C3=A9my_Jean?= <Jeremy.Jean@oss.cyber.gouv.fr>
Cc: guoren@kernel.org, linux-csky@vger.kernel.org
Subject: Re: [PATCH] csky: ptrace: reload syscall handler after trace entry
In-Reply-To: <20260921194036.4157985-2-Jeremy.Jean@oss.cyber.gouv.fr>
References: <20260921194036.4157985-2-Jeremy.Jean@oss.cyber.gouv.fr>
User-Agent: Roundcube Webmail/1.6.20
Message-ID: <611b530fab2d7fba3d7f33546d2b928b@oss.cyber.gouv.fr>
X-Sender: jeremy.jean@oss.cyber.gouv.fr
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - pf-012.whm.fr-par.scw.cloud
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oss.cyber.gouv.fr
X-Get-Message-Sender-Via: pf-012.whm.fr-par.scw.cloud: authenticated_id: jeremy.jean@oss.cyber.gouv.fr
X-Authenticated-Sender: pf-012.whm.fr-par.scw.cloud: jeremy.jean@oss.cyber.gouv.fr
X-Source: 
X-Source-Args: 
X-Source-Dir: 

On 2026-09-21 21:40, Jérémy Jean wrote:
> csky_systemcall looks up the syscall handler before entering the traced
> syscall path. Ptrace can then change the saved syscall number in 
> pt_regs,
> and seccomp examines that rewritten number in syscall_trace_enter(), 
> but
> the assembly still jumps through the stale pre-trace handler pointer.
> 
> If a tracer changes the saved number from denied syscall A to allowed
> syscall B before seccomp runs, the seccomp check sees B in pt_regs and
> permits it. The later jsr syscallid still calls A because syscallid
> already contains A's function pointer.
> 
> Reload the post-trace saved syscall number, repeat the bounds and table
> checks, and resolve the handler again before dispatch.
> [...]

Hello,

Did you have time to check at this?
Current commit on master still has the issue.

Regards,
Jérémy
