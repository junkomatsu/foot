class UsersController < ApplicationController
  respond_to :html, :json, :xml

  # GET /users
  # GET /users.xml
  # GET /users.xml
  def index
    conditions = {}
    conditions[:rank] = params[:rank] if params[:rank]
    conditions[:status] = params[:status] if params[:status]
    order = params[:order]
    @users = User.where(conditions).order(order);
    logger.info('log test')
    logger.info(request.headers['Accept'])
    respond_with @users
  end

  # GET /users/104205970003083264
  # GET /users/104205970003083264.json
  # GET /users/104205970003083264.xml
  def show
    @user = User.find_by_id_str(params[:id])

    respond_with @user
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_with @user
  end

  # GET /users/1/edit
  def edit
    @user = User.find_by_id_str(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.json  { render :json => @user, :status => :created, :location => @user }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @user.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find_by_id_str(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.json  { head :ok }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find_by_id_str(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.json  { head :ok }
      format.xml  { head :ok }
    end
  end
end
