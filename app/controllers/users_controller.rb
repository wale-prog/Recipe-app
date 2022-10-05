class UsersController < ApplicationController
<<<<<<< HEAD
  before_action :authenticate_user!

  def show
    @user = current_user
=======
  def index
    @users = User.all
>>>>>>> dev
  end
end
