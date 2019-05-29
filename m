Return-Path: <SRS0=K7zh=T5=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E68C04AB3
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 07:19:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E5A56216FD
	for <linux-csky@archiver.kernel.org>; Wed, 29 May 2019 07:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559114344;
	bh=HV+VMscjkm+MGrbWIGBWkxk1q7FL8JErjQNsyyY6GnM=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=cHWSUEcQQMFyFCdTq7sJ8IrBuHZeTXk2gvK5Vc4Onc99ETZpDqc3MYDrJQ5o4fD/M
	 xKSyhsU52xT7AuF0EvmF5Gvb1NOs7kCv9TDYbgq3RRBvJSlqv792d3LaWKiksulRGu
	 Hj+FzfXHnlVpUHJT5tPUEiwZtiSzugTOwjI4ogzU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbfE2HTD (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Wed, 29 May 2019 03:19:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:48922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726543AbfE2HTC (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Wed, 29 May 2019 03:19:02 -0400
Received: from localhost.localdomain (unknown [223.93.147.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E072F21019;
        Wed, 29 May 2019 07:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559114341;
        bh=HV+VMscjkm+MGrbWIGBWkxk1q7FL8JErjQNsyyY6GnM=;
        h=From:To:Cc:Subject:Date:From;
        b=gnE2EFYg9EosHqtiQB/SiTbpNModmFAjwITewhIInSFhZjUGXVgLsk7eNaWqPEyOK
         FwzuQWIPqU/rvzXLbXjDdYE9TDQxXbnhN3825iGpUNxVwgSwsnV+GG3TNJOzJZUx0a
         kT7JNBfyFR3M0CDH6IirxEs1Gv/tFaMrIkDWBbXE=
From:   guoren@kernel.org
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be
Cc:     linux-csky@vger.kernel.org, buildroot@buildroot.org,
        Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH V3 00/10] Update arch/csky for buildroot
Date:   Wed, 29 May 2019 15:18:38 +0800
Message-Id: <1559114328-23357-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

From: Guo Ren <ren_guo@c-sky.com>

This is the 3th patchset for arch/csky update for buildroot, it includes:

 - Support VDSP
 - Support new CPU ck860
 - Support toolchain build in buildroot
 - Add qemu defconfigs

Changes in V3:
 - Fixup the sequence logic of patches
 - Fixup binutils version select
 - Fixup gdb.mk
 - Fixup glibc.hash to seperate dir 

Changes in V2:
 - Seperate gcc gdb glibc gdb from one patch

Guo Ren (10):
  arch/csky: Use VDSP instead of DSP
  arch/csky: Add ck860 supported
  arch/csky: Add FLOAT_ABI compiler options
  arch/csky: Add ABI variable for toolchain build
  package/binutils: Add C-SKY support
  package/gcc: Add C-SKY support
  package/gdb: Add C-SKY support
  package/glibc: Add C-SKY support
  configs/qemu_cskyXXX_virt: new defconfig
  arch/csky: Enable csky toolchain build

 .gitlab-ci.yml                                     |   4 +
 arch/Config.in                                     |   1 -
 arch/Config.in.csky                                |  26 +-
 arch/arch.mk.csky                                  |  26 +
 board/qemu/csky/610_defconfig                      | 526 ++++++++++++++++++++
 board/qemu/csky/807_defconfig                      | 531 ++++++++++++++++++++
 board/qemu/csky/810_defconfig                      | 531 ++++++++++++++++++++
 board/qemu/csky/860_defconfig                      | 533 +++++++++++++++++++++
 configs/qemu_csky610_virt_defconfig                |  29 ++
 configs/qemu_csky807_virt_defconfig                |  30 ++
 configs/qemu_csky810_virt_defconfig                |  30 ++
 configs/qemu_csky860_virt_defconfig                |  30 ++
 package/Makefile.in                                |   9 +
 package/binutils/Config.in.host                    |  11 +-
 package/binutils/binutils.hash                     |   2 +
 package/binutils/binutils.mk                       |   7 +
 package/gcc/Config.in.host                         |  13 +
 package/gcc/gcc.hash                               |   2 +
 package/gcc/gcc.mk                                 |   3 +
 package/gdb/Config.in.host                         |   2 +
 package/gdb/gdb.hash                               |   2 +
 package/gdb/gdb.mk                                 |   6 +
 .../glibc.hash                                     |   2 +
 package/glibc/glibc.mk                             |   3 +
 toolchain/toolchain-buildroot/Config.in            |   2 +-
 25 files changed, 2343 insertions(+), 18 deletions(-)
 create mode 100644 arch/arch.mk.csky
 create mode 100644 board/qemu/csky/610_defconfig
 create mode 100644 board/qemu/csky/807_defconfig
 create mode 100644 board/qemu/csky/810_defconfig
 create mode 100644 board/qemu/csky/860_defconfig
 create mode 100644 configs/qemu_csky610_virt_defconfig
 create mode 100644 configs/qemu_csky807_virt_defconfig
 create mode 100644 configs/qemu_csky810_virt_defconfig
 create mode 100644 configs/qemu_csky860_virt_defconfig
 create mode 100644 package/glibc/7630ed2fa60caea98f500e4a7a51b88f9bf1e176/glibc.hash

-- 
2.7.4

