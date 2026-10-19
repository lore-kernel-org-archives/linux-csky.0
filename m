Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02E3503BEE;
	Mon, 19 Oct 2026 13:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415450; cv=none; b=F1bFVUp80mJdknzxn8R2YYjsQ66itqYkOALONsZocuPjs5uOdY0VxMw51ibf+cbCmKIC58SDEUdmleLJMcVnbrWoHHJaH4Bzk+kR1GD0JEKLwJAf1v3WwmKtExwAUAf7SP7pFNOqkzh2mK5GUR9Awg9hYBMj0Cu8GiGwDRfnHNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415450; c=relaxed/simple;
	bh=BUeV9y2XTMPcQa7SJlXbP+Up7KV2XrGndbM5xGGNs0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=insJX3fBYPk+cFndeGPNLzYZEcNMhJq4fS8hmQ4a0RL8iB44tUAkn1VgVkW9UJqIrpaz9NTwyXVdxnwehhAUaBukIwdZdDaFI3ZRM6PEQzg6Ndx10LN5kpU2oQr9nO9qlXLcHufGE8WYKf9d7HFvwZMI0Vuy14R553bVshH12DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MXSkrHfB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MXSkrHfB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 890D91F000C6;
	Mon, 19 Oct 2026 13:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415448;
	bh=zVLcEQfjrqS1qw+E4VSWWFV3QIqoTQsCJosZL8UoT2M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MXSkrHfBIR4AqvLi5L96BK5cjQYDP6ThZjCslDwGXnJLloLhtVkk94xphW7b875HM
	 cxY5CZG0aBhvdl1T8WpN44MMpG0fLGPmWkhefB0PWmx5FExKxo2a1NRm6etBkgj/xC
	 SCrwXRxsDraJGEoAlkfkW0PjgDhp2jp6d2lJaMvkHYZrztQRZgcyoS4UC1qJtP6Z3G
	 MYjmkoRRlVyYdPR3bs+VfYnw4RD1AO2khLWmK3FUdbo7vkly3r1XdhsjJKgJRxPYK1
	 38jKq58w5VegMOX42gF+x6FHDis7kTX7F2ETl0tXIQunUhchjfz4dLF2mU/Ww0OqdF
	 KK/ngHZSSOfKg==
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
	linux-csky@vger.kernel.org
Subject: [RFC PATCH 37/49] clocksource/drivers/c-sky: Move CPUHP_AP_CSKY_TIMER_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:44 +0200
Message-ID: <20261019130856.49711-38-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019130856.49711-1-frederic@kernel.org>
References: <20261019130856.49711-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
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
index 9735d6cd01d8..f8c8fbbd0628 100644
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

