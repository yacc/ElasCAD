require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EsbsController do

  def mock_esb(stubs={})
    @mock_esb ||= mock_model(Esb, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all esbs as @esbs" do
      Esb.should_receive(:find).with(:all).and_return([mock_esb])
      get :index
      assigns[:esbs].should == [mock_esb]
    end

    describe "with mime type of xml" do
  
      it "should render all esbs as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Esb.should_receive(:find).with(:all).and_return(esbs = mock("Array of Esbs"))
        esbs.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested esb as @esb" do
      Esb.should_receive(:find).with("37").and_return(mock_esb)
      get :show, :id => "37"
      assigns[:esb].should equal(mock_esb)
    end
    
    describe "with mime type of xml" do

      it "should render the requested esb as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Esb.should_receive(:find).with("37").and_return(mock_esb)
        mock_esb.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new esb as @esb" do
      Esb.should_receive(:new).and_return(mock_esb)
      get :new
      assigns[:esb].should equal(mock_esb)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested esb as @esb" do
      Esb.should_receive(:find).with("37").and_return(mock_esb)
      get :edit, :id => "37"
      assigns[:esb].should equal(mock_esb)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created esb as @esb" do
        Esb.should_receive(:new).with({'these' => 'params'}).and_return(mock_esb(:save => true))
        post :create, :esb => {:these => 'params'}
        assigns(:esb).should equal(mock_esb)
      end

      it "should redirect to the created esb" do
        Esb.stub!(:new).and_return(mock_esb(:save => true))
        post :create, :esb => {}
        response.should redirect_to(esb_url(mock_esb))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved esb as @esb" do
        Esb.stub!(:new).with({'these' => 'params'}).and_return(mock_esb(:save => false))
        post :create, :esb => {:these => 'params'}
        assigns(:esb).should equal(mock_esb)
      end

      it "should re-render the 'new' template" do
        Esb.stub!(:new).and_return(mock_esb(:save => false))
        post :create, :esb => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested esb" do
        Esb.should_receive(:find).with("37").and_return(mock_esb)
        mock_esb.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :esb => {:these => 'params'}
      end

      it "should expose the requested esb as @esb" do
        Esb.stub!(:find).and_return(mock_esb(:update_attributes => true))
        put :update, :id => "1"
        assigns(:esb).should equal(mock_esb)
      end

      it "should redirect to the esb" do
        Esb.stub!(:find).and_return(mock_esb(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(esb_url(mock_esb))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested esb" do
        Esb.should_receive(:find).with("37").and_return(mock_esb)
        mock_esb.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :esb => {:these => 'params'}
      end

      it "should expose the esb as @esb" do
        Esb.stub!(:find).and_return(mock_esb(:update_attributes => false))
        put :update, :id => "1"
        assigns(:esb).should equal(mock_esb)
      end

      it "should re-render the 'edit' template" do
        Esb.stub!(:find).and_return(mock_esb(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested esb" do
      Esb.should_receive(:find).with("37").and_return(mock_esb)
      mock_esb.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the esbs list" do
      Esb.stub!(:find).and_return(mock_esb(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(esbs_url)
    end

  end

end
