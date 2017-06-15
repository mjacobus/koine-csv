require 'test_helper'

module Koine
  module Csv
    class CsvParserTest < TestCase
      def subject
        CsvParser.new
      end

      test "defaults column separator to ';'" do
        assert_equal ';', subject.send(:parser_options)[:col_sep]
      end

      test 'can change default separator' do
        parser = CsvParser.new(col_sep: ',')
        assert_equal ',', parser.send(:parser_options)[:col_sep]
      end

      test 'can parse content' do
        content = "a;b\nc;d\n"

        expected = [
          %w[a b],
          %w[c d]
        ]

        actual = subject.parse(content)

        assert_equal expected, actual
      end

      test 'can iterate with rows' do
        content = "a;b\nc;d\n"

        expected = %w[a c]

        collected = []

        subject.parse(content) do |row|
          collected.push(row[0])
        end

        assert_equal expected, collected
      end
    end
  end
end
