Return-Path: <SRS0=wqK1=T7=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95299C04AB6
	for <linux-csky@archiver.kernel.org>; Fri, 31 May 2019 06:39:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 645A92649F
	for <linux-csky@archiver.kernel.org>; Fri, 31 May 2019 06:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559284790;
	bh=zsMw7cH+P10zCRimjfy4hUeez5j+H7t/bhr/zm4UPvo=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=wW91dQpkkIPH6SnWf894HhG134Kblm7udM0g70lO+Broh8S5BQQ0urZcfoB++nYHe
	 Rd6J1k9pmwmANdkqXl1b4XgDIaUUjGWJbuUelKeJaa5/u4CIqEsce02v2zhxdwCrfA
	 eVePBjO8ng2KOkScDkRfohEl1nXFm676IDP8U84g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbfEaGjt (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Fri, 31 May 2019 02:39:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:47690 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726386AbfEaGjt (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Fri, 31 May 2019 02:39:49 -0400
Received: from localhost.localdomain (unknown [223.93.147.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9DDB02649E;
        Fri, 31 May 2019 06:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559284788;
        bh=zsMw7cH+P10zCRimjfy4hUeez5j+H7t/bhr/zm4UPvo=;
        h=From:To:Cc:Subject:Date:From;
        b=Kyrt5UZVxnoVFxSzMJuTCJ+RerAez/sLIkOotQwN1y+kobjdoK7vZHQot1vKVmzGr
         5ACG3W5KdEVDHgD02MFsaJhBXxPkh/0xvR0GtAnJXGMHEOClPnGpN5KXCE1B3XOi5E
         XsTNhDaumQ/PdCFPKXHOt7iJoIeovXFbRySX0Lhk=
From:   guoren@kernel.org
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
        arnout@mind.be
Cc:     linux-csky@vger.kernel.org, buildroot@buildroot.org,
        Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH V4 00/11] Update arch/csky for buildroot
Date:   Fri, 31 May 2019 14:38:57 +0800
Message-Id: <1559284748-32011-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

From: Guo Ren <ren_guo@c-sky.com>

This is the 4th patchset for arch/csky update for buildroot, it
includes:

 - Add arch.mk.csky for -mcpu=xxx
 - Use VDSP instead of DSP
 - Support new CPU ck860
 - Support toolchain build in buildroot
 - Add qemu defconfigs

Changes in V4:
 - Seperate add arch.mk.csky to a patch
 - Seperate change DSP to VDSP to a patch
 - Seperate add ck860 to a patch
 - Update FLOAT_ABI commit msg 

Changes in V3:
 - Fixup the sequence logic of patches
 - Fixup binutils version select
 - Fixup gdb.mk
 - Fixup glibc.hash to seperate dir 

Changes in V2:
 - Seperate gcc gdb glibc gdb from one patch

Guo Ren (11):
  arch/csky: Add arch.mk.csky for -mcpu=xxx
  arch/csky: Change DSP to VDSP for -mcpu
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

