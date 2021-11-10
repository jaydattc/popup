require_relative '../parser'

describe 'parser-unit-test' do
  it 'should output correct data for a fixed file' do
    expect(Parser::LogParser.new('spec/webserver_example.log')::call).to eq "/help_page/1 - Total Views: 79, Unique Views: 23\n/contact - Total Views: 88, Unique Views: 23\n/home - Total Views: 77, Unique Views: 22\n/about/2 - Total Views: 89, Unique Views: 22\n/index - Total Views: 81, Unique Views: 23\n/about - Total Views: 80, Unique Views: 21\n"
  end
end