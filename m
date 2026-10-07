Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C987438656C;
	Wed,  7 Oct 2026 08:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791361475; cv=none; b=Gb5mOG3mjN+tfWeK9zHKd3CMxOIU+jrVrkR2BZgy66QGgWrPitQtTHo3GPROZcBW9UCIwzRwFHXKGeAjeScm9M1nKIt+am+w4G7YY/o84TZDH7fLcGnPz+cWBEgvT1YQu4vNv3GPr+D774gmJ6rxhbCIWwIb6kJc+dyKtNjQFGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791361475; c=relaxed/simple;
	bh=YHL4djo49xwZU7zooBHab6/GTr0aMmUC7fb418Zs1+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QluQ2aNc8FH+cVhCD+ovX8h3Mep83Kif972LbxoKDWLnTSrc0JAUWFpm200q8wtfh09YiC5o8bT4O4Ho2YJpv4hGqsNgsNwQ7ta54LQdjElfPQt0wfTmmInj0GgsxxglwwofVfytehxCFfniRqMLKqM1xlFboXklmuQErNPJF6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4BIVvvi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4BIVvvi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028E81F0089B;
	Wed,  7 Oct 2026 08:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791361474;
	bh=tEHk71hYPBCCE5NSj1/QC7/bFh+9rih0EHooMX+l+AI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=g4BIVvvibk1n55JtSi1PZH3NBzz0Q+6Y1F2jpAswWWxMhg8nWx4OTX0N/BV2lcK2Y
	 hk3M/xWmj3kkY6+WlwQ4pCpqfzff7dtvn9H6EBwjJUNeVdvIiQdCHGdGHhq+4FOQAr
	 FOGA0JRRdabHzQoH2OGLJjmgT85x6lLeaF6sBEw+cKllqMLyIgfUCcGtGskR/x0I2U
	 KsaX0/AvetYcEhxZMdw0xLbBMods4dNijg6csE3wJl2vixQLlNGV347HEr10+Skucq
	 aBZBojmFoiKc3y8aCkKpE1eIG0Nble7B/zYbqxBKOFh6J98fuQbgcJjBxtepWm690L
	 k1YQzQ5xfju7w==
Message-ID: <a8bc1396-fa38-4648-89c4-ac528fc1888b@kernel.org>
Date: Wed, 7 Oct 2026 10:24:28 +0200
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] xtensa: Emulate two-byte cmpxchg
To: paulmck@kernel.org, kernel test robot <lkp@intel.com>
Cc: Bradley Morgan <brads@mainlining.org>, akpm@linux-foundation.org,
 vgupta@kernel.org, guoren@kernel.org, chris@zankel.net, jcmvbkbc@gmail.com,
 oe-kbuild-all@lists.linux.dev, arnd@arndb.de, david.laight.linux@gmail.com,
 glaubitz@physik.fu-berlin.de, ysato@users.sourceforge.jp, dalias@libc.org,
 linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261005120700.383058-4-brads@mainlining.org>
 <202610061704.rvbolgPy-lkp@intel.com>
 <82aad69a-603c-41cd-876d-09772a1a7e6a@paulmck-laptop>
Content-Language: en-US
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <82aad69a-603c-41cd-876d-09772a1a7e6a@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/6/26 17:44, Paul E. McKenney wrote:
> These patches need to be applied on top of my -rcu tree's "dev" branch,
> which supplies cmpxchg_emu_u16().
>
> Nevertheless, thank you for your testing efforts!

Sorry I don't have your tree is my git remotes. can u point me to the 
msg id of the series which was applied so i can fetch it and apply.
At this point I can't ACK/Nack the patch since w/o the pre-req it just 
fails to build locally exactly as the kernel robot found.

Thx,
-Vineet
