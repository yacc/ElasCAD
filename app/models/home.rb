class Home < ActiveRecord::Base
  has_one :esbs
  has_one :s3_snapshot
  belongs_to :project
end
