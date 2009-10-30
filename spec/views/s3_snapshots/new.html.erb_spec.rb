require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/s3_snapshots/new.html.erb" do
  include S3SnapshotsHelper
  
  before(:each) do
    assigns[:s3_snapshot] = stub_model(S3Snapshot,
      :new_record? => true,
      :name => "value for name",
      :snapshot_status => "value for snapshot_status"
    )
  end

  it "should render new form" do
    render "/s3_snapshots/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", s3_snapshots_path) do
      with_tag("input#s3_snapshot_name[name=?]", "s3_snapshot[name]")
      with_tag("input#s3_snapshot_snapshot_status[name=?]", "s3_snapshot[snapshot_status]")
    end
  end
end


