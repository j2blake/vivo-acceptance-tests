module Converter
  module Testfile
    module ParsingUtils
      #
      # Do we recognize this as a valid element specifier in Selenium-HTML?
      # Reformat it for Selenium-Ruby, or return nil.
      #
      def element_spec(raw)
        raw.match %r{^css=(.+)} do |m|
          return ":css, \"%s\"" % value(m[1])
        end
        raw.match %r{^id=(.+)} do |m|
          return ":id, \"%s\"" % value(m[1])
        end
        raw.match %r{^link=(.+)} do |m|
          return ":link_text, \"%s\"" % value(m[1])
        end
        raw.match %r{^name=(.+)} do |m|
          return ":name, \"%s\"" % value(m[1])
        end
        raw.match %r{^xpath=(.+)} do |m|
          return ":xpath, \"%s\"" % adjust_xpath(value(m[1]))
        end
        raw.match %r{^(//.+)} do |m| # implicit XPath
          return ":xpath, \"%s\"" % adjust_xpath(value(m[1]))
        end
        raw.match %r{^(.+)} do |m| # implicit id
          return ":id, \"%s\"" % adjust_xpath(value(m[1]))
        end
        nil
      end

      #
      # Selenium-HTML allowed xpath's to start with "//" to specify "anywhere in
      # the document". Selenium-Ruby requires ".//"
      #
      # Replace at the beginning of the path, or if preceded by something other than a "."
      #
      def adjust_xpath(raw)
        raw.gsub(%r{([^.]//)}, ".\\1").gsub(%r{^//}, ".//")
      end

      # Convert a windows-based absolute file path to just the name.ext
      #
      # C:\VIVO\vivo\utilities\acceptance-tests\suites\LanguageSupport\Test-utf8.n3
      #   becomes
      # Test-utf8.n3
      #
      def strip_file_path(absolute)
        absolute.match %r{[^\\]*$} do |m|
          m[0]
        end
      end

      #
      # Some values were HTML-encoded, in order to be specified in the HTML-based
      # tests. Now, they should be Ruby-string-encoded instead.
      #
      # These values include text to be typed, CSS specifiers, XPath
      # specifiers, and maybe more.
      #
      def value(raw)
        CGI.unescapeHTML(raw.strip).gsub('"', '\"').gsub(/&nbsp;/, " ")
      end

    end
  end
end