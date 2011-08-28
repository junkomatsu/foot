class BattlesController < ApplicationController
  respond_to :html, :json, :xml

  # GET /battles
  # GET /battles.json
  # GET /battles.xml
  def index
    conditions = {}
#    conditions[:type] = params[:type] if params[:type]
    order = params[:order]
    count = params[:count] || 100
    offset = params[:offset] || 0

    @battles = Battle.where(conditions).order(order).limit(count).offset(offset)

    respond_with @battles
  end

  # GET /battles/1
  # GET /battles/1.xml
  def show
    @battle = Battle.find(params[:id])

    respond_with @battle
  end

  # GET /battles/new
  # GET /battles/new.xml
  def new
    @battle = Battle.new

    respond_with @battle
  end

  # GET /battles/1/edit
  def edit
    @battle = Battle.find(params[:id])
  end

  # POST /battles
  # POST /battles.xml
  def create
    @battle = Battle.new(params[:battle])

    respond_to do |format|
      if @battle.save
        format.html { redirect_to(@battle, :notice => 'Battle was successfully created.') }
        format.json { render :json => @battle, :status => :created, :location => @battle }
        format.xml  { render :xml => @battle, :status => :created, :location => @battle }
      else
        format.html { render :action => "new" }
        format.json { render :json => @battle.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @battle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /battles/1
  # PUT /battles/1.xml
  def update
    @battle = Battle.find(params[:id])

    respond_to do |format|
      if @battle.update_attributes(params[:battle])
        format.html { redirect_to(@battle, :notice => 'Battle was successfully updated.') }
        format.json { head :ok }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @battle.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @battle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /battles/1
  # DELETE /battles/1.xml
  def destroy
    @battle = Battle.find(params[:id])
    @battle.destroy

    respond_to do |format|
      format.html { redirect_to(battles_url) }
      format.json { head :ok }
      format.xml  { head :ok }
    end
  end
end
