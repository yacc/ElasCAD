class S3Snapshot < ActiveRecord::Base
  belongs_to :home
  belongs_to :tool
end
