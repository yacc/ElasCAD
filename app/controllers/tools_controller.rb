class ToolsController < ApplicationController
  # GET /tools
  # GET /tools.xml
  def index
    @tools = Tool.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tools }
    end
  end

  # GET /tools/1
  # GET /tools/1.xml
  def show
    @tool = Tool.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tool }
    end
  end

  # GET /tools/new
  # GET /tools/new.xml
  def new
    @tool = Tool.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tool }
    end
  end

  # GET /tools/1/edit
  def edit
    @tool = Tool.find(params[:id])
  end

  # POST /tools
  # POST /tools.xml
  def create
    @tool = Tool.new(params[:tool])

    respond_to do |format|
      if @tool.save
        flash[:notice] = 'Tool was successfully created.'
        format.html { redirect_to(@tool) }
        format.xml  { render :xml => @tool, :status => :created, :location => @tool }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tool.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tools/1
  # PUT /tools/1.xml
  def update
    @tool = Tool.find(params[:id])

    respond_to do |format|
      if @tool.update_attributes(params[:tool])
        flash[:notice] = 'Tool was successfully updated.'
        format.html { redirect_to(@tool) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tool.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tools/1
  # DELETE /tools/1.xml
  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy

    respond_to do |format|
      format.html { redirect_to(tools_url) }
      format.xml  { head :ok }
    end
  end
end
