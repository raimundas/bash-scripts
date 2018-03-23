#!/bin/bash
clear

exim="Exim spammer check."
postfix="Postfix spammer check."
pmta="Pmta spammer check."

#
echo "Enter a number to start a task:"
echo "==============================="
echo "[0] Exit."
echo
echo "[1] Exim    spammer check."
echo "[2] Postfix spammer check."
echo "[3] Pmta    spammer check."
echo "==============================="


# Reading a value from input:
read user_input

case "$user_input" in
        0)
          	clear
                echo "==============================="
                echo Exiting...
                ;;
        1)
          	clear
                echo "==============================="
                echo Running task [$user_input] $exim
                echo "==============================="
                echo "Exim mail queue: $(exim -bpc)"
                echo -e "Top 10 senders:\n\n $(exim -bpr | grep '<' | sed '/<>/d' | cut -d'<' -f2 | cut -d'>' -f1 | sort -n | uniq -c | sort -n | tail)"
                # echo -e "Exim summary:\n $(exim -bp | exiqsumm)"
                # exiqgrep -i -list only mail ids

                ;;
        2)
          	clear
                echo "==============================="
                echo Running task: [$user_input] $postfix
                echo "==============================="



                ;;
        3)
          	clear
                echo "==============================="
                echo Running task: [$user_input] $pmta
                echo "==============================="
                
                # testing
                ### Show mail queue
                # pmta show queue
                # pmta show topqueues
                
                ###  Show domains to which mails are being sent
                # pmta show domains
                # pmta show topdomains
                
                ### Show status of Traffic, Connections and Queues
                # pmta show status
                
                ### Show jobs
                # pmta show jobs
                
                
                ;;
        *)
          	clear
                echo "==============================="
                echo "# Error: The input must be a number between 0 and 9. "
esac
echo "==============================="
