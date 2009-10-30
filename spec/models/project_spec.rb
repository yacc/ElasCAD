require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
describe Project do
  fixtures :images,:tools,:instances,:homes,:servers,:operating_systems
  
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :x11 => false,
      :operating_system => operating_systems(:one),
      :image => images(:one),
      :tools => [tools(:one),tools(:two),tools(:three)],
      :server => servers(:one),
      :data_size => '250', #250Mb
      :home => homes(:one),
      :status => "Valid"
    }
    @attributes_new_project = {
      :name => "Brand new project",
      :x11 => false,
      :operating_system => operating_systems(:one),
      :image => nil,
      :tools => [tools(:one),tools(:two),tools(:three)],
      :server => nil,
      :data_size => '250', #250Mb
      :home => nil,
      :status => "New"
    }
  end

  it "should create a new project given valid attributes" do
    Project.create!(@valid_attributes)
  end

  it "should create new project, define home and attach an image" do
    @p = Project.new(@attributes_new_project)
    @p.status.should == "New"
    @p.image.should_not be_nil
    @p.home.should_not be_nil
    @p.image.should == images(:one)
    @p.home.should == homes(:one)
    @p.status.should == "Ready"
  end

  it "should add a server to an existing project" do
    @p = Project.new(@attributes_new_project)
    @p.server = servers(:one)
  end

end
