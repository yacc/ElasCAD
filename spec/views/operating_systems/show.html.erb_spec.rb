require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/operating_systems/show.html.erb" do
  include OperatingSystemsHelper
  
  before(:each) do
    assigns[:operating_system] = @operating_system = stub_model(OperatingSystem,
      :name => "value for name",
      :version => "value for version",
      :release => "value for release",
      :provider => "value for provider"
    )
  end

  it "should render attributes in <p>" do
    render "/operating_systems/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ version/)
    response.should have_text(/value\ for\ release/)
    response.should have_text(/value\ for\ provider/)
  end
end

