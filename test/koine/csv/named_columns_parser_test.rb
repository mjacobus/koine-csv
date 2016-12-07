require 'test_helper'

module Koine
  module Csv
    class NamedColumnsParserTest < TestCase
      def subject
        NamedColumnsParser.new(column_separator: ';')
      end

      test "is a csv parser" do
        assert subject.is_a?(::Koine::Csv::CsvParser)
      end

      test "defaults column separator to ';'" do
        assert_equal ';', subject.send(:parser_options)[:col_sep]
      end

      test "can cange default separator" do
        parser = NamedColumnsParser.new(
          column_separator: ',',
        )
        assert_equal ',', parser.send(:parser_options)[:col_sep]
      end

      test "can parse content" do
        contents = <<-CSV
name;"last_name"
jon;doe
name;last_name
john;travolta
        CSV

        expected = [
          { 'name' => 'jon', 'last_name' => 'doe'},
          { 'name' => 'name', 'last_name' => 'last_name'},
          { 'name' => 'john', 'last_name' => 'travolta'},
        ]

        actual = subject.parse(contents)

        assert_equal expected, actual
      end

      test "can parse content and deal use the block" do
        contents = <<-CSV
"name";last_name
jon;doe
john;travolta
        CSV

        expected = [
          'doe',
          'travolta'
        ]

        collected = []

        subject.parse(contents) do |item|
          collected << item['last_name']
        end

        assert_equal expected, collected
      end
    end
  end
end
