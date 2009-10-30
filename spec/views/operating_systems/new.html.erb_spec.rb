require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/operating_systems/new.html.erb" do
  include OperatingSystemsHelper
  
  before(:each) do
    assigns[:operating_system] = stub_model(OperatingSystem,
      :new_record? => true,
      :name => "value for name",
      :version => "value for version",
      :release => "value for release",
      :provider => "value for provider"
    )
  end

  it "should render new form" do
    render "/operating_systems/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", operating_systems_path) do
      with_tag("input#operating_system_name[name=?]", "operating_system[name]")
      with_tag("input#operating_system_version[name=?]", "operating_system[version]")
      with_tag("input#operating_system_release[name=?]", "operating_system[release]")
      with_tag("input#operating_system_provider[name=?]", "operating_system[provider]")
    end
  end
end


