Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.188.251
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793916629;
	b=4oUDtc9fWltIAynzWmuDAVr5wNVZHC0BHw0B4tgvlm0Gdbod+b8KWe7UJCtEmBnykNMc
	 p9ZGv8mH3BqC/3Ryxdfp7GNi1ugZZ4ywrViPkYMdG87Sv9LnXd1GbtVyOuhKOACWiGG9G
	 pskWgtspH0EClmPJ9QPY+yr+OQDfmqiU6g0vrl+ehv4AtJGm36ix1I51RWtP3NnTPCy18
	 qOp3UaFnmYb5CBXrrgJ13Lzem1Ou9JdQrfMJey+D1Ut7NO07a6aC9MQe8Qsrrj/8EpOwv
	 cAT/+ua+Bah4HLNZjwdnFLdIYGWJdgHoC+TrpvquKbTQij8dk6vVZFEWqeJ1JKC+HOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793916629;
	h=DMARC-Filter:DKIM-Signature:Received:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
	 Content-Type:Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Get-Message-Sender-Via:
	 X-Authenticated-Sender:X-Source:X-Source-Args:X-Source-Dir;
	bh=HymqT1psSDHqwLJnChBoGIGtIwPt2A2soh1k3njgmDo=;
	b=rpf/dQZ6ErNbAtirUmOIP/2gXYmKzOE6drFUPH1i9YSqk5jeA7wkb9JvqbPhfwj7SmJH
	 NDlzrcjtsaO/oxf+9zmiPyfbTDEDvD1zRmMCuY8evUmN5u9nXL8pAk9G0IeBw9Rfog7Lw
	 TDmi5ul78l36HCj9PY+lrkvVQvqM9L4JMtyptj7byn8weWKjiZeM/6vBa+KLQWdjIYzqY
	 17AA/P6zbbehOAqkUzzXGP+qLXilKJ74mS7ZQCKM0dIX6CxqREjS0luVbXwk1Slv5rU2z
	 yMuSKpUdVgEdqZmlM1vzpczQQWDYGxI6tm6zWBB3dZt5loRcgvLRZ+MVtcagfS1zr4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.cyber.gouv.fr;
	spf=pass smtp.mailfrom=oss.cyber.gouv.fr;
	dkim=pass header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.a=rsa-sha256 header.s=default header.b=MKQUUEnN;
	arc=none smtp.remote-ip=51.159.188.251
