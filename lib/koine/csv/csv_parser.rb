require "csv"

module Koine
  module Csv
    class CsvParser
      def initialize(options = {})
        defaults = { column_separator: ";" }
        options = defaults.merge(options)
        @options = { col_sep: options[:column_separator] }
      end

      def parse(contents, &block)
        CSV.parse(contents, options, &block)
      end

      attr_reader :options
    end
  end
end
