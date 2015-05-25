class SavedItemsController < ApplicationController
  # GET /saved_items
  # GET /saved_items.json
  def index
    @saved_items = SavedItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @saved_items }
    end
  end

  # GET /saved_items/1
  # GET /saved_items/1.json
  def show
    @saved_item = SavedItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @saved_item }
    end
  end

  # GET /saved_items/new
  # GET /saved_items/new.json
  def new
    @saved_item = SavedItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @saved_item }
    end
  end

  # GET /saved_items/1/edit
  def edit
    @saved_item = SavedItem.find(params[:id])
  end

  # POST /saved_items
  # POST /saved_items.json
  def create
    @saved_item = SavedItem.new(params[:saved_item])

    respond_to do |format|
      if @saved_item.save
        format.html { redirect_to @saved_item, notice: 'Saved item was successfully created.' }
        format.json { render json: @saved_item, status: :created, location: @saved_item }
      else
        format.html { render action: "new" }
        format.json { render json: @saved_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /saved_items/1
  # PUT /saved_items/1.json
  def update
    @saved_item = SavedItem.find(params[:id])

    respond_to do |format|
      if @saved_item.update_attributes(params[:saved_item])
        format.html { redirect_to @saved_item, notice: 'Saved item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @saved_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saved_items/1
  # DELETE /saved_items/1.json
  def destroy
    @saved_item = SavedItem.find(params[:id])
    @saved_item.destroy

    respond_to do |format|
      format.html { redirect_to saved_items_url }
      format.json { head :no_content }
    end
  end
end
