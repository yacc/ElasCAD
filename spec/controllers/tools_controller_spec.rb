require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ToolsController do

  def mock_tool(stubs={})
    @mock_tool ||= mock_model(Tool, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all tools as @tools" do
      Tool.should_receive(:find).with(:all).and_return([mock_tool])
      get :index
      assigns[:tools].should == [mock_tool]
    end

    describe "with mime type of xml" do
  
      it "should render all tools as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Tool.should_receive(:find).with(:all).and_return(tools = mock("Array of Tools"))
        tools.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested tool as @tool" do
      Tool.should_receive(:find).with("37").and_return(mock_tool)
      get :show, :id => "37"
      assigns[:tool].should equal(mock_tool)
    end
    
    describe "with mime type of xml" do

      it "should render the requested tool as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Tool.should_receive(:find).with("37").and_return(mock_tool)
        mock_tool.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new tool as @tool" do
      Tool.should_receive(:new).and_return(mock_tool)
      get :new
      assigns[:tool].should equal(mock_tool)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested tool as @tool" do
      Tool.should_receive(:find).with("37").and_return(mock_tool)
      get :edit, :id => "37"
      assigns[:tool].should equal(mock_tool)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created tool as @tool" do
        Tool.should_receive(:new).with({'these' => 'params'}).and_return(mock_tool(:save => true))
        post :create, :tool => {:these => 'params'}
        assigns(:tool).should equal(mock_tool)
      end

      it "should redirect to the created tool" do
        Tool.stub!(:new).and_return(mock_tool(:save => true))
        post :create, :tool => {}
        response.should redirect_to(tool_url(mock_tool))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved tool as @tool" do
        Tool.stub!(:new).with({'these' => 'params'}).and_return(mock_tool(:save => false))
        post :create, :tool => {:these => 'params'}
        assigns(:tool).should equal(mock_tool)
      end

      it "should re-render the 'new' template" do
        Tool.stub!(:new).and_return(mock_tool(:save => false))
        post :create, :tool => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested tool" do
        Tool.should_receive(:find).with("37").and_return(mock_tool)
        mock_tool.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :tool => {:these => 'params'}
      end

      it "should expose the requested tool as @tool" do
        Tool.stub!(:find).and_return(mock_tool(:update_attributes => true))
        put :update, :id => "1"
        assigns(:tool).should equal(mock_tool)
      end

      it "should redirect to the tool" do
        Tool.stub!(:find).and_return(mock_tool(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(tool_url(mock_tool))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested tool" do
        Tool.should_receive(:find).with("37").and_return(mock_tool)
        mock_tool.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :tool => {:these => 'params'}
      end

      it "should expose the tool as @tool" do
        Tool.stub!(:find).and_return(mock_tool(:update_attributes => false))
        put :update, :id => "1"
        assigns(:tool).should equal(mock_tool)
      end

      it "should re-render the 'edit' template" do
        Tool.stub!(:find).and_return(mock_tool(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested tool" do
      Tool.should_receive(:find).with("37").and_return(mock_tool)
      mock_tool.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the tools list" do
      Tool.stub!(:find).and_return(mock_tool(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(tools_url)
    end

  end

end
