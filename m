Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210D63A8FE1
	for <linux-csky@vger.kernel.org>; Mon, 15 Jun 2026 08:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781513954; cv=pass; b=J4ceHO5JNnCGVEGPt3jyv7chB7oX/GPp+2xoE056TbtvCvztVze4nwETbQ420aCMYhplBPsiBO68fwP9cTme2nrply223e5Ee/6hJWiWk05E5+IUPOEtMoysNnBhyoAAwF3UnBLKhfKRVegYSp9aRbziy4twkpsgWPVHhiTxIRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781513954; c=relaxed/simple;
	bh=3uLVh43MeaP/ToUiQMCv2JgfyNZn1d/el+2GVwJlQfo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=pR+UBn4Vv492CMgbAldYze8UTYIFD2eZ1VfRu6ThBa+ozuCE28dqFlaTneL890yLTSYKhWZVkG4uVOXo0+q8gVqrhCyE6ZAFUa9gHKfpdRdXHz9JaqLnxQcB12HDBkgZOc/SGf0csJb+oSbRyQNAUE9kgN8VugGUqDV3cztB2GM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWdttlXI; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWdttlXI"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6608c1a4215so3195664d50.0
        for <linux-csky@vger.kernel.org>; Mon, 15 Jun 2026 01:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781513952; cv=none;
        d=google.com; s=arc-20240605;
        b=ZnPF3Ab7puZpmEevvcckyb8oWWVuO7I2p1Vi+gin6H8FgnXMcBaWX0E0wjffr7LeVa
         DYVwH13nkdowdyj53+nJHnEwfjh2acCu7LRU3zSnZORKKPLTi4MeLkznLCZhIiZInCJ1
         0a7Q77mn2W3x65xk6X5gWhuITI9Zrbgeat27py8IoI3rrRjGDQrWqRtVhDKk67YCAGqQ
         xM7ScIThltOlf9pX9HX+ThvjJ8xtYF2+OQx22vrh0EpxajcAN6CXLai1kp4fhwmOvIGM
         xwxbCdAcj+UMQVXuI4qpp20oA7XJXIqVklmtjsI8fDU21BBMn9rh02f8BSyaN+M188LN
         x/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=1+H6IWpwBFR1bCnVfBMu9KvYIxI1pJ73NKip5KNo1PE=;
        fh=dC7PvDje+JbW1FlJ+pr5jG0rDjSjLwzg9cEgzHzmdHE=;
        b=awZLcp04935DKyNlMZU9oMa4iyNfdL1OKupFy+TbsdSvYnYRZh5F+62raKb3uzV4iw
         AOu4yalOZzr+VMqbg426vUnTOMr5NAPRl2O3DFSVVekgsbUmfcRdYn0rcLxXPf1IBvTA
         y+gGGOKoZcTa64zHc6dUEpPhMsifklV3AwZQ4lFqGepuiCgcNDdkYKhgiyWA7R4W3rOt
         SelrgqmcgS+XIPfQ6S/wYY6fAN5e3XJKEUveF2dpv0eP5PA2i4cVVNpe7cUeEq8SAzH8
         MDgFCDlCiyszq1u4hj5JU1EcXlB9L8qJWIIk7azCmdktqFcKqz8pj7idworEspJMQAcZ
         V9zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781513952; x=1782118752; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1+H6IWpwBFR1bCnVfBMu9KvYIxI1pJ73NKip5KNo1PE=;
        b=cWdttlXIJhQSKOUM1CltDCPkTbKS1/54lFkRz1PcWcAuTxKVj6CmEUrgfgOwWHSGeF
         SC7PURx2m/fiJ9TXOddnCEhccXMmAuRnOx4wjoSfIJCGTHqJYHMJI5/pZSNubTFwS8cH
         3kUovpjsJB19hu/0CU0YbLp9JPdlO3CfYozmTQhSOHchRc9Q2UTcueafBbslkpHYY1n3
         YOYwBl762WdRyFK0X9BmH9MrhEJ48nUz5R9zS4pAIj2cq/mD5UADBC8v/tTznc/vj398
         L/sERDeiiQC4AMvQmmtuhy3uQxX7/zIHwcQ3cIwOgA6+MSJzO7xegWD/u+DG6XOVNzl1
         eDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781513952; x=1782118752;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1+H6IWpwBFR1bCnVfBMu9KvYIxI1pJ73NKip5KNo1PE=;
        b=RX+0gnzIfe4fut/YhNdI/xwccsAiRUCdVeMUxu5tjF2UM5M3zHeDHE4PLwXMT7hmF1
         7vpfujhc7zqn6zWquqUWZGHaFagGlBClM7mSMAK/g9pTHipz6mHDtNGFt+I3MTcqN2Jr
         W7rQF+JoTnfa467q6y7/jyZNVc96e8XikMUoO3NxY1+aAyNYDoApPbXVJn0qi0+UG/GL
         Yt3aEKoRV+zZ2tiD08cKnqMwovsRcpdW9d13B3qP5x9f7recjSm6BA/b/UxsmUm+ETTN
         Iuc525IYJdEvaRxhf0bks5lqAlzNU56Zf+9TUIJcBRVo9UCwZrhBAvpPvCK5hnP2aslO
         PwyQ==
