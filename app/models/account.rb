class Account < ActiveRecord::Base
  belongs_to :user
  has_many :transactions, :dependent => :destroy
  has_many :expenses, :dependent => :destroy
  has_many :incomes, :dependent => :destroy
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  scope :by_user, lambda { |user| where(:user_id => user.id) }
  
  after_initialize :set_initial_balance
  
  private
  
  def set_initial_balance
    self.balance ||= 0.0
  end
end

# == Schema Information
#
# Table name: accounts
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  balance    :decimal(14, 2)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

