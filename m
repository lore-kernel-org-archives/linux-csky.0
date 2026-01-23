Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B7F2D5C97
	for <linux-csky@vger.kernel.org>; Fri, 23 Jan 2026 22:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769206949; cv=none; b=uxLN402gk9e1v8Sg9xwJeY39bW8Gw3GKYWLqgH2lflU3fGEcf/y8Guur5KrxjFCMt51nXmJ56y7FxPzex4o2Iy0C6ryLUhShyPnfsTNwpQ//LwFw3CJ1iBFBTc53ZNqh58Xj8Vr6XjrNnkWMMGdlS5vSrAmWrCZoUCCWH4op+xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769206949; c=relaxed/simple;
	bh=EkQnCI1q2pDYkyyeg8Nk3WtRPBP8LP0/xBc6aVriJtU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=qSYe7WeBGojwTFAIGcIG0ui9PEzK66/V4D7z22oF0n9bVrsmrNvTkOkOVPqLOvFllmQEQbUR+Lz4SpRAcVDegQplzR2qRAS1D7RVvcjZFWTafzw4TZ/+c/LOx5X8jXiGqcutanXVr3cVHXoEF5hxYO+GcJfOYUhsYxA39VDRrbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MOucuvzS; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MOucuvzS"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2b6f0b345e3so4339243eec.0
        for <linux-csky@vger.kernel.org>; Fri, 23 Jan 2026 14:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769206947; x=1769811747; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4oNTQ1SpPeomHkYYljia0MlXVcvHzoqRR2FSTzw2VhE=;
        b=MOucuvzSR+lz8hnVeqH3Vq9KyMGwVUGP6XD6pBkz60plKAkoPLb3sKhGIrqe/XQqAW
         098H3EOAmt3A0DMxawZEVmeC/dHT33SYTenfs9hSfEnp3Kvmty+VKBlDtEsNYNIzt2NY
         ZHjDX20Ou+vH0o8AkZDouI388dbrr3q1Q43uLyPvv83WNBZufaf2l6nOHSBJuUNyC3tS
         dI+YQeqBIjv/lM1GMW+MIU1/2yY3sv8oScOWHngvSigFRJfX7mH3PtOQRYimvtvpMGGD
         +jO+rUgPyYq90P2ZwVVGF4aiofqdKvHObwUm+bdv/Qh3nd+9PFcKeUwOdD/zxyDbaiDf
         wJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769206947; x=1769811747;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4oNTQ1SpPeomHkYYljia0MlXVcvHzoqRR2FSTzw2VhE=;
        b=T8wY/1lDZBE14lQCE4WIhNpnzjTE42nx/Wn/o47kYLI28HkULSGGfOO6WXK+6M7CKr
         uUS7PLnvlFjCE3f4n+Ij09CYwY4avY40FV5SSQ6lwHcWFvJjd0nCmEEtT7zb16+RTq6n
         +BWCX/s5+xar+h4AMTO44bkEVt6kENwbLQpsnIL8LMaCkSwV5FNPW1u6HcJ6uUGLkSs8
         OeW0rbdpF0wjE7flMGgGV4ygRf9yNUKJAjinCn+gcFp8uag24cnVOREIHOHV3HOmLfPv
         3DYGXTtPQUe458qc3X0Co/9Q08dd4Sy3nv8btC26JGsKOV9euBborsmmdy5YtUFoRon4
         Fq1g==
X-Forwarded-Encrypted: i=1; AJvYcCVOX+/zq7d1BD7gkZFhVYUunAAsml8v/4T77TOWndsB9pnKcMW0ls+7zlqxGORAeUBGgKt4+ZPRVK+w@vger.kernel.org
X-Gm-Message-State: AOJu0YyU6URTrBcrSPHU5HwH8pyatZj9mQYNl0nfQBNhTP3yXBvy/pPu
	A7tVSwOvRHtCR45/HiqmuMAQeNlNN9Y4LAbPEy2VhHVa4/BVa+RFFddNX2rECwj3WZwCGTrBCAz
	fWjiiSR0XgQ==
