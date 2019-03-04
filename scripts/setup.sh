#
# Create the output directory, with places for logs and for failure recordings.
# Create the VIVO context, and the Solr WAR.
#
# Don't create the home directory, since we want that to be fresh each time the 
# server starts up.
#

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

# Locate VIVOSOLR War
cp $VIVODIR/installer/solr/target/vivosolr.war $OUT_DIR
