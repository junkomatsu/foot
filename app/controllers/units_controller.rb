class UnitsController < ApplicationController
  respond_to :html, :json, :xml

  # GET /units
  # GET /units.json
  # GET /units.xml
  def index
    conditions = {}
    conditions['users.id_str'] = params[:user_id] if params[:user_id]
    order = params[:order]
    count = params[:count] || 100
    offset = params[:offset] || 0

    @units = Unit.joins(:user).where(conditions).order(order).limit(count).offset(offset)

    respond_with @units, {:except => :user_id}
  end

  # GET /users/:user_id/units/1
  # GET /users/:user_id/units/1.json
  # GET /users/:user_id/units/1.xml
  def show
    @unit = Unit.find(params[:id])

    respond_with @unit, {:except => :user_id}
  end

  # GET /users/:user_id/units/new
  # GET /users/:user_id/units/new.json
  # GET /users/:user_id/units/new.xml
  def new
    @unit = Unit.new

    rendpond_with @unit, {:except => :user_id}
  end

  # GET /users/:user_id/units/1/edit
  def edit
    @unit = Unit.find(params[:id])
  end

  # POST /units
  # POST /units.json
  # POST /units.xml
  def create
    @unit = Unit.new(params[:unit])

    respond_to do |format|
      if @unit.save
        format.html { redirect_to(user_unit_path(@unit), :notice => 'Unit was successfully created.') }
        format.json  { render :json => @unit, :status => :created, :location => @unit }
        format.xml  { render :xml => @unit, :status => :created, :location => @unit }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @unit.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @unit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/:user_id/units/1
  # PUT /users/:user_id/units/1.xml
  # PUT /users/:user_id/units/1.xml
  def update
    @unit = Unit.find(params[:id])

    respond_to do |format|
      if @unit.update_attributes(params[:unit])
        format.html { redirect_to(user_unit_path(@unit), :notice => 'Unit was successfully updated.') }
        format.json { head :ok }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @unit.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @unit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/:user_id/units/1
  # DELETE /users/:user_id/units/1.xml
  # DELETE /users/:user_id/units/1.xml
  def destroy
    @unit = Unit.find(params[:id])
    @unit.destroy

    respond_to do |format|
      format.html { redirect_to(user_units_url) }
      format.json { head :ok }
      format.xml  { head :ok }
    end
  end
end
