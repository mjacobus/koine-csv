require "csv"

module Koine
  module Csv
    class MappedColumnsParser < CsvParser
      attr_reader :column_names

      def initialize(options = {})
        super(options)
        @column_names = options.fetch(:column_names)
      end

      def parse(contents, &block)
        mapped = []
        CSV.parse(contents, parser_options) do |row|
          new_row = {}
          row.each_with_index do |value, index|
            new_row[column_name(index)] = value
          end
          mapped << new_row
        end
        block_given? ? mapped.each(&block) : mapped
      end

      private

      def column_name(index)
        column_names.fetch(index)
      end
    end
  end
end
