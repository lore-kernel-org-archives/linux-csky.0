Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896369;
	b=2eYYgy7H1VM953Qn31hvw1TKWX9fRBwadcuxqgMXYDGTy5Hfc8Fa3+UysgYu6joO64Ak
	 xFz/sQX7BFOYi/CPDZbj8IyqJravQ5aQLAIok73Sdtyl1xqPG/tUjgqhq9KoGznPARlGX
	 iOtxTdO+52VsjGR4wPnHZ9Ik0bDFY08lnq9Sk/Tgv1pJMgCKJmRYPTEP8BZPiy9m+YxfS
	 lyqBpxBo+xqASTl3bz+UWB1KEEo2Cj1tqtCaliXexsy+XQSU+9ldqJIw6gft+NhviUUc5
	 AZqH4ym93y5DfI6nH/5x/FQMb2lWMSK9ZUso9jiK9pEcZh/ca6c9VRJJBEg+tQbT1/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896369;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ONaf0T7i5HmgMhqyqYNDKCC/0CiSVlL4yh8Lun4liAw=;
	b=E3qCYo6OmdjL/Bp2ZFEyInwb6Zn7Lr4385EIWzCMWEs5BeegzMKBCrMjnYJ9Oll6tAMK
	 Bwmp7s0i1AHvZyCKNV154Pu0W3eSoP7zmWFssXuCcmy6JNVsr936J73FbN8pbL7pFeJ+7
	 Jrbd9suIZ9LL1AUpyQ1Fvo4QyhQMV53i3UrRUZpXJrHpW4k5fJidrx9t3Wr4iyhTfk2+B
	 DmLL42OOxRJDj7SSGClKt6L1a3Jrtgxm22wqcwjx2qChPzSLM1j0qLjPS8YTAx5Dsmwfo
	 wz6pApCq0KhIwwjFftPp1OBXO/lURjrW4gF56vq3K9MO4MT1dzG8gpQFH/oRqYeTYyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IsJENWZm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A583A606D711;
	Thu,  5 Nov 2026 16:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IsJENWZm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC061F0093A;
	Thu,  5 Nov 2026 16:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896368;
	bh=ONaf0T7i5HmgMhqyqYNDKCC/0CiSVlL4yh8Lun4liAw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IsJENWZmDAfU3ucF95Tl6/ktNdvHoT/KTIcQFVH2RGKcQGpszTMzCeCmrBpoDI0OY
	 WIobr4HjZ+I5XlDUehjb8/6JaAXFCAPhsgGEAGdwHXQ9sX+0+LqPW0gzjcUbN2Ikn2
	 /ksQgq9vy8peGqR2vt5k1+ADVgOSz9MxnEO+XHPbHic8/h07QPhc4pRYpNGLnUOhCC
	 yCGrb6KQtFkTlPVhTZCTN2JnpjAsaGKezZwMRVNjSFUwT5GOaHUEqmV0HAGaYw6hvY
	 b5oqL8Ah1YKbcB9kAvD6+OndjiYtrhWDqVGQCGriBY/znTsPVWhcOXBzBvTSwXmHHw
	 RgsLoxTJh8dWA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-csky@vger.kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 37/47] clocksource/drivers/c-sky: Move CPUHP_AP_CSKY_TIMER_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:35 +0100
Message-ID: <20261105163045.38862-38-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105163045.38862-1-frederic@kernel.org>
References: <20261105163045.38862-1-frederic@kernel.org>
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

Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
all the teardown callbacks while stopping all CPUs in the system. This
doesn't mix-up well with running RT or isolated tasks.

In order to transition smoothly from global stop_machine to finer
grained synchronization between teardown callbacks and the other CPUs,
a new stop machine post function has been introduced to be executed
after the main one with IRQs still disabled while other CPUs can exit
stop_machine().

The teardown callback here simply performs IRQ disablement, which can
run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 01c343b4daea..44f425cc48d9 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_CLINT_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_CSKY_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_CLINT_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_CSKY_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

