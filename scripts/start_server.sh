#
# Figure out what directory the script is in (absolute path)
#
# TODO 
#   from the running script
#
BASEDIR=/Users/jeb228/Development/VIVO/AcceptanceTests/projects/vivo-acceptance-tests/scripts

#
# Locate the output directory
#
# TODO
#   from the command line
#
OUT_DIR=/Users/jeb228/Development/VIVO/AcceptanceTests/output
if [ ! -d "$OUT_DIR" ]; then
  mkdir $OUT_DIR
fi

#
# Ensure that a directory exists for logs (in output directory)
#
if [ ! -d "$OUT_DIR/logs" ]; then
  mkdir $OUT_DIR/logs
fi

#
# Ensure that a directory exists for failure recording (in output directory)
#
if [ ! -d "$OUT_DIR/failures" ]; then
  mkdir $OUT_DIR/failures
fi

#
# Run it
#
# TODO
#   Check that the executable exists. 
#   Make this independent of the project version number
#
java -Dcatalina.base=$OUT_DIR \
     -Dvitro.home=$OUT_DIR/home \
     -Dsolr.solr.home=$OUT_DIR/home/solr \
     -jar $BASEDIR/jetty/jetty-runner-9.4.9.v20180320.jar \
     --out $OUT_DIR/logs/jetty_runner.log \
     --log $OUT_DIR/logs/request.log \
     --path /vivosolr $OUT_DIR/vivosolr.war \
     --path /vivo $OUT_DIR/context/vivo \
     --stop-port 8181 --stop-key abc123
