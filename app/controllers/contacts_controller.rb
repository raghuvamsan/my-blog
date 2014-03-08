class ContactsController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
	@user = User.new(c_params)
	if @user.save
		redirect_to action: "index"
	else
		render "new"
	end
  end

  private
  
  def c_params
    params.require(:user).permit(:name, :phone, :dob, :facebook, :twitter)
  end
end
