require 'test_helper'

module Koine
  module Csv
    class NamedColumnsParserTest < TestCase
      def subject
        NamedColumnsParser.new(col_sep: ';')
      end

      test "is a csv parser" do
        assert subject.is_a?(::Koine::Csv::CsvParser)
      end

      test "defaults column separator to ';'" do
        assert_equal ';', subject.send(:parser_options)[:col_sep]
      end

      test "can change default separator" do
        parser = NamedColumnsParser.new(
          col_sep: ',',
        )
        assert_equal ',', parser.send(:parser_options)[:col_sep]
      end

      test "can parse content" do
        subject = NamedColumnsParser.new(
          quote_char: "'"
        )

        contents = <<-CSV
name;last_name
jon;'doe da silva'
name;last_name
john;travolta
        CSV

        expected = [
          { 'name' => 'jon', 'last_name' => 'doe da silva'},
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
