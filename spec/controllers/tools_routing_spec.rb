require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ToolsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "tools", :action => "index").should == "/tools"
    end
  
    it "should map #new" do
      route_for(:controller => "tools", :action => "new").should == "/tools/new"
    end
  
    it "should map #show" do
      route_for(:controller => "tools", :action => "show", :id => 1).should == "/tools/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "tools", :action => "edit", :id => 1).should == "/tools/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "tools", :action => "update", :id => 1).should == "/tools/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "tools", :action => "destroy", :id => 1).should == "/tools/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/tools").should == {:controller => "tools", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/tools/new").should == {:controller => "tools", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/tools").should == {:controller => "tools", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/tools/1").should == {:controller => "tools", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/tools/1/edit").should == {:controller => "tools", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/tools/1").should == {:controller => "tools", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/tools/1").should == {:controller => "tools", :action => "destroy", :id => "1"}
    end
  end
end
