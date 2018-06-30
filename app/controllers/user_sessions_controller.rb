class UserSessionsController < ApplicationController
  skip_before_action :logged_in_required, only: %i[new create]
  before_action :logged_out_required, only: %i[new create]

  # delivers an empty login page to users
  def new
    @user_session = UserSession.new
  end

  # processes the login form
  def create
    @user_session = UserSession.new(user_session_params)
    if @user_session.save
      flash[:success] = 'Welcome back'
      redirect_to root_path
    else
      render :new
    end
  end

  # logs the user out
  def destroy
    current_user_session.destroy
    flash[:success] = 'Bye bye'
    redirect_to new_user_session_url
  end

  private

  def user_session_params
    params.require(:user_session).permit(:email, :password)
  end
end