class Transaction < ActiveRecord::Base
  belongs_to :account
  acts_as_taggable
  
  accepts_nested_attributes_for :tags
  
  before_save :add_balance
  before_destroy :subtract_balance
  
  private
  
  def add_balance
    self.account.balance += self.amount
    self.account.save
  end
  
  def subtract_balance
    self.account.balance -= self.amount
    self.account.save
  end
end
