require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/operating_systems/index.html.erb" do
  include OperatingSystemsHelper
  
  before(:each) do
    assigns[:operating_systems] = [
      stub_model(OperatingSystem,
        :name => "value for name",
        :version => "value for version",
        :release => "value for release",
        :provider => "value for provider"
      ),
      stub_model(OperatingSystem,
        :name => "value for name",
        :version => "value for version",
        :release => "value for release",
        :provider => "value for provider"
      )
    ]
  end

  it "should render list of operating_systems" do
    render "/operating_systems/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", "value for version", 2)
    response.should have_tag("tr>td", "value for release", 2)
    response.should have_tag("tr>td", "value for provider", 2)
  end
end

