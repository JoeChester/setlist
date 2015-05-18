ENV['RAILS_ENV'] ||= 'test'

require 'simplecov'
SimpleCov.start

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

SimpleCov.at_exit do
  SimpleCov.result.format!
  result = (SimpleCov.result.covered_percent * $test_result)
  File.open(Rails.root + "log/setlist.log", 'a'){|f| f.write "['#{Time.now}',#{SimpleCov.result.covered_percent},#{$test_result},#{result}]\n" }
  puts "\n" + "=" * 34
  puts " Project Result: %.2f%% of 100%" % [result]
  puts "=" * 34
end

module MiniTest
  class MyReporter < MiniTest::StatisticsReporter
    def report # :nodoc:
      super
      failed = failures + errors + skips
      $test_result = (count-failed) / count.to_f
    end
  end

  self.extensions << 'my_reporter'
  def self.plugin_my_reporter_init opts
    self.reporter << MiniTest::MyReporter.new
  end
end
