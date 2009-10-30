require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/homes/new.html.erb" do
  include HomesHelper
  
  before(:each) do
    assigns[:home] = stub_model(Home,
      :new_record? => true,
      :name => "value for name"
    )
  end

  it "should render new form" do
    render "/homes/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", homes_path) do
      with_tag("input#home_name[name=?]", "home[name]")
    end
  end
end


