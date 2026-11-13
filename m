Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794592832;
	b=bT6xpf26T0nMm1JVEd8HlgtTzEhaHJe48kqtANEcYnrARNmXaQ7l1gIGlsuA8zD4k3IU
	 JreMe1HBo//hlplf1st87HXnp//bKQ1p1M9BalIx+jaidMxFmABMJauO7U+3KrSeNqyTa
	 09wiBDY7pxH09TUN9BhrCISe68B7q+Ynl3/JmMjCi1NcrC8jGoVWOL0DSSE5vZ+P0W1/w
	 2GBC8XEBVe8Fd8VhguXXpnUxqc/+8LSjDZIEtEoffaX6fSWLRz+umTMNy/G3Habqdvs4F
	 dYfbt6dIrWWoJmu5vxsBx+NtzqEqRcFcXy+ToV1AC1WlYJO7JHKevDNPq0hVwaBXOVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592832;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=9FGtgapqf+t9EUsMhhF0AQk1EeXyjV2Us13KHEtxoOc=;
	b=nTdNOjNvgI/AconOqELoYfUFuz7SPXT9BqjEs7FbsxFCrV3XgEtyubchQAeSINu60Zam
	 lZDSCmkuAyI7B1fLSd8WYzvCuy6NeYxcA2tFGlakz2DiPbCJJiUafMIWvv/XG0l5H0wNn
	 5eSYWEeaLsknAL1MCBvOHjvkYiDvF++C9xAhd6d4nw+97sQ2P4u0+oLmgsx1+xgN7qmSc
	 e08vd0ru0lhlgOtZ3UciHgUfUbaLniiTzdQ9vcMebhKTw9hOur1EUoN3vbbnr73R9YdlM
	 h6dO4B8BRtrTqCAK4CAxVVN55MfzsTbBSK1BN0pCdNSm/BfYjWWu4ECyo5asE1KVUyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PkM16QOu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF956606B342
	for <linux-csky@vger.kernel.org>; Fri, 13 Nov 2026 18:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PkM16QOu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 091DB1F0089E;
	Fri, 13 Nov 2026 18:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794592832;
	bh=9FGtgapqf+t9EUsMhhF0AQk1EeXyjV2Us13KHEtxoOc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PkM16QOucH8gQY81GJ+cVa3AYvJGLSFc5I7y/3vq+iWIIR7g9P4Vc3LX80cTEYEhv
	 uYofe+IMGzlCkxzO1X4ceXRsFtdpNhdEHg/UffLXi0aZvSWpLIhLkE4uSKHF1C0aUA
	 d3EOHgNUwE0VAPqn6iayQyWTFo7CW/cGWD73y00O2ovdTvAT+CcOGI+8HQXv57czG1
	 RKdH7mG92hjsxKK2AMEAEW2kfqmXRT8lLvKG2yN86MJmzAKAr8GRnGkZGz2TbGaZm2
	 hdEQ/MD712cYOaiwAdmLTu8cvo0jH1MMbJ0lvqHrSrdoGqitwl2T+Kpp3skl4Wh9Jn
	 xJMumkP4q4zOA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Syed Saba Kareem <syed.sabakareem@amd.com>
Cc: Vijendar.Mukunda@amd.com, anson.tsao@amd.com, 
 Sunil-kumar.Dommati@amd.com, mario.limonciello@amd.com, 
 Syed Saba Kareem <Syed.SabaKareem@amd.com>, Guo Ren <guoren@kernel.org>, 
 "open list:C-SKY ARCHITECTURE:Keyword:csky" <linux-csky@vger.kernel.org>
In-Reply-To: <20261112123603.2891858-1-syed.sabakareem@amd.com>
References: <20261112123603.2891858-1-syed.sabakareem@amd.com>
Subject: Re: [PATCH v4 0/6] ASoC: amd: acp: ACP7.F SoundWire configs and
 SOF function topology support
Message-Id: <179458523228.68977.1942336202187968930.b4-ty@b4>
Date: Fri, 13 Nov 2026 15:53:52 +0000
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Post: <mailto:linux-csky@vger.kernel.org>
List-Help: <mailto:linux-csky+help@vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-csky+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2050; i=broonie@kernel.org;
 h=from:subject:message-id; bh=42qJZ2zd1/OG95s/m3tsoY0R2LgbY3r0DTBCQNhCNzQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+B9iuPftPxMXO9HOk9YuujsyjW6bm7f5dwPpq0/M2/
 72TLIzDOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRhe8YGfpdBU6pLdU4/3lp
 xFGrd/0fasUjVG6fnXRLLmPB8s/rH9xn+M3mXJMUlsB9t+f9LukFK9QkVhy2srJSPqH35V608qv
 iSB4A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 12 Nov 2026 18:05:35 +0530, Syed Saba Kareem wrote:
> ASoC: amd: acp: ACP7.F SoundWire configs and SOF function topology support
> 
> From: Syed Saba Kareem <Syed.SabaKareem@amd.com>
> 
> This series adds the Cirrus SoundWire machine configurations for ACP7.F
> and reworks the SOF function-topology handling so it can be shared
> between the Intel and AMD ACP drivers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/6] ASoC: amd: acp: add Cirrus SoundWire configs for ACP7.F
      https://git.kernel.org/broonie/sound/c/0fad8a0a8aec
[2/6] ASoC: amd: acp: add SoundWire speaker quirks for Dell platforms
      https://git.kernel.org/broonie/sound/c/72b048630d14
[3/6] ASoC: soc-acpi: move common SOF topology helpers
      https://git.kernel.org/broonie/sound/c/e23ffd79d900
[4/6] ASoC: amd: acp: add SOF function topology support
      https://git.kernel.org/broonie/sound/c/50bb13ee80fb
[5/6] ASoC: amd: acp: always append the DAI type to SoundWire DAI link names
      https://git.kernel.org/broonie/sound/c/e8e52a9a8257
[6/6] ASoC: amd: acp: enable function topologies for ACP7.B and ACP7.F SoundWire
      https://git.kernel.org/broonie/sound/c/2732ae983737

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

