#!/bin/bash
$SPARK_HOME/sbin/start-master.sh
PYSPARK_DRIVER_PYTHON=jupyter \
PYSPARK_DRIVER_PYTHON_OPTS="notebook --port 8889 --notebook-dir='/usr/notebooks' --ip='*' --no-browser" \
$SPARK_HOME/bin/pyspark