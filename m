Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2762FF67A
	for <linux-csky@vger.kernel.org>; Mon, 16 Feb 2026 10:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771237299; cv=none; b=Fjr+r9jH5siPqmy8xCTlTYUpu+HqILoMnJoRVa8Jf71bOQfTlE4q1Sgj45c1r1Z7Nz2nX/j3ksGXFt4+dfZcICtdxW0yWucqUczV6jJF2AIWg8FKCDP+r1dAf55+FGVm05oDud2+bJIOdCEyTIs3KdxYyND9LxO0zekFAGEJ0x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771237299; c=relaxed/simple;
	bh=hPe8h0DtfhJgwDhL/MTo/0nn7WzS24db3TtnQR4WYgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gyix51MovK890FuWJ5T3auJG2gW3my2lyLKFWD96HCkJxNPYtj0rwKtxJ472ylh7oXasFfY79NRolyF9JWP5OIrFx8vAZQ0jnG9l/kN4hrTioZe8KO7mbE/6bsbLr/CfpnLIcu5hb0iPgd47xh4JzJRHrSCuB9WnbMUdRNxaw5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5637886c92aso1196846e0c.0
        for <linux-csky@vger.kernel.org>; Mon, 16 Feb 2026 02:21:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771237297; x=1771842097;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9k16NacyBqRsPOeIOlYkH0Gj7wgknc1ckVejj7V1hU=;
        b=qGEdv9exdevPKaM/WrbZBKfq7iJHqn2OH+h4/NpFYPzIxLO6uIg8WmASYjEryLOwYb
         5z+XDj3DNzD0vIxcnkm/p1CfoSuu/Q/knOXlkwUnVuZ1+XG4fnHvUVc9iJtu/yB7PdD2
         r+yckSmWZcwlsE8Lyt6/JKYB9N08EigyJHzPybSbwPD2OwaUsup8E6QK7xqDSgaxVXmR
         Rxu3Y/HZVYc20+2elMzdtM3c3nHReCEwtKBkbWjmiR41bNRLIjThdQ6EJd7hpRvivj69
         h7sfZUF46LS6ldoO8xDyRsxHdvS1t9H1xYXfdHQ/rwKel3+5VTqy7nfs/eSAHTI/Dgs+
         NAWw==
X-Forwarded-Encrypted: i=1; AJvYcCV1Vjb4bNaj1AoEVfBrm+Zi/xd0vP3oTvKRcIGU2Z8FMs7NwW9Iv/KuaTCI/A+T5fZYAIMwFquXCSdy@vger.kernel.org
X-Gm-Message-State: AOJu0Yykb7RprKxE5wA6MS55VCcNuMW87NBIzj74zRjcZKXB4xPLuomf
	Bvix9TzEJHKAYoOfXdsOz7kUtNFMED91nalo3v5VFTCPp0IDeFw31AKC9d04EZ+y
X-Gm-Gg: AZuq6aLu5Y776HQWPl92o/AwdZYMWhQYUE1t7JmLxLHDM4pXsWkPsvz6EdE5Gj8c1ih
	pJJoE74Re3ysQqC/ZjRcs15hLHwXmgLo/RYVjBWu6OJ7qxEexdg3r//tDuCsYcJ1ooufn0MEjx6
	QTEWA2tK9XlGh8hfuE0acD9RVbyDN2GTcWXFn9DYa+GOe0mrn3ZdUHa4Kw0LWb/Ovl7ishYDtH/
	zKYmMZNx1Lp3doaBzweVihzOGXuhAsq5CWVC9lZGeokVXcBLWpmi/j6urwxxjHijX8LWORL8SE/
	mZpxxz2Rq1J+PKCOXwK52BjyrV7V5iSodFlMlLmwHLfPFc8DL2Ou32UjZXJ+qtjdmb/GeM+aFQP
	3Nst4BbymOtAT8Au4V/XqiLiUO4o6WrHs1R2E4EntRTu50M2X2lprKBYTxNOK7s2dWN9yMjrbFK
	zTeClOwiDRzqyuQ5VXfUfTjBzLBLEbGQ2DQkNeIhvEBVlxhj1CP+jCoFPUnjsTLwS+e9gklHM=
X-Received: by 2002:a05:6122:80b2:b0:566:341b:4dde with SMTP id 71dfb90a1353d-56889a04237mr2038644e0c.0.1771237297395;
        Mon, 16 Feb 2026 02:21:37 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5674bfc96b6sm7324793e0c.3.2026.02.16.02.21.36
        for <linux-csky@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 02:21:36 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-94ac7f22d23so675974241.3
        for <linux-csky@vger.kernel.org>; Mon, 16 Feb 2026 02:21:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXq0FgJ9rPROMnBS1qXPEY4QcWMri9cYVc/RiKcHXXBSy8e9lILhEOZljLPUaU7lQw8qxWtXh3Ux+SB@vger.kernel.org
