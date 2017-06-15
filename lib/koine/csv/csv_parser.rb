require 'csv'

module Koine
  module Csv
    class CsvParser
      def initialize(options = {})
        defaults = { col_sep: ';' }
        options = defaults.merge(options)
        @parser_options = options
      end

      def parse(contents, &block)
        CSV.parse(contents, parser_options, &block)
      end

      protected

      attr_reader :parser_options
    end
  end
end
