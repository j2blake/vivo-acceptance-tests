require("cgi")

require_relative 'parsing_utils'

module Converter
  module Testfile
    class TagCleaner
      include ParsingUtils
      #
      def initialize(parsed)
        @parsed = parsed
      end

      def go
        @result = []

        @parsed.each do |line|
          @line = line

          replacement =
          convert_default_specs_to_name_specs(
          %w{clickAndWait type select},
          %w{submitAdd PublicName positionType Name URI Prefix loginName loginPassword loginForm})

          @result.concat([ *(replacement || @line) ])
        end

        @result
      end

      #
      # #<tr><td>clickAndWait</td><td>submitAdd</td><td></td></tr>
      #   becomes
      # #<tr><td>clickAndWait</td><td>name=submitAdd</td><td></td></tr>
      #
      def convert_default_specs_to_name_specs(verbs, tag_names)
        verb = @line.field1
        tag_name = @line.field2
        if verbs.include?(verb) && tag_names.include?(tag_name)
          $reporter.clean_tag(:default_to_name)
          Line.new(@line.text.gsub(tag_name, "name=" + tag_name))
        else
          nil
        end
      end

    end
  end
end