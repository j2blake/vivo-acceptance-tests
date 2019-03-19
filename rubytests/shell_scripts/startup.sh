#
# Start the server.
#
# ------------------------------------------------------------------------------

#
# settings.rb has already verified that the output directory exists.
#
if [ -z "$VIVOTEST_OUTPUT_DIRECTORY" ]; then
  echo "The environment variable 'VIVOTEST_OUTPUT_DIRECTORY' has not been set."
  exit 1
fi

#
# settings.rb has already verified that the Jetty executables exist.
#
if [ -z "$VIVOTEST_JETTY_EXECUTABLES" ]; then
  echo "The environment variable 'VIVOTEST_JETTY_EXECUTABLES' has not been set."
  exit 1
fi

#
# Run it
#
java -Dcatalina.base=$VIVOTEST_OUTPUT_DIRECTORY \
     -Dvitro.home=$VIVOTEST_OUTPUT_DIRECTORY/home \
     -Dsolr.solr.home=$VIVOTEST_OUTPUT_DIRECTORY/home/solr \
     -jar $VIVOTEST_JETTY_EXECUTABLES/jetty-runner-9.4.9.v20180320.jar \
     --out $VIVOTEST_OUTPUT_DIRECTORY/logs/jetty_runner.log \
     --log $VIVOTEST_OUTPUT_DIRECTORY/logs/request.log \
     --path /vivosolr $VIVOTEST_OUTPUT_DIRECTORY/vivosolr.war \
     --path /vivo $VIVOTEST_OUTPUT_DIRECTORY/vivo_context \
     --stop-port 8181 --stop-key abc123
