require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/servers/show.html.erb" do
  include ServersHelper
  
  before(:each) do
    assigns[:server] = @server = stub_model(Server,
      :name => "value for name",
      :server_type => "value for server_type"
    )
  end

  it "should render attributes in <p>" do
    render "/servers/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ server_type/)
  end
end