X-Gm-Message-State: AOJu0Yzt/dm+J9wOp6Uf+AX4SqoC1SxqxmnbtfAuQmmPZPrS0c6i3KW8
	NqXc0BaRdexxRTt5wc/6qmlIlv7XkJUc3tzE0JKDzsEbzN8nLhFhUGhhXy5yawHq1/1FQd3MUSa
	Pmmmeoiz4FEbWoObI/D0GmUbsujmnTGJZn/Ehd6Y=
X-Gm-Gg: Acq92OEocvTGUyiXjN9Jr81sf+pgO2NjueHbxHjjjJf/Gu0tWJcyDCBxeD1I6DTVsyG
	t0AKSaH2q5AQx/K2hXC6RoWumaW3OAtrHVvS/BED0JoNEphd+vWIlg16P09rGxoYD3536DsenZa
	NP84eALfvoSptYlDMY+wVYm5qtnDKkT4xWVM0BszFRMgVOvxFNhmcucmQo7cqcFkHVYChIkoOlT
	Uc6refsuB2S4ESFGeMEdp6Q/SRkFWsVGZp8BI8kx0LXhI1nCbQ1arW40nrBDsCFeCMwoN6sKuv7
	acdKRJo=
X-Received: by 2002:a05:690e:13cd:b0:660:529f:76c2 with SMTP id
 956f58d0204a3-6627691f001mr8369482d50.8.1781513951992; Mon, 15 Jun 2026
 01:59:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: h calabash <gavincodegk@gmail.com>
Date: Mon, 15 Jun 2026 16:58:59 +0800
X-Gm-Features: AVVi8CffnpjSM818MEQpwqFfvjlo3v6uBhHRQy0eTQp0jBrHFH6bgJ7CQp7sqXw
Message-ID: <CAKNjZJ+-6ra=U_w+Aod6XkyiRz_Dxwoa3S=JwSfLPEHBCfxhwA@mail.gmail.com>
Subject: [PATCH] csky: fix initrd setup for initrd= command line parameter
To: guoren@kernel.org
Cc: linux-csky@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000045f72e0654470ad9"

--00000000000045f72e0654470ad9
Content-Type: multipart/alternative; boundary="00000000000045f72c0654470ad7"

--00000000000045f72c0654470ad7
Content-Type: text/plain; charset="UTF-8"

Hi Guo Ren and C-SKY maintainers,

The generic early_param("initrd") handler in init/do_mounts_initrd.c
records physical initrd location in phys_initrd_start/phys_initrd_size.
On C-SKY, setup_initrd() only checked initrd_start/end, which are not
populated from the command line when initrd= is passed via bootargs.
As a result, initrd= was effectively ignored.

This patch converts phys_initrd_* to virtual addresses using __va(),
similar to ARC and reserve_initrd_mem().

Testing (kd5886 vendor platform, private, not for upstream):
- Kernel: Linux 4.9.56-based BSP with CONFIG_BLK_DEV_INITRD=y and
  CONFIG_CSKY_BUILTIN_DTB disabled; external DTB passed from U-Boot
- Boot method: U-Boot TFTP loads kd5886_evb_rgmii.dtb, uImage, and
  rootfs.squashfs into DDR
- /chosen/bootargs in DTB:
    console=ttyS0,115200 loglevel=8 root=/dev/ram0
    initrd=0x12000000,0x54000
- rootfs.squashfs (344064 bytes) loaded to physical address 0x12000000
  (virtual 0x92000000 via KSEG0 mapping)

