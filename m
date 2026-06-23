Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6938C3D4117
	for <linux-csky@vger.kernel.org>; Tue, 23 Jun 2026 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782213940; cv=none; b=LGQibPoMVyVC0nsVJs15e0NXPh3dVYOa97FB5F9js6e0/QqiwkNa5GjxM3dkjM6X2XKEAX6g3qhSEtzWV/GSjwXqp5BwwZwWts+e8C5iWvWHCcmHkOO0OsPm49Wzn38ZNHZnPLKL4PhK6HKPtBl4OB2s/kAlmrPK6w5zctDATIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782213940; c=relaxed/simple;
	bh=5E6ao1mwvzTElxdrsxeoZAlZX2VKkXweTmp6NC9SHS4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=a9XvIXdJH9oB2MElv2+hOCFDenUwCjNubA18Epm+8Jy25M1ROeIYPUzvHVC3/Z3NosNvOHGT/U/fRJ+C5JM4oYvhyaC1t8VWnDlRlXcX8f2ddLRV5qsuLR1ociTCkcXu1fsJzwQ6wQvOwIPYgDjHMq9IU2cKR/amGvoTwRm1FUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfQUf0Uu; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfQUf0Uu"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c7cfa17fedso2699755ad.3
        for <linux-csky@vger.kernel.org>; Tue, 23 Jun 2026 04:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782213938; x=1782818738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M29e8Ql7IjJywoNGR4bcqNAVaB1wcoGs5n53l5aPyvg=;
        b=RfQUf0Uu2QpKDutgjnMXFD6C1PVkMMW3MWpWcOqxVFg1Yqunelo+Jun5us3olB8LwM
         u/Ygzktqq4bfMf+coywzWPsi+y7gpHkZNPrpqTrz1Sd9nqnkCcXiEuVWjm778gcSKy6r
         QGsbQyc1fL5K7bLNQt1QHzbSjxI+jRImm2Gz8wo4sXigqIMt8Sn9DOCiPUy1wtPECHuy
         OIzY+rDZrBuApFvcQ4/ja+OlKveHC3cr5HdqhxmPT6H1JsgMvW9LoWEGECqZok7/kJwC
         E33vV9d8+nilMnbmHJqWndewi03Nzx4l9JWA7YfzLkXQQPef+0pchEXY1GjUb1faGY5x
         OYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782213938; x=1782818738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M29e8Ql7IjJywoNGR4bcqNAVaB1wcoGs5n53l5aPyvg=;
        b=oEaIiZVNAVwkkr6e8Z724Wh4WtE37pXz7w7MOG7KE4yhpUs5IQghHCIhW1OfVLvqaf
         FoR32amd84GoTos9XluChsOBg+HTVtxivPRmaZhJXk8jwsR/HVrZeDgQcS9f4n3m/3Ce
         R6olMkRUkLO1vSTLcvrGNwt0z6/nRuA4AV/icyfbl91D/sdE5ROQ8j3bUAxlJcaJlZRP
         D1A5sDxm10+XSFGTLVLw0dxa9e2hPHOMIMVv8iqV8lj1neUvrOng5uDYDpOqIKzKkRpp
         /6yzsVMC0bQN7+rBXV5HLqRC++utJHhC2jF0h/Z5ZPvx5LdDIlLosEgh/GlVgJsO2B3X
         wOFA==
X-Gm-Message-State: AOJu0Ywi9803uJSshPw7OmHZH1d5yVXgFGWMAIAwVL29RWWhD1lxom+C
	gKoe+U0UA0sStCFE9TOrZ+EDes8Rkf23aI4A4Nm98TpS2rPRFBhZGAic
X-Gm-Gg: AfdE7cn8T++BCWF7n6d9nAY+aaMvXPnvR6F7N7KEdcjQK7kTVTfdB2KQCnUiItAvNuf
	E/R5a5CtbGbfOVKDlLOSvzeXYSOl+0O7JeRTz5BqogMUsyT2HR8tG5begZUqhYZOcEalL62zaTI
	r/iUKXomiPxsOdk/mWb2EkVXBQ/g+uzSrXBK03zn2VEF+L8VuBD1OX4uQztEzQNKMsmzHbkf0H8
	BTXmZNOfOKkfjJREn9SnJ673u/yl/a327S1Meodo8wD4f5W9pXCV7jyzOJKxRBJbEljROpm4s2i
	lrEAA7m1zBnObUUQgT42U85b4RI/y47eMfdqMqoA6jZVnN3LofPw66NZl/gCgKuFr+dPJ+2X0yB
	cGIaWhapc3AacfzZEYmFu2ad6uoJUx1HGTxcT0ZpZBHOmgN3wae+zV2gsEkGIi9Uxnbrx1j0bKV
	yfuXSISbFuWfbX1Z5odxiD96bFyxTpoWM4YIVxV9k=
X-Received: by 2002:a17:903:19cb:b0:2c6:b40a:d0c7 with SMTP id d9443c01a7336-2c7c99435b2mr19905315ad.7.1782213938504;
        Tue, 23 Jun 2026 04:25:38 -0700 (PDT)
Received: from gmail.com (42-200-231-193.static.imsbiz.com. [42.200.231.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c743bfe8aasm100035825ad.68.2026.06.23.04.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 04:25:38 -0700 (PDT)
From: Hanlin Song <pgeorge8929@gmail.com>
To: guoren@kernel.org
Cc: linux-csky@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hanlin Song <pgeorge8929@gmail.com>
Subject: [PATCH] csky: Fix ABIv2 memcmp() s1 alignment check
Date: Tue, 23 Jun 2026 19:24:38 +0800
Message-Id: <20260623112438.33022-1-pgeorge8929@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

memcmp() saves the original s1 pointer in r3 and then clears r0 for the
return value. The following alignment check tests r0 instead of r3:

        mov     r3, r0
        movi    r0, 0
        ...
        andi    r13, r0, 3

As a result, the path for an unaligned s1 address is never taken, and
memcmp() may issue word loads from an unaligned s1 address.

Test r3 instead, which still holds the original s1 pointer.

Signed-off-by: Hanlin Song <pgeorge8929@gmail.com>
---
 arch/csky/abiv2/memcmp.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/csky/abiv2/memcmp.S b/arch/csky/abiv2/memcmp.S
index bf0d809f0..1c6ced74d 100644
--- a/arch/csky/abiv2/memcmp.S
+++ b/arch/csky/abiv2/memcmp.S
@@ -12,7 +12,7 @@ ENTRY(memcmp)
 	cmplti	r2, 4
 	bt	.L_compare_by_byte
 
-	andi	r13, r0, 3
+	andi	r13, r3, 3
 	movi	r19, 4
 
 	/* Test if s1 is not 4 bytes aligned.  */
-- 
2.25.1

