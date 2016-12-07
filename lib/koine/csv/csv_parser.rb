require "csv"

module Koine
  module Csv
    class CsvParser
      def initialize(options = {})
        defaults = { column_separator: ";" }
        options = defaults.merge(options)
        @parser_options = { col_sep: options[:column_separator] }
      end

      def parse(contents, &block)
        CSV.parse(contents, parser_options, &block)
      end

      protected

      def column_separator
        parser_options[:col_sep]
      end

      attr_reader :parser_options
    end
  end
end
