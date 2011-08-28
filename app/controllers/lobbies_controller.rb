class LobbiesController < ApplicationController
  respond_to :html, :json, :xml

  # GET /lobbies
  # GET /lobbies.xml
  def index
    @lobbies = Lobby.all

    respond_with @lobbies, {:except => [:id, :user_id]}
  end

  # GET /lobbies/1
  # GET /lobbies/1.xml
  def show
    @lobby = Lobby.find_by_id_str(params[:id])

    respond_with @lobby, {:except => [:id, :user_id]}
  end

  # GET /lobbies/new
  # GET /lobbies/new.xml
  def new
    @lobby = Lobby.new

    respond_with @lobby
  end

  # GET /lobbies/1/edit
  def edit
    @lobby = Lobby.find(params[:id])
  end

  # POST /lobbies
  # POST /lobbies.xml
  def create
    @lobby = Lobby.new(params[:lobby])

    respond_to do |format|
      if @lobby.save
        format.html { redirect_to(@lobby, :notice => 'Lobby was successfully created.') }
        format.xml  { render :xml => @lobby, :status => :created, :location => @lobby }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lobby.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lobbies/1
  # PUT /lobbies/1.xml
  def update
    @lobby = Lobby.find(params[:id])

    respond_to do |format|
      if @lobby.update_attributes(params[:lobby])
        format.html { redirect_to(@lobby, :notice => 'Lobby was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lobby.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lobbies/1
  # DELETE /lobbies/1.xml
  def destroy
    @lobby = Lobby.find(params[:id])
    @lobby.destroy

    respond_to do |format|
      format.html { redirect_to(lobbies_url) }
      format.xml  { head :ok }
    end
  end
end
