# -*- Makefile -*-

# ------------------------------------------------------------------------
TOPLEVEL  = ../../
JASMINDIR = $(TOPLEVEL)/jasmin
CODEDIR   = $(TOPLEVEL)/code
SYSCALL   = $(JASMINDIR)/compiler/syscall/jasmin_syscall.c

# ------------------------------------------------------------------------
CFLAGS  ?= -Wall -W -I ../../code -I ../../code/jasmin

# ------------------------------------------------------------------------
.PHONY: clean __force__

# ------------------------------------------------------------------------
default: all_test_kem all_speed_kem

PQCRYSTAL_FIPS202 := fips202.c
PQCRYSTAL_KYBER   := \
	kem.c indcpa.c polyvec.c poly.c ntt.c cbd.c \
	reduce.c verify.c symmetric-shake.c

# ------------------------------------------------------------------------
TEST_KEM :=

define test_kem
test_kem_$(2)_$(3): test_kem.c $$(CODEDIR)/jasmin/$(3)/$(2)/jkem.s
	$$(CC) $$(CFLAGS) $$(LDFLAGS) -o $$@ \
		-DMLKEM_ARCH=$(1) -DMLKEM_MICROARCH=$(2) \
		-DMLKEM_PARAM=$(3) -DKYBER_K=$(4) \
		-DMLKEM_NAMESPACE=jade_kem_mlkem_mlkem$(3)_$(1)_$(2) \
		-I $(CODEDIR)/jasmin/$(3)/$(2)/include \
		$$(SYSCALL) runtime.c test_kem.c $$(CODEDIR)/jasmin/$(3)/$(2)/jkem.s \
		$$(CODEDIR)/kyber/ref/randombytes.c \
		$$(PQCRYSTAL_FIPS202:%=$$(CODEDIR)/kyber/ref/%) \
		$$(PQCRYSTAL_KYBER:%=$$(CODEDIR)/kyber/ref/%)

run_test_kem_$(2)_$(3): test_kem_$(2)_$(3) __force__
	./test_kem_$(2)_$(3)

TEST_KEM += test_kem_$(2)_$(3)
endef

$(eval $(call test_kem,amd64,avx2,768,3))
$(eval $(call test_kem,amd64,avx2,1024,4))
$(eval $(call test_kem,amd64,ref,768,3))
$(eval $(call test_kem,amd64,ref,1024,4))

all_test_kem: $(TEST_KEM)

all_run_test_kem: $(TEST_KEM:%=run_%)

# ------------------------------------------------------------------------
SPEED_KEM :=

define speed_kem
speed_kem_$(2)_$(3): speed_kem.c $$(CODEDIR)/jasmin/$(3)/$(2)/jkem.s
	$$(CC) $$(CFLAGS) $$(LDFLAGS) -o $$@ \
		-DMLKEM_ARCH=$(1) -DMLKEM_MICROARCH=$(2) \
		-DMLKEM_PARAM=$(3) -DKYBER_K=$(4) \
		-DMLKEM_NAMESPACE=jade_kem_mlkem_mlkem$(3)_$(1)_$(2) \
		-I $(CODEDIR)/jasmin/$(3)/$(2)/include \
		$$(SYSCALL) runtime.c speed_kem.c $$(CODEDIR)/jasmin/$(3)/$(2)/jkem.s \
		$$(CODEDIR)/kyber/ref/randombytes.c \
		$$(PQCRYSTAL_FIPS202:%=$$(CODEDIR)/kyber/ref/%) \
		$$(PQCRYSTAL_KYBER:%=$$(CODEDIR)/kyber/ref/%)

run_speed_kem_$(2)_$(3): test_speed_$(2)_$(3)
	./test_speed_$(2)_$(3)

SPEED_KEM += speed_kem_$(2)_$(3)
endef

$(eval $(call speed_kem,amd64,avx2,768,3))
$(eval $(call speed_kem,amd64,avx2,1024,4))
$(eval $(call speed_kem,amd64,ref,768,3))
$(eval $(call speed_kem,amd64,ref,1024,4))

all_speed_kem: $(SPEED_KEM)

all_run_speed_kem: $(SPEED_KEM:%=run_%)

# ------------------------------------------------------------------------
clean:
	rm -f $(TEST_KEM)
