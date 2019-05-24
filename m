Return-Path: <SRS0=5yQk=TY=vger.kernel.org=linux-csky-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 265DDC282E1
	for <linux-csky@archiver.kernel.org>; Fri, 24 May 2019 20:40:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ED21B21871
	for <linux-csky@archiver.kernel.org>; Fri, 24 May 2019 20:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1558730436;
	bh=SguSDlRZ1JbrNZHQMHbnMOlSxtv8O9hZv4bFB0MZ/JI=;
	h=Date:From:To:Subject:List-ID:From;
	b=nJ3pFLnXryUXSlcXXFPVZluL2jIKA5/dCtrz++gFDOdgkBPo3tLS+FxRZP0L5NFuw
	 EpUX5FSGTkkOwHGryeV06lStZUQKJMgkVxMPCutUrterCcRcWh5AP/8aHwN/oy/00E
	 1K7LkryUu8PfCZTQCieeWcNQhbyIaBIBPvn94rP4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404194AbfEXUkf (ORCPT <rfc822;linux-csky@archiver.kernel.org>);
        Fri, 24 May 2019 16:40:35 -0400
Received: from mail-ua1-f49.google.com ([209.85.222.49]:36060 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403762AbfEXUkf (ORCPT
        <rfc822;linux-csky@vger.kernel.org>); Fri, 24 May 2019 16:40:35 -0400
Received: by mail-ua1-f49.google.com with SMTP id 94so4161316uam.3
        for <linux-csky@vger.kernel.org>; Fri, 24 May 2019 13:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=sylI6KCKC7JdbrRTrFiI8FPycSz5MfTSM9IpeWCz2OQ=;
        b=RY6nZPx4q+f5KX++Zk3WVPEWnvwmHtlBBa/n1YNwQ2kWx5bruIQu0bQV+agZpojQEJ
         vThFV7E0kAUa2QpIcmHHyrPuJctp31r0/Ap5qX98zg5iFX4nFIMgxTCGmBddZjkJkd/U
         k7WsDDlt0a+hhNhYOepdi3dmpn3zLoNtdFrr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=sylI6KCKC7JdbrRTrFiI8FPycSz5MfTSM9IpeWCz2OQ=;
        b=Uj3OeIFYbeAV2yK09lTXhQJO9e18HQOi9X8GTQCPr18KN5vV3uLw/zeCWtZ44+capL
         0mwLTz3TKJCbveMqBJxeladNcS1NYkdF0OWALVqrkB19e8SwhgFf+DpwubFW+ehCbNWT
         yasSQ5gWeo08D9nKz+X5NfabCbQlueutqmPnNXp0MT8bkJVFzceO9rPQ4XHpJzpb7AQh
         nzSCo4IOJC7i1IR4zOzK/qfAtaxUlDBtWdV8M6l3Udc/H4D5O/yLFgpXw2Gg3ePYrlDs
         4vdbC+LOFR/4WP6UNCehIJABWmfnpdJF4NAAvxVY32d4ru7JxYu6EIM6p9b2A6Zd2U/3
         qIKA==
X-Gm-Message-State: APjAAAUBafk7StHSBBllcSEt9ye4nzZ2lIaADCvoryOGa4/nLH7hzCDS
        JGrd4MRmsURg2zDDLEM6JuVSu1Wlf2cXYw==
X-Google-Smtp-Source: APXvYqyU0DilUiLUtmmZTyLI1mdfGokaVUlGnKjYIBYQL6gCjxJK2LBTXXxxvZuuqaPDrAqRJMxNbw==
X-Received: by 2002:ab0:2c15:: with SMTP id l21mr15298799uar.139.1558730434184;
        Fri, 24 May 2019 13:40:34 -0700 (PDT)
Received: from chatter.i7.local (192-0-228-88.cpe.teksavvy.com. [192.0.228.88])
        by smtp.gmail.com with ESMTPSA id d79sm2297122vkd.23.2019.05.24.13.40.33
        for <linux-csky@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 24 May 2019 13:40:33 -0700 (PDT)
Date:   Fri, 24 May 2019 16:40:32 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     linux-csky@vger.kernel.org
Subject: Test lore.kernel.org archive setup
Message-ID: <20190524204032.GA13558@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-csky-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-csky.vger.kernel.org>
X-Mailing-List: linux-csky@vger.kernel.org

Hello:

This is a test of lore.kernel.org/linux-csky. It is a required step when 
no prior archives are available.

Best regards,
-K
