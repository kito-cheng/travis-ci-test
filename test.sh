curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > repo
chmod a+x ./repo

./repo init -u https://github.com/olibc/manifest.git
./repo sync
echo "OLIBC_CONF:=.config-olibc" > Makefile
echo "-include \$(OLIBC_CONF)" >> Makefile
echo "include build/core/olibc.mk" >> Makefile
echo "include build/core/main.mk" >> Makefile
./BUILD.sh -j10
