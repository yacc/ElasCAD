require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/s3_snapshots/show.html.erb" do
  include S3SnapshotsHelper
  
  before(:each) do
    assigns[:s3_snapshot] = @s3_snapshot = stub_model(S3Snapshot,
      :name => "value for name",
      :snapshot_status => "value for snapshot_status"
    )
  end

  it "should render attributes in <p>" do
    render "/s3_snapshots/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ snapshot_status/)
  end
end