Observed kernel log:
- Kernel command line: ... root=/dev/ram0 initrd=0x12000000,0x54000
- "Freeing initrd memory: 336k freed"
- "RAMDISK: squashfs filesystem found at block 0"
- "VFS: Mounted root (squashfs filesystem) readonly on device 1:0"
- Userspace application started successfully

Thanks,
gavin-Angry-Birds <gavincodegk@gmail.com>

--00000000000045f72c0654470ad7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Guo Ren and C-SKY maintainers,<br><br>The generic early=
_param(&quot;initrd&quot;) handler in init/do_mounts_initrd.c<br>records ph=
ysical initrd location in phys_initrd_start/phys_initrd_size.<br>On C-SKY, =
setup_initrd() only checked initrd_start/end, which are not<br>populated fr=
om the command line when initrd=3D is passed via bootargs.<br>As a result, =
initrd=3D was effectively ignored.<br><br>This patch converts phys_initrd_*=
 to virtual addresses using __va(),<br>similar to ARC and reserve_initrd_me=
m().<br><br>Testing (kd5886 vendor platform, private, not for upstream):<br=
>- Kernel: Linux 4.9.56-based BSP with CONFIG_BLK_DEV_INITRD=3Dy and<br>=C2=
=A0 CONFIG_CSKY_BUILTIN_DTB disabled; external DTB passed from U-Boot<br>- =
Boot method: U-Boot TFTP loads kd5886_evb_rgmii.dtb, uImage, and<br>=C2=A0 =
rootfs.squashfs into DDR<br>- /chosen/bootargs in DTB:<br>=C2=A0 =C2=A0 con=
sole=3DttyS0,115200 loglevel=3D8 root=3D/dev/ram0<br>=C2=A0 =C2=A0 initrd=
=3D0x12000000,0x54000<br>- rootfs.squashfs (344064 bytes) loaded to physica=
l address 0x12000000<br>=C2=A0 (virtual 0x92000000 via KSEG0 mapping)<br><b=
r>Observed kernel log:<br>- Kernel command line: ... root=3D/dev/ram0 initr=
d=3D0x12000000,0x54000<br>- &quot;Freeing initrd memory: 336k freed&quot;<b=
r>- &quot;RAMDISK: squashfs filesystem found at block 0&quot;<br>- &quot;VF=
S: Mounted root (squashfs filesystem) readonly on device 1:0&quot;<br>- Use=
rspace application started successfully<br><br>Thanks,<br>gavin-Angry-Birds=
 &lt;<a href=3D"mailto:gavincodegk@gmail.com">gavincodegk@gmail.com</a>&gt;=
<br></div>

--00000000000045f72c0654470ad7--
--00000000000045f72e0654470ad9
Content-Type: application/octet-stream; 
	name="0001-csky-fix-initrd-setup-for-initrd-command-line-parame.patch"
Content-Disposition: attachment; 
	filename="0001-csky-fix-initrd-setup-for-initrd-command-line-parame.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mqez6rqd0>
X-Attachment-Id: f_mqez6rqd0

