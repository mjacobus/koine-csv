require "csv"

module Koine
  module Csv
    class NamedColumnsParser < CsvParser
      def parse(contents, &block)
        contents = contents.split("\n")
        titles = contents.shift
        column_names = CSV.parse(titles, col_sep: column_separator).first

        options = {
          column_names: column_names,
          column_separator: column_separator
        }

        contents = contents.join("\n")
        MappedColumnsParser.new(options).parse(contents, &block)
      end
    end
  end
end
