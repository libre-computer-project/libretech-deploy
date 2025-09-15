#!/bin/bash

cd $(readlink -f $(dirname ${BASH_SOURCE[0]}))
cd ..

output=lc-deploy

echo '#!/bin/bash' > $output
cat $(find lib -type f | grep -v "/\\.") >> $output
cat $(find module -type f | grep -v "/\\." | grep -v "disabled") >> $output
cat ldp >> $output
sed -Ei '2,$s/^#!\/bin\/bash//' $output
chmod 755 $output
