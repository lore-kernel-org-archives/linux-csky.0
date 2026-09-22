Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC19B54EEAD
	for <linux-csky@vger.kernel.org>; Tue, 22 Sep 2026 14:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089140; cv=none; b=FglvRouAIygtAQVWW/71Vmb5HAs6W14j8o+opXJSdatVWXSDGn9wAwoofzsngq7C5ImVgMX9RkQLtcaJE2kTqx+x6K5a8/AbI6jQBooWeO7zlM2y8EYbhtLRhLo2feS4eQ67KK019ZF201Ui0ehQ+tPvyMQau2C2wvmIkRPzjkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089140; c=relaxed/simple;
	bh=Xcv6XqGr8GRDrZTYE+bcfGYsESnoIwDYOn1wqnCy4NA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kEaQrTCHC/zDNUOSMmSkYBG8woxtPSLKJQxWYyZPT8V20mnzWhjQxZcHPMrOZNzo2RY3b3jDJDKxTBc0qJFWncwTTP/O0/xbP4syYlhKDH1d+iZzDjHLI8494L8FcxioTichHPJQGI2wiuOABkVTuHTGqdXDQkZI+Fx0ye8er4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9vpbU/G; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9vpbU/G"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85a4329731cso3399189b3a.3
        for <linux-csky@vger.kernel.org>; Tue, 22 Sep 2026 07:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790089138; x=1790693938; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GBsYZYC2tty9xsMubEGxI75zG2Y/0N6IAo5rsTEyC18=;
        b=P9vpbU/GKY22GSz+f0k3PPTLbtIEa1DRbrDXoeJrdM4jONBG2jsqCMs+6DtAQ6bzS+
         uktvirJHaQKj9zrUgPwYJkJICqlWWTsFXlvQHpByKLnKZtL2eIoAEQWEWxstultGQfOd
         eXf4DZyXrXwDK3PbO3iu936rnFq4pjkyuiTXDA19gz/iK7qLP+cOLx6d+QeP7DgpZnMS
         gz0YDKLTfGq8oLtscpfbnvn6HU84bsFr82Wf2TVvcFvgtcfpK2d359LJEf9XyQNXplkU
         FSP3W/HQ2bTH21U8ytVcHY2ZBJLnrr/I9CJWFP3GdRqag++3uPSZybjN0A33mRu0nAQB
         sDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790089138; x=1790693938;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GBsYZYC2tty9xsMubEGxI75zG2Y/0N6IAo5rsTEyC18=;
        b=qPqL9lWAwAEnyWvXl41PiM0YpfZNLHQsPk3Rakb2s3ZI8+VgdT3rrs4T3PotAQjhCL
         1XSHSAhzsTqM0L7E+iGoXxnFhRGU4w8qATflGLwVYjGeORE2zCb+geEmSEtBC5sTd+dW
         QY8ILFzkwpxtzvgBfmQlLPnZxfo6dn/ZtdaxceAxrl4FoKjkJkTKF4sOa8MGGGB8kj7K
         dEpVTW7oAVq3nwASdz3vsWXu0x/0154io9pFVE9apt41B7KkZ9/KFvlmEBmpXaP3V9zw
         sh52HDBq3suxXyKeAWcAulRUzye5GB+Ph7JHLMnMi5Rwx3BtGNIKnQ/0ZI/YhF9M63JN
         7TKg==
X-Forwarded-Encrypted: i=1; AKwUvByl4fCzwQ7goEwccEhwq6jPZ4+zVaY8ii0dmtKqJxFjZCdPCBkSqtPOUyvFuEG54g9D4qK99wcjcF1T@vger.kernel.org
X-Gm-Message-State: AFuF++m8X8NIEGMeryVKoGY3UzKmV2PMIhlko9xT84PXa0LfZwN2BtP2
	UrsHMN3kgKaSSkHQKAja1vN65xfocTVR3yjAv5UHqGpIGaU/GXzyh2Gn
X-Gm-Gg: AYBFou2fD18Rd4UjDPwd7iPk+hVoSWf/SRo+ICd7VatbnFyxW2hnJCbZHOqyCKj3t4q
	nuMXShMfSfPKkNzMVryirLXm6VOOAzAkGaLJ0qUhzwcpwfloDy3JD2toTtR5izea8tZ/p93f/+d
	z2wxRZ3HPszFJtpY5PLUaRHZ12JN5TnFF8VcRKSJwCb0q6R3OU69gNMb2Wt6nFR4Y3Y7d1OuzSc
	dKPvA0k9q4DBRp+caBTayM3HF28lN1SiEXMtZnMAPEH7QYJVOPq21G6EtQmhMQSkD0mM1wKdZiJ
	vLuZoLGMn79pzY8Ifh5NHpQJTWrKebayAs20qlM2t7OTOxyDTg3EP2Nd3R10/UcBKJp8bX1GaBF
	zVxkaDUaMeJloHo6zwE+VtKW37M5UttBQSB9J5PaAaLf03nSfJoAso0MkuR84tk4/jXJe5EDv8h
	WOT9MRahIfGmmjfoMw+qScwCWqLacPvVYcPLl1mCLEpQhDr505FrNQZLBB+T4LhcLKb3LevBCzC
	XhUMzFbdl3i
