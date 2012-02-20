class Income < Transaction
end

# == Schema Information
#
# Table name: transactions
#
#  id         :integer         not null, primary key
#  account_id :integer
#  amount     :decimal(14, 2)
#  created_at :datetime
#  updated_at :datetime
#  date       :date
#

