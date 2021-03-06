$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
])

SimpleCov.start

require 'koine/csv'
require 'minitest/autorun'
require "minitest/reporters"

ENV.delete("VIM")
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(:color => true)]

class TestCase < Minitest::Test
  def self.test(test_name, &block)
    method_name = "test_#{test_name.gsub(' ', '_')}"
    define_method(method_name, &block)
  end
end
