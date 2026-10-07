Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACFE3BCD29;
	Wed,  7 Oct 2026 08:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791361581; cv=none; b=rR09tEmxoMcS9H8AFn+JNg95t/nmctU2Btq2mUh7TWXVYF/N7wFXJ5sb7ftH0rMuWzCnMmTf/uyK0/3cfV0nt9yBc7EAV35FmozqmD6lmMq/i8do04Pacbr18wRBhR2KfRafwjr0Nx7xF7SDsyHglztwZY1bJDH39VaE0BwVXxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791361581; c=relaxed/simple;
	bh=hlUZCHfbuJBYU16iQy8H6PXle9Q4Ze/1tSWfJ/Y+zdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iGvD9Vud/QeZAKDbxkgxTbrvx2p0eYtHAztbna0/RStrB7LW8rTKG1/NSDwlgjg4cDTbeYSg1N26mqhds+JzIpxmOInEhoJwpYRI45FTm7Bf4WQYpifQC3eOLmwOiE+ML/DXg6lOVpHFHEmG0154HBR15bH1G3BxqmgBh8WsAsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OmrkYRjy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OmrkYRjy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF821F0089B;
	Wed,  7 Oct 2026 08:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791361580;
	bh=hlUZCHfbuJBYU16iQy8H6PXle9Q4Ze/1tSWfJ/Y+zdI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=OmrkYRjy0QQ1IyzAAdn77k4jJ/VV9aUhwixFkBj+g1pAyp60O2kty5Qwyzfm4S3Gh
	 20fPdkEBpbjyajPgMJ9z07fpqM5aJGZK/vwbljoJOccUprgE1mPdrjIXJcoXRL+fPY
	 0lSV1wvoF/PcLD47jui8v+7oX+ClaW0IqjUazTI9amREodX1tiHEJzvSqBppDCuD++
	 ySopvILlww2B2PwayUF0KskHYyVi8Q1I3EINJHuGl3w1itbSOTwh/z1LU5GJBahvQd
	 7pZXa0DulB/CK1vfsfqCSnXqrtvCphm98O8ztjT5FaigVWS20DQe5B6HxDbDvZxZxs
	 mTVbDS2/O8enw==
Message-ID: <1634a670-eeb4-4e74-a861-c7f54642ae63@kernel.org>
Date: Wed, 7 Oct 2026 10:26:15 +0200
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] xtensa: Emulate two-byte cmpxchg
To: Bradley Morgan <brads@mainlining.org>, paulmck@kernel.org,
 kernel test robot <lkp@intel.com>
Cc: akpm@linux-foundation.org, vgupta@kernel.org, guoren@kernel.org,
 chris@zankel.net, jcmvbkbc@gmail.com, oe-kbuild-all@lists.linux.dev,
 arnd@arndb.de, david.laight.linux@gmail.com, glaubitz@physik.fu-berlin.de,
 ysato@users.sourceforge.jp, dalias@libc.org,
 linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261005120700.383058-4-brads@mainlining.org>
 <202610061704.rvbolgPy-lkp@intel.com>
 <82aad69a-603c-41cd-876d-09772a1a7e6a@paulmck-laptop>
 <543B9D97-52F8-4D12-8118-9698F6908668@mainlining.org>
Content-Language: en-US
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <543B9D97-52F8-4D12-8118-9698F6908668@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/6/26 17:46, Bradley Morgan wrote:
> Do you reckon they are fine to you? The patches?
>
> Arch maintainers may be busy unfortunately 🙁, I've done testing on all
> the arches,

Everyone is traveling due to the conf season - LPC, ELC.

-Vineet
