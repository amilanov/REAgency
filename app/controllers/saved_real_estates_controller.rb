class SavedRealEstatesController < ApplicationController
  before_filter :signed_in?
  # GET /saved_real_estates
  # GET /saved_real_estates.json
  def index
    # @saved_real_estates = SavedRealEstate.all
    @saved_real_estates = current_user.saved_real_estates

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @saved_real_estates }
    end
  end

  # GET /saved_real_estates/1
  # GET /saved_real_estates/1.json
  def show
    @saved_real_estate = SavedRealEstate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @saved_real_estate }
    end
  end

  # GET /saved_real_estates/new
  # GET /saved_real_estates/new.json
  def new
    @saved_real_estate = SavedRealEstate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @saved_real_estate }
    end
  end

  # GET /saved_real_estates/1/edit
  def edit
    @saved_real_estate = SavedRealEstate.find(params[:id])
  end

  # POST /saved_real_estates
  # POST /saved_real_estates.json
  def create
    @saved_real_estate = current_user.saved_real_estates.build(real_estate_id: params[:id])

    respond_to do |format|
      if @saved_real_estate.save
        format.html { redirect_to real_estates_path, notice: 'Saved real estate was successfully created.' }
        format.json { render json: @saved_real_estate, status: :created, location: @saved_real_estate }
      else
        format.html { render action: "new" }
        format.json { render json: @saved_real_estate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /saved_real_estates/1
  # PUT /saved_real_estates/1.json
  def update
    @saved_real_estate = SavedRealEstate.find(params[:id])

    respond_to do |format|
      if @saved_real_estate.update_attributes(params[:saved_real_estate])
        format.html { redirect_to @saved_real_estate, notice: 'Saved real estate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @saved_real_estate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saved_real_estates/1
  # DELETE /saved_real_estates/1.json
  def destroy
    @saved_real_estate = SavedRealEstate.find(params[:id])
    @saved_real_estate.destroy

    respond_to do |format|
      format.html { redirect_to saved_real_estates_url }
      format.json { head :no_content }
    end
  end
end
