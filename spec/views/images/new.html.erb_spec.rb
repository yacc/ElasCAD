require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/images/new.html.erb" do
  include ImagesHelper
  
  before(:each) do
    assigns[:image] = stub_model(Image,
      :new_record? => true,
      :name => "value for name",
      :ami => "value for ami",
      :x11 => false,
      :os => "value for os"
    )
  end

  it "should render new form" do
    render "/images/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", images_path) do
      with_tag("input#image_name[name=?]", "image[name]")
      with_tag("input#image_ami[name=?]", "image[ami]")
      with_tag("input#image_x11[name=?]", "image[x11]")
      with_tag("input#image_os[name=?]", "image[os]")
    end
  end
end


