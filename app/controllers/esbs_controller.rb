class EsbsController < ApplicationController
  # GET /esbs
  # GET /esbs.xml
  def index
    @esbs = Esb.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @esbs }
    end
  end

  # GET /esbs/1
  # GET /esbs/1.xml
  def show
    @esb = Esb.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @esb }
    end
  end

  # GET /esbs/new
  # GET /esbs/new.xml
  def new
    @esb = Esb.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @esb }
    end
  end

  # GET /esbs/1/edit
  def edit
    @esb = Esb.find(params[:id])
  end

  # POST /esbs
  # POST /esbs.xml
  def create
    @esb = Esb.new(params[:esb])

    respond_to do |format|
      if @esb.save
        flash[:notice] = 'Esb was successfully created.'
        format.html { redirect_to(@esb) }
        format.xml  { render :xml => @esb, :status => :created, :location => @esb }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @esb.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /esbs/1
  # PUT /esbs/1.xml
  def update
    @esb = Esb.find(params[:id])

    respond_to do |format|
      if @esb.update_attributes(params[:esb])
        flash[:notice] = 'Esb was successfully updated.'
        format.html { redirect_to(@esb) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @esb.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /esbs/1
  # DELETE /esbs/1.xml
  def destroy
    @esb = Esb.find(params[:id])
    @esb.destroy

    respond_to do |format|
      format.html { redirect_to(esbs_url) }
      format.xml  { head :ok }
    end
  end
end
