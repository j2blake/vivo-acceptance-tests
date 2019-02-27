module Converter
  class Reporter
    def initialize
      @suite_count = 0
      @test_count = 0
      @step_count = 0
      @copy_count = 0
      @tags_remaining = []
      @phrases_replaced = Hash.new([0, 0])
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

    def tags_remaining(tag_array)
      @tags_remaining = @tags_remaining.concat(tag_array)
    end

    def missing_suite_file(suite_name)
      @missing_suite_count += 1
      puts "%s contains no suite file." % [ suite_name ]
    end

    def replace_phrase(key, line_count)
      already = @phrases_replaced[key]
      @phrases_replaced[key] = [ already[0] + 1, already[1] + line_count]
    end

    def report
      puts
      puts "Command line: #{@args.join(" ")}"
      puts "Converted %d suites, %d tests, and %d steps." % [ @suite_count, @test_count, @step_count ]
      puts "Copied %d files." % [ @copy_count ]
      puts "%d missing suite files." % [ @missing_suite_count ]
      @phrases_replaced.each { |k, v| puts "replaced %d '%s' phrases (%d lines)" % [ v[0], k, v[1] ] }
      puts
      puts "%d UNKNOWN TAGS REMAIN." % [ @tags_remaining.size ]
      @tags_remaining.shuffle.first(20).each { |t| puts t }
      puts
    end
  end
end