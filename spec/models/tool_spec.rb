require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Tool do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :vendor => "value for vendor",
      :license_key => "value for license_key",
      :license_server => "value for license_server",
      :s3_snapshot => "value for s3_snapshot"
    }
  end

  it "should create a new instance given valid attributes" do
    Tool.create!(@valid_attributes)
  end
end
