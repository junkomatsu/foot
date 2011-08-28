class ItemsController < ApplicationController
  respond_to :html, :json, :xml

  # GET /items
  # GET /items.json
  # GET /items.xml
  def index
    conditions = {}
    conditions[:type] = params[:type] if params[:type]
    order = params[:order]
    count = params[:count] || 100
    offset = params[:offset] || 0

    @items = Item.where(conditions).order(order).limit(count).offset(offset)

    respond_with @items
  end

  # GET /items/1
  # GET /items/1.json
  # GET /items/1.xml
  def show
    @item = Item.find(params[:id])

    respond_with @item
  end

  # GET /items/new
  # GET /items/new.json
  # GET /items/new.xml
  def new
    @item = Item.new

    respond_with @item
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  # POST /items.xml
  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to(@item, :notice => 'Item was successfully created.') }
        format.json  { render :json => @item, :status => :created, :location => @item }
        format.xml  { render :xml => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @item.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  # PUT /items/1.xml
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to(@item, :notice => 'Item was successfully updated.') }
        format.json  { head :ok }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @item.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  # DELETE /items/1.xml
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to(items_url) }
      format.json  { head :ok }
      format.xml  { head :ok }
    end
  end
end
