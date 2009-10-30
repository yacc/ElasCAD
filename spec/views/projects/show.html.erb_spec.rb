require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/projects/show.html.erb" do
  include ProjectsHelper
  
  before(:each) do
    assigns[:project] = @project = stub_model(Project,
      :name => "value for name",
      :x11 => false
    )
  end

  it "should render attributes in <p>" do
    render "/projects/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/als/)
  end
end

