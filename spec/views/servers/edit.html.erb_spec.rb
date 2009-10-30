require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/servers/edit.html.erb" do
  include ServersHelper
  
  before(:each) do
    assigns[:server] = @server = stub_model(Server,
      :new_record? => false,
      :name => "value for name",
      :server_type => "value for server_type"
    )
  end

  it "should render edit form" do
    render "/servers/edit.html.erb"
    
    response.should have_tag("form[action=#{server_path(@server)}][method=post]") do
      with_tag('input#server_name[name=?]', "server[name]")
      with_tag('input#server_server_type[name=?]', "server[server_type]")
    end
  end
end


