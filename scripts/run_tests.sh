#
# Figure out what directory the script is in (absolute path)
#
# TODO 
#   from the running script
#
BASEDIR=/Users/jeb228/Development/VIVO/AcceptanceTests/projects/vivo-acceptance-tests/scripts

#
# Locate the VIVO distribution directory
#
# TODO 
#   from the command line
#   validate that 
#     1) it is a VIVO distribution directory
#     2) the target files exist
#
VIVODIR=/Users/jeb228/Development/VIVO/projects/VIVO

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
# Assemble the home directory (in the output directory)
#
# TODO
#   Make this independent of VIVO version number.
#   If any of the required don't exist, exit.
#
if [ -d "$OUT_DIR/home" ]; then
  rm -r $OUT_DIR/home
fi
cp -R $VIVODIR/installer/home/target/vivo-installer-home-1.11.0-SNAPSHOT/ $OUT_DIR/home
cp $BASEDIR/config/applicationSetup.n3 $OUT_DIR/home/config
cp $BASEDIR/config/runtime.properties $OUT_DIR/home/config
cp -r $BASEDIR/rdf/* $OUT_DIR/home/rdf

#
# Ensure that a clean directory exists for logs (in output directory)
#
if [ -d "$OUT_DIR/logs" ]; then
  rm -r $OUT_DIR/logs
fi
mkdir $OUT_DIR/logs

#
# Ensure that a clean directory exists for failure recording (in output directory)
#
if [ -d "$OUT_DIR/failures" ]; then
  rm -r $OUT_DIR/failures
fi
mkdir $OUT_DIR/failures

#
# Assemble the context directory (in the output directory)
#   Start with the VIVO target directory
#   Add the transient data stores
#
# TODO
#   Don't rely on hard-coding the repository paths
#   Is there a better way to get catalina.jar, or something smaller?
# 
if [ -d "$OUT_DIR/context" ]; then
  rm -r $OUT_DIR/context
  mkdir $OUT_DIR/context
fi

cp -R $VIVODIR/installer/webapp/target/vivo $OUT_DIR/context

cp $BASEDIR/../transience/target/vivo-acceptance-tests-transient-stores-0.1-SNAPSHOT.jar $OUT_DIR/context/vivo/WEB-INF/lib

cp /Users/jeb228/.m2/repository/org/apache/lucene/lucene-analyzers-common/7.6.0/lucene-analyzers-common-7.6.0.jar $OUT_DIR/context/vivo/WEB-INF/lib
cp /Users/jeb228/.m2/repository/org/apache/lucene/lucene-core/7.6.0/lucene-core-7.6.0.jar $OUT_DIR/context/vivo/WEB-INF/lib
cp /Users/jeb228/.m2/repository/org/apache/lucene/lucene-queries/7.6.0/lucene-queries-7.6.0.jar $OUT_DIR/context/vivo/WEB-INF/lib
cp /Users/jeb228/.m2/repository/org/apache/lucene/lucene-queryparser/7.6.0/lucene-queryparser-7.6.0.jar $OUT_DIR/context/vivo/WEB-INF/lib
cp /Users/jeb228/.m2/repository/org/apache/lucene/lucene-sandbox/7.6.0/lucene-sandbox-7.6.0.jar $OUT_DIR/context/vivo/WEB-INF/lib

cp $BASEDIR/kluge/catalina.jar $OUT_DIR/context/vivo/WEB-INF/lib
cp $BASEDIR/kluge/startup_listeners.txt $OUT_DIR/context/vivo/WEB-INF/resources

#
# Run it
#
# TODO
#   Check that the executable exists. 
#   Make this independent of the project version number
#
java -Dcatalina.base=$OUT_DIR \
     -Dvitro.home=$OUT_DIR/home \
     -jar $BASEDIR/jetty/jetty-runner-9.4.9.v20180320.jar \
     --out $OUT_DIR/logs/jetty_runner.log \
     --log $OUT_DIR/logs/request.log \
     --path /vivo $OUT_DIR/context/vivo
