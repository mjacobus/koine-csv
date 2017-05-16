require 'csv'

module Koine
  module Csv
    class NamedColumnsParser < CsvParser
      def parse(contents, &block)
        csv = CSV.parse(contents, headers: true, col_sep: column_separator)
        column_names = csv.headers
        collection = []

        csv.each do |line|
          element = {}
          column_names.each do |name|
            element[name] = line[name]
          end
          collection << element
        end

        return collection.each(&block) if block
        collection
      end
    end
  end
end
