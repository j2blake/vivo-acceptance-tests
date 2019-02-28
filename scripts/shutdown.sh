#
# Figure out what directory the script is in (absolute path)
#
# TODO 
#   from the running script
#
BASEDIR=/Users/jeb228/Development/VIVO/AcceptanceTests/projects/vivo-acceptance-tests/scripts

#
# Stop jetty-runner
#
java -jar $BASEDIR/jetty/start.jar -DSTOP.PORT=8181 -DSTOP.KEY=abc123 --stop