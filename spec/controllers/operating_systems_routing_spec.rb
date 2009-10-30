require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OperatingSystemsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "operating_systems", :action => "index").should == "/operating_systems"
    end
  
    it "should map #new" do
      route_for(:controller => "operating_systems", :action => "new").should == "/operating_systems/new"
    end
  
    it "should map #show" do
      route_for(:controller => "operating_systems", :action => "show", :id => 1).should == "/operating_systems/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "operating_systems", :action => "edit", :id => 1).should == "/operating_systems/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "operating_systems", :action => "update", :id => 1).should == "/operating_systems/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "operating_systems", :action => "destroy", :id => 1).should == "/operating_systems/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/operating_systems").should == {:controller => "operating_systems", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/operating_systems/new").should == {:controller => "operating_systems", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/operating_systems").should == {:controller => "operating_systems", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/operating_systems/1").should == {:controller => "operating_systems", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/operating_systems/1/edit").should == {:controller => "operating_systems", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/operating_systems/1").should == {:controller => "operating_systems", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/operating_systems/1").should == {:controller => "operating_systems", :action => "destroy", :id => "1"}
    end
  end
end
