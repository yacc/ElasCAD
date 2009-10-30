require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/instances/edit.html.erb" do
  include InstancesHelper
  
  before(:each) do
    assigns[:instance] = @instance = stub_model(Instance,
      :new_record? => false,
      :name => "value for name",
      :status => "value for status"
    )
  end

  it "should render edit form" do
    render "/instances/edit.html.erb"
    
    response.should have_tag("form[action=#{instance_path(@instance)}][method=post]") do
      with_tag('input#instance_name[name=?]', "instance[name]")
      with_tag('input#instance_status[name=?]', "instance[status]")
    end
  end
end


