class Project < ActiveRecord::Base
  has_many :tools
  has_one :image
  has_one :server
  has_one :home
  has_one :operating_system

  def after_initialize
    #an operating system maps to an image
    self.image = self.operating_system.image unless self.image
    self.home = Home.find_or_create_by_size(self.data_size) unless self.home
  end


end
