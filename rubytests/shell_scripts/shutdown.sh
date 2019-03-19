#
# Stop the server.
#
# ------------------------------------------------------------------------------

#
# settings.rb has already verified that the Jetty executables exist.
#
if [ -z "$VIVOTEST_JETTY_EXECUTABLES" ]; then
  echo "The environment variable 'VIVOTEST_JETTY_EXECUTABLES' has not been set."
  exit 1
fi

#
# Stop jetty-runner
#
java -jar $VIVOTEST_JETTY_EXECUTABLES/start.jar -DSTOP.PORT=8181 -DSTOP.KEY=abc123 --stop