Return-Path: <linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98826C433F5
	for <linux-csky@archiver.kernel.org>; Fri, 30 Sep 2022 16:26:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232029AbiI3Q0H (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Fri, 30 Sep 2022 12:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232126AbiI3Q0C (ORCPT
        <rfc822;linux-csky@vger.kernel.org>); Fri, 30 Sep 2022 12:26:02 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D94E7FEE57;
        Fri, 30 Sep 2022 09:26:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4B5BDB82961;
        Fri, 30 Sep 2022 16:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 733BEC433D6;
        Fri, 30 Sep 2022 16:25:55 +0000 (UTC)
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     rostedt@goodmis.org, mhiramat@kernel.org, paul.walmsley@sifive.com,
        aou@eecs.berkeley.edu, maz@kernel.org, alexandru.elisei@arm.com,
        will@kernel.org, Liao Chang <liaochang1@huawei.com>,
        palmer@dabbelt.com, guoren@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-csky@vger.kernel.org
Subject: Re: (subset) [PATCH V4 0/3] kprobe: Optimize the performance of patching ss
Date:   Fri, 30 Sep 2022 17:25:53 +0100
Message-Id: <166455513411.3737568.2438972272060446845.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220927022435.129965-1-liaochang1@huawei.com>
References: <20220927022435.129965-1-liaochang1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

On Tue, 27 Sep 2022 10:24:32 +0800, Liao Chang wrote:
> Single-step slot would not be used until kprobe is enabled, that means
> no race condition occurs on it under SMP, hence it is safe to pacth ss
> slot without stopping machine.
> 
> v4:
> 1. Add Acked-by from Will Deacon
> 2. Mark Rutland provides some subtleties on arm64 micro-architecture
>    that needs to follow.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[3/3] arm64/kprobe: Optimize the performance of patching single-step slot
      https://git.kernel.org/arm64/c/a0caebbd0460

-- 
Catalin

