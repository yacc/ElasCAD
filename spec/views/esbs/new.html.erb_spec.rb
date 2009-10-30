require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/esbs/new.html.erb" do
  include EsbsHelper
  
  before(:each) do
    assigns[:esb] = stub_model(Esb,
      :new_record? => true,
      :name => "value for name",
      :size => "1",
      :status => "value for status"
    )
  end

  it "should render new form" do
    render "/esbs/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", esbs_path) do
      with_tag("input#esb_name[name=?]", "esb[name]")
      with_tag("input#esb_size[name=?]", "esb[size]")
      with_tag("input#esb_status[name=?]", "esb[status]")
    end
  end
end