Received: from oss.cyber.gouv.fr (oss.cyber.gouv.fr [51.159.188.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB66F606A31B
	for <linux-csky@vger.kernel.org>; Thu,  5 Nov 2026 22:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB66F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.a=rsa-sha256 header.s=default header.b=MKQUUEnN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oss.cyber.gouv.fr; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:
	Reply-To:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=HymqT1psSDHqwLJnChBoGIGtIwPt2A2soh1k3njgmDo=; b=MKQUUEnNHJgY1tqkS6/I8SQsFq
	d23S6+OCTd3CxWwCNA+r8bxGo2TghmYs7fyd7up+EBNv4EO/PycS+xaiW+bFlRbJVwqR21lL+Bzmx
	S16nGbVVFc2rBZ7oorb9D42U7u624LNzkHwc76n1vpvztTml3R2kk/8lB3ss1WLBrTmKn6LRjfPnz
	LWp9zETzFjsUu+L6BCmVF1GSTjZg+D3i6MYfbVwtvQNcH7mVSYRClepOgXnkWYtJGsa4vNPywjNwO
	O65IXfCMlFvrkd01Hl+dsnyFdekc/OFxJ/4tfGZaxvrqUCFR6WYrGLbYCrWoXk3aPeB0NZYzbOmaX
	Cz040wGg==;
Received: from [::1] (port=36314 helo=pf-012.whm.fr-par.scw.cloud)
	by pf-012.whm.fr-par.scw.cloud with esmtpa (Exim 4.100.1)
	(envelope-from <jeremy.jean@oss.cyber.gouv.fr>)
	id 1xP5fB-0000000CzfS-19qV;
	Thu, 05 Nov 2026 23:10:26 +0100
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Post: <mailto:linux-csky@vger.kernel.org>
List-Help: <mailto:linux-csky+help@vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-csky+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 05 Nov 2026 23:10:26 +0100
From: =?UTF-8?Q?J=C3=A9r=C3=A9my_Jean?= <jeremy.jean@oss.cyber.gouv.fr>
To: Guo Ren <guoren@kernel.org>
Cc: linux-csky@vger.kernel.org
Subject: Re: [PATCH] csky: ptrace: reload syscall handler after trace entry
In-Reply-To: <CAJF2gTTRw6tD4dMSvLQwWnEyHNo5pUjxLa7iiDADZtRzTgoERQ@mail.gmail.com>
References: <20260921194036.4157985-2-Jeremy.Jean@oss.cyber.gouv.fr>
 <CAJF2gTTRw6tD4dMSvLQwWnEyHNo5pUjxLa7iiDADZtRzTgoERQ@mail.gmail.com>
User-Agent: Roundcube Webmail/1.6.20
Message-ID: <25e38ed23152466a816842cae33195e0@oss.cyber.gouv.fr>
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

On 2026-11-05 02:06, Guo Ren wrote:
> On Tue, Sep 22, 2026 at 3:43 AM Jérémy Jean
> <Jeremy.Jean@oss.cyber.gouv.fr> wrote:
>> 
>> csky_systemcall looks up the syscall handler before entering the 
>> traced
>> syscall path. Ptrace can then change the saved syscall number in 
>> pt_regs,
>> and seccomp examines that rewritten number in syscall_trace_enter(), 
>> but
>> the assembly still jumps through the stale pre-trace handler pointer.
>> 
>> If a tracer changes the saved number from denied syscall A to allowed
>> syscall B before seccomp runs, the seccomp check sees B in pt_regs and
>> permits it. The later jsr syscallid still calls A because syscallid
>> already contains A's function pointer.
>> 
>> Reload the post-trace saved syscall number, repeat the bounds and 
>> table
>> checks, and resolve the handler again before dispatch.
>> 
>> Fixes: e95a4f8cb985 ("csky: Add SECCOMP_FILTER supported")
>> Assisted-by: Codex:gpt-5
>> Signed-off-by: Jérémy Jean <Jeremy.Jean@oss.cyber.gouv.fr>
>> ---
>>  arch/csky/kernel/entry.S | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>> 
>> diff --git a/arch/csky/kernel/entry.S b/arch/csky/kernel/entry.S
>> index 3261f46f2244..193ee3eb832c 100644
>> --- a/arch/csky/kernel/entry.S
>> +++ b/arch/csky/kernel/entry.S
>> @@ -87,6 +87,23 @@ csky_syscall_trace:
>>         jbsr    syscall_trace_enter
>>         cmpnei  a0, 0
>>         bt      1f
>> +       /*
>> +        * Ptrace can change the saved syscall number before seccomp 
>> sees it.
> How does Ptrace modify the saved syscall number?

It can change the value using PTRACE_SETREGSET.
I'm not sure what you mean otherwise?

>> +        * Resolve the handler again so dispatch follows the number in 
>> pt_regs.
> Resolving the handler again smells like a duplicate; how do other 
> arches do it?
> 
>> +        */
>> +#if defined(__CSKYABIV2__)
>> +       ldw     syscallid, (sp, PT_REGS3)
>> +#else
>> +       ldw     syscallid, (sp, PT_REGS9)
>> +#endif
>> +       lrw     r9, __NR_syscalls
>> +       cmphs   syscallid, r9
>> +       bt      1f
>> +       lrw     r9, sys_call_table
>> +       ixw     r9, syscallid
>> +       ldw     syscallid, (r9)
> Em... Load handler from sys_call_table again...
> Could we prevent the previous load or prohibit ptrace here?

Indeed, it does not look so good.
Here is an attempt to move the lookup below the
_TIF_SYSCALL_WORK branch, which hopefully solves the problem.
That version still fixes the issue with my reproducer.
What do you think? I can send a v2 with this diff instead.


diff --git a/arch/csky/kernel/entry.S b/arch/csky/kernel/entry.S
index 3261f46f22442..8e79ceda9456a 100644
--- a/arch/csky/kernel/entry.S
+++ b/arch/csky/kernel/entry.S
@@ -56,12 +56,6 @@ ENTRY(csky_systemcall)
         cmphs   syscallid, r9           /* Check nr of syscall */
         bt      ret_from_exception

-       lrw     r9, sys_call_table
-       ixw     r9, syscallid
-       ldw     syscallid, (r9)
-       cmpnei  syscallid, 0
-       bf      ret_from_exception
-
         mov     r9, sp
         bmaski  r10, THREAD_SHIFT
         andn    r9, r10
@@ -70,6 +64,13 @@ ENTRY(csky_systemcall)
         and     r10, r9
         cmpnei  r10, 0
         bt      csky_syscall_trace
+
+       lrw     r9, sys_call_table
+       ixw     r9, syscallid
+       ldw     syscallid, (r9)
+       cmpnei  syscallid, 0
+       bf      ret_from_exception
+
  #if defined(__CSKYABIV2__)
         subi    sp, 8
         stw     r5, (sp, 0x4)
@@ -87,6 +88,19 @@ csky_syscall_trace:
         jbsr    syscall_trace_enter
         cmpnei  a0, 0
         bt      1f
+#if defined(__CSKYABIV2__)
+       ldw     syscallid, (sp, PT_REGS3)
+#else
+       ldw     syscallid, (sp, PT_REGS9)
+#endif
+       lrw     r9, __NR_syscalls
+       cmphs   syscallid, r9
+       bt      1f
+       lrw     r9, sys_call_table
+       ixw     r9, syscallid
+       ldw     syscallid, (r9)
+       cmpnei  syscallid, 0
+       bf      1f
         /* Prepare args before do system call */
         ldw     a0, (sp, LSAVE_A0)
         ldw     a1, (sp, LSAVE_A1)


Regards,
Jérémy
