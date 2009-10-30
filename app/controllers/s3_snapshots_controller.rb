class S3SnapshotsController < ApplicationController
  # GET /s3_snapshots
  # GET /s3_snapshots.xml
  def index
    @s3_snapshots = S3Snapshot.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @s3_snapshots }
    end
  end

  # GET /s3_snapshots/1
  # GET /s3_snapshots/1.xml
  def show
    @s3_snapshot = S3Snapshot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @s3_snapshot }
    end
  end

  # GET /s3_snapshots/new
  # GET /s3_snapshots/new.xml
  def new
    @s3_snapshot = S3Snapshot.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @s3_snapshot }
    end
  end

  # GET /s3_snapshots/1/edit
  def edit
    @s3_snapshot = S3Snapshot.find(params[:id])
  end

  # POST /s3_snapshots
  # POST /s3_snapshots.xml
  def create
    @s3_snapshot = S3Snapshot.new(params[:s3_snapshot])

    respond_to do |format|
      if @s3_snapshot.save
        flash[:notice] = 'S3Snapshot was successfully created.'
        format.html { redirect_to(@s3_snapshot) }
        format.xml  { render :xml => @s3_snapshot, :status => :created, :location => @s3_snapshot }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @s3_snapshot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /s3_snapshots/1
  # PUT /s3_snapshots/1.xml
  def update
    @s3_snapshot = S3Snapshot.find(params[:id])

    respond_to do |format|
      if @s3_snapshot.update_attributes(params[:s3_snapshot])
        flash[:notice] = 'S3Snapshot was successfully updated.'
        format.html { redirect_to(@s3_snapshot) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @s3_snapshot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /s3_snapshots/1
  # DELETE /s3_snapshots/1.xml
  def destroy
    @s3_snapshot = S3Snapshot.find(params[:id])
    @s3_snapshot.destroy

    respond_to do |format|
      format.html { redirect_to(s3_snapshots_url) }
      format.xml  { head :ok }
    end
  end
end
