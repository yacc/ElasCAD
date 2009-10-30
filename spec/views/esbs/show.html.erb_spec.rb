require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/esbs/show.html.erb" do
  include EsbsHelper
  
  before(:each) do
    assigns[:esb] = @esb = stub_model(Esb,
      :name => "value for name",
      :size => "1",
      :status => "value for status"
    )
  end

  it "should render attributes in <p>" do
    render "/esbs/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ status/)
  end
end

