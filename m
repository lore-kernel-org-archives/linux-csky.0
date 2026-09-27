Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D701331EA3
	for <linux-csky@vger.kernel.org>; Sun, 27 Sep 2026 02:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790475329; cv=none; b=qguC+VXqpZkSCkj8zpbmmfIX6tXO+osVIh4zsGi2HHenfG7NakTp08ixIZ0COL3v0ATwVl3ujtiDSjygsPyFRIyY55647/aA++8tqnjcAkOg4WkjQtfQdWPJXgwJ0xrcGKHA21BTQ++O7BZpKGOdL5nvshDkJEHP8w1upol+aUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790475329; c=relaxed/simple;
	bh=1TqcNzihamCzIKkgqFL5yhacEz1Pe3q8TEk+dS7wIB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gNVf1JI9is+IVUKXzpU3dE+Oha5bzY8tl7xYCsD50N9eKwyFxzDK/Q5VxYMoA41Ua8v0QH3hD9aILhkGBaMTzf1mX8hOwePJImyFR0dE1ZFS1qpuMSKuPiNk3Zfbo9sHeCoRdbnTVS/KsVcxdcK8Odpyf98AW2MetjR9xyJR+iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F11B1F00893
	for <linux-csky@vger.kernel.org>; Sun, 27 Sep 2026 02:15:25 +0000 (UTC)
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48882c1f2baso237782f8f.1
        for <linux-csky@vger.kernel.org>; Sat, 26 Sep 2026 19:15:25 -0700 (PDT)
X-Gm-Message-State: AFq9FYLRnExjIk2G+PIJw/puyZP1pOPoSdufH8Vd9UkrJgZPATLxEe9S
	IfEfl4UJVb5999OcARNEsdEDOhbau+u4GSK/ai42ovsRfCv1HZ8Ody5GoncFDD2iY7pBNhQIgNV
	rZUBjDvGTTa3QgVEgXIZYlg4cV9MCoFQ=
X-Received: by 2002:a05:6000:4808:b0:488:8568:bb02 with SMTP id
 ffacd0b85a97d-4888568bd1dmr6200290f8f.23.1790475324198; Sat, 26 Sep 2026
 19:15:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925115128.362186-1-elver@google.com>
In-Reply-To: <20260925115128.362186-1-elver@google.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 27 Sep 2026 10:15:11 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRr2pouJoj=NtofkCW1OgU08Jqoh2B8Guu=FheJMzEGyg@mail.gmail.com>
X-Gm-Features: AclHuK-zb0cQz4v0ljhPr4_-ItgQMT7BFiotF8YL8ggEhscXRlvydmuZ9NPvu_Y
Message-ID: <CAJF2gTRr2pouJoj=NtofkCW1OgU08Jqoh2B8Guu=FheJMzEGyg@mail.gmail.com>
Subject: Re: [PATCH] csky: Implement _THIS_IP_ using inline asm
To: Marco Elver <elver@google.com>
Cc: linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 7:51=E2=80=AFPM Marco Elver <elver@google.com> wrot=
e:
>
> Both GCC [1] and Clang [2] consider the generic version of _THIS_IP_ to
> be broken:
>
>         #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&=
__here; })
>
> In particular, the address of a label is only expected to be used with a
> computed goto.
>
> While the generic version more or less works today, it is known to be
> brittle and may break with current and future optimizations. For
> example, Clang -O2 always returns 1 when this function is inlined:
>
>         static inline unsigned long get_ip(void)
>         { return ({ __label__ __here; __here: (unsigned long)&&__here; })=
; }
>
> Fix it by overriding _THIS_IP_ in <asm/linkage.h> (which is included by
> <linux/instruction_pointer.h>) using an architecture-specific inline asm
> version.
>
> This also fixes this GCC ICE [3]:
>
> sound/core/oss/mixer_oss.c: In function 'snd_mixer_oss_proc_write':
> sound/core/oss/mixer_oss.c:1202:1: error: could not split insn
>  1202 | }
>       | ^
> (insn 183 400 184 (set (reg:SI 0 a0 [orig:307 _55 ] [307])
>         (xor:SI (reg:SI 3 a3 [orig:308 random_kmalloc_seed ] [308])
>             (const:SI (plus:SI (symbol_ref:SI ("*.LANCHOR0") [flags 0x182=
])
>                     (const_int 132 [0x84]))))) "include/linux/slab.h":759=
:52 288 {cskyv2_xorsi3}
>      (expr_list:REG_DEAD (reg:SI 3 a3 [orig:308 random_kmalloc_seed ] [30=
8])
>         (nil)))
> during RTL pass: final
> sound/core/oss/mixer_oss.c:1202:1: internal compiler error: in final_scan=
_insn_1, at final.cc:2813
> 0x779b51e2a1c9 __libc_start_call_main
>         ../sysdeps/nptl/libc_start_call_main.h:58
> 0x779b51e2a28a __libc_start_main_impl
>         ../csu/libc-start.c:360
>
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D120071 [1]
> Link: https://github.com/llvm/llvm-project/issues/138272 [2]
> Link: https://lore.kernel.org/all/6106aefa-47c7-4bda-a51f-8a2fba3bf715@ro=
eck-us.net/ [3]
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Marco Elver <elver@google.com>
> ---
>  arch/csky/include/asm/linkage.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 arch/csky/include/asm/linkage.h
>
> diff --git a/arch/csky/include/asm/linkage.h b/arch/csky/include/asm/link=
age.h
> new file mode 100644
> index 000000000000..04afd3583e25
> --- /dev/null
> +++ b/arch/csky/include/asm/linkage.h
> @@ -0,0 +1,7 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_CSKY_LINKAGE_H
> +#define __ASM_CSKY_LINKAGE_H
> +
> +#define _THIS_IP_ ({ unsigned long __ip; asm volatile("grs %0, ." : "=3D=
r" (__ip)); __ip; })

Yes, this is the right fix.

csky has always used the generic label-address _THIS_IP_.  That is
brittle, and on csky the compiler now crashes when that address is
folded into an immediate.  `grs rz, .` materializes the current
instruction address, so it is the correct replacement.

Acked-by: GUO Ren (XuanTie) <guoren@kernel.org>


> +
> +#endif /* __ASM_CSKY_LINKAGE_H */
> --
> 2.56.0.rc1.315.gc6ed9934b7-goog
>


--=20
Best Regards
 Guo Ren
