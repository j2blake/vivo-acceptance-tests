#
# Run the tests with a particular settings file.
#
# Do it like this: 
#    run_rspec [settings_file] [test_selector]
# Example to run all of the tests:
#    run_rspec ./jims_settings ../spec
# Example to run a specific test:
#    run_rspec ./jims_settings ../spec/converted/CreatePeople
#
export VIVOTEST_SETTINGS=$1
shift
echo "TRY THIS" $@
rspec $@
