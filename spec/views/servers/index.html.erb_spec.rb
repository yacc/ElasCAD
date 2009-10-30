require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/servers/index.html.erb" do
  include ServersHelper
  
  before(:each) do
    assigns[:servers] = [
      stub_model(Server,
        :name => "value for name",
        :server_type => "value for server_type"
      ),
      stub_model(Server,
        :name => "value for name",
        :server_type => "value for server_type"
      )
    ]
  end

  it "should render list of servers" do
    render "/servers/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", "value for server_type", 2)
  end
end