X-Received: from dycqb8.prod.google.com ([2002:a05:7300:fe88:b0:2b7:4519:63a4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:ef89:b0:2a4:3593:646a
 with SMTP id 5a478bee46e88-2b739b748d6mr2243173eec.26.1769206946998; Fri, 23
 Jan 2026 14:22:26 -0800 (PST)
Date: Fri, 23 Jan 2026 14:22:06 -0800
In-Reply-To: <20260123222209.1181249-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-csky@vger.kernel.org
List-Id: <linux-csky.vger.kernel.org>
List-Subscribe: <mailto:linux-csky+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-csky+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260123222209.1181249-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260123222209.1181249-2-irogers@google.com>
Subject: [PATCH v1 1/4] perf dso: Factor out e_machine reading for use in thread
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Guo Ren <guoren@kernel.org>, 
	Tianyou Li <tianyou.li@intel.com>, Athira Rajeev <atrajeev@linux.ibm.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Chun-Tse Shao <ctshao@google.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>, 
	Howard Chu <howardchu95@gmail.com>, Sergei Trofimovich <slyich@gmail.com>, 
	Shimin Guo <shimin.guo@skydio.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Factor out the resilient e_machine reading code in dso so that it may
be used in thread. As there is no dso in that case, make the dso
optional. This makes some minor other changes as the swap type from
the dso cannot be ascertained.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.c    | 110 ++++++++++++++++++++++++---------------
 tools/perf/util/dso.h    |  10 ++--
 tools/perf/util/thread.c |   5 +-
 3 files changed, 75 insertions(+), 50 deletions(-)

diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index 3b272a6fae24..91c9f7cb9d8c 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -1203,6 +1203,68 @@ ssize_t dso__data_read_offset(struct dso *dso, struct machine *machine,
 	return data_read_write_offset(dso, machine, offset, data, size, true);
 }
 
+static enum dso_swap_type dso_swap_type__from_elf_data(unsigned char eidata)
+{
+	static const unsigned int endian = 1;
+
+	switch (eidata) {
+	case ELFDATA2LSB:
+		/* We are big endian, DSO is little endian. */
+		return (*(unsigned char const *)&endian != 1) ? DSO_SWAP__YES : DSO_SWAP__NO;
+	case ELFDATA2MSB:
+		/* We are little endian, DSO is big endian. */
+		return (*(unsigned char const *)&endian != 0) ? DSO_SWAP__YES : DSO_SWAP__NO;
+	default:
+		return DSO_SWAP__UNSET;
+	}
+}
+
+/* Reads e_machine from fd, optionally caching data in dso. */
+uint16_t dso__read_e_machine(struct dso *optional_dso, int fd)
+{
+	uint16_t e_machine = EM_NONE;
+	unsigned char e_ident[EI_NIDENT];
+	enum dso_swap_type swap_type;
+
+	_Static_assert(offsetof(Elf32_Ehdr, e_ident) == 0, "Unexpected offset");
+	_Static_assert(offsetof(Elf64_Ehdr, e_ident) == 0, "Unexpected offset");
+	if (pread(fd, &e_ident, sizeof(e_ident), 0) != sizeof(e_ident))
+		return EM_NONE; // Read failed.
+
+	if (memcmp(e_ident, ELFMAG, SELFMAG) != 0)
+		return EM_NONE; // Not an ELF file.
+
+	if (e_ident[EI_CLASS] == ELFCLASSNONE || e_ident[EI_CLASS] >= ELFCLASSNUM)
+		return EM_NONE; // Bad ELF class (32 or 64-bit objects).
+
+	if (e_ident[EI_VERSION] != EV_CURRENT)
+		return EM_NONE; // Bad ELF version.
+
+	swap_type = dso_swap_type__from_elf_data(e_ident[EI_DATA]);
+	if (swap_type == DSO_SWAP__UNSET)
+		return EM_NONE; // Bad ELF data encoding.
+
+	/* Cache the need for swapping. */
+	if (optional_dso) {
+		assert(dso__needs_swap(optional_dso) == DSO_SWAP__UNSET ||
+		       dso__needs_swap(optional_dso) == swap_type);
+		dso__set_needs_swap(optional_dso, swap_type);
+	}
+
+	{
+		_Static_assert(offsetof(Elf32_Ehdr, e_machine) == 18, "Unexpected offset");
+		_Static_assert(offsetof(Elf64_Ehdr, e_machine) == 18, "Unexpected offset");
+		if (pread(fd, &e_machine, sizeof(e_machine), 18) != sizeof(e_machine))
+			return EM_NONE; // e_machine read failed.
+	}
+
+	e_machine = DSO_SWAP_TYPE__SWAP(swap_type, uint16_t, e_machine);
+	if (e_machine >= EM_NUM)
+		return EM_NONE; // Bad ELF machine number.
+
+	return e_machine;
+}
+
 uint16_t dso__e_machine(struct dso *dso, struct machine *machine)
 {
 	uint16_t e_machine = EM_NONE;
@@ -1248,30 +1310,9 @@ uint16_t dso__e_machine(struct dso *dso, struct machine *machine)
 	 */
 	try_to_open_dso(dso, machine);
 	fd = dso__data(dso)->fd;
-	if (fd >= 0) {
-		unsigned char e_ident[EI_NIDENT];
-
-		_Static_assert(offsetof(Elf32_Ehdr, e_ident) == 0, "Unexpected offset");
-		_Static_assert(offsetof(Elf64_Ehdr, e_ident) == 0, "Unexpected offset");
-		if (pread(fd, &e_ident, sizeof(e_ident), 0) == sizeof(e_ident) &&
-		    memcmp(e_ident, ELFMAG, SELFMAG) == 0 &&
-		    e_ident[EI_CLASS] > ELFCLASSNONE && e_ident[EI_CLASS] < ELFCLASSNUM &&
-		    e_ident[EI_DATA] > ELFDATANONE && e_ident[EI_DATA] < ELFDATANUM &&
-		    e_ident[EI_VERSION] == EV_CURRENT) {
-			_Static_assert(offsetof(Elf32_Ehdr, e_machine) == 18, "Unexpected offset");
-			_Static_assert(offsetof(Elf64_Ehdr, e_machine) == 18, "Unexpected offset");
-
-			if (dso__needs_swap(dso) == DSO_SWAP__UNSET)
-				dso__swap_init(dso, e_ident[EI_DATA]);
-
-			if (dso__needs_swap(dso) != DSO_SWAP__UNSET &&
-			    pread(fd, &e_machine, sizeof(e_machine), 18) == sizeof(e_machine) &&
-			    e_machine < EM_NUM)
-				e_machine = DSO__SWAP(dso, uint16_t, e_machine);
-			else
-				e_machine = EM_NONE;
-		}
-	}
+	if (fd >= 0)
+		e_machine = dso__read_e_machine(dso, fd);
+
 	mutex_unlock(dso__data_open_lock());
 	return e_machine;
 }
@@ -1656,28 +1697,13 @@ void dso__put(struct dso *dso)
 
 int dso__swap_init(struct dso *dso, unsigned char eidata)
 {
-	static unsigned int const endian = 1;
-
-	dso__set_needs_swap(dso, DSO_SWAP__NO);
+	enum dso_swap_type type = dso_swap_type__from_elf_data(eidata);
 
-	switch (eidata) {
-	case ELFDATA2LSB:
-		/* We are big endian, DSO is little endian. */
-		if (*(unsigned char const *)&endian != 1)
-			dso__set_needs_swap(dso, DSO_SWAP__YES);
-		break;
-
-	case ELFDATA2MSB:
-		/* We are little endian, DSO is big endian. */
-		if (*(unsigned char const *)&endian != 0)
-			dso__set_needs_swap(dso, DSO_SWAP__YES);
-		break;
-
-	default:
+	dso__set_needs_swap(dso, type);
+	if (type == DSO_SWAP__UNSET) {
 		pr_err("unrecognized DSO data encoding %d\n", eidata);
 		return -EINVAL;
 	}
-
 	return 0;
 }
 
diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index ac725bc8ea74..a95fee7d634b 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -160,12 +160,11 @@ enum dso_load_errno {
 	__DSO_LOAD_ERRNO__END,
 };
 
-#define DSO__SWAP(dso, type, val)				\
+#define DSO_SWAP_TYPE__SWAP(swap_type, type, val)		\
 ({								\
 	type ____r = val;					\
-	enum dso_swap_type ___dst = dso__needs_swap(dso);	\
-	BUG_ON(___dst == DSO_SWAP__UNSET);			\
-	if (___dst == DSO_SWAP__YES) {				\
+	BUG_ON(swap_type == DSO_SWAP__UNSET);			\
+	if (swap_type == DSO_SWAP__YES) {			\
 		switch (sizeof(____r)) {			\
 		case 2:						\
 			____r = bswap_16(val);			\
@@ -183,6 +182,8 @@ enum dso_load_errno {
 	____r;							\
 })
 
+#define DSO__SWAP(dso, type, val) DSO_SWAP_TYPE__SWAP(dso__needs_swap(dso), type, val)
+
 #define DSO__DATA_CACHE_SIZE 4096
 #define DSO__DATA_CACHE_MASK ~(DSO__DATA_CACHE_SIZE - 1)
 
@@ -865,6 +866,7 @@ int dso__data_file_size(struct dso *dso, struct machine *machine);
 off_t dso__data_size(struct dso *dso, struct machine *machine);
 ssize_t dso__data_read_offset(struct dso *dso, struct machine *machine,
 			      u64 offset, u8 *data, ssize_t size);
+uint16_t dso__read_e_machine(struct dso *optional_dso, int fd);
 uint16_t dso__e_machine(struct dso *dso, struct machine *machine);
 ssize_t dso__data_read_addr(struct dso *dso, struct map *map,
 			    struct machine *machine, u64 addr,
diff --git a/tools/perf/util/thread.c b/tools/perf/util/thread.c
index aa9c58bbf9d3..3642858e6cbc 100644
--- a/tools/perf/util/thread.c
+++ b/tools/perf/util/thread.c
@@ -458,10 +458,7 @@ static uint16_t read_proc_e_machine_for_pid(pid_t pid)
 	snprintf(path, sizeof(path), "/proc/%d/exe", pid);
 	fd = open(path, O_RDONLY);
 	if (fd >= 0) {
-		_Static_assert(offsetof(Elf32_Ehdr, e_machine) == 18, "Unexpected offset");
-		_Static_assert(offsetof(Elf64_Ehdr, e_machine) == 18, "Unexpected offset");
-		if (pread(fd, &e_machine, sizeof(e_machine), 18) != sizeof(e_machine))
-			e_machine = EM_NONE;
+		e_machine = dso__read_e_machine(/*optional_dso=*/NULL, fd);
 		close(fd);
 	}
 	return e_machine;
-- 
2.52.0.457.g6b5491de43-goog

