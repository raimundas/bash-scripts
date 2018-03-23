#!/bin/bash
clear

exim="Exim spammer check."
postfix="Postfix spammer check."
pmta="Pmta spammer check."

### Print textual user interface
echo "Enter a number to start a task:"
echo "==============================="
echo "[0] Exit."
echo
echo "[1] Exim    spammer check."
echo "[2] Postfix spammer check."
echo "[3] Pmta    spammer check."
echo "==============================="


### Read value from user input
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
                
                ### Check exim status. 0 = not running; 1 = running;
                exim_status=`service exim status | grep "dead\|stopped\|failed" | wc -l`
                echo -e "Checking Exim status...\n"
                if [ "$exim_status" != 0 ]
                then
                        echo -e "Exim appears to be offline.\n"
                else
                        echo -e "Exim appears to be running.\n"
                fi
                echo "==============================="
                
                ### Exim summary
                echo -e "Exim mail queue: $(exim -bpc)\n"
                echo -e "Exim top 10 senders:\n$(exim -bpr | grep '<' | sed '/<>/d' | cut -d'<' -f2 | cut -d'>' -f1 | sort -n | uniq -c | sort -n | tail)\n"
                
                ### Large Exim summary table. May not be useful if there are a lot of senders. [Uncomment to enable]
                # Count  Volume  Oldest  Newest  Domain
                # -----  ------  ------  ------  ------
                # echo -e "Exim summary:\n$(exim -bp | exiqsumm)\n"
                # exiqgrep -i -list only mail ids
                
                ;;
        2)
          	clear
                echo "==============================="
                echo Running task: [$user_input] $postfix
                echo "==============================="
                
                ### Postfix summary
                echo -e "Postfix mail queue: $(mailq | grep ^[A-F0-9] | wc -l)\n"
                echo -e "Postfix top 10 senders:\n$(mailq | grep ^[A-F0-9] | cut -c 42-80 | sort | uniq -c | sort -n | tail)\n" 


                ;;
        3)
          	clear
                echo "==============================="
                echo Running task: [$user_input] $pmta
                echo "==============================="
                
                ### Pmta summary
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
