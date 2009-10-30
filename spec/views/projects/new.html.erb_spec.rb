require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/projects/new.html.erb" do
  include ProjectsHelper
  
  before(:each) do
    assigns[:project] = stub_model(Project,
      :new_record? => true,
      :name => "value for name",
      :x11 => false
    )
  end

  it "should render new form" do
    render "/projects/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", projects_path) do
      with_tag("input#project_name[name=?]", "project[name]")
      with_tag("input#project_x11[name=?]", "project[x11]")
    end
  end
end


