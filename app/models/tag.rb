class Tag < ActiveRecord::Base
  has_many :transactions, :through => :transaction_tag
end
