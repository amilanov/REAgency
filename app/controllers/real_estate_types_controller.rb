class RealEstateTypesController < ApplicationController
  # GET /real_estate_details
  # GET /real_estate_details.json
  def index
    @real_estate_types = RealEstateType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @real_estate_dtype }
    end
  end

  # GET /real_estate_details/1
  # GET /real_estate_details/1.json
  def show
    @real_estate_type = RealEstateType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @real_estate_type }
    end
  end

  # GET /real_estate_details/new
  # GET /real_estate_details/new.json
  def new
    @real_estate_type = RealEstateType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @real_estate_type }
    end
  end

  # GET /real_estate_details/1/edit
  def edit
    @real_estate_type = RealEstateType.find(params[:id])
  end

  # POST /real_estate_details
  # POST /real_estate_details.json
  def create
    @real_estate_type = RealEstateType.new(params[:real_estate_type])

    respond_to do |format|
      if @real_estate_type.save
        format.html { redirect_to @real_estate_type, notice: 'Real estate type was successfully created.' }
        format.json { render json: @real_estate_type, status: :created, location: @real_estate_type }
      else
        format.html { render action: "new" }
        format.json { render json: @real_estate_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /real_estate_details/1
  # PUT /real_estate_details/1.json
  def update
    @real_estate_type = RealEstateType.find(params[:id])

    respond_to do |format|
      if @real_estate_type.update_attributes(params[:real_estate_type])
        format.html { redirect_to @real_estate_type, notice: 'Real estate type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @real_estate_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /real_estate_details/1
  # DELETE /real_estate_details/1.json
  def destroy
    @real_estate_type = RealEstateType.find(params[:id])
    @real_estate_type.destroy

    respond_to do |format|
      format.html { redirect_to real_estate_types_url }
      format.json { head :no_content }
    end
  end
end
