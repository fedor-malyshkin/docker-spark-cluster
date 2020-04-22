#Creating some variables to make the docker run command more readable
#App jar environment used by the spark-submit image
SPARK_APPLICATION_JAR_LOCATION="/opt/spark-apps/job.jar"
#App main class environment used by the spark-submit image
SPARK_APPLICATION_MAIN_CLASS="ae.pegasus.maple.job.IdentificationBearings"
#Extra submit args used by the spark-submit image
SPARK_SUBMIT_ARGS="--conf spark.executor.extraJavaOptions='-Dconfig-path=/opt/spark-apps/dev/config.conf'"

#We have to use the same network as the spark cluster(internally the image resolves spark master as spark://spark-master:7077)
docker run --rm --network docker-spark-cluster_default \
-v /mnt/spark-apps:/opt/spark-apps \
--env SPARK_APPLICATION_JAR_LOCATION=$SPARK_APPLICATION_JAR_LOCATION \
--env SPARK_APPLICATION_MAIN_CLASS=$SPARK_APPLICATION_MAIN_CLASS \
fedormalyshkin/spark-submit:2.4.5
