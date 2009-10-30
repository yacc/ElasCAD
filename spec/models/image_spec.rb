require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Image do
  fixtures :operating_systems
  
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :ami => "value for ami",
      :x11 => false,
      :os => operating_systems(:one)
    }
    @new_32bit_image_attributes = {
      :name => "Ubuntu Jaunty 32bit",
      :ami => nil,
      :x11 => false,
      :os => operating_systems(:one)
    }
  end

  it "should create a new instance given valid attributes" do
    Image.create!(@valid_attributes)
  end

  it "should build and store a list of supported AWS images" do
    pending
  end

end
