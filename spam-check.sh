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
                echo "Top 10 senders: $(exim -bpr | grep '<' | sed '/<>/d' | cut -d'<' -f2 | cut -d'>' -f1 | sort -n |$
                echo -e "Exim summary:\n $(exim -bp | exiqsumm)"
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



                ;;
        *)
          	clear
                echo "==============================="
                echo "# Error: The input must be a number between 0 and 9. "
esac
echo "==============================="
