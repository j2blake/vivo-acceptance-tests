#
# Create the output directory, with a place for logs and a place to record
# failure conditions.
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
# Make the output directory empty.
#
if [ "$(ls -A $VIVOTEST_OUTPUT_DIRECTORY)" ]; then
  rm -r $VIVOTEST_OUTPUT_DIRECTORY/*
fi

#
# Ensure that it contains an empty sub-directory for recording test failures.
#
if [ -d "$VIVOTEST_OUTPUT_DIRECTORY/failures" ]; then
  rm -r $VIVOTEST_OUTPUT_DIRECTORY/failures
fi
mkdir $VIVOTEST_OUTPUT_DIRECTORY/failures

exit 0
