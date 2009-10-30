require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/homes/edit.html.erb" do
  include HomesHelper
  
  before(:each) do
    assigns[:home] = @home = stub_model(Home,
      :new_record? => false,
      :name => "value for name"
    )
  end

  it "should render edit form" do
    render "/homes/edit.html.erb"
    
    response.should have_tag("form[action=#{home_path(@home)}][method=post]") do
      with_tag('input#home_name[name=?]', "home[name]")
    end
  end
end


