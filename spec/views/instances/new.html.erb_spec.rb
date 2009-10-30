require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/instances/new.html.erb" do
  include InstancesHelper
  
  before(:each) do
    assigns[:instance] = stub_model(Instance,
      :new_record? => true,
      :name => "value for name",
      :status => "value for status"
    )
  end

  it "should render new form" do
    render "/instances/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", instances_path) do
      with_tag("input#instance_name[name=?]", "instance[name]")
      with_tag("input#instance_status[name=?]", "instance[status]")
    end
  end
end


