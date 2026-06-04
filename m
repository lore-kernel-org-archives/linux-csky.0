Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2724F38424D
	for <linux-csky@vger.kernel.org>; Thu,  4 Jun 2026 03:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780545595; cv=none; b=AixIktpwPFh7f6DTcF9ENzsUys4tEwWyQWQN/sgynKWqbEd25dLNb+Id6heX6iWx8OrTH+XgPsEGC0FsAq6fzZlFrowoGeWOs7J+q8Br5HVBYPTv2WDS+Q+3Ycog9peKNmZ0s32938lihPMikgbkSNJBJYyQ42WePcd0+Py+vN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780545595; c=relaxed/simple;
	bh=jWIugnGwWr5Db/CRBACJ0KQrzHP/28q9xxM9/896aq8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P1eFeQxy0ycwaBw5V2npaVtlYwGnyxj/wiZzV50K1eVfXLohwahHa4RXNv7ppTAK6pDCOrnx0OWc17waKD6KD9rWzeLTiGzFyKVWsnO/4OwFij3Bddau/hhW/r8XhHVcFV9V1lmTap+1BMrm+dGc6M6JHBbaYqnbrgMs6hjoVCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KClfEiJb; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KClfEiJb"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c85d4b4245aso180624a12.1
        for <linux-csky@vger.kernel.org>; Wed, 03 Jun 2026 20:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780545593; x=1781150393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWIugnGwWr5Db/CRBACJ0KQrzHP/28q9xxM9/896aq8=;
        b=KClfEiJbnpSC5/SZFLe4tz1zmfK0BSaoici4dxejP7mHywoheRPikzar7G9airCB+7
         RPoikcF64dwrSM8LKe9UES9AE7hMUJtLHX8d0968AAxiwz4czc/jLPY2SVCF6c8algT6
         ueKLaJzfylZ4bvlOxmXjhJiNLBPB6UtK+nDuWma4/T9y+cg4PFM7IW3xwzHj5pYRosMA
         2ZSXvDuHjOf6d9RE/Ttgv8G0tFYikOqnHHifruKb8MAYc9pEXeTx4u7SZhSk/GhoHwwY
         1AqmOSADbPgNQvumrBZBLoTSM6ocVk/XgRRCQoXfIanm+qqrFAo11BX3yB2s+9GMP/hL
         Cmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780545593; x=1781150393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jWIugnGwWr5Db/CRBACJ0KQrzHP/28q9xxM9/896aq8=;
        b=TJmekv2ZCGRsathxKwDfmDiHoILrxu/6iheh6o6OF0q6YQUyfFY3GSsPeLqMkDN2gr
         rR6kl7Hw1SNrzcwO/aarEqbhMR98ftMeYcGEsfOYhJxvI0m2XSkFvrej+L7XK2zgBBSl
         HSffYpIXTxn77dErT3Xgeh4j58/EbEOrvcBiFCxMvBxslSCJQLsAhVlmYykfCcj182v5
         Fn4/Uf48/enAYUmWUlwIf61kbPZl33wxbNfBPplCfuokdr20jEvpSB38as09woBjsdvJ
         02IY2+5D2RJ1o7oDVS/V7Vy6elXUoz+qQTFT1ztMSJXqor3TO9wufz2Jl65C0S18OCkW
         6fhA==
X-Gm-Message-State: AOJu0YyiikLoeRoNkft1v+g6UOUfwXL3jn/OocwM15s8hrcTGUP4mGso
	86NOGcCFymC3xqgM9wMpY/NYBQhM6B4Q02gGT+nppdwFN5B+ptpjDpXCGUddV5gF+HM=
X-Gm-Gg: Acq92OGMsa+bLWiKe49ICRg74jNafEU0mPD4kxlX4vZgnctbN4esNbAWGx7OqKk38AN
	5SsMIwYslZefEvJb6sQKwQC7uYIlERxoZTCSATfJYe1X7fJH/4DvDBHPEi+DrgEjBS+Vd3fUV9W
	nh0pfECc6WLByrC94YIiur8GyzmSnXNmR8mEOa5/tuF6x/IS9cnz4daiR7ZwNO74vWMYJMLE3MZ
	i+o8NypJecqK398oPU5KbmYP3eOWyYwLDFf3130dd9a+cgH/oPWJt94uYxG4EUimK6AYSr2vfKP
	JTHZDQOFD3mMaMDD3PMAA++SVxWgpzIphNNZWmiMhvJsCXs5ILOOKfKmbfcToB2bHlZOFCxu0WF
	dA8jSS8qaxmodva8AThaQJ9L2n3g6pVHk6qS+1zdNVD8CQbMv9fsS4pmgqn/u14zp0m/iBi8R2z
	DQuBI5xGQ8G/tbxfmV7q23DPxsGR8RhXMejJ8TSNQfW4P9maUxPa46CLclfDKr
X-Received: by 2002:a05:6a00:2789:b0:842:614e:cc94 with SMTP id d2e1a72fcca58-84284e7d724mr6416630b3a.26.1780545593286;
        Wed, 03 Jun 2026 20:59:53 -0700 (PDT)
Received: from gmail.com (42-200-172-209.static.imsbiz.com. [42.200.172.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428288002asm4411945b3a.31.2026.06.03.20.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 20:59:52 -0700 (PDT)
From: Hanlin Song <pgeorge8929@gmail.com>
To: Guo Ren <guoren@kernel.org>
Cc: linux-csky@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] csky: Fix a4/a5 restoration in syscall trace path
Date: Thu,  4 Jun 2026 11:59:28 +0800
Message-Id: <20260604035928.43352-1-pgeorge8929@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260522031824.22834-1-pgeorge8929@gmail.com>
References: <20260522031824.22834-1-pgeorge8929@gmail.com>
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Guo,

Sorry to bother you.

Just following up on this v3. This resend only updates the author and
Signed-off-by name as requested; the code is unchanged from v2.

Could you please let me know whether it is still queued, or if I should
do anything else?

Thanks,
Hanlin
