require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe S3SnapshotsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "s3_snapshots", :action => "index").should == "/s3_snapshots"
    end
  
    it "should map #new" do
      route_for(:controller => "s3_snapshots", :action => "new").should == "/s3_snapshots/new"
    end
  
    it "should map #show" do
      route_for(:controller => "s3_snapshots", :action => "show", :id => 1).should == "/s3_snapshots/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "s3_snapshots", :action => "edit", :id => 1).should == "/s3_snapshots/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "s3_snapshots", :action => "update", :id => 1).should == "/s3_snapshots/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "s3_snapshots", :action => "destroy", :id => 1).should == "/s3_snapshots/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/s3_snapshots").should == {:controller => "s3_snapshots", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/s3_snapshots/new").should == {:controller => "s3_snapshots", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/s3_snapshots").should == {:controller => "s3_snapshots", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/s3_snapshots/1").should == {:controller => "s3_snapshots", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/s3_snapshots/1/edit").should == {:controller => "s3_snapshots", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/s3_snapshots/1").should == {:controller => "s3_snapshots", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/s3_snapshots/1").should == {:controller => "s3_snapshots", :action => "destroy", :id => "1"}
    end
  end
end
