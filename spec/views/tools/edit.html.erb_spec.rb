require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tools/edit.html.erb" do
  include ToolsHelper
  
  before(:each) do
    assigns[:tool] = @tool = stub_model(Tool,
      :new_record? => false,
      :name => "value for name",
      :vendor => "value for vendor",
      :license_key => "value for license_key",
      :license_server => "value for license_server",
      :s3_snapshot => "value for s3_snapshot"
    )
  end

  it "should render edit form" do
    render "/tools/edit.html.erb"
    
    response.should have_tag("form[action=#{tool_path(@tool)}][method=post]") do
      with_tag('input#tool_name[name=?]', "tool[name]")
      with_tag('input#tool_vendor[name=?]', "tool[vendor]")
      with_tag('input#tool_license_key[name=?]', "tool[license_key]")
      with_tag('input#tool_license_server[name=?]', "tool[license_server]")
      with_tag('input#tool_s3_snapshot[name=?]', "tool[s3_snapshot]")
    end
  end
end


