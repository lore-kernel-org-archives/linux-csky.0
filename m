Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB28B52ED3B
	for <linux-csky@vger.kernel.org>; Thu,  1 Oct 2026 21:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790888769; cv=pass; b=KXwy2CpJoKNMOcEiiCBvSpl4daSYVtSmTzkpJYSZIgWhDK5LV18CPIKw3pSjDieHgYy1I4xQcJW6U5tzFd297KZ4fg6kKGk/KRQSElvQtosuSylcM4FHPKSmrED71MfzpxsDSvQoIJqLPsJOWqLR2hUUpqGS5jfClpLzqaiYc1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790888769; c=relaxed/simple;
	bh=xN21QYy0yGgz2sHT1nXnC/21nVEwjhkQB04Hg4E+rW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pqvOcXbIriymqfpoZ39D30pIrbCEirkhzZW4NnN79RkFbZsQeI5LIlq3d3ZKGvjr3HIN96z92dkGeKnCYsLGQU7MNgkd4l2VF4X+vkFpRSQHUQKRkCJtk2UZjLK91KoyVj+Gtbm7AlbPCSZnMIDj9MIHPJwcH96JZYbzlTQablU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=CAwV36pr; arc=pass smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="CAwV36pr"
Received: by mail-pz2-f37.google.com with SMTP id d2e1a72fcca58-885f0eca6c4so1421114b3a.1
        for <linux-csky@vger.kernel.org>; Thu, 01 Oct 2026 14:06:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790888767; cv=none;
        d=google.com; s=arc-20260327;
        b=av/ibJcOVlPfCRIWkgm5qCDbgqCQEE25KG4ciKaMHhQ1/9sdNagunlZOIZOMojhg/w
         kJ7774sSBJBTfZT2TJAGDsCG10VlHhoLKXqPbTQxZVi6J8VBqoNne7Ztg1yu4O8LfLXC
         5v2Qtu2Tvoqcy9QotQvGD1x29fyLL0/VyeN5na2R7H1vfwQRpx8Xk/vSKIdxdJ34FdRQ
         VZ0w/Mm9qvKU0wkPcuEbdDmyoDMfO1WwO1YNsnYvmW4rfL5OdN+ZVW1isdKZyzLS8tSZ
         KzkID1MjAjdVcHEjhJkF2QCSwPaj8X/JPjcuzwvJ6ZTK6HCj7FvRhTXyicFgKaN0Nuxv
         aclQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zQjpYhlPNUCc8b2PKOBh4ENa5gh7HULkWsy4SYnLXSM=;
        fh=w7mMtlDdsIQxcW5OU9b3ugImxM7ZXuVh0vtJ3ydop0Y=;
        b=ONjVvpVTF5VP/4U9G2WElARHUWXze8pLgHqFiE4J0IxaCPQ+Y4qa6lzucdEPanNKaa
         FETaLTIyuvji8daM3G+gQs2c2pAyv5p0JOJl9+Hqrh63qufZgDpDQvkToPNszvZV2Ewn
         gGTn2NhYJnyNvgBvwvBcTXk34qbaa84h9oLdDuuCg9TZqTXuS/675cZdwk3nfwUIDYln
         vcH/3mEHroJtQ/vQ6hoHba6ylmIHM/R0YT6T5mrmdmE224MVXYZfa4J5OR5Qr2QY325D
         CPC8BRu5iQwrrxuypmYzQuHbTrL01Mx/Ha1YaJ8UiiADVjKnYsWBbkI1z2EUCpueXjTn
         ijwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1790888767; x=1791493567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zQjpYhlPNUCc8b2PKOBh4ENa5gh7HULkWsy4SYnLXSM=;
        b=CAwV36prXHOZw2NRE+aSACbPdDsBf2SHqbBYA6oNTHRxcIGcOyC/CJqkRH7LJRevOZ
         ClcJMU2t93f7XmqqwruK0c5ZXJiXQfI/+n+w9nHyb4EcEh0EZTu11pUBC9xzrVuOqKBT
         YsV75j7RrnJU55Z+JqH44vXWfdCbI4I+NCB8980IdTgu7vzPMxHvgU+uCw/+FxPpgY0h
         63X1M3w+g/hILuWVI8qWSFmlSwv2NKZwGdJ2DwWfYsxtFTA/lG+C3YADiA4myoIGj7HP
         Z1Ev8yhuTUNqN+BrgGDh8F6GLVD0gbmqkkcnf9FOFy5sLyuxAa1XjcNkIrhbHMfk8YG5
         z0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790888767; x=1791493567;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQjpYhlPNUCc8b2PKOBh4ENa5gh7HULkWsy4SYnLXSM=;
        b=xOBygPzL+VvKu5l4C7vBb3D1+6k3mJaxlkpElWZCiSG+VAghi8CCGA3KoxRJqqvGoN
         i1L4s2QhcMVqU/zLebCYYm8QYYS1QwPH2RT4wIAObQi1TfkEhW5mfH9mIccQhFPK9zxx
         nveUWHxDJr8lb8fg4VzgUrhJJLv4iczAtcqoNfAqIoYSZwnIZMeNgh9rgFA62nGggBcM
         ZrZsL9bFZxNJEKaAI3596dhT1tdmKCAuwJ13zC2ESz2TAgDTolGFr3BAXBs49z5m4CJF
         PxM+JX3aSyyEJcHQ0qW6JvKVxTRqLZ30vzdNaUYgKUXhnMOyI2VBy2IoXAW06mpGKTFU
         LrrQ==
