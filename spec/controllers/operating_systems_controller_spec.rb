require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OperatingSystemsController do

  def mock_operating_system(stubs={})
    @mock_operating_system ||= mock_model(OperatingSystem, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all operating_systems as @operating_systems" do
      OperatingSystem.should_receive(:find).with(:all).and_return([mock_operating_system])
      get :index
      assigns[:operating_systems].should == [mock_operating_system]
    end

    describe "with mime type of xml" do
  
      it "should render all operating_systems as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        OperatingSystem.should_receive(:find).with(:all).and_return(operating_systems = mock("Array of OperatingSystems"))
        operating_systems.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested operating_system as @operating_system" do
      OperatingSystem.should_receive(:find).with("37").and_return(mock_operating_system)
      get :show, :id => "37"
      assigns[:operating_system].should equal(mock_operating_system)
    end
    
    describe "with mime type of xml" do

      it "should render the requested operating_system as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        OperatingSystem.should_receive(:find).with("37").and_return(mock_operating_system)
        mock_operating_system.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new operating_system as @operating_system" do
      OperatingSystem.should_receive(:new).and_return(mock_operating_system)
      get :new
      assigns[:operating_system].should equal(mock_operating_system)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested operating_system as @operating_system" do
      OperatingSystem.should_receive(:find).with("37").and_return(mock_operating_system)
      get :edit, :id => "37"
      assigns[:operating_system].should equal(mock_operating_system)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created operating_system as @operating_system" do
        OperatingSystem.should_receive(:new).with({'these' => 'params'}).and_return(mock_operating_system(:save => true))
        post :create, :operating_system => {:these => 'params'}
        assigns(:operating_system).should equal(mock_operating_system)
      end

      it "should redirect to the created operating_system" do
        OperatingSystem.stub!(:new).and_return(mock_operating_system(:save => true))
        post :create, :operating_system => {}
        response.should redirect_to(operating_system_url(mock_operating_system))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved operating_system as @operating_system" do
        OperatingSystem.stub!(:new).with({'these' => 'params'}).and_return(mock_operating_system(:save => false))
        post :create, :operating_system => {:these => 'params'}
        assigns(:operating_system).should equal(mock_operating_system)
      end

      it "should re-render the 'new' template" do
        OperatingSystem.stub!(:new).and_return(mock_operating_system(:save => false))
        post :create, :operating_system => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested operating_system" do
        OperatingSystem.should_receive(:find).with("37").and_return(mock_operating_system)
        mock_operating_system.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :operating_system => {:these => 'params'}
      end

      it "should expose the requested operating_system as @operating_system" do
        OperatingSystem.stub!(:find).and_return(mock_operating_system(:update_attributes => true))
        put :update, :id => "1"
        assigns(:operating_system).should equal(mock_operating_system)
      end

      it "should redirect to the operating_system" do
        OperatingSystem.stub!(:find).and_return(mock_operating_system(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(operating_system_url(mock_operating_system))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested operating_system" do
        OperatingSystem.should_receive(:find).with("37").and_return(mock_operating_system)
        mock_operating_system.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :operating_system => {:these => 'params'}
      end

      it "should expose the operating_system as @operating_system" do
        OperatingSystem.stub!(:find).and_return(mock_operating_system(:update_attributes => false))
        put :update, :id => "1"
        assigns(:operating_system).should equal(mock_operating_system)
      end

      it "should re-render the 'edit' template" do
        OperatingSystem.stub!(:find).and_return(mock_operating_system(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested operating_system" do
      OperatingSystem.should_receive(:find).with("37").and_return(mock_operating_system)
      mock_operating_system.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the operating_systems list" do
      OperatingSystem.stub!(:find).and_return(mock_operating_system(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(operating_systems_url)
    end

  end

end
