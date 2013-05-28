curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > repo
chmod a+x ./repo

./repo init -u https://github.com/olibc/manifest.git
./repo sync
echo "OLIBC_CONF:=.config-olibc" > Makefile
echo "-include \$(OLIBC_CONF)" >> Makefile
echo "include build/core/olibc.mk" >> Makefile
echo "include build/core/main.mk" >> Makefile
echo "build/core/BUILD-real.sh \$@" > ./BUILD.sh
./BUILD.sh -j10 OLIBC_CONF=travis-ci/configs/.config-olibc
