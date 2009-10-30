require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe S3SnapshotsController do

  def mock_s3_snapshot(stubs={})
    @mock_s3_snapshot ||= mock_model(S3Snapshot, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all s3_snapshots as @s3_snapshots" do
      S3Snapshot.should_receive(:find).with(:all).and_return([mock_s3_snapshot])
      get :index
      assigns[:s3_snapshots].should == [mock_s3_snapshot]
    end

    describe "with mime type of xml" do
  
      it "should render all s3_snapshots as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        S3Snapshot.should_receive(:find).with(:all).and_return(s3_snapshots = mock("Array of S3Snapshots"))
        s3_snapshots.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested s3_snapshot as @s3_snapshot" do
      S3Snapshot.should_receive(:find).with("37").and_return(mock_s3_snapshot)
      get :show, :id => "37"
      assigns[:s3_snapshot].should equal(mock_s3_snapshot)
    end
    
    describe "with mime type of xml" do

      it "should render the requested s3_snapshot as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        S3Snapshot.should_receive(:find).with("37").and_return(mock_s3_snapshot)
        mock_s3_snapshot.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new s3_snapshot as @s3_snapshot" do
      S3Snapshot.should_receive(:new).and_return(mock_s3_snapshot)
      get :new
      assigns[:s3_snapshot].should equal(mock_s3_snapshot)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested s3_snapshot as @s3_snapshot" do
      S3Snapshot.should_receive(:find).with("37").and_return(mock_s3_snapshot)
      get :edit, :id => "37"
      assigns[:s3_snapshot].should equal(mock_s3_snapshot)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created s3_snapshot as @s3_snapshot" do
        S3Snapshot.should_receive(:new).with({'these' => 'params'}).and_return(mock_s3_snapshot(:save => true))
        post :create, :s3_snapshot => {:these => 'params'}
        assigns(:s3_snapshot).should equal(mock_s3_snapshot)
      end

      it "should redirect to the created s3_snapshot" do
        S3Snapshot.stub!(:new).and_return(mock_s3_snapshot(:save => true))
        post :create, :s3_snapshot => {}
        response.should redirect_to(s3_snapshot_url(mock_s3_snapshot))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved s3_snapshot as @s3_snapshot" do
        S3Snapshot.stub!(:new).with({'these' => 'params'}).and_return(mock_s3_snapshot(:save => false))
        post :create, :s3_snapshot => {:these => 'params'}
        assigns(:s3_snapshot).should equal(mock_s3_snapshot)
      end

      it "should re-render the 'new' template" do
        S3Snapshot.stub!(:new).and_return(mock_s3_snapshot(:save => false))
        post :create, :s3_snapshot => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested s3_snapshot" do
        S3Snapshot.should_receive(:find).with("37").and_return(mock_s3_snapshot)
        mock_s3_snapshot.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :s3_snapshot => {:these => 'params'}
      end

      it "should expose the requested s3_snapshot as @s3_snapshot" do
        S3Snapshot.stub!(:find).and_return(mock_s3_snapshot(:update_attributes => true))
        put :update, :id => "1"
        assigns(:s3_snapshot).should equal(mock_s3_snapshot)
      end

      it "should redirect to the s3_snapshot" do
        S3Snapshot.stub!(:find).and_return(mock_s3_snapshot(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(s3_snapshot_url(mock_s3_snapshot))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested s3_snapshot" do
        S3Snapshot.should_receive(:find).with("37").and_return(mock_s3_snapshot)
        mock_s3_snapshot.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :s3_snapshot => {:these => 'params'}
      end

      it "should expose the s3_snapshot as @s3_snapshot" do
        S3Snapshot.stub!(:find).and_return(mock_s3_snapshot(:update_attributes => false))
        put :update, :id => "1"
        assigns(:s3_snapshot).should equal(mock_s3_snapshot)
      end

      it "should re-render the 'edit' template" do
        S3Snapshot.stub!(:find).and_return(mock_s3_snapshot(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested s3_snapshot" do
      S3Snapshot.should_receive(:find).with("37").and_return(mock_s3_snapshot)
      mock_s3_snapshot.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the s3_snapshots list" do
      S3Snapshot.stub!(:find).and_return(mock_s3_snapshot(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(s3_snapshots_url)
    end

  end

end
