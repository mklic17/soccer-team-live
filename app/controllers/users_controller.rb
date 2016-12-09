class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy, :index]


  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:sucess] = "account created successfully!"
      redirect_to @user
    else
      render 'new'
    end
  end


  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User successfully deleted"
    redirect_to users_url
  end

  def display
    @users = User.search(params[:search]).order("created_at DESC")
  end

  def edit
    @user = User.find(params[:id]);
  end

  def index
    @user = User.all
  end


  def new
    u = User.create(name: "admin", email: "admin@admin.com", password: "administrator", password_confirmation: "administrator", admin: true, admin: true, position: "admin", hometown: "adminr", number: 0, team_id: 3)
    @user = User.new()
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end



  private

    def logged_in_user
      if !logged_in?
        flash[:danger] = "error";
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirext_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :position, :hometown, :number, :team_id)
    end

end
