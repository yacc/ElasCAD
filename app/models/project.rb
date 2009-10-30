class Project < ActiveRecord::Base
  has_many :tools
  has_one :server
  has_one :home
  has_one :operating_system

  def after_initialize
    #an operating system maps to an image
    self.home = Home.find_or_create_by_size(self.data_size) unless self.home
    self.status = 'Ready'
  end


end
