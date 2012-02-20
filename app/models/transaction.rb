class Transaction < ActiveRecord::Base
  belongs_to :account
  acts_as_taggable
  
  accepts_nested_attributes_for :tags
  
  before_save :negate_expenses
  before_save :add_balance
  before_destroy :subtract_balance
  
  validates_presence_of :date
  validates_presence_of :amount
  validates_presence_of :tag_list
  
  private
  
  def negate_expenses
    if self.is_a? Expense and self.amount > 0
      self.amount *= -1
    end
  end
  
  def add_balance
    if Transaction.find_by_id(self.id).nil?
      self.account.balance += self.amount
      self.account.save
    end
  end
  
  def subtract_balance
    self.account.balance -= self.amount
    self.account.save
  end
end
