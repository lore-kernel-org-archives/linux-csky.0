Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5F446AEE1
	for <linux-csky@vger.kernel.org>; Tue, 14 Jul 2026 12:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784032470; cv=none; b=AdyTvj+zXpRFQQj8+2OkGTws4eodJiyvc3mWrFS3m1qvrMniJuvGYG22omgbVDIvec3qniHLCz6usyCo0/AxtNvxfJMAD0aUCAfi+kxs9y65UaMIESn84uov86WONRU6yEuteIoKLapODVBrK5NIi6VkwMz+uZcUlN/mkD3Lb38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784032470; c=relaxed/simple;
	bh=WegHpjcb2vagWqLjN3VnSMlDf7mDmA8mmd3Rp43fqxk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VQRCNn4a/w4bVkhrM7cK5J5uJACFe+/a+nOFLlJeQawtl+ynUd4s9TBZlt/oBCo+uyIB0EMMmKNo2sJ4K94YdfCdUJqrZsObjPmc8BQKMOD/Ly0zE/6rD9V4jgOihJKjwKtnI0hzRaFiBllKbZT1J6tnFsrZSoXzEbB6EJVkONc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYjlWK1u; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYjlWK1u"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4798bea72f9so2307197f8f.1
        for <linux-csky@vger.kernel.org>; Tue, 14 Jul 2026 05:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784032459; x=1784637259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CcC3mXhC9vFPxE1TVGprdVmvuMWQZA/m1vfAGdGaT0s=;
        b=lYjlWK1u9qTN9m59IOgLZFFl6A3QUAJm3hdoEWMcd5UKeeBoShkzCviu2smy4APX3v
         NN5AZkPK1ppnlJXxGIYtb3uSBTUAc0B+wayHesZpCBe4jytJPUY+BljPijmMgpcegPIF
         PXKSWEOW3ErIiWzcHUW6W3XWuMiWkNtznHfjgl+Ze5WjS7p75CkTtBEUjZ7eYYEb4WVe
         t/wLiAqhA+bcnEt3jwXlx9rr7iFDZTXx8m0oTcDew40YJPRuD5W9kS9Gacv+xSLvl4Q5
         oTVGJsu9IQsI31fiS/t7+SgCqd9JTLWr2IMEoMEi7hVerkpv7kPlwAdXOuOq2N56iugM
         Hrfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784032459; x=1784637259;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CcC3mXhC9vFPxE1TVGprdVmvuMWQZA/m1vfAGdGaT0s=;
        b=DI1a1Du4xYHwIgck93bYucfb3pqSW9xfj3nJuH+TLHa41sfz/eV9AlS4fyiPouI9+L
         lssW28UX1/OcEYi8kKlo5ALwr/8AW72cf2fDh4tCVZ17NgL7O2g5VwgZsOglQex7+Q1a
         6FEkvtVOQIN6LhP0FszDYvZbb41UYrK4SM9RzdQkDwYcStZKi8uP7tJVgyr3EMvRDuuf
         uxwuMOBKZryQC9lhvRMr6t46EplDXPTb4n03brk/F4zvt4iJ1yufdFQyXg4rRRr39QVW
         1gfSGUgZlTNrt9NJMT3APP1Yk7CYpfAzswpDxzhq0nP6QxAB7SdvoGT5L0L7iTJM5P2H
         F3bg==
X-Forwarded-Encrypted: i=1; AHgh+RqaIqlmPPHAe0eZE8px2IQDosqiifPK7ReC9tFoo2BkJJGN/5nHYbokQlqhslAEVtA8Z1Hw9XJc2VJd@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj/u9jDCR0UM0FmprHAdz6l7/1m3Xvv1IpSaMDN58z3Q5sUvcy
	k/mSXs0UpiBY+4W4aOmVuUVfYUVlZH6ZHpaugQt/MDjsdFyfkiRleAVH