X-Received: by 2002:a05:6102:4192:b0:5f5:35bd:6fb3 with SMTP id
 ada2fe7eead31-5fe2aceef00mr2011773137.5.1771237296107; Mon, 16 Feb 2026
 02:21:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214005825.3665084-1-sashal@kernel.org>
In-Reply-To: <20260214005825.3665084-1-sashal@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Feb 2026 11:21:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVeGv=f-Oo1=GQLghn_hwpe2YN5OS79fQsy2uccwyVUZg@mail.gmail.com>
X-Gm-Features: AaiRm50N-jUB71MK4eHWfadpGLVlD7JkxipNiaF9cDCx3KnVx3LWPVTtpfkjLnY
Message-ID: <CAMuHMdVeGv=f-Oo1=GQLghn_hwpe2YN5OS79fQsy2uccwyVUZg@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.19-5.10] parisc: Prevent interrupts during reboot
To: Sasha Levin <sashal@kernel.org>
Cc: patches@lists.linux.dev, stable@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, guoren@kernel.org, neil.armstrong@linaro.org, 
	brauner@kernel.org, yelangyan@huaqin.corp-partner.google.com, 
	schuster.simon@siemens-energy.com, linux-csky@vger.kernel.org, 
	Parisc List <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Sasha

Cc linux-parisc

How did you (or the LLM?) came up with that CC list?!?

