Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD3F188713
	for <linux-csky@vger.kernel.org>; Tue,  7 Jul 2026 03:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783396075; cv=none; b=tEG5PHm5DWGaVqpMfgYopAo+TNYadugN55VHrdLCYtZJL2GBLWDguJ6dtGtlJrok+NQD5JsA/Vm32Ya+wIAqy5pbn32ivzOuv2Ka+ixzeMCx8f/xZqWqpObdX/W8F2M/PuyZRX6zBv26JR91bu9ss8Z5ueVk2+JPQIgPn5h6TVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783396075; c=relaxed/simple;
	bh=70M8owVCOQmzoIVE/OE13k0xqPMzJj6kgCNEiBOsQRk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i7Kni9MJZcwqvDM6QwVXE5ua2w9ROIcYYclmcUOqOrsaRclhbKTH8byxFgR5GS/QZPjmGDASZVfOAVooMzY+BqZelV7pVbxLuRCa30h3gpmD84J6l2l61lrSIhoI9XeumS8L81XuBMW5B/dldy7Uulcsw5Hl/GixPlTK/S6mSpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZMOeexJv; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMOeexJv"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-37cab825ec9so3707102a91.1
        for <linux-csky@vger.kernel.org>; Mon, 06 Jul 2026 20:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783396073; x=1784000873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=70M8owVCOQmzoIVE/OE13k0xqPMzJj6kgCNEiBOsQRk=;
        b=ZMOeexJv/vShrNIbmEQGHZt9Zr+JR/e+50DtyhDKkAj0n6+V97SVb6jDx058aOLWCr
         m8jXhcHo6wC1ygagq46IUDtJoyBFvsOOI32xZYzaDTRlauNLxc7xnPvkpzdS7GnRwoe/
         CkUgaf6oSIIUhsFAS2hvBiHkqI4qBbYjKO+oKXVWXQBuGXlNqdgb+hkxAgVQ0ulY5sBE
         maxwVroWL5aeYG5LDdO6rep4mUfcA5RPxrqV5N4ueDWLSWyX+XeyhdbIdo/afz3aMSrl
         LY4cOvZft2k6Jp2YHlo0uWJQ0LPu65kbrKaBy7uK5W0sQq5tPe+b4fbTnh2vgOwIH5xz
         qOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783396073; x=1784000873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=70M8owVCOQmzoIVE/OE13k0xqPMzJj6kgCNEiBOsQRk=;
        b=pOFyYk1kf6jWEL91s5znnPQvhzs928/mX9Oyp1ra2flao22XbIbMAPbFQ3o46cAiek
         EzAScJ5TAvzkYwnf4d1JZrXHXGWjQfIMIJCERtGX1uSohoZPN3mr+O37f32FrIdfhkU4
         SDS/L9A0Mg2gXjvTzn/pSUYIkHrpbWzJLWDKL0nlqyZF3mlwBf0isfqUA3tEq8n+GyoY
         xJBtT/ooyuM6qIh2XIMpTYAkIjg8UySuxddSw61xw1wM5nL6fbu2QjuFMWswzqzLrO3B
         P/MtqoEnMdJI/r5f8q/dRWAiVTHdCJ/07Sa8tl4t8s0k2sJrwDIInLnLT4SyAp5sSH8U
         rvEw==
X-Forwarded-Encrypted: i=1; AHgh+RotwjA1FutLbasCJoTCpcw12If02pdMghhuNv4hK2SJYpnsE/XyzELe4GQyAnmjEBO7/h2uqcw9gcXK@vger.kernel.org
X-Gm-Message-State: AOJu0YxZFO3hV2aUCbadTkV7lVCYfiZYRfqCNNpKYQ5Wb/G+4BryPzQn
	7ZPqpzhqqFQql/RFJTXEE2sERCDU+BMqsZQtlj0UIcZPIPLvml2/0voh
X-Gm-Gg: AfdE7cm5EfSZSfFCoWQG3iZ3QylBr13gAm2y1HV6jb6FFu2yFjL3RwNrtOnWLC41W1+
	EvTZkiQbIzTBMa6LT6ocED/be/5PHBhSIsGVYCnMzHSHN3WiRDBAk0bzAIEO8NWHdTc1fGE1AMl
	lYfaQ8qEM6DB30y7ceiBA8zlEjTtNwfBbo4bVVPM8fUXQA69YO5KsgIjXRscJD4zwTFX9bsT/dv
	kfXu58YDEilv8DnYZGEAff4Uo2Xn2U0nd32plEPT/pBz51rosg0n7najEEiDBK7oYaz5umnixpG
	Owp0wz3P/34b7/kjRlPS3yDIl7nIjc8/333QrHPk494y7rTH4meAAsbtfEMefKEUx4tCSzah3oY
	Nv0XqFEMbLqh1ndsW6gWJInCo0/Ql5rlUJPmKEgX5Ek62Ncgy9o2DRIKVzlFkHTAgEzC90VJIBl
	sXvFjIyMIlMECMN7zxpR8tP/tJDz9Eg/M6p6YPy7g=
X-Received: by 2002:a17:90b:586d:b0:37f:9ce1:cdb3 with SMTP id 98e67ed59e1d1-3875a1ba886mr3438082a91.33.1783396073612;
        Mon, 06 Jul 2026 20:47:53 -0700 (PDT)
Received: from gmail.com (42-200-231-193.static.imsbiz.com. [42.200.231.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a361asm314188a91.15.2026.07.06.20.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:47:52 -0700 (PDT)
From: Hanlin Song <pgeorge8929@gmail.com>
To: Guo Ren <guoren@kernel.org>
Cc: Hanlin Song <pgeorge8929@gmail.com>,
	linux-csky@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] csky: Fix ABIv2 memcmp() s1 alignment check
Date: Tue,  7 Jul 2026 11:47:26 +0800
Message-Id: <20260707034726.11076-1-pgeorge8929@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAJF2gTTExptWYfy7m-aMG6WtcOJhegZ7=obcf4PQ25-jpMHvSA@mail.gmail.com>
References: <20260623112438.33022-1-pgeorge8929@gmail.com> <20260706103932.20961-1-pgeorge8929@gmail.com> <CAJF2gTTExptWYfy7m-aMG6WtcOJhegZ7=obcf4PQ25-jpMHvSA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Guo Ren,

Thanks for the clarification.

Hanlin
