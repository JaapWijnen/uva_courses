class UsersController < ApplicationController
  # make shure only signed in users can view the following user actions
  before_action :signed_in_user, only: [:index, :show, :update, :destroy]
  # make shure users can only view and update their own profile
  before_action :correct_user, only: [:show, :update]
  # allow only admin to view to following user actions
  before_action :admin_user, only: [:index, :destroy]


  def index
    @users = User.paginate(page: params[:page])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      sign_in @user
  		flash[:success] = "Welcome to UvA Courses!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def show
  	@user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      # redirect to tab on user profile page
      redirect_to user_path(current_user.id, tab: 'recent')
    else
      render 'show'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  private

  	def user_params
  		params.require(:user).permit( :name, 
                                    :email, 
                                    :password, 
                                    :password_confirmation)
  	end

    # Before filters

    # check if current user matches owner of the visited/updated page or admin
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user) || current_user.admin?
    end

    # check if current user is admin
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
