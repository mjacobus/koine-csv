$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'koine/csv'

require 'minitest/autorun'

class TestCase < Minitest::Test
  def self.test(test_name)
    define_method "test_#{test_name.gsub(' ', '_')}" do
      yield
    end
  end
end