X-Gm-Gg: AfdE7ckBZ3p4r+vsoNGc/aPSNevfQqB6Ug6aJqbJYJV9ISeMQhSchIuSPXuuiBWVcbE
	1QWwJCpjdgAu4iithKZwUiXl/qGkbvGYXBra6mBwhZyQ2SfEll7mGpKSUYPPI02IRnx2HHtjvDg
	q+tB7ErRg8nZchnrl2YK4Sr81OJ1nOstOxEzJS1tvzUY4/LU/pRKbq5feSE6LQFsi4I26FZGFSE
	MMPLm50sfUJ4EbLhZTHbGboNeK9nmtSNtekjSF8QZKu8jKUdyXRTSJ5/NMlKnm0tBz3Ryq45HI5
	A6Zax3yJTuvcEWX8GEvK+kynm7I1Ru8sgvYio5BFrqW18/+IjOQnu8DBkrmkpUmgh9uN+SoaMbh
	8Dst7Tycivq9nblKJ+BHNBmsb8CWe2c9XIf8YqCG9l3+QaPBsXf29qA8THgIX8Rjt1DHS4YT3BO
	TuDLtjuGI8H2yUsC1HuZ80V4pWiBVtLP3HiX6vlXYwgONT14rBlfklb1asUfJR
X-Received: by 2002:a05:6000:4903:b0:47e:9d58:3b4e with SMTP id ffacd0b85a97d-47f4887f947mr2511343f8f.24.1784032458400;
        Tue, 14 Jul 2026 05:34:18 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c1f84sm8103524f8f.29.2026.07.14.05.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:34:18 -0700 (PDT)
Date: Tue, 14 Jul 2026 13:34:15 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-arch@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, linux-csky@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
 david@kernel.org, linux@armlinux.org.uk, akpm@linux-foundation.org,
 ankur.a.arora@oracle.com, rppt@kernel.org, linmag7@gmail.com,
 chleroy@kernel.org, klarasmodin@gmail.com, chenhuacai@kernel.org,
 kernel@xen0n.name, kas@kernel.org, zhangtianyang@loongson.cn,
 wangyuli@aosc.io, tsbogend@alpha.franken.de, ljs@kernel.org, jgg@ziepe.ca,
 catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
 ryan.roberts@arm.com, pasha.tatashin@soleen.com, rmclure@linux.ibm.com,
 baolin.wang@linux.alibaba.com, tj@kernel.org, kevin.brodsky@arm.com,
 anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 tglx@kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 hannes@cmpxchg.org, mhocko@kernel.org, qi.zheng@linux.dev,
 shakeel.butt@linux.dev, kasong@tencent.com, baohua@kernel.org,
 axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, vincenzo.frascino@arm.com, anshuman.khandual@arm.com,
 yang@os.amperecomputing.com, chaitanyas.prakash@arm.com, ardb@kernel.org,
 guoren@kernel.org, yang.li85200@gmail.com, viro@zeniv.linux.org.uk,
 dinguyen@kernel.org, schuster.simon@siemens-energy.com,
 wangruikang@iscas.ac.cn, junhui.liu@pigmoral.tech, muchun.song@linux.dev,
 vishal.moola@gmail.com, namcao@linutronix.de, pavel@kernel.org,
 djbw@kernel.org, yu-cheng.yu@intel.com, baolu.lu@linux.intel.com,
 Jonathan.Cameron@huawei.com, coxu@redhat.com, andreas@gaisler.com,
 liam@infradead.org, vbabka@kernel.org, surenb@google.com, mhocko@suse.com,
 geert@linux-m68k.org, shorne@gmail.com, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi
Subject: Re: [RFC PATCH 02/34] ARM: mm: make 2-level pgd_t a scalar
Message-ID: <20260714133415.78e25654@pumpkin>
In-Reply-To: <20260713135614.1618183-3-yeoreum.yun@arm.com>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
	<20260713135614.1618183-3-yeoreum.yun@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 13 Jul 2026 14:55:41 +0100
Yeoreum Yun <yeoreum.yun@arm.com> wrote:

> From: "David Hildenbrand (Arm)" <david@kernel.org>
> 
> We don't want pgd_t to be an array, as it prohibits returning it from a
> function, like pgdp_get().

If you use a two element structure the compiler/ABI might be able to
return that from a function in two registers.
That might make the entire mess more readable ...

	David
