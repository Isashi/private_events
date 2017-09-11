class UsersController < ApplicationController
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
	end

  def index
    @users = User.paginate(page: params[:page])
  end

	private
	    def user_params
      params.require(:user).permit(:name, :email)
    end 
end
