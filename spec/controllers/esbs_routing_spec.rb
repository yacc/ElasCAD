require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EsbsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "esbs", :action => "index").should == "/esbs"
    end
  
    it "should map #new" do
      route_for(:controller => "esbs", :action => "new").should == "/esbs/new"
    end
  
    it "should map #show" do
      route_for(:controller => "esbs", :action => "show", :id => 1).should == "/esbs/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "esbs", :action => "edit", :id => 1).should == "/esbs/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "esbs", :action => "update", :id => 1).should == "/esbs/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "esbs", :action => "destroy", :id => 1).should == "/esbs/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/esbs").should == {:controller => "esbs", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/esbs/new").should == {:controller => "esbs", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/esbs").should == {:controller => "esbs", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/esbs/1").should == {:controller => "esbs", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/esbs/1/edit").should == {:controller => "esbs", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/esbs/1").should == {:controller => "esbs", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/esbs/1").should == {:controller => "esbs", :action => "destroy", :id => "1"}
    end
  end
end
