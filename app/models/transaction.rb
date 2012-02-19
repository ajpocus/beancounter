class Transaction < ActiveRecord::Base
  belongs_to :account
  has_many :tags, :through => :transaction_tag
end
