Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9262E8DFC;
	Sat,  2 May 2026 11:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777720765; cv=none; b=EHxeRlFsLm3AtUdzPAreayUSIBn2o+0Qmw6YgZ8lFjbvNg4/FbJi30Ij8SXUcfqPNye/zGn+THqR4psVuLIqI4eAwL/uWUyeiXMJufyJSET2hB8a69sn/hYj9T2cGAKHPWVR0ue+oooKhiJp53Gj86xBF7iLbKEs8Rp2PYukYyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777720765; c=relaxed/simple;
	bh=Y7BmLuecdtoDWUbyr5oGGqes/kM/uBxyXVEYWfLelAI=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=XPMMn7wZiEO10/CH6kaSm+GLEG/vvS7ppKozhcVQqDU5C+Ck7UcTh0V97gV08MtbEf3JEPJpIhcZLkjEEXpeUgQ6UTet0epUxt3CXB1ZvrRLCcIVly+E9ft5buu3TVdp7CE050yzaXCYDa5Y+h7eHyfnAsfanfgnm1SEUuc9o6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=El2wKY1H; arc=none smtp.client-ip=43.163.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="El2wKY1H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1777720753; bh=76NoYislCiSkqg+6/jcEtLqb9Fj7DsHDYv26GtYkFpI=;
	h=From:To:Cc:Subject:Date;
	b=El2wKY1HhEcZ4yPLnx0yrB9SFuCYFyzpPME7bCV2UcyZzWa3FVs9LfyA4MUBee3Yg
	 6OCBll6ksw3o35fplgeWLqkqIMre5SAQNEbv242YlDO4K7RhjoL9DXwLkPc28GXvFk
	 4fTFmzPLTKvBnDb6uSv0OPL2LBzPDsm0GD1u5W74=
Received: from Lang.smartont.net ([2409:8a44:2312:14e1:56d8:1e1e:3f0b:d0f3])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 4C8A3C3A; Sat, 02 May 2026 19:19:08 +0800
X-QQ-mid: xmsmtpt1777720748t758xpqbo
Message-ID: <tencent_7F23A3DF4B91955F6E2BD07BAE7C92B2E607@qq.com>
X-QQ-XMAILINFO: MMwjR1C73eIsJwuzCV45N4dDiEQ/1wUpUyHkryJgzG5UMbBvwuMK+dWgUCCUgq
	 6+CIloBQDFVl/g/fT1xeZiYQz7rZQemtSMn8/R5WZfhrMslMtfaxVkHc5wVCkH11ayBQFrLgJx4X
	 C1U//aBCdGVJHLSNG7ZjUr0eQ4XKO+hNDiKIu/78fO1p1njJtjvH/Y+8AiVSVkm25V9XjgzLHApl
	 KSkaMMCbgoi4vB67kcIjdAwLtfDfKFOvZxALwsuLHuKTS6J36zt5ub8BjENhpmoqmbTfdts8FWqy
	 NvQFSrilCQsspCsvQJIVFe/HgSvHTx/eAddbtIjnPZAQFlU5XSBaRd4rrminLSdPDl5c1Jpf9nA6
	 nEVmDYe+pgKE3XmklxcIbmk3rtAJOqI1PuXZ3v2bOv1r2kgYWexD+3nO0sg5LQE6hCyTeDGEpIys
	 DW7mZ7cMeuKDn7Ayb4FxIO9JaFP9t44RUZlSHguc3ZnnigAWpK7k+pP9Z3zs60q+YtryqntYpFR7
	 /F7tAiB89MjsNMHGCp//W3/oschof+FmczMMON/7fyn6l+WP2/CZKiDVT+oaMCCmtAtoB0PxfPDp
	 QDL0K2jh84C7mDRkdpxLmGLehPorGLOoSFSvPIu9Yt7Ux3g7n0f20M+zVT3bZ7EbGmxDRi/7vhcq
	 K8vxKBwG2By5iXViti6q1V92C42DRI+KLBLtHJZQsoYV+y99Yp7mWd9UyUPUCOEFQYZFsSkux6Fv
	 X+b2/evlU8Yw0elRFjXH7jnJH+EGb+HeW8BspJKqEb75YybW5Lsia05q3d2eQrhzsuJc3sKFn9GE
	 RKwl+I1YlNDe3lz42LthH/O9sqMqYNfkbHmxR6tfDewaeR+vo89dQ6Xa/Fmh3ba6yz3P1cso8ijA
	 S9j2FKx5O2IzGhTVJLAg/imyCnxfrdnMtIi85ISgkASxu8LXXcyt5f/BURCyA+fkaDhmP/rWyxLt
	 vv7/clk7k4fUxBIWNxqRmi69SMivSMzXsYHvzM8pTotSsmHitmgNxZT/zKxMsdDoeSfBbRXmzMFq
	 G4zGqdAkd2bFMxr/UHWVf+LYVgplI0xHdJuKWqdAaKM4J1h65xLeVaoNyhIp5rrJdjBoyMip1/9a
	 rcLU+D
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Wang Zihan <3772548978@qq.com>
To: devicetree@vger.kernel.org,
	linux-csky@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	guoren@kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Zihan <3772548978@qq.com>
Subject: [PATCH] dt-bindings: csky: Fix typo in pmu node name
Date: Sat,  2 May 2026 19:19:08 +0800
X-OQ-MSGID: <20260502111908.142458-1-3772548978@qq.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix 'performace-monitor' to 'performance-monitor' in the example
node name.

Signed-off-by: Wang Zihan <3772548978@qq.com>
---
 Documentation/devicetree/bindings/csky/pmu.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/csky/pmu.txt b/Documentation/devicetree/bindings/csky/pmu.txt
index 728d05ca6..08a829ae3 100644
--- a/Documentation/devicetree/bindings/csky/pmu.txt
+++ b/Documentation/devicetree/bindings/csky/pmu.txt
@@ -30,7 +30,7 @@ Examples:
 ---------
 #include <dt-bindings/interrupt-controller/irq.h>
 
-	pmu: performace-monitor {
+	pmu: performance-monitor {
 		compatible = "csky,csky-pmu";
 		interrupts = <23 IRQ_TYPE_EDGE_RISING>;
 		interrupt-parent = <&intc>;
-- 
2.54.0

