require 'csv'

task :parse_statement, [:filename] => :environment do |t, args|
  CSV.foreach(args[:filename]) do |row|
    # make sure the line begins with a date, and skip descriptive/empty rows
    next if row.empty?
    next unless row[0].split(' ')[0] =~ /\d{2}\/\d{2}\/\d{4}/

    datestr, description, amount, bal = row
    month, day, year = datestr.split('/')
    date = Date.new(year.to_i, month.to_i, day.to_i)
    entry = StatementEntry.create(:date => date, :description => description,
      :amount => amount)
    puts "Created StatementEntry: #{entry.inspect}"
  end
end