class Transaction < ActiveRecord::Base
  belongs_to :account
  acts_as_taggable
  
  accepts_nested_attributes_for :tags
end
