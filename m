Received: from oss.cyber.gouv.fr (oss.cyber.gouv.fr [51.159.188.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B3D3B0585
	for <linux-csky@vger.kernel.org>; Mon, 21 Sep 2026 19:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.188.251
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790019787; cv=none; b=uuQmb84aMHovHDw77UzZpP6SmK9zAKY6EGBlmpWJ8R6iYgJgmBdCQcSzSpRgnU18o0ITDXoMMrnAjQWyOQ+qXhRgm6rHfLl3/56Vs6Cf0M01zK88S9UfK+F6bI6KyBixV/JLPcYQJeX3D46Gd4nITa+8SolI2dOUkIjO27rvEVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790019787; c=relaxed/simple;
	bh=HsMI2o6+DKtxuDA7Lot9V9LPqBv2gn31HvnECZVYj+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bTfnZQfXHCOHpHddlwck3d/KMJfU14Bkq3RAji1si3MdouM4yazHyzl/agpWmzsIQKS80EzQChHqvo5gdol5e2DHTPFE7XFlipB+PqZ1ooGJO5p0IWRdmucoWbd4Qsmp4Pi/PtnTAVvBZTMAQn8IMsA7R6noCE1EFJFAscAocOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr; spf=pass smtp.mailfrom=oss.cyber.gouv.fr; dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b=N02iDGrV; arc=none smtp.client-ip=51.159.188.251
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b="N02iDGrV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oss.cyber.gouv.fr; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Sender:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=0sj4UyCxT6hFQdS4n1pxRlhdoOK2D3eONfpodUp5/AU=; b=N02iDGrVldBj/Wg/VxlgNuiDIE
	87fi3DMxMLO6Fv/ScTo2SUaLB0HjjywLxWBmYE9fjrzaYFkMtgCtD2rflaypupI5H6VufJNKRuxOQ
	8jvPLeozpuuC0nwRx7o8yug//2EBVNw7BigdBICaTW+OabwGBt2xyn0OSYNtLeR9LoLLkVqJF81mG
	HpWvjuqHSxyt4urMdYGDYrOjjUGYG2+WYHWNj6CYg4996EBTXe9e5y4qITntHXFwgrFBpaHLruKE6
	BwyDCAUsHIxd0XkidtQLKTNOrRIVXbMMVXw1RDWIiZeluc8wNkDNbIJONseUjBndiqzhildRUdAoO
	JJJJGLjw==;
Received: from [151.115.150.205] (port=55698 helo=gepetto..)
	by pf-012.whm.fr-par.scw.cloud with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100)
	(envelope-from <Jeremy.Jean@oss.cyber.gouv.fr>)
	id 1x8juk-00000002Kdp-0Vet;
	Mon, 21 Sep 2026 21:42:58 +0200
From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Jean?= <Jeremy.Jean@oss.cyber.gouv.fr>
To: guoren@kernel.org
Cc: linux-csky@vger.kernel.org,
	=?UTF-8?q?J=C3=A9r=C3=A9my=20Jean?= <Jeremy.Jean@oss.cyber.gouv.fr>
Subject: [PATCH] csky: ptrace: reload syscall handler after trace entry
Date: Mon, 21 Sep 2026 19:40:37 +0000
Message-ID: <20260921194036.4157985-2-Jeremy.Jean@oss.cyber.gouv.fr>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

csky_systemcall looks up the syscall handler before entering the traced
syscall path. Ptrace can then change the saved syscall number in pt_regs,
and seccomp examines that rewritten number in syscall_trace_enter(), but
the assembly still jumps through the stale pre-trace handler pointer.

If a tracer changes the saved number from denied syscall A to allowed
syscall B before seccomp runs, the seccomp check sees B in pt_regs and
permits it. The later jsr syscallid still calls A because syscallid
already contains A's function pointer.

Reload the post-trace saved syscall number, repeat the bounds and table
checks, and resolve the handler again before dispatch.

Fixes: e95a4f8cb985 ("csky: Add SECCOMP_FILTER supported")
Assisted-by: Codex:gpt-5
Signed-off-by: Jérémy Jean <Jeremy.Jean@oss.cyber.gouv.fr>
---
 arch/csky/kernel/entry.S | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/csky/kernel/entry.S b/arch/csky/kernel/entry.S
index 3261f46f2244..193ee3eb832c 100644
--- a/arch/csky/kernel/entry.S
+++ b/arch/csky/kernel/entry.S
@@ -87,6 +87,23 @@ csky_syscall_trace:
 	jbsr	syscall_trace_enter
 	cmpnei	a0, 0
 	bt	1f
+	/*
+	 * Ptrace can change the saved syscall number before seccomp sees it.
+	 * Resolve the handler again so dispatch follows the number in pt_regs.
+	 */
+#if defined(__CSKYABIV2__)
+	ldw	syscallid, (sp, PT_REGS3)
+#else
+	ldw	syscallid, (sp, PT_REGS9)
+#endif
+	lrw	r9, __NR_syscalls
+	cmphs	syscallid, r9
+	bt	1f
+	lrw	r9, sys_call_table
+	ixw	r9, syscallid
+	ldw	syscallid, (r9)
+	cmpnei	syscallid, 0
+	bf	1f
 	/* Prepare args before do system call */
 	ldw	a0, (sp, LSAVE_A0)
 	ldw	a1, (sp, LSAVE_A1)
-- 
2.47.3

