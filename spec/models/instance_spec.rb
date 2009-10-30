require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Instance do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :status => "value for status"
    }
  end

  it "should create a new instance given valid attributes" do
    Instance.create!(@valid_attributes)
  end
end
