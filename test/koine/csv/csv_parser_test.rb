require 'test_helper'

module Koine
  module Csv
    class CsvParserTest < TestCase
      def test_can_be_initiaized
        assert CsvParser.new.is_a?(CsvParser)
      end
    end
  end
end
