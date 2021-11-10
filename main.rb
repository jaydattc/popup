require_relative 'parser'

raise ArgumentError, "Usage: `ruby main.rb <file>`" unless ARGV.length > 0

parser = Parser::LogParser.new ARGV[0]
output = parser::call
puts output