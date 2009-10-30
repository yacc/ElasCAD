require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe S3Snapshot do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :snapshot_status => "value for snapshot_status"
    }
  end

  it "should create a new instance given valid attributes" do
    S3Snapshot.create!(@valid_attributes)
  end
end
