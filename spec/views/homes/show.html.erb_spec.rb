require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/homes/show.html.erb" do
  include HomesHelper
  
  before(:each) do
    assigns[:home] = @home = stub_model(Home,
      :name => "value for name"
    )
  end

  it "should render attributes in <p>" do
    render "/homes/show.html.erb"
    response.should have_text(/value\ for\ name/)
  end
end

