require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/instances/show.html.erb" do
  include InstancesHelper
  
  before(:each) do
    assigns[:instance] = @instance = stub_model(Instance,
      :name => "value for name",
      :status => "value for status"
    )
  end

  it "should render attributes in <p>" do
    render "/instances/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ status/)
  end
end

