require 'statement_parser'

task :parse_statement, [:filename] => :environment do |t, args|
  StatementParser.parse(args[:filename])
end