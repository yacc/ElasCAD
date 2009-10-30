require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/images/edit.html.erb" do
  include ImagesHelper
  
  before(:each) do
    assigns[:image] = @image = stub_model(Image,
      :new_record? => false,
      :name => "value for name",
      :ami => "value for ami",
      :x11 => false,
      :os => "value for os"
    )
  end

  it "should render edit form" do
    render "/images/edit.html.erb"
    
    response.should have_tag("form[action=#{image_path(@image)}][method=post]") do
      with_tag('input#image_name[name=?]', "image[name]")
      with_tag('input#image_ami[name=?]', "image[ami]")
      with_tag('input#image_x11[name=?]', "image[x11]")
      with_tag('input#image_os[name=?]', "image[os]")
    end
  end
end


