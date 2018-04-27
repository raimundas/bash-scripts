<b>spam-check.sh script</b>
This script will give you the options to run mail queue checks for exim, postfix, pmta.
The output will give you some quick info on the email count in the mail queue and top senders.

How to run:

1) bash <(curl https://raw.githubusercontent.com/raimundas/bash-scripts/master/spam-check.sh)
2) bash <(curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/raimundas/bash-scripts/master/spam-check.sh)

This will request the server not to use cached version.
* curl -H 'Cache-Control: no-cache'


