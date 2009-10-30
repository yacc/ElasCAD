require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Home do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :size => 250
    }
  end

  it "should create a new instance given valid attributes" do
    Home.create!(@valid_attributes)
  end

  it "should allocate a new s3 home disk and update status" do
    pending
    @q = SqsQueue.new('home')
    @h = Home.new(@valid_attributes)
    @h.allocate_home
    @h.status.should == "pending"
    @q.dequeue(@h)
    @h.status.should == 'ready'
  end

end