X-Forwarded-Encrypted: i=1; AKwUvByY/8tIEiqSQ9I2RZ9djRow8Jpc4ibEwO102NKiuvv4IHKeNFfT4QtoVDMFRS+b0z/tgk+D9SM9WmEo@vger.kernel.org
X-Gm-Message-State: AFuF++kPjTj6EEvvi6W5L4Mp+4lGpEf37gSGDRQrECc1/+WLSvms4kbe
	7FXXtLAqWhV5AQ+vTcyZOESg25sTXpIYMb1N/R2y7OVaY2DhvtVlqk4LxYrE9b42+OpBUWW1DnR
	dAdF3e3AeFMQi+5ooW52z0yztM+8tE5oiX4CjNk2v
X-Gm-Gg: AYBFou3F5cwatLH4AQSii3zk9/4Wp3sCB3gKM2Le9BG/tY6NYdOvfYnxr+3zodXnacy
	JIBAuQnhE9wKjog6KB9ZVag72UR/IANjNUFjWnxKUFa2xJfHMgtHYAa72edQ70WjcCD2fna0kIo
	tF8sDPXrIm+BMzAfgP90Neu28tliK2AVCg8nktiXI6i4wb5kokSKKnFNfBXph3+3jQ4Uxw/f/vx
	R8MJEFQE4rD19fA53eznI58DPFtCpBg3Z6kex3CXaIHPm7fIZtNuZ2zEWXeEk+CjE5MWkiFhZ0O
	OaGThzidL0WVZ+wrZUdPor42YI4pLqj1toRCpsQ65MpFrVyo4SrTeE73/7nmLqD7PJAkIq16aj5
	ZSGvnrr/K48e/
X-Received: by 2002:a05:6a00:1254:b0:881:5dcb:400e with SMTP id
 d2e1a72fcca58-88af6d24f34mr727169b3a.56.1790888767004; Thu, 01 Oct 2026
 14:06:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790088067.git.rrobaina@redhat.com>
In-Reply-To: <cover.1790088067.git.rrobaina@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 1 Oct 2026 17:05:54 -0400
X-Gm-Features: AclHuK923qNeclwyxHc-N96rTW9f--kU_8IWc_3FVDcJfFTXqnWMr4asd_Mjppw
Message-ID: <CAHC9VhQ=FFYVNmQdiMsqg+5KDDrSC3SZS+H2=r_GkhfwQox8tg@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] audit: log all six syscall arguments in the
 SYSCALL record
To: Ricardo Robaina <rrobaina@redhat.com>
Cc: audit@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, bpf@vger.kernel.org, eparis@redhat.com, 
	sgrubb@redhat.com, oleg@redhat.com, richard.henderson@linaro.org, 
	mattst88@gmail.com, linmag7@gmail.com, linux@armlinux.org.uk, 
	catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, monstr@monstr.eu, 
	tsbogend@alpha.franken.de, jonas@southpole.se, 
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, chris@zankel.net, 
	jcmvbkbc@gmail.com, tglx@kernel.org, peterz@infradead.org, luto@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 3:21=E2=80=AFPM Ricardo Robaina <rrobaina@redhat.co=
m> wrote:
>
> The SYSCALL record currently logs only four of the six syscall
> arguments (a0-a3), silently discarding the remaining two. This
> leads to the need for auxiliary records when audit-relevant
> data lands in the 5th or 6th argument of a syscall.
>
> This series extends the SYSCALL record to log all six arguments,
> by adding arguments a4 and a5 inline within the existing record.

Thanks Ricardo, this looks great!

There are a few things in some of the individual patches which I reply
to in a minute, but there are a couple of "global" things that I
wanted to mention:

* As pointed out by Sashiko, when you were converting all of the
arches, it looks like you missed alpha.  I took a quick look and it
appears that it should be a pretty straightforward conversion like
most of the others.

* We need to get ACKs from all the various arch maintainers.  Aside
from the parisc changes all of your arch specific patches are trivial
(and cleaner than the existing code IMO) so I don't expect anyone to
complain, but getting ACKs will likely take some time.  Even the
parisc patches aren't that bad, and arguably they fix a problem for
seccomp so that should make asking for ACKs easier :)

Since I expect chasing down all the various maintainers for ACKs will
take a little while, and I'd like to start getting this patchset some
basic testing, I'm going to merge it into dev-staging now.  While the
dev-staging branch doesn't feed into linux-next (this isn't likely to
land in the next merge window) it is one of the branches that gets
tested automatically and included in my kernel-secnext RPM builds.
This also means you won't need to worry about keeping this patchset
up-to-date with rebasing, as I rebase dev-staging as needed (it
intentionally isn't a stable branch).  Going forward, if there are any
minor changes to this patchset, e.g. a few line change in one of two
patches, please just send a fixup patchset based against
audit/dev-staging and I'll squash it into the relevant patch in the
series.  However, in the unlikely event that a major rewrite is
needed, just send a new patchset ... but I'll be very surprised if
that happens here :)

--=20
paul-moore.com
