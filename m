Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645495;
	b=M74ujQeMNErk7SeUBM97bIhDaaLetVM3wdpp3HvlnhvqJ1kDrM8RyaDJVLWbhYu8Ggkt
	 jdEhhODvrnfg/0Ah1SUxJGNmPO/VURgsZ0IHOskP9a0/CR5eQPo6n+es+ZdgInu790htH
	 iIpabZdI7CObmGuSnmv6yAj1YDgVWTMZ1h9PV4saL9M5OK6w82uOPBoUu6TxqYO3YORqC
	 wwtqh75yaocHBwGw7dO/2VWoxvKHsWGh2aXEzdFwabY38gEdhPwz3KOYYzIbQGYp7fqAE
	 Wj26kHa1ASvfrhi9HnHq2ia4DRio1stjYFn17YXTkR4Vyic8FWv3VCQpIHrbNfuAsUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645495;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=rvMa1YhJ00DjgdS0oJ0wXlNb/+Yb9rCLFzL001pmo1E=;
	b=YUxU0XW/2GGBBz6SVRiZkphpNL7tXC+Phf/MsLsiXYnY6iy9EKEwwjByADM0uZQM3UWP
	 suZ9joH3m/UUmS3Rmwe4ZRdIdDvDMoiM9NFpntG9fxmVkEjfsEDVpMq8EYVQj05crVM1+
	 a/QmYbgBaJ9C+vsygOOSEgdtvO62Zk/gXeaW4Lhn9fK61+Ea1aCL6g7iVhgCr7i2CWYoY
	 S7xdWWQoxaNcagA8t/UJTpLbyVyZAV7Mr4lcrJYMfZARJDhebv4RzU1gai2SdjKHAgQ/0
	 fUfso5l3ntZxlRspNRkCNvJCOrfb7kSOIb8tJ4TruudHG1jPyXGLODtAXZfvAlxhZyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jHuSIstE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407CB606A321;
	Wed, 25 Nov 2026 22:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jHuSIstE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B13C1F000D2;
	Wed, 25 Nov 2026 22:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645495;
	bh=rvMa1YhJ00DjgdS0oJ0wXlNb/+Yb9rCLFzL001pmo1E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jHuSIstEHiW4vFTZ0weq2bYI7nCR2bASW67uwKEMJIK9BAP2PEcOU+sdD7hUSNnVN
	 eyVfeG+Omt/K86Ig2GejgNsPNZpetKUbaAf6W/mCSCtPni18jSVPPufeVHVMLboVwI
	 SL03bbII4p7BBTlHbH2J9SPATRQ3FyZOyxCDk+KNeHml7ckw5HMgw0kZ17MReMRb0Q
	 8hjVhBisSNZWgqSV48eoIS1iGk19bEqsO+8vYskw+bwqb6bYIVFzxlI6w61+leZ5Es
	 2OzqrruyXVtGIU92GZ08R0hyFa4N8mRMPe9ZUdNDs+gyxoMXNK7cGetSTsfEIcjHO1
	 +BDdKDuPGryYw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-csky@vger.kernel.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 37/47] clocksource/drivers/c-sky: Move CPUHP_AP_CSKY_TIMER_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:20 +0100
Message-ID: <20261125222230.22508-38-frederic@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125222230.22508-1-frederic@kernel.org>
References: <20261125222230.22508-1-frederic@kernel.org>
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
all the teardown callbacks while temporarily stopping/pausing all CPUs
in the system. This doesn't mix well with running RT or isolated tasks.

In order to transition smoothly from global stop_machine to finer
grained synchronization between teardown callbacks and the other CPUs,
a new stop machine post function has been introduced to be executed
after the main one with IRQs still disabled while other CPUs can exit
stop_machine().

The teardown callback here simply performs IRQ disablement, which can
run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
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
2.56.1

