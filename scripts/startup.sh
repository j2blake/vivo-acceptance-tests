#
# Create the home directory and start the server.
#
# We create the home directory on each startup, to insure that the TDBModels
# the Solr index, and the file uploads are cleared.
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
