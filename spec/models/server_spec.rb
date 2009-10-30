require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Server do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :server_type => "value for server_type"
    }
  end

  it "should create a new instance given valid attributes" do
    Server.create!(@valid_attributes)
  end
end
