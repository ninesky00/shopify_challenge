class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if matching_password? && user.save
      flash[:notice] = 'You signed up successfully'
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:notice] = user.errors.full_messages
      flash[:notice] = 'Passwords do not match' unless matching_password?
      redirect_to registration_path
    end
  end

  private

  def user_params
    params[:user][:email].downcase!
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def matching_password?
    params[:user][:password] == params[:user][:password_confirmation]
  end
end
