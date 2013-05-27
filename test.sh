curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > repo
chmod a+x ./repo

./repo init -u https://github.com/olibc/manifest.git
./repo sync