X-Received: by 2002:a05:6a00:8085:b0:874:708d:b620 with SMTP id d2e1a72fcca58-87c8403d93amr1485976b3a.30.1790089137920;
        Tue, 22 Sep 2026 07:58:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87c31ee8fb4sm1046216b3a.12.2026.09.22.07.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:58:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 22 Sep 2026 07:58:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marco Elver <elver@google.com>
Cc: Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Bill Wendling <morbo@google.com>,
	David Hildenbrand <david@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, Jann Horn <jannh@google.com>,
	Justin Stitt <justinstitt@google.com>,
	KP Singh <kpsingh@kernel.org>, Kees Cook <kees@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Matteo Rizzo <matteorizzo@google.com>,
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-hardening@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>, Harry Yoo <harry@kernel.org>,
	Hao Li <hao.li@linux.dev>, "Liam R. Howlett" <liam@infradead.org>,
	Alexander Potapenko <glider@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	kasan-dev@googlegroups.com, llvm@lists.linux.dev,
	Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org
Subject: csky ICe (was: Re: [PATCH v4 2/3] slab: improve
 KMALLOC_PARTITION_RANDOM randomness)
Message-ID: <6106aefa-47c7-4bda-a51f-8a2fba3bf715@roeck-us.net>
References: <20260511200136.3201646-1-elver@google.com>
 <20260511200136.3201646-2-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511200136.3201646-2-elver@google.com>

Hi,

On Mon, May 11, 2026 at 10:00:49PM +0200, Marco Elver wrote:
> When using CONFIG_KMALLOC_PARTITION_RANDOM, _RET_IP_ was previously used
> to identify the allocation site. _RET_IP_, however, evaluates to the
> caller's parent's instruction pointer rather than the actual allocation
> site; this would lead to collisions where a function performs multiple
> allocations.
> 
> With the generalization to kmalloc_token_t, we now generate the token at
> the outermost macro, and using _THIS_IP_ would fix this for all cases.
> 
> Unfortunately, the generic implementation of _THIS_IP_ relies on taking
> the address of a local label, which is considered broken by both GCC [1]
> and Clang [2] because label addresses are only expected to be used with
> computed gotos. While the generic version more or less works today, it
> is known to be brittle. For example, Clang -O2 always returns 1 when
> this function is inlined:
> 
>         static inline unsigned long get_ip(void)
>         { return ({ __label__ __here; __here: (unsigned long)&&__here; }); }
> 
> To provide a reliable unique identifier without breaking architectures
> relying on the generic _THIS_IP_, introduce _CODE_LOCATION_: it resolves
> to _THIS_IP_ where architectures provide a safe implementation, and
> falls back to a zero-cost static marker where _THIS_IP_ is broken.
> 
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120071 [1]
> Link: https://github.com/llvm/llvm-project/issues/138272 [2]
> Signed-off-by: Marco Elver <elver@google.com>

With this patch in the tree, I get ICE erors when trying to build
csky:allmodconfig.

Example:

Error log:
sound/core/oss/mixer_oss.c: In function 'snd_mixer_oss_proc_write':
sound/core/oss/mixer_oss.c:1202:1: error: could not split insn
 1202 | }
      | ^
(insn 183 400 184 (set (reg:SI 0 a0 [orig:307 _55 ] [307])
        (xor:SI (reg:SI 3 a3 [orig:308 random_kmalloc_seed ] [308])
            (const:SI (plus:SI (symbol_ref:SI ("*.LANCHOR0") [flags 0x182])
                    (const_int 132 [0x84]))))) "include/linux/slab.h":759:52 288 {cskyv2_xorsi3}
     (expr_list:REG_DEAD (reg:SI 3 a3 [orig:308 random_kmalloc_seed ] [308])
        (nil)))
during RTL pass: final
sound/core/oss/mixer_oss.c:1202:1: internal compiler error: in final_scan_insn_1, at final.cc:2813
0x779b51e2a1c9 __libc_start_call_main
	../sysdeps/nptl/libc_start_call_main.h:58
