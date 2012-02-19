class Account < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  
  scope :by_user, lambda { |user| where(:user_id => user.id) }
end
