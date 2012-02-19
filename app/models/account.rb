class Account < ActiveRecord::Base
  belongs_to :user
  has_many :transactions
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  scope :by_user, lambda { |user| where(:user_id => user.id) }
  
  after_initialize :set_initial_balance
  
  private
  
  def set_initial_balance
    self.balance ||= 0.0
  end
end
