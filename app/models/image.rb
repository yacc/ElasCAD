class Image < ActiveRecord::Base
  belongs_to :server
  belongs_to :operating_system

#  def match(os,x11_support)
#    self.ami = ''
#  end

end
