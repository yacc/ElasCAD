require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/instances/index.html.erb" do
  include InstancesHelper
  
  before(:each) do
    assigns[:instances] = [
      stub_model(Instance,
        :name => "value for name",
        :status => "value for status"
      ),
      stub_model(Instance,
        :name => "value for name",
        :status => "value for status"
      )
    ]
  end

  it "should render list of instances" do
    render "/instances/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", "value for status", 2)
  end
end

