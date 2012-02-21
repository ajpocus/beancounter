class Statement < ActiveRecord::Base
  belongs_to :account
  mount_uploader :file, StatementUploader
end
