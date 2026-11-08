Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794166286;
	b=BqmThut+IgtfgRVtqZd0jeaZknyKus14MUS4U6/E6SI0avAFOt6RLbXZ0PKbb6azHji+
	 HDVpDO9Lfpuk9n1k7oVYZWZYW9yNwxvTBZCEs13Yno9vG97nCnvuviRluNTp+zTDtxJN+
	 VwQY+LLwkkbyOItgz/nSWKKRKH6xOOqbW++kuyb1XJs0/jz8FPNcE+fD8ITjUixUhXnvd
	 BEPZKmqmf7MvV1/G5JeXM6WN3Jzrar1QyfP6CT2fPoNkI855AFnsOUJrhW+UrvppMehD1
	 IWZ1MRf3hwpcpi8q9efiUP9HF33X8KECmfMpdX33ajIjAoZnXo+qy8rxa6vQbtq0RmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794166286;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=OykuHwhmxKBkSPG8K/fZRtwRGhFXnwfbd+h1hJ6VrBk=;
	b=y7xMdvIWyX0hlleV85GpAWlivHa2SimkrPic6yP9J+irMBg7zAtAPNqDRGiUijy8T2Qg
	 MU+dw3GDrisygNCSV9wm1gz08AkHznmW3h+0APnrbbIWKbeB3JhqOxQXhrUfrzC3DRDuy
	 t3JuB3APLs6krsJyEPGJbCfex7HirXZsz5EfO8w3C0rm8cz3NXRNpu2PadV2LWdxZ/8Hy
	 5er/UOaM6rRFLVPMLsRtHKdMOmQ2hgKXj1u9/r+ritj6pvROrGZvMvQnOxba59i9xhHUi
	 R6Aze2zLqgA09o+BBpdTnCW/f8rcofSH9RAGXrM+aR6Ls0nK2skIi/cqeOrgxbTr0fQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=qvVh1yYu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.37
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010037.outbound.protection.outlook.com [52.101.46.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38E3606A31C
	for <linux-csky@vger.kernel.org>; Sun,  8 Nov 2026 19:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B38E3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=qvVh1yYu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZcpQ5+2xh8woW2kmg/bmXI8th+DOHVCgOtgtnpIqBAbtzUc3kGagw2s2ywUMtvJH8gp1EP+mkhS1BY8mzgHbLfNSJiauep44ov0+QpwTJbhhizbTz+vrA5crAX40ZuB2xv3vwyKTQOXjvWgv4LOmHhQ1DzEluSDPAF3Yt834Cpel56K6uKel38bQdRcv6jZY4inL9VkjCHuoL/1Fkua9tyqiuBwuDFu8wzD7vCnhwuDVA8Q4QPoVG/kLCRrwmW8qbIREZdRfAGh4l4Ch2zBhfA93TtSV1336rNIJ8GIqar0/MtUNEsZUSiLVUoKurvagaaWZJ78pFQetWH/czEwUWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OykuHwhmxKBkSPG8K/fZRtwRGhFXnwfbd+h1hJ6VrBk=;
 b=R3gkr82hPSsSsqPsD6hCVSBBuXiUsxKXELSJ5nOeBt2OQSSSYcv//FvX1yg7wZA7lmLBBY5iKUt1SAloBhzBviA1r7qIGcLL8mNSSa54XqGo1RlM3qN26d48QSfaTXsLSUKtqnTjdlCmRIprwT3r0XJt+U9cLxxO/xlrOAFuCjTHipcrZPJy3VXKxOxLBWx6xAlckjzpwIbsVQaU7Ewgda1RCATTgzJgeEjO9b/W6pVbHBCN+gWQaYJcpulFActOupPA3pEH59ZllenilSQ/vbdM8bkVjhe80ZO4s5Zqf3L5cd66yTldFLVMRs3JMIKV9rNIQMXRXwBVZSHvc4rMkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OykuHwhmxKBkSPG8K/fZRtwRGhFXnwfbd+h1hJ6VrBk=;
 b=qvVh1yYuhHRPJx9xW3+QF/6TS9b79rpfIAUjmY22cGPYY3W/2qQtmWOv7ogS88gNYuyYDSZZndd3TgjUV//BBNFmFOZyGPtI8MkwVi6b7CQYQTsQhMx8gXo3fj318dJVSsX1ibnO0dMUWJCrWr26CWpnvulzwi/1DvNTbLNovPA=
Received: from PH3PEPF000040A1.namprd05.prod.outlook.com (2603:10b6:518:1::52)
 by DS5PR12MB238689.namprd12.prod.outlook.com (2603:10b6:8:47e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Sun, 8 Nov
 2026 19:31:23 +0000
Received: from PH3PEPF00059618.namprd05.prod.outlook.com
 (2a01:111:f403:c95d::1) by PH3PEPF000040A1.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.7 via Frontend Transport; Sun, 8
 Nov 2026 19:31:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH3PEPF00059618.mail.protection.outlook.com (10.167.243.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sun, 8 Nov 2026 19:31:22 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 8 Nov
 2026 13:31:22 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 8 Nov
 2026 13:31:22 -0600
Received: from amd-B550M-DS3H.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sun, 8 Nov 2026 13:31:19 -0600
From: Syed Saba Kareem <syed.sabakareem@amd.com>
To: <broonie@kernel.org>
CC: <Sunil-kumar.Dommati@amd.com>, <vijendar.mukunda@amd.com>,
	<Mario.Limonciello@amd.com>, <venkataprasad.potturu@amd.com>, "Syed Saba
 Kareem" <Syed.SabaKareem@amd.com>, Guo Ren <guoren@kernel.org>, "open
 list:C-SKY ARCHITECTURE:Keyword:csky" <linux-csky@vger.kernel.org>
Subject: [PATCH v3 0/6] ASoC: amd: acp: ACP7.F SoundWire configs and SOF function topology support
Date: Mon, 9 Nov 2026 01:00:28 +0530
Message-ID: <20261108193119.2308421-1-syed.sabakareem@amd.com>
X-Mailer: git-send-email 2.43.0
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
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PEPF00059618:EE_|DS5PR12MB238689:EE_
X-MS-Office365-Filtering-Correlation-Id: cb4c876f-0383-49bd-ff7a-08df3dcedf38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|11063799006|56012099006|261021123027099003|261021121427099003|261022075727099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|261102123227099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	NYFmW3BWcnb7NMol1v6mnFRQvcJ5hfneaxRIS/s+IL0RYf1k2ZIfD5Cv3qMO1GZXbEIf3CTyWb4zFzJvWFxDHO5aOqWX39qMtH9IwOltyitxTr9+eNA4J84TmtGsxVT7CJgjDRjgAelp7nv1M70Yflcn8Q0E/s17YjDGrMcC+/bqXuissU+zoDoD3yaf7pDk6FOZ10llcOGtMFzS01gOuRnOzu5qe0jvsVUc99yOFz7DUs7iukR0poRoNcz/FQh1anR2dsRp569fcgCIf/7ng8GhOzchkYvQRiu3x6355NCt+4MffCEIHKZb3SkWPsC7tZoOp+hPhZksSyn4ATLYTp7Qd2/8/fW9WzJ3YbNWjf/nmaBXinEDnu0WZgtDu6S160hw8iGJNWsUPDM0Rievpt8nSVouj5PHcn1VNtUFn02re3r0jI4XgDaBK3d7oEWNzXB+w8PmIltOkhzCOTkx4Y9K9yAwchNAyCvW489hZuBa077UhNbEi5Bg5OpiSlzktdbolxZDNVZ1liwr4NjeTskG7kNu2kFhVYuMartPIdc5KxFsI9909Q94iGmnhE0FSjecCJEYAeB+31s/UFEecxjqdkM7J+wDQavQhNs1duoovz4opEpHRIZ+ipAopPXnJbwRtR42tzQvGxpxd7EpkJLcMMhXCpNiecAThkInsrD1aVe/4fsDSnvukP2Pqw7+ErSdVw+TdlauVMHVc1OWaw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	P3oqNoqvfl6XNe1AGgzqYuFxqMAKEBk3SRUsJfAgfFDjHVC7et9vuYlem3zasgzyaEfS5WjqQg/rrqq/siv1PbHd0R5KU9FeOQyE0j94DrUtpQ8ABAp74zyA1sp8rrBvQa3guDxB6ymLooMxR8oFQAsez38rKzwp1/OndTAGc4n05RgYsx3PdsDKpmSOxQkB6hmKu7vHdecwDIRXiigmhduO6JjYnIVcj/2msG2NHf2AFLKBjGW9/rgF4+PrYE1MHx6I7Odvl1USI4qX4UJ/sTMfcqZujGDw8EreinT4sH8C1EVMATkJSZ75c8KGZhLnlsTSByR0KosKb0VFv2zjN6xD9uglbw0CIDLFGphPCwApVNzw7tsbPX+Fzo9Tn8Pq4uW4Cmc/p7icaEsWbpW8TNqtVdcSY0rrQhedIKOtqMDMFELkCmD4WUagQ8O/T9oY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2026 19:31:22.6792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb4c876f-0383-49bd-ff7a-08df3dcedf38
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH3PEPF00059618.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PR12MB238689

From: Syed Saba Kareem <Syed.SabaKareem@amd.com>

This series adds the Cirrus SoundWire machine configurations for ACP7.F
and reworks the SOF function-topology handling so it can be shared
between the Intel and AMD ACP drivers.

Patches 1-2 add the ACP7.F Cirrus SoundWire machine descriptors
(endpoint, adr_device and link_adr tables and the machine entries) and
the Dell speaker-amp DMI quirks.

Patches 3-6 move the common SOF function-topology helpers out of the
Intel code into soc-acpi, add AMD ACP support for them, always append
the DAI type to the SoundWire DAI link names, and finally enable
function topologies for the ACP7.F SoundWire machines.

Changes in v3:
 - Select SND_SOC_ACPI unconditionally in the Intel match Kconfig so the
   topology helpers moved into soc-acpi link on non-ACPI builds (fixes a
   kernel test robot modpost error on csky).

Changes in v2:
 - Drop the unused acp7x_cs35l63x4_l0u0246 link_adr array in patch 1
   (reported by the kernel test robot).
 - Add "ASoC: amd: acp: always append the DAI type to SoundWire DAI
   link names" (patch 5).
 - Move the AMD function-topology helpers into their own
   amd-sof-function-topology-lib.{c,h} instead of reusing the Intel
   file name.

Siva Subramanian Ravi Saravanan (4):
  ASoC: soc-acpi: move common function topology helpers
  ASoC: amd: acp: add SOF function topology support
  ASoC: amd: acp: always append the DAI type to SoundWire DAI link names
  ASoC: amd: acp: enable function topologies for ACP7.F SoundWire

Syed Saba Kareem (2):
  ASoC: amd: acp: add Cirrus SoundWire configs for ACP7.F
  ASoC: amd: acp: add SoundWire speaker quirks for Dell platforms

 include/sound/soc-acpi.h                      |  25 +
 sound/soc/amd/acp/Makefile                    |   3 +-
 sound/soc/amd/acp/acp-sdw-sof-mach.c          |  51 ++
 sound/soc/amd/acp/amd-acp7x-acpi-match.c      | 451 ++++++++++++++++++
 .../amd/acp/amd-sof-function-topology-lib.c   | 129 +++++
 .../amd/acp/amd-sof-function-topology-lib.h   |  19 +
 sound/soc/intel/Kconfig                       |   2 +-
 .../intel/common/sof-function-topology-lib.c  |  93 +---
 sound/soc/soc-acpi.c                          |  73 +++
 9 files changed, 759 insertions(+), 87 deletions(-)
 create mode 100644 sound/soc/amd/acp/amd-sof-function-topology-lib.c
 create mode 100644 sound/soc/amd/acp/amd-sof-function-topology-lib.h


base-commit: ec8a85e1d3fd3b357b147215c9269c9c00488dcc
-- 
2.43.0

