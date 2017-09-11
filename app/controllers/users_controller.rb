class UsersController < ApplicationController
before_action :logged_in_user, only: [:index]

  def new
  	@user = User.new
  end

 	def create
 		@user = User.new(user_params)
 		@user.email.downcase!
 		@user.save
 		redirect_to root_url
 	end

 	def show
 		@user = User.find(params[:id])
    @events = @user.events.paginate(page: params[:page])
	end

  def index
    @users = User.paginate(page: params[:page])
  end

	private
	  
    def user_params
      params.require(:user).permit(:name, :email)
    end 

    # Before filters

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
