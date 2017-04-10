class ReportsController < ApplicationController
  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reports }
    end
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @report = Report.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @report }
    end
  end

  # GET /reports/new
  # GET /reports/new.json
  def new
    @report = Report.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @report }
    end
  end

  # GET /reports/1/edit
  def edit
    @report = Report.find(params[:id])
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = current_user.reports.build(params[:report])

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render json: @report, status: :created, location: @report }
      else
        format.html { render action: "new" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reports/1
  # PUT /reports/1.json
  def update
    @report = Report.find(params[:id])

    respond_to do |format|
      if @report.update_attributes(params[:report])
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report = Report.find(params[:id])
    @report.destroy

    respond_to do |format|
      format.html { redirect_to reports_url }
      format.json { head :no_content }
    end
  end

  def monthly_articles
    @real_estates = RealEstate.all
    @months = {}
    @real_estates.each do |re|
      if month = re.created_at.strftime("%B")
        (@months[month]||=[]) << re
      end
    end

    respond_to do |format|
      format.html
      format.json { render json: @real_estates }
    end
  end

  def real_estates_by_city
    @real_estates = RealEstate.all
    @display_city = false
    if real_estates_from_params = params["real_states"]
      if city_id = real_estates_from_params["city_id"]
        unless city_id.empty?
          @real_estates = RealEstate.where(city_id: city_id)
          @display_city = true
        end
      end
    end

    respond_to do |format|
      format.html
      format.json { render json: @real_estates }
    end
  end

  def number_of_real_estates_per_user
    @real_estates = RealEstate.all
    @display_user = false

    if real_estates_from_params = params["real_states"]
      if user_id = real_estates_from_params["user_id"]
        unless user_id.empty?
          @real_estates = RealEstate.where(user_id: user_id)
          @username = User.where(id: user_id).first
          @display_user = true
        end
      end
    end

    respond_to do |format|
      format.html
      format.json { render json: @real_estates }
    end
  end

  def total_number_of_users
    @users = User.all
    @total = @users.size

    respond_to do |format|
      format.html
      format.json { render json: @real_estates }
    end
  end

  def total_number_of_real_estates
    @real_estates = RealEstate.all
    @total = @real_estates.size

    respond_to do |format|
      format.html
      format.json { render json: @real_estates }
    end
  end

  def number_of_rented_real_estates
    @rented = Contract.where(contractType: 'Izdavanje')
    respond_to do |format|
      format.html
      format.json { render json: @real_estates }
    end
  end

  def number_of_rented_by_city
    @rented = Contract.where(contractType: 'Izdavanje')
    @display_city = false

    if real_estates_from_params = params["real_states"]
      if city_id = real_estates_from_params["city_id"]
        unless city_id.empty?
          @rented = Contract.eager_load(:real_estate).where(contracts: {contractType: 'Izdavanje'}, real_estates: {city_id: city_id})
          @display_city = true unless @rented.empty?
        end
      end
    end

    respond_to do |format|
      format.html
      format.json { render json: @real_estates }
    end
  end

  def number_of_rented_real_estates_per_month
    @rented = Contract.where(contractType: 'Izdavanje')
    @months = {}

    @rented.each do |re|
      if month = re.created_at.strftime("%B")
        (@months[month]||=[]) << re
      end
    end

    respond_to do |format|
      format.html
      format.json { render json: @real_estates }
    end
  end

  def number_of_rented_real_estates_per_user
    @real_estates = RealEstate.all
    @display_user = false

    if real_estates_from_params = params["real_states"]
      if user_id = real_estates_from_params["user_id"]
        unless user_id.empty?
          @real_estates = RealEstate.where(user_id: user_id)
          @username = User.where(id: user_id).first
          @display_user = true
        end
      end
    end

    respond_to do |format|
      format.html
      format.json { render json: @real_estates }
    end
  end

end
