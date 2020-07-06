class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by_username(params[:username])

    if @user
      session[:current_user_id] = @user.id
      flash[:success] = 'Logged in'
      redirect_to lines_path
    else
      flash[:error] = 'username invalid'
      redirect_to login_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    flash[:success] = 'Logged out'
    redirect_to root_path
  end
end
