module Converter
  class Utils
    class <<self
      def create_directory_for(path)
        dir = File.dirname(path)
        FileUtils.mkdir_p(dir) unless File.directory?(dir)
      end
    end
  end
end