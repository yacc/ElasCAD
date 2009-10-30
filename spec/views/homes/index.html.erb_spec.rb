require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/homes/index.html.erb" do
  include HomesHelper
  
  before(:each) do
    assigns[:homes] = [
      stub_model(Home,
        :name => "value for name"
      ),
      stub_model(Home,
        :name => "value for name"
      )
    ]
  end

  it "should render list of homes" do
    render "/homes/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
  end
end

