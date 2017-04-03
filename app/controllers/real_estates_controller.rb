class RealEstatesController < ApplicationController
  before_filter :can_create_re, :except => [:index, :show]
  # GET /real_estates
  # GET /real_estates.json
  def index
    @real_estates = RealEstate.paginate(page: params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @real_estates }
    end
  end

  # GET /real_estates/1
  # GET /real_estates/1.json
  def show
    @real_estate = RealEstate.find(params[:id])
    @images      = @real_estate.pictures

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @real_estate }
    end
  end

  # GET /real_estates/new
  # GET /real_estates/new.json
  def new
    @real_estate = RealEstate.new
    @cities      = City.all
    @re_types    = RealEstateType.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @real_estate }
    end
  end

  # GET /real_estates/1/edit
  def edit
    @real_estate = RealEstate.find(params[:id])
    @cities      = City.all
    @re_types    = RealEstateType.all
  end

  # POST /real_estates
  # POST /real_estates.json
  def create
    @real_estate = current_user.real_estates.build(params[:real_estate])
    @cities      = City.all
    @re_types    = RealEstateType.all

    respond_to do |format|
      if @real_estate.save
        if params[:images]
          params[:images].each { |image|
            @real_estate.pictures.create(image: image)
          }
        end
        if re_detail = params[:real_estate_detail]
          @real_estate.create_real_estate_detail(re_detail)
        end
        format.html { redirect_to @real_estate, notice: 'Real estate was successfully created.' }
        format.json { render json: @real_estate, status: :created, location: @real_estate }
      else
        format.html { render action: "new" }
        format.json { render json: @real_estate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /real_estates/1
  # PUT /real_estates/1.json
  def update
    @real_estate = RealEstate.find(params[:id])

    respond_to do |format|
      if @real_estate.update_attributes(params[:real_estate])
        if params[:images]
          params[:images].each { |image|
            @real_estate.pictures.create(image: image)
          }
        end
        format.html { redirect_to @real_estate, notice: 'Real estate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @real_estate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /real_estates/1
  # DELETE /real_estates/1.json
  def destroy
    @real_estate = RealEstate.find(params[:id])
    @real_estate.destroy

    respond_to do |format|
      format.html { redirect_to real_estates_url }
      format.json { head :no_content }
    end
  end

  private

  def can_create_re
    redirect_to root_path unless current_user && current_user.can_create_real_estate?
  end
end
