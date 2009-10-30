require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Esb do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :size => "1",
      :status => "value for status"
    }
  end

  it "should create a new instance given valid attributes" do
    Esb.create!(@valid_attributes)
  end
end
