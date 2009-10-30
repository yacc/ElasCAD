require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/projects/edit.html.erb" do
  include ProjectsHelper
  
  before(:each) do
    assigns[:project] = @project = stub_model(Project,
      :new_record? => false,
      :name => "value for name",
      :x11 => false
    )
  end

  it "should render edit form" do
    render "/projects/edit.html.erb"
    
    response.should have_tag("form[action=#{project_path(@project)}][method=post]") do
      with_tag('input#project_name[name=?]', "project[name]")
      with_tag('input#project_x11[name=?]', "project[x11]")
    end
  end
end


