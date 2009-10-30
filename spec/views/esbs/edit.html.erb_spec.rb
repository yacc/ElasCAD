require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/esbs/edit.html.erb" do
  include EsbsHelper
  
  before(:each) do
    assigns[:esb] = @esb = stub_model(Esb,
      :new_record? => false,
      :name => "value for name",
      :size => "1",
      :status => "value for status"
    )
  end

  it "should render edit form" do
    render "/esbs/edit.html.erb"
    
    response.should have_tag("form[action=#{esb_path(@esb)}][method=post]") do
      with_tag('input#esb_name[name=?]', "esb[name]")
      with_tag('input#esb_size[name=?]', "esb[size]")
      with_tag('input#esb_status[name=?]', "esb[status]")
    end
  end
end


