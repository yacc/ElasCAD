require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/esbs/index.html.erb" do
  include EsbsHelper
  
  before(:each) do
    assigns[:esbs] = [
      stub_model(Esb,
        :name => "value for name",
        :size => "1",
        :status => "value for status"
      ),
      stub_model(Esb,
        :name => "value for name",
        :size => "1",
        :status => "value for status"
      )
    ]
  end

  it "should render list of esbs" do
    render "/esbs/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "value for status", 2)
  end
end

