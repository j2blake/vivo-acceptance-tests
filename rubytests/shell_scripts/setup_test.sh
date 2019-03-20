#
# In the output directory:
#   Make sure that the logs directory is empty. 
#   Create the home directory, the VIVO context, and the Solr WAR.
#
# Creating the home directory each time insures that the TDB models are cleared,
# the Solr index is cleared, and the uploaded image files are cleared.
#
# Creating the VIVO context each time insures that any files injected by a 
# previous test are cleared.
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
# settings.rb has already verified that:
#   the VIVO project directory exists,
#   it looks like a VIVO project directory,
#   it looks like 'mvn package' has already been run.
#
if [ -z "$VIVOTEST_VIVO_PROJECT" ]; then
  echo "The environment variable 'VIVOTEST_VIVO_PROJECT' has not been set."
  exit 1
fi

#
# settings.rb has already verified that the directory of injected files exists.
#
if [ -z "$VIVOTEST_INJECTED_FILES" ]; then
  echo "The environment variable 'VIVOTEST_INJECTED_FILES' has not been set."
  exit 1
fi

#
# Ensure that the logs directory (in the output directory) is empty.
#
if [ -d "$VIVOTEST_OUTPUT_DIRECTORY/logs" ]; then
  rm -r $VIVOTEST_OUTPUT_DIRECTORY/logs
fi
mkdir $VIVOTEST_OUTPUT_DIRECTORY/logs

#
# Create the home directory (in the output directory).
#
# TODO
#   Make this independent of VIVO version number.
#   Complain if there is more than one home directory in vivo-installer-home
#   If any of the required pieces don't exist, exit.
#
if [ -d "$VIVOTEST_OUTPUT_DIRECTORY/home" ]; then
  rm -r $VIVOTEST_OUTPUT_DIRECTORY/home
fi

cp -R $VIVOTEST_VIVO_PROJECT/installer/home/target/vivo-installer-home-* $VIVOTEST_OUTPUT_DIRECTORY/home
cp -R $VIVOTEST_INJECTED_FILES/home/ $VIVOTEST_OUTPUT_DIRECTORY/home

#
# Create the VIVO context directory.
#
if [ -d "$VIVOTEST_OUTPUT_DIRECTORY/vivo_context" ]; then
  rm -r $VIVOTEST_OUTPUT_DIRECTORY/vivo_context
fi
mkdir $VIVOTEST_OUTPUT_DIRECTORY/vivo_context

cp -R $VIVOTEST_VIVO_PROJECT/installer/webapp/target/vivo/ $VIVOTEST_OUTPUT_DIRECTORY/vivo_context
cp -R $VIVOTEST_INJECTED_FILES/context/ $VIVOTEST_OUTPUT_DIRECTORY/vivo_context

#
# Make the VIVOSOLR WAR file available.
#
cp $VIVOTEST_VIVO_PROJECT/installer/solr/target/vivosolr.war $VIVOTEST_OUTPUT_DIRECTORY

