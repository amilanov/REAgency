class RealEstatesController < ApplicationController
  # before_filter :can_create_re, :except => [:index, :show]
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
    @details     = @real_estate.real_estate_detail
    @back_to     = params[:back_to]

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

    if selected_type = params[:real_estate_type]
      @selected_re_type = @re_types.find{ |re| re[:realEstateType] == selected_type }
    end

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
          if latitude = params[:latitude]
            re_detail[:latitude] = latitude unless latitude.empty?
          end
          if longitude = params[:longitude]
            re_detail[:longitude] = longitude unless longitude.empty?
          end
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
        if real_estate_detail_attrs = params[:real_estate_detail]
          if latitude = params[:latitude]
            real_estate_detail_attrs[:latitude] = latitude unless latitude.empty?
          end
          if longitude = params[:longitude]
            real_estate_detail_attrs[:longitude] = longitude unless longitude.empty?
          end
          @real_estate.real_estate_detail.update_attributes(real_estate_detail_attrs)
        end
        # gu.update_attributes (:status => 'inactive')
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
    @back_to     = params[:back_to]

    respond_to do |format|
      format.html { redirect_to @back_to }
      format.json { head :no_content }
    end
  end

  def apartments
    condition = { real_estate_types: {realEstateType: 'Stan'} }
    if real_estates_from_params = params["real_states"]
      if city_id = real_estates_from_params["city_id"]
        condition.merge!(cities: {id: city_id}) unless city_id.empty?
      end
    end
    @real_estates = RealEstate.eager_load(:real_estate_type, :city).where(condition).paginate(page: params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @real_estates }
    end
  end

  def houses
    condition = { real_estate_types: {realEstateType: 'Kuća'} }
    if real_estates_from_params = params["real_states"]
      if city_id = real_estates_from_params["city_id"]
        condition.merge!(cities: {id: city_id}) unless city_id.empty?
      end
    end
    @real_estates = RealEstate.eager_load(:real_estate_type, :city).where(condition).paginate(page: params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @real_estates }
    end
  end

  def garages
    condition = { real_estate_types: {realEstateType: 'Garaža'} }
    if real_estates_from_params = params["real_states"]
      if city_id = real_estates_from_params["city_id"]
        condition.merge!(cities: {id: city_id}) unless city_id.empty?
      end
    end
    @real_estates = RealEstate.eager_load(:real_estate_type, :city).where(condition).paginate(page: params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @real_estates }
    end
  end

  def rooms
    condition = { real_estate_types: {realEstateType: 'Soba'} }
    if real_estates_from_params = params["real_states"]
      if city_id = real_estates_from_params["city_id"]
        condition.merge!(cities: {id: city_id}) unless city_id.empty?
      end
    end
    @real_estates = RealEstate.eager_load(:real_estate_type, :city).where(condition).paginate(page: params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @real_estates }
    end
  end

  def others
    @real_estates = RealEstate.eager_load(:real_estate_type).where(real_estate_types: {realEstateType: 'Balkon'}).paginate(page: params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @real_estates }
    end
  end

  def contract_real_estates
    @contract_real_estates = RealEstate.search(params[:search])
    respond_to do |format|
      format.html
      format.json { render json: @real_estates }
    end
  end

  def mark_as_finished
    @real_estate = RealEstate.find(params[:id])
    respond_to do |format|
      if @real_estate.update_attributes(params[:real_estate])
        format.html { redirect_to @real_estate }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @real_estate.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def can_create_re
    redirect_to root_path unless current_user && current_user.can_create_real_estate?
  end
end
