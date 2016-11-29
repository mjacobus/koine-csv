require 'test_helper'

module Koine
  module Csv
    class CsvParserTest < TestCase
      def subject
        CsvParser.new
      end

      test "defaults column separator to ';'" do
        assert_equal ';', subject.send(:options)[:col_sep]
      end

      test "can cange default separator" do
        parser = CsvParser.new(column_separator: ',')
        assert_equal ',', parser.send(:options)[:col_sep]
      end

      test "can parse content" do
        content = "a;b\nc;d\n"

        expected = [
          ['a', 'b'],
          ['c', 'd'],
        ]

        actual = subject.parse(content)

        assert_equal expected, actual
      end

      test "can iterate with rows" do
        content = "a;b\nc;d\n"

        expected = ['a', 'c']

        collected = []

        subject.parse(content) do |row|
          collected.push(row[0])
        end

        assert_equal expected, collected
      end
    end
  end
end
