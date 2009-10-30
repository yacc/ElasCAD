require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/s3_snapshots/edit.html.erb" do
  include S3SnapshotsHelper
  
  before(:each) do
    assigns[:s3_snapshot] = @s3_snapshot = stub_model(S3Snapshot,
      :new_record? => false,
      :name => "value for name",
      :snapshot_status => "value for snapshot_status"
    )
  end

  it "should render edit form" do
    render "/s3_snapshots/edit.html.erb"
    
    response.should have_tag("form[action=#{s3_snapshot_path(@s3_snapshot)}][method=post]") do
      with_tag('input#s3_snapshot_name[name=?]', "s3_snapshot[name]")
      with_tag('input#s3_snapshot_snapshot_status[name=?]', "s3_snapshot[snapshot_status]")
    end
  end
end


