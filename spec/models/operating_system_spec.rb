require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OperatingSystem do
  fixtures :images,:projects

  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :version => "value for version",
      :release => "value for release",
      :provider => "value for provider",
      :bit_type => "32bit"
    }
  end

  it "should create a new OS instance given valid attributes" do
    OperatingSystem.create!(@valid_attributes)
  end

  it "should attach an image that amtches the OS specs" do
     @os = OperatingSystem.new(@valid_attributes)
     @os.image = images(:one)
  end

  it "should build a list of supported OS and link them to AMIs" do
    pending
  end


end
