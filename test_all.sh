#!/bin/bash

echo "//////////////////////////////////"
echo "/////////Beginning Test///////////"
echo "//////////////////////////////////"
echo
echo
echo "************* Test 1 *************"
echo "---------- Testing Spark ---------"
./test_1.sh "java -jar java/target/spark_test-1.0-SNAPSHOT-jar-with-dependencies.jar" > test_1_spark_results.txt
echo
echo "---------- Testing Go ---------"
echo
./test_1.sh "./go/go_test" > test_1_go_results.txt

echo "************* Test 2 *************"
echo
echo "---------- Testing Spark ---------"
./test_2.sh "java -jar java/target/spark_test-1.0-SNAPSHOT-jar-with-dependencies.jar" > test_2_spark_results.txt
echo
echo "---------- Testing Go ---------"
echo
./test_2.sh "./go/go_test" > test_2_go_results.txt
