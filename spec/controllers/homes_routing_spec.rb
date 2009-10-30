require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HomesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "homes", :action => "index").should == "/homes"
    end
  
    it "should map #new" do
      route_for(:controller => "homes", :action => "new").should == "/homes/new"
    end
  
    it "should map #show" do
      route_for(:controller => "homes", :action => "show", :id => 1).should == "/homes/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "homes", :action => "edit", :id => 1).should == "/homes/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "homes", :action => "update", :id => 1).should == "/homes/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "homes", :action => "destroy", :id => 1).should == "/homes/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/homes").should == {:controller => "homes", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/homes/new").should == {:controller => "homes", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/homes").should == {:controller => "homes", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/homes/1").should == {:controller => "homes", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/homes/1/edit").should == {:controller => "homes", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/homes/1").should == {:controller => "homes", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/homes/1").should == {:controller => "homes", :action => "destroy", :id => "1"}
    end
  end
end
