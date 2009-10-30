class Server < ActiveRecord::Base
  belongs_to :project
  has_one :image
end
