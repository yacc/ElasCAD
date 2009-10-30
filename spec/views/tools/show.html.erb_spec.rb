require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tools/show.html.erb" do
  include ToolsHelper
  
  before(:each) do
    assigns[:tool] = @tool = stub_model(Tool,
      :name => "value for name",
      :vendor => "value for vendor",
      :license_key => "value for license_key",
      :license_server => "value for license_server",
      :s3_snapshot => "value for s3_snapshot"
    )
  end

  it "should render attributes in <p>" do
    render "/tools/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ vendor/)
    response.should have_text(/value\ for\ license_key/)
    response.should have_text(/value\ for\ license_server/)
    response.should have_text(/value\ for\ s3_snapshot/)
  end
end

