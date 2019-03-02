#
# Some useful methods for running the tests.
#
module TesterHelpers
  #
  # Find the absolute path of this relative one.
  #
  def tester_filepath(relative_path, script_path)
    File.expand_path(relative_path, File.dirname(script_path))
  end

end