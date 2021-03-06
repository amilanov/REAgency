class UsersController < ApplicationController
  # before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: [:index, :new, :create, :destroy]
  before_filter :can_show, only: [:show]

  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(page: params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user       = User.find(params[:id])
    @roles      = @user.roles
    @role_names = @roles.map{|role| role.roleName}

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    @user_roles = Role.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user_roles = Role.all
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @user_roles = Role.all

    respond_to do |format|
      if @user.save
        # sign_in @user
        flash[:success] = 'User was successfully created.'
        format.html { redirect_to @user }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user_roles = Role.all
    respond_to do |format|
      if @user.update_attributes(params[:user])
        sign_in @user
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = 'User was successfully destroyed.'
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless current_user?(@user)
  end

  def admin_user
    if signed_in?
      return true if current_user.admin?
    end
    redirect_to root_path
  end

  def can_show
    can_show = false

    correct = current_user?(User.find(params[:id]))
    if signed_in?
      can_show = true if current_user.admin?
    end

    unless can_show
      redirect_to root_path unless correct
    end
  end
end
