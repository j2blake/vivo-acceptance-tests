module Converter
  class Reporter
    def initialize
      @suite_count = 0
      @test_count = 0
      @step_count = 0
      @copy_count = 0
      @tags_remaining = 0
      @missing_suite_count = 0
    end

    def command_line(args)
      @args = args.to_a
    end

    def convert_test_file(suite_name, filename)
      @test_count += 1
      puts "Converting %s/%s" % [ suite_name, filename ]
    end

    def convert_suite_file(suite_name)
      @suite_count += 1
      puts "Converting %s suite" % [ suite_name ]
    end

    def copy_file(suite_name, filename)
      @copy_count += 1
      puts "Copying %s/%s" % [ suite_name, filename ]
    end

    def compressed_tag(tag_line)
      @step_count += 1
    end

    def tags_remaining(how_many)
      @tags_remaining += how_many
    end

    def missing_suite_file(suite_name)
      @missing_suite_count += 1
      puts "%s contains no suite file." % [ suite_name ]
    end

    def report
      puts
      puts "Command line: #{@args.join(" ")}"
      puts "Converted %d suites, %d tests, and %d steps." % [ @suite_count, @test_count, @step_count ]
      puts "Copied %d files." % [ @copy_count ]
      puts "%d missing suite files." % [ @missing_suite_count ]
      puts
      puts "%d UNKNOWN TAGS REMAIN." % [ @tags_remaining ]
      puts
    end
  end
end