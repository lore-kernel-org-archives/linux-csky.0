Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFC43E2AD6
	for <linux-csky@vger.kernel.org>; Tue, 25 Aug 2026 22:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787695630; cv=none; b=qzph/BRQ95E/9CLF2O+sNDLl54RdLnAXkaSbfCRdDBu13xKLqojGNVf9mjjkZJkjEOxDYAqEYInnVy6OPbSLtN4aG5F9fKKOhTr2hxSqeYFKZIwLgZlzqGshUywYkR90V5Z7J52mBXdOAgKsQ682oiNW7gYKalZePoPPm2O+8Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787695630; c=relaxed/simple;
	bh=63qI2K79bcm4cDczUBl3jeHM3xipML3Gz7DLpnr04Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Het3t4PBfPiOWDNr2l2wF8a36/jA0PPVS0dQdnlUzFSnUgystNMyMdR3ey2PMWXpZfvkt1bZIX+WxdTLPWdyoq/E+felebYAXVtO0HeB0ke0tD+RH3gssbo60t/onVcBKgujBFe97qRJi+dGVgQaCfIU4VAoinKecr11L+OEN6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yd59fMiL; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yd59fMiL"
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3964deae8a7so129489a91.0
        for <linux-csky@vger.kernel.org>; Tue, 25 Aug 2026 15:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787695628; x=1788300428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E2HRqo0BNmOG+wvSL71FMHVkpYIR+F5v9R73Mp72HJs=;
        b=Yd59fMiLkFIJFSaPsIB3sDLIkOhLNFFSJ2OohGDo2kEp+Mb7bBfjkPhbYzXsKoDtEc
         FaYfC+TL965X0LUTYCDhIDa36EfNtR9+jpwimN1ufte8eJSU82m765RVGEXCcLF1iNvr
         +84R+0SeJ0oEC8f0mLCRlZ/PFjelJ84y3Iw0SepbLLH7NUfwhNK2Q4Pmtmib1bhF+aE5
         4awltP8HYAr1IldJ4ip5GO8ANpYtn8dq4nAXzbPufhc38milbbM/HQh2hrxR0QsEwD8G
         Oye1PCF41GB17nFHF1WxRpSFCg1VH8tHC+XWKOJ00JSEJiy7F779FWtSYWPw90kn/ViJ
         QCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787695628; x=1788300428;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E2HRqo0BNmOG+wvSL71FMHVkpYIR+F5v9R73Mp72HJs=;
        b=oN58JPdgfbePY4+r4K75JkuYjssx/NvZdBHEQO+ilefFRmgLxxfEnNXJ7NScubgpqJ
         efDbQbw5yAZedd9DLuI0zsy3xAkLTjG5np+HLuvusiulyVm3389D0jxV/h4eBzwb06zK
         8bsMmaLtl4v7tdSze77EBdDPWiKhypNqjz9hEss2yTnOBIxgGnprEmX9XsFBUAztDjYR
         WgAGxAxaibV5T5g/DKR+fMytNz3XyLSduKrm/HeSnuyJL2BFsXHjOkbKJ6p0I6+lQSKH
         NLuK3duJaUO71nZhucBvLXWJYzwudCWw5M5d+L0yozZfnvjUFQ7OncUDoq4LFDOU431h
         tBvw==
X-Forwarded-Encrypted: i=1; AHgh+RouV4XEnajEsFgLx6GJY0J55cfx1wxWusK6m2tPXOKrA4ukQ7awu6OeO6LGn1r+n5MOGVKP8e4+SawH@vger.kernel.org
X-Gm-Message-State: AFuF++nhiz8lLFdksJ09rR+JIQWNmy1CYWEftMu9JELaThk2emaEyCbc
	3YG5rKXCfgBMdOhMLnA27wcQmB0InJw1hlGyU0SYCu4TsaUZAamu63x7