RnJvbSA0YTUzOTk2ZDQ5MDRkYTY0ZDFmMDIyYjU2NWFkZDdlOWUxZDJjMDM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBnYXZpbi1BbmdyeS1CaXJkcyA8Z2F2aW5jb2RlZ2tAZ21haWwu
Y29tPgpEYXRlOiBNb24sIDE1IEp1biAyMDI2IDE2OjQ3OjI1ICswODAwClN1YmplY3Q6IFtQQVRD
SF0gY3NreTogZml4IGluaXRyZCBzZXR1cCBmb3IgaW5pdHJkPSBjb21tYW5kIGxpbmUgcGFyYW1l
dGVyCgpUaGUgZ2VuZXJpYyBlYXJseV9wYXJhbSgiaW5pdHJkIikgaGFuZGxlciByZWNvcmRzIHBo
eXNpY2FsIGluaXRyZApsb2NhdGlvbiBpbiBwaHlzX2luaXRyZF9zdGFydC9waHlzX2luaXRyZF9z
aXplLiAgQy1TS1kgc2V0dXBfaW5pdHJkKCkKb25seSBjaGVja2VkIGluaXRyZF9zdGFydC9lbmQs
IHdoaWNoIGFyZSBub3QgcG9wdWxhdGVkIGZyb20gdGhlCmNvbW1hbmQgbGluZSwgc28gaW5pdHJk
PSB3YXMgZWZmZWN0aXZlbHkgaWdub3JlZC4KCkNvbnZlcnQgcGh5c19pbml0cmRfKiB0byB2aXJ0
dWFsIGFkZHJlc3NlcyB3aXRoIF9fdmEoKSwgc2ltaWxhciB0bwpBUkMgYW5kIHJlc2VydmVfaW5p
dHJkX21lbSgpLgoKVGVzdGVkIG9uIGtkNTg4NiB2ZW5kb3IgcGxhdGZvcm0gKHByaXZhdGUsIG5v
dCBmb3IgdXBzdHJlYW0pOgotIEV4dGVybmFsIERUQiB3aXRoIC9jaG9zZW4vYm9vdGFyZ3MgY29u
dGFpbmluZwogIGluaXRyZD0weDEyMDAwMDAwLDB4NTQwMDAgYW5kIHJvb3Q9L2Rldi9yYW0wCi0g
cm9vdGZzLnNxdWFzaGZzICgzNDQwNjQgYnl0ZXMpIGxvYWRlZCB2aWEgVEZUUCB0byBwaHlzaWNh
bCAweDEyMDAwMDAwCi0gS2VybmVsIGNvbW1hbmQgbGluZSBwYXJzZWQgY29ycmVjdGx5OyAiRnJl
ZWluZyBpbml0cmQgbWVtb3J5OiAzMzZrCiAgZnJlZWQiOyBzcXVhc2hmcyByb290IG1vdW50ZWQg
b24gL2Rldi9yYW0wOyB1c2Vyc3BhY2UgcmVhY2hlZAoKU2lnbmVkLW9mZi1ieTogZ2F2aW4tQW5n
cnktQmlyZHMgPGdhdmluY29kZWdrQGdtYWlsLmNvbT4KLS0tCiBhcmNoL2Nza3kva2VybmVsL3Nl
dHVwLmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9hcmNoL2Nza3kva2VybmVsL3NldHVwLmMgYi9hcmNoL2Nza3kva2VybmVsL3NldHVw
LmMKaW5kZXggNDVjOThkY2Y3ZjUwLi5hNDkwZmYyYzIwYjUgMTAwNjQ0Ci0tLSBhL2FyY2gvY3Nr
eS9rZXJuZWwvc2V0dXAuYworKysgYi9hcmNoL2Nza3kva2VybmVsL3NldHVwLmMKQEAgLTgsNiAr
OCw3IEBACiAjaW5jbHVkZSA8bGludXgvb2ZfZmR0Lmg+CiAjaW5jbHVkZSA8bGludXgvc3RhcnRf
a2VybmVsLmg+CiAjaW5jbHVkZSA8bGludXgvZG1hLW1hcC1vcHMuaD4KKyNpbmNsdWRlIDxhc20v
cGFnZS5oPgogI2luY2x1ZGUgPGFzbS9zZWN0aW9ucy5oPgogI2luY2x1ZGUgPGFzbS9tbXVfY29u
dGV4dC5oPgogI2luY2x1ZGUgPGFzbS9wZ2FsbG9jLmg+CkBAIC0xNyw2ICsxOCwxMiBAQCBzdGF0
aWMgdm9pZCBfX2luaXQgc2V0dXBfaW5pdHJkKHZvaWQpCiB7CiAJdW5zaWduZWQgbG9uZyBzaXpl
OwogCisJLyogaW5pdHJkPSBvbiB0aGUgY29tbWFuZCBsaW5lIHNwZWNpZmllcyBwaHlzaWNhbCBh
ZGRyZXNzZXMgKi8KKwlpZiAocGh5c19pbml0cmRfc2l6ZSkgeworCQlpbml0cmRfc3RhcnQgPSAo
dW5zaWduZWQgbG9uZylfX3ZhKHBoeXNfaW5pdHJkX3N0YXJ0KTsKKwkJaW5pdHJkX2VuZCA9IGlu
aXRyZF9zdGFydCArIHBoeXNfaW5pdHJkX3NpemU7CisJfQorCiAJaWYgKGluaXRyZF9zdGFydCA+
PSBpbml0cmRfZW5kKSB7CiAJCXByX2VycigiaW5pdHJkIG5vdCBmb3VuZCBvciBlbXB0eSIpOwog
CQlnb3RvIGRpc2FibGU7Ci0tIAoyLjUwLjEgKEFwcGxlIEdpdC0xNTUpCgo=
--00000000000045f72e0654470ad9--
