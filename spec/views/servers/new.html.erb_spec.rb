require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/servers/new.html.erb" do
  include ServersHelper
  
  before(:each) do
    assigns[:server] = stub_model(Server,
      :new_record? => true,
      :name => "value for name",
      :server_type => "value for server_type"
    )
  end

  it "should render new form" do
    render "/servers/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", servers_path) do
      with_tag("input#server_name[name=?]", "server[name]")
      with_tag("input#server_server_type[name=?]", "server[server_type]")
    end
  end
end


