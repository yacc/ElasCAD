require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tools/index.html.erb" do
  include ToolsHelper
  
  before(:each) do
    assigns[:tools] = [
      stub_model(Tool,
        :name => "value for name",
        :vendor => "value for vendor",
        :license_key => "value for license_key",
        :license_server => "value for license_server",
        :s3_snapshot => "value for s3_snapshot"
      ),
      stub_model(Tool,
        :name => "value for name",
        :vendor => "value for vendor",
        :license_key => "value for license_key",
        :license_server => "value for license_server",
        :s3_snapshot => "value for s3_snapshot"
      )
    ]
  end

  it "should render list of tools" do
    render "/tools/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", "value for vendor", 2)
    response.should have_tag("tr>td", "value for license_key", 2)
    response.should have_tag("tr>td", "value for license_server", 2)
    response.should have_tag("tr>td", "value for s3_snapshot", 2)
  end
end