0x779b51e2a28a __libc_start_main_impl
	../csu/libc-start.c:360

This happens with lots of files, not just this one. It is seen with all
versions of gcc starting with at least v13.x. Reverting this patch fixes
the problem. Bisect log is attached for reference.

Any idea what I could do to avoid the problem other than stopping to build
csky:allmodconfig ?

Thanks,
Guenter

---
# bad: [93f51579e7df248780214094418f205253383cc5] Linux 7.3-rc4
# good: [7d0a66e4bb9081d75c82ec4957c50034cb0ea449] Linux 6.18
git bisect start 'HEAD' 'v6.18'
# good: [df8f6181ab57d65a99e61fcfc5be22a42df58642] Merge tag 'perf-tools-for-v7.1-2026-04-17' of git://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools
git bisect good df8f6181ab57d65a99e61fcfc5be22a42df58642
# bad: [093239070573637ad2b4cb56abc9c4c7ee109294] Merge tag 'v7.2-rc2' into togreg
git bisect bad 093239070573637ad2b4cb56abc9c4c7ee109294
# bad: [b85966adbf5de0668a815c6e3527f87e0c387fb4] Merge tag 'net-next-7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
git bisect bad b85966adbf5de0668a815c6e3527f87e0c387fb4
# good: [25447851777a53bd4b501e7f2cb418332ad584cc] Merge tag 'char-misc-7.1-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc
git bisect good 25447851777a53bd4b501e7f2cb418332ad584cc
# good: [bd77e50c9a70f844d6073499f3d1a6fd193eae73] Merge tag 'fbdev-for-7.2-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev
git bisect good bd77e50c9a70f844d6073499f3d1a6fd193eae73
# good: [972c4dd19cb92e03d75b66c426cfade07582a1ba] Merge tag 'wireless-next-2026-06-10' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next
git bisect good 972c4dd19cb92e03d75b66c426cfade07582a1ba
# bad: [9b40ba14edcdf70240af8114092a76f75f070774] Merge tag 'for-7.2/io_uring-20260615' of git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux
git bisect bad 9b40ba14edcdf70240af8114092a76f75f070774
# bad: [0d8c1134936f1fb6678156ab4248ac740d274525] Merge tag 'v7.2-p1' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6
git bisect bad 0d8c1134936f1fb6678156ab4248ac740d274525
# good: [42a58f08b70a7a320c168a1ce15e3fcfc8568708] crypto: atmel-sha204a - Use named initializers for struct i2c_device_id
git bisect good 42a58f08b70a7a320c168a1ce15e3fcfc8568708
# good: [2c1ccd9a1d786503086e83fe83e5c3b3c953b70e] docs: changes.rst: restore pahole 1.26 minimum (regressed by sort)
git bisect good 2c1ccd9a1d786503086e83fe83e5c3b3c953b70e
# bad: [f8115f0e8a0585ef1c03d07a68b989023097d16c] Merge tag 'slab-for-7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab
git bisect bad f8115f0e8a0585ef1c03d07a68b989023097d16c
# bad: [dfdfd58cce1c3f5df8733b64595448996c08e424] Merge branch 'slab/for-7.2/alloc_token' into slab/for-next
git bisect bad dfdfd58cce1c3f5df8733b64595448996c08e424
# good: [648927ceb84021a25a0fbd5673740956f318d534] mm/slab: do not limit zeroing to orig_size when only red zoning is enabled
git bisect good 648927ceb84021a25a0fbd5673740956f318d534
# good: [d196ea36a2f2118833ca648af53654553a4a1e7b] Merge branch 'slab/for-7.2/tools' into slab/for-next
git bisect good d196ea36a2f2118833ca648af53654553a4a1e7b
# bad: [e0f54249a491c62ef8196b9f13bd7d95dba47c6f] slab: fix kernel-docs for mm-api
git bisect bad e0f54249a491c62ef8196b9f13bd7d95dba47c6f
# bad: [0fc1bd38a19c108395d8338fb034f90c2d3fbe55] slab: improve KMALLOC_PARTITION_RANDOM randomness
git bisect bad 0fc1bd38a19c108395d8338fb034f90c2d3fbe55
# good: [feb662d9168b63e1d4c02671ec96005410c6f3ce] slab: support for compiler-assisted type-based slab cache partitioning
git bisect good feb662d9168b63e1d4c02671ec96005410c6f3ce
# first bad commit: [0fc1bd38a19c108395d8338fb034f90c2d3fbe55] slab: improve KMALLOC_PARTITION_RANDOM randomness
