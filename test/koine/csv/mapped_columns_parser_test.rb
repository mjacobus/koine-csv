require 'test_helper'

module Koine
  module Csv
    class CsvColumnsParserTest < TestCase
      def subject
        MappedColumnsParser.new({
          column_names: [:name, :last_name]
        })
      end

      test "is a csv parser" do
        assert subject.is_a?(CsvParser)
      end

      test "defaults column separator to ';'" do
        assert_equal ';', subject.send(:parser_options)[:col_sep]
      end

      test "can cange default separator" do
        parser = MappedColumnsParser.new(
          column_separator: ',',
          column_names: [:name, :last_name]
        )
        assert_equal ',', parser.send(:parser_options)[:col_sep]
      end

      test "can parse content" do
        content = "jon;doe\njohn;travolta\n"

        expected = [
          { name: 'jon', last_name: 'doe'},
          { name: 'john', last_name: 'travolta'},
        ]

        actual = subject.parse(content)

        assert_equal expected, actual
      end

      test "can iterate with rows" do
        content = "jon;doe\njohn;travolta\n"
        collected = []

        subject.parse(content) do |row|
          collected << row[:last_name]
        end

        assert_equal ['doe', 'travolta'], collected
      end
    end
  end
end
