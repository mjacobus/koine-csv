require "koine/csv/version"

module Koine
  module Csv
    autoload :CsvParser, 'koine/csv/csv_parser'
    autoload :MappedColumnsParser, 'koine/csv/mapped_columns_parser'
  end
end
