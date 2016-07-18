#!/bin/bash


if [ $# -le 0 ]; then
    echo "Error: No command was specified for the test"
    exit
fi


COMMAND="$1"
HOST="http://127.0.0.1:8000"
CONCURRENCIES=(10 100 500)
REQUESTLOADS=(100 1000 10000)
ENDPOINTS=("/status" "/echo/hello")

echo "//////////////////////////////////////////"
echo "/------------ Beginning Test ------------/"
echo "//////////////////////////////////////////"
echo "Testing command: $COMMAND"
echo "Testing host: $HOST"
echo

for e in "${ENDPOINTS[@]}"
do
    echo "-------- Testing $e Endpoint ---------"
    echo

    for c in "${CONCURRENCIES[@]}"
    do
	echo "    ---Concurrency Level $c---"
	for n in "${REQUESTLOADS[@]}"
	do
	    # If the concurrency is greater than the total then skip
	    if [ $c -gt $n ]; then
		continue
	    fi

	    echo "            - $n Requests -              "
	    /usr/bin/time -l $COMMAND &> /tmp/results &
	    TIMEPID=$!
	    sleep 1
	    COMMANDPID=$(pgrep -P $TIMEPID)
	    wrk2 -t4 -c$c -d30s -R$n $HOST$e
	    kill $COMMANDPID
	    sleep 1
	    MEM=$(cat /tmp/results | grep maximum | awk '{print $1}')
	    echo "Max Memory Used: $(expr $MEM / 1048576) MB"
	    sleep 1
	done
    done
done

echo
echo "************ End of Test **************"

rm /tmp/results
