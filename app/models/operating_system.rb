class OperatingSystem < ActiveRecord::Base
  OS_BIT_TYPES = [
      #Displayed    In db
      ["32 bits",   "32bit"],
      ["64 bits",   "64bit"] ]

  belongs_to :project
  has_one :image

  validates_inclusion_of :bit_type , :in => OS_BIT_TYPES.map {|disp, value| value}
end
