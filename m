Return-Path: <SRS0=kdtN=5X=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED6CCC2BA1A
	for <linux-csky@archiver.kernel.org>; Tue,  7 Apr 2020 01:50:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BF0062076E
	for <linux-csky@archiver.kernel.org>; Tue,  7 Apr 2020 01:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586224223;
	bh=lR50Y3wtF/OeKxF+qQaiQiXtrV2GjwUIGtv+2u8JKhw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=vxs6OW0tXbgml0sr/zq4B8BXIfXyZyYbZ7hUyJhI2kF4WRoV40zsEGZU3xGcsXCch
	 Hkl4ss15m5rf9V8dbXtVwQebS2GWEt9gW1z6IMxx3uH+Yst5ztE4MMWcfq8PxjXiPu
	 Km+RdNseskLGzpngOfulpb2SKsr102TK4OYtSW+A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgDGBuX (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Mon, 6 Apr 2020 21:50:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:45906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726287AbgDGBuX (ORCPT <rfc822;linux-csky@vger.kernel.org>);
        Mon, 6 Apr 2020 21:50:23 -0400
Subject: Re: [GIT PULL] csky updates for v5.7-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586224222;
        bh=lR50Y3wtF/OeKxF+qQaiQiXtrV2GjwUIGtv+2u8JKhw=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=dZkWGqlxw4wnY+VGMaaeS+IHQfprtxbDzy2QJ+5HJAqcvEc90K8n1/zWsjOugUwO9
         5yr6qm1qgni378xj7nCJbvN0cCGGnfw6n2fCfEPIqp1pbwOAw1bY4sXVap5cEfEk1a
         S1ooh+Ju4lftfcf1fhFUCDvqcYcqpOGPXSm/39gk=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200407014408.5136-1-guoren@kernel.org>
References: <20200407014408.5136-1-guoren@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200407014408.5136-1-guoren@kernel.org>
X-PR-Tracked-Remote: https://github.com/c-sky/csky-linux.git
 tags/csky-for-linus-5.7-rc1
X-PR-Tracked-Commit-Id: aefd9461d34a1b0a2acad0750c43216c1c27b9d4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f183d269cc6c64481b47ecbf9d3aff128dc0978c
Message-Id: <158622422277.7913.5910730865167073820.pr-tracker-bot@kernel.org>
Date:   Tue, 07 Apr 2020 01:50:22 +0000
To:     guoren@kernel.org
Cc:     torvalds@linux-foundation.org, arnd@arndb.de,
        linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-csky@vger.kernel.org, guoren@kernel.org
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

The pull request you sent on Tue,  7 Apr 2020 09:44:08 +0800:

> https://github.com/c-sky/csky-linux.git tags/csky-for-linus-5.7-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f183d269cc6c64481b47ecbf9d3aff128dc0978c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
