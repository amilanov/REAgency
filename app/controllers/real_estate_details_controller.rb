class RealEstateDetailsController < ApplicationController
  # GET /real_estate_details
  # GET /real_estate_details.json
  def index
    @real_estate_details = RealEstateDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @real_estate_details }
    end
  end

  # GET /real_estate_details/1
  # GET /real_estate_details/1.json
  def show
    @real_estate_detail = RealEstateDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @real_estate_detail }
    end
  end

  # GET /real_estate_details/new
  # GET /real_estate_details/new.json
  def new
    @real_estate_detail = RealEstateDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @real_estate_detail }
    end
  end

  # GET /real_estate_details/1/edit
  def edit
    @real_estate_detail = RealEstateDetail.find(params[:id])
  end

  # POST /real_estate_details
  # POST /real_estate_details.json
  def create
    @real_estate_detail = RealEstateDetail.new(params[:real_estate_detail])

    respond_to do |format|
      if @real_estate_detail.save
        format.html { redirect_to @real_estate_detail, notice: 'Real estate detail was successfully created.' }
        format.json { render json: @real_estate_detail, status: :created, location: @real_estate_detail }
      else
        format.html { render action: "new" }
        format.json { render json: @real_estate_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /real_estate_details/1
  # PUT /real_estate_details/1.json
  def update
    @real_estate_detail = RealEstateDetail.find(params[:id])

    respond_to do |format|
      if @real_estate_detail.update_attributes(params[:real_estate_detail])
        format.html { redirect_to @real_estate_detail, notice: 'Real estate detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @real_estate_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /real_estate_details/1
  # DELETE /real_estate_details/1.json
  def destroy
    @real_estate_detail = RealEstateDetail.find(params[:id])
    @real_estate_detail.destroy

    respond_to do |format|
      format.html { redirect_to real_estate_details_url }
      format.json { head :no_content }
    end
  end
end