On Sat, 14 Feb 2026 at 01:58, Sasha Levin <sashal@kernel.org> wrote:
>
> From: Helge Deller <deller@gmx.de>
>
> [ Upstream commit 35ac5a728c878594f2ea6c43b57652a16be3c968 ]
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>
> LLM Generated explanations, may be completely bogus:
>
> Now I have all the information I need for a thorough analysis. Here is
> my complete assessment:
>
> ---
>
> ## Detailed Analysis: "parisc: Prevent interrupts during reboot"
>
> ### 1. COMMIT MESSAGE ANALYSIS
>
> The commit message is minimal: "parisc: Prevent interrupts during
> reboot". It clearly states the problem it's fixing -- interrupts are not
> properly disabled during the reboot path on PA-RISC systems. The author
> is **Helge Deller**, the long-time parisc maintainer and the most
> authoritative developer for this architecture. The commit has no
> `Fixes:` tag or `Cc: stable` (as expected for autosel candidates).
>
> ### 2. CODE CHANGE ANALYSIS
>
> The change is **one single effective line of code** plus a comment:
>
> ```c
> /* prevent interrupts during reboot */
> set_eiem(0);
> ```
>
> This is inserted into `machine_restart()` in
> `arch/parisc/kernel/process.c` immediately after
> `pdc_chassis_send_status(PDC_CHASSIS_DIRECT_SHUTDOWN)` and before
> `pdc_do_reset()`.
>
> **What `set_eiem(0)` does:** On PA-RISC, the EIEM (External Interrupt
> Enable Mask, Control Register 15) controls which external interrupts can
> fire. Setting it to 0 **masks all external interrupts at the hardware
> level**, preventing any interrupt from being delivered to the CPU. This
> is defined as:
>
> ```82:82:arch/parisc/include/asm/special_insns.h
> #define set_eiem(val)   mtctl(val, CR_EIEM)
> ```
>
> **The bug:** Without this line, external interrupts remain enabled
> during the entire reboot sequence. This means:
>
> a) **Deadlock risk in `pdc_do_reset()`**: The `pdc_do_reset()` function
> acquires `pdc_lock` via `spin_lock_irqsave()`:
>
> ```1236:1246:arch/parisc/kernel/firmware.c
> int pdc_do_reset(void)
> {
>         int retval;
>         unsigned long flags;
>
>         spin_lock_irqsave(&pdc_lock, flags);
>         retval = mem_pdc_call(PDC_BROADCAST_RESET, PDC_DO_RESET);
>         spin_unlock_irqrestore(&pdc_lock, flags);
>
>         return retval;
> }
> ```
>
> While `spin_lock_irqsave` disables local interrupts, the PA-RISC EIEM
> hardware mask is a separate mechanism. On PA-RISC, the external
> interrupt delivery path goes through the EIEM -- an interrupt fires only
> if the corresponding EIEM bit is set AND the EIRR (External Interrupt
> Request Register) bit is set. If a hardware interrupt fires between
> `pdc_chassis_send_status()` (which also uses `pdc_lock`) and
> `pdc_do_reset()`, or during the firmware calls themselves, it could
> interfere with the reset process.
>
> b) **Interference with firmware reset**: `pdc_do_reset()` calls into PDC
> firmware (`mem_pdc_call(PDC_BROADCAST_RESET, PDC_DO_RESET)`). Firmware
> calls on PA-RISC are sensitive to the processor state. An interrupt
> arriving during or between firmware calls can corrupt the reset
> sequence, potentially causing the machine to **hang instead of
> rebooting**.
>
> c) **The `gsc_writel(CMD_RESET, COMMAND_GLOBAL)` fallback**: If
> `pdc_do_reset()` returns (on machines that don't implement
> `PDC_BROADCAST_RESET`), the code tries a hardware reset via
> `gsc_writel`. Interrupts during this path are equally problematic.
>
> ### 3. ESTABLISHED PATTERN IN PARISC AND OTHER ARCHITECTURES
>
> **PA-RISC internal precedent:**
> - `parisc_terminate()` in `traps.c` uses the exact same pattern:
>   `set_eiem(0)` followed by `local_irq_disable()` before critical
>   shutdown operations (line 428-429)
> - The SMP CPU hotplug code (`smp.c:481`) uses `set_eiem(0)` to disable
>   all external interrupts when taking a CPU offline
>
> **Other architectures ALL disable interrupts before reset:**
> - ARM: `local_irq_disable()` at line 136 of `arch/arm/kernel/reboot.c`
> - ARM64: `local_irq_disable()` at line 141 of
>   `arch/arm64/kernel/process.c`
> - x86: `local_irq_disable()` at line 100 of `arch/x86/kernel/reboot.c`
> - xtensa: `local_irq_disable()` at line 524 of
>   `arch/xtensa/kernel/setup.c`
> - nios2: `local_irq_disable()` at line 49 of
>   `arch/nios2/kernel/process.c`
> - csky: `local_irq_disable()` at line 25 of `arch/csky/kernel/power.c`
> - MIPS falcon: `local_irq_disable()` at line 37 of
>   `arch/mips/lantiq/falcon/reset.c`
>
> PA-RISC was the **outlier** in not disabling interrupts before reboot.
> This commit fixes that deficiency.
>
> ### 4. CLASSIFICATION
>
> This is a **bug fix** -- specifically fixing a potential hang/crash
> during reboot caused by unmasked interrupts during firmware calls. It is
> NOT a new feature, optimization, or cleanup.
>
> ### 5. SCOPE AND RISK ASSESSMENT
>
> - **Lines changed**: 3 (1 blank line, 1 comment, 1 functional line)
> - **Files touched**: 1 (`arch/parisc/kernel/process.c`)
> - **Subsystem**: parisc architecture, reboot path
> - **Risk**: **Extremely low**. Disabling interrupts before a system
>   reset is universally accepted as correct and necessary. The
>   `set_eiem(0)` pattern is already used in the same codebase for similar
>   critical paths.
>
> ### 6. USER IMPACT
>
> - **Who is affected**: All PA-RISC Linux users who reboot their machines
> - **What happens without the fix**: Potential hang during reboot,
>   requiring a hard power cycle. This could be intermittent and timing-
>   dependent, making it hard to reproduce but very real.
> - **Severity if triggered**: System hang requiring manual intervention
>   (power cycle)
>
> ### 7. STABILITY INDICATORS
>
> - Author is the subsystem maintainer (highest trust level)
> - Pattern is well-established across all other architectures
> - The exact same `set_eiem(0)` call is used in the parisc
>   `parisc_terminate()` function already
> - The change is trivially small and obviously correct
>
> ### 8. DEPENDENCY CHECK
>
> - No dependencies on other commits
> - The `set_eiem()` macro has existed since the earliest parisc code
> - The `machine_restart()` function is largely unchanged across all
>   stable trees
> - This will apply cleanly to any kernel version that has parisc support
>
> ### Summary
>
> This is a trivially small, obviously correct fix that prevents
> interrupts during the reboot sequence on PA-RISC systems. Without it, an
> untimely interrupt can interfere with PDC firmware calls during reset,
> potentially causing the machine to hang instead of rebooting. Every
> other Linux architecture disables interrupts before reboot; parisc was
> the outlier. The fix uses the same `set_eiem(0)` pattern already used in
> `parisc_terminate()` and SMP CPU offline code. The risk is essentially
> zero -- there is no conceivable way that disabling interrupts right
> before a hardware reset could cause a regression.
>
> **YES**
>
>  arch/parisc/kernel/process.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
> index e64ab5d2a40d6..703644e5bfc4a 100644
> --- a/arch/parisc/kernel/process.c
> +++ b/arch/parisc/kernel/process.c
> @@ -85,6 +85,9 @@ void machine_restart(char *cmd)
>  #endif
>         /* set up a new led state on systems shipped with a LED State panel */
>         pdc_chassis_send_status(PDC_CHASSIS_DIRECT_SHUTDOWN);
> +
> +       /* prevent interrupts during reboot */
> +       set_eiem(0);
>
>         /* "Normal" system reset */
>         pdc_do_reset();
> --
> 2.51.0
>