X-Gm-Gg: AR+sD1317hBuNlTMxhwTxjumMCz1h0FEDpIrPAZB999siYAC22T8mk6LAgDfBxydIhs
	C+Bet/DPQkSxI38bRzo3Ln1nWYp3AZ6+OpeG9nmW95AqdPuuUvHt7JmX39ip0eH4jW8wT92rs7e
	rje4mX7sJML23L6H2hUCYNaR3v4/YEK2VNaBUFaldxuXGlqZTC1KWf9Lj2z0ghKXMUl4k89AI+O
	gdBtyTStDU372+HfSYUxBF8OnAEogoOkeF8DmpF3jwz7OF83dMfrP7hKgGUI8w/Kmh4YGfQJ5Pr
	ksc01R8ySdVTw+Yeo6rN5FrfU3MOMui9MMKBC/6o2+o+Uqwlbhat1MIUyAbm0C8ITe7/1EnO2Kv
	QQlJInaWxNuCEK7u0/fmhWAmocdYWNeyBju4llY9ohBjSWqlXhZ+7abILfK/watq20y5HPzMAdG
	7EUIAybziUyxOvNlI98lzPDcOXmdhNkbw+m8AK2L9H8araZBs6YFisQfGTYAlq3soB
X-Received: by 2002:a17:90b:3b4b:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-3966d8b6295mr4351538a91.14.1787695628197;
        Tue, 25 Aug 2026 15:07:08 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:46::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39668a57396sm1314425a91.13.2026.08.25.15.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 15:07:07 -0700 (PDT)
Date: Tue, 25 Aug 2026 15:05:46 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com, andrew+netdev@lunn.ch, 
	saeedm@nvidia.com, tariqt@nvidia.com, mbloch@nvidia.com, 
	maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	aleksander.lobakin@intel.com, horms@kernel.org, magnus.karlsson@intel.com, sdf@fomichev.me, 
	ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com, 
	guoren@kernel.org, dtatulea@nvidia.com, witu@nvidia.com, martin.lau@kernel.org, 
	yoong.siang.song@intel.com, intel-wired-lan@lists.osuosl.org, linux-kernel@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, linux-csky@vger.kernel.org, leon@kernel.org
Subject: Re: [PATCH net v3 3/3] net: stmmac: document oversized AF_XDP frame
 handling
Message-ID: <ao4RsulsnIEMOmiG@devvm7509.cco0.facebook.com>
References: <20260819160535.1472459-1-sdf@fomichev.me>
 <20260819160535.1472459-4-sdf@fomichev.me>
 <aoceSoSFMx69Z9up@boxer>
 <aoeoJ6-njBxcWs4w@devvm7509.cco0.facebook.com>
 <aogpDsa8hz6CPpD3@boxer>
 <aoiIarzdjk92RkCN@devvm7509.cco0.facebook.com>
 <20260824111443.34bffe04@kernel.org>
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260824111443.34bffe04@kernel.org>

On 08/24, Jakub Kicinski wrote:
> On Fri, 21 Aug 2026 10:28:47 -0700 Stanislav Fomichev wrote:
> > > > I do agree that a better idea is to probably do these checks during control
> > > > paths, but it's a bit more involved (and not sure if it's possible? if we
> > > > have a bunch of xsk sockets and we change that max_sdu, do we go over all
> > > > sockets on the system somehow?). My main motivation with this patch was
> > > > to make our LLM reviewers less chatty about preexisting issues.  
> > > 
> > > I hear you, however I feel like we do not know this driver too much and
> > > probably we don't have a HW to test out such changes, so maybe let us try
> > > to fix existing behavior?  
> > 
> > Let's definitely fix it properly if you have better ideas. But since we
> > don't have HW, I'm not super confident doing anything sophisticated
> > myself :-D
> 
> Let me take the first 2 patches and leave the stmmac for later.
> I don't think anyone involved care particularly deeply here.
> 
> Maxime said he bought a bunch of relevant HW. If we finally wrap 
> the AF_XDP tests into driver runtime he should be able to help us...

Sounds fair, thanks!
