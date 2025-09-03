#!/bin/bash

cd $(readlink -f $(dirname ${BASH_SOURCE[0]}))
cd ..

echo '#!/bin/bash' > deploy
cat $(find module -type f | grep -v "/\\." | grep -v "disabled") >> deploy
cat $(find lib -type f | grep -v "/\\.") >> deploy
cat ldp >> deploy
sed -Ei '2,$s/^#!\/bin\/bash//' deploy
chmod 755 deploy
