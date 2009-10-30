require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HomesController do

  def mock_home(stubs={})
    @mock_home ||= mock_model(Home, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all homes as @homes" do
      Home.should_receive(:find).with(:all).and_return([mock_home])
      get :index
      assigns[:homes].should == [mock_home]
    end

    describe "with mime type of xml" do
  
      it "should render all homes as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Home.should_receive(:find).with(:all).and_return(homes = mock("Array of Homes"))
        homes.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested home as @home" do
      Home.should_receive(:find).with("37").and_return(mock_home)
      get :show, :id => "37"
      assigns[:home].should equal(mock_home)
    end
    
    describe "with mime type of xml" do

      it "should render the requested home as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Home.should_receive(:find).with("37").and_return(mock_home)
        mock_home.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new home as @home" do
      Home.should_receive(:new).and_return(mock_home)
      get :new
      assigns[:home].should equal(mock_home)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested home as @home" do
      Home.should_receive(:find).with("37").and_return(mock_home)
      get :edit, :id => "37"
      assigns[:home].should equal(mock_home)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created home as @home" do
        Home.should_receive(:new).with({'these' => 'params'}).and_return(mock_home(:save => true))
        post :create, :home => {:these => 'params'}
        assigns(:home).should equal(mock_home)
      end

      it "should redirect to the created home" do
        Home.stub!(:new).and_return(mock_home(:save => true))
        post :create, :home => {}
        response.should redirect_to(home_url(mock_home))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved home as @home" do
        Home.stub!(:new).with({'these' => 'params'}).and_return(mock_home(:save => false))
        post :create, :home => {:these => 'params'}
        assigns(:home).should equal(mock_home)
      end

      it "should re-render the 'new' template" do
        Home.stub!(:new).and_return(mock_home(:save => false))
        post :create, :home => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested home" do
        Home.should_receive(:find).with("37").and_return(mock_home)
        mock_home.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :home => {:these => 'params'}
      end

      it "should expose the requested home as @home" do
        Home.stub!(:find).and_return(mock_home(:update_attributes => true))
        put :update, :id => "1"
        assigns(:home).should equal(mock_home)
      end

      it "should redirect to the home" do
        Home.stub!(:find).and_return(mock_home(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(home_url(mock_home))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested home" do
        Home.should_receive(:find).with("37").and_return(mock_home)
        mock_home.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :home => {:these => 'params'}
      end

      it "should expose the home as @home" do
        Home.stub!(:find).and_return(mock_home(:update_attributes => false))
        put :update, :id => "1"
        assigns(:home).should equal(mock_home)
      end

      it "should re-render the 'edit' template" do
        Home.stub!(:find).and_return(mock_home(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested home" do
      Home.should_receive(:find).with("37").and_return(mock_home)
      mock_home.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the homes list" do
      Home.stub!(:find).and_return(mock_home(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(homes_url)
    end

  end

end
