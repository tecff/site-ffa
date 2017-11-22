GLUON_BUILD_DIR := gluon-build
GLUON_GIT_URL := https://github.com/tecff/gluon.git
GLUON_GIT_REF := 21ea8319164ece68a2ce9b1efa30349d27d6a4c1

SECRET_KEY_FILE ?= ${HOME}/.gluon-secret-key

GLUON_TARGETS ?= \
	ar71xx-generic \
	ar71xx-mikrotik \
	ar71xx-nand \
	ar71xx-tiny \
	brcm2708-bcm2708 \
	brcm2708-bcm2709 \
	ipq806x \
	mpc85xx-generic \
	mvebu \
	ramips-mt7620 \
	ramips-mt7621 \
	ramips-mt7628 \
	ramips-rt305x \
	sunxi \
	x86-64 \
	x86-generic \
	x86-geode

GLUON_RELEASE := $(shell git describe --tags 2>/dev/null)
ifneq (,$(shell git describe --exact-match --tags 2>/dev/null))
  GLUON_BRANCH := stable
else ifeq (,${GLUON_BRANCH})
  GLUON_RELEASE := snapshot~$(shell date '+%Y%m%d')
endif

MAKE_PID := $(shell echo $$PPID)
JOB_FLAG := $(filter -j%, $(subst -j ,-j,$(shell ps T | grep "^\s*$(MAKE_PID).*$(MAKE)")))
JOBS     := $(subst -j,,${JOB_FLAG})
ifeq ($(strip ${JOBS}),)
    JOBS := $(shell cat /proc/cpuinfo | grep processor | wc -l)
endif

GLUON_MAKEFLAGS := -j${JOBS} -C ${GLUON_BUILD_DIR} \
			GLUON_RELEASE=${GLUON_RELEASE} \
			GLUON_BRANCH=${GLUON_BRANCH}

# this special target makes sure that this Makefile is run serially
.NOTPARALLEL:

all: build move-output

info:
	@echo
	@echo '#########################'
	@echo '# TECFF Firmware build'
	@echo '# GLUON_RELEASE: ${GLUON_RELEASE}'
	@echo '# GLUON_BRANCH:  ${GLUON_BRANCH}'
	@echo '# GLUON_GIT_URL: ${GLUON_GIT_URL}'
	@echo '# GLUON_GIT_REF: ${GLUON_GIT_REF}'
	@echo '#########################'
	@echo

build: info gluon-prepare
	@echo '# starting builds...'
	+for target in ${GLUON_TARGETS}; do \
		echo ""Building target $$target""; \
		$(MAKE) ${GLUON_MAKEFLAGS} GLUON_TARGET="$$target"; \
	done

manifest:
	@echo '# creating manifest...'
	$(MAKE) ${GLUON_MAKEFLAGS} manifest

move-output:
	@echo '# moving output out of build directory...'
	mv ${GLUON_BUILD_DIR}/output .

sign: build manifest move-output
	@echo '# signing manifest...'
	${GLUON_BUILD_DIR}/contrib/sign.sh ${SECRET_KEY_FILE} output/images/sysupgrade/${GLUON_BRANCH}.manifest

${GLUON_BUILD_DIR}:
	git clone ${GLUON_GIT_URL} ${GLUON_BUILD_DIR}

gluon-prepare: output-clean ${GLUON_BUILD_DIR}
	@echo '# preparing sources...'
	(cd ${GLUON_BUILD_DIR} \
	  && git remote set-url origin ${GLUON_GIT_URL} \
	  && git fetch origin \
	  && git checkout -q ${GLUON_GIT_REF})
	ln -sfT .. ${GLUON_BUILD_DIR}/site
	$(MAKE) ${GLUON_MAKEFLAGS} update

gluon-clean:
	@echo '# removing build directory...'
	rm -rf ${GLUON_BUILD_DIR}

output-clean:
	@echo '# removing output of last build...'
	rm -rf output

clean: gluon-clean output-clean
