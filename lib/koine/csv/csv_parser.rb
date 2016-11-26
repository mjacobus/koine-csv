require "csv"

module Koine
  module Csv
    class CsvParser
      def initialize(column_separator = ";")
        @options = { col_sep: column_separator }
      end

      def parse(contents, &block)
        CSV.parse(contents, options, &block)
      end

      attr_reader :options
    end
  end
end
