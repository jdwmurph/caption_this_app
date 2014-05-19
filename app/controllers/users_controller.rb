class UsersController < ApplicationController
  before_action:current_user

  def index
    @users = User.all
  end

  def new
  end

  def create
    User.create(user_params)
    redirect_to '/users'
  end

  def show
    @published_count = @current_user.images.select {|image| image.published == true}.count
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end


end
