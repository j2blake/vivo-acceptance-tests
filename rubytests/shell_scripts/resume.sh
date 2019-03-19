#
# For diagnostic purporses, start the server without clearing any of the 
# directories.
#

VIVOTEST_JETTY_EXECUTABLES=/Users/jeb228/Development/VIVO/AcceptanceTests/projects/vivo-acceptance-tests/rubytests/jetty
VIVOTEST_OUTPUT_DIRECTORY=/Users/jeb228/Development/VIVO/AcceptanceTests/output

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
