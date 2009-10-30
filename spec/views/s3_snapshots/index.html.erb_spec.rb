require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/s3_snapshots/index.html.erb" do
  include S3SnapshotsHelper
  
  before(:each) do
    assigns[:s3_snapshots] = [
      stub_model(S3Snapshot,
        :name => "value for name",
        :snapshot_status => "value for snapshot_status"
      ),
      stub_model(S3Snapshot,
        :name => "value for name",
        :snapshot_status => "value for snapshot_status"
      )
    ]
  end

  it "should render list of s3_snapshots" do
    render "/s3_snapshots/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", "value for snapshot_status", 2)
  end
end

