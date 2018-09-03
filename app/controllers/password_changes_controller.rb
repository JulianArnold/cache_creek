# frozen_string_literal: true

# this controller handles change requests from people who are logged in
class PasswordChangesController < ApplicationController
  before_action :add_breadcrumbs
  # delivers the password change form
  def new
    @user = current_user
  end

  # handles the actual change request
  def create
    @user = current_user
    if @user.change_password(allowed_params)
      flash[:success] = 'Your password has been changed successfully.'
      redirect_to my_profile_path
    else
      flash[:error] = 'Your password could not be changed.'
      render :new
    end
  end

  protected

  def allowed_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end

  def add_breadcrumbs
    @breadcrumbs << { label: I18n.t('views.users.show.h1').downcase, path: my_profile_path }
    @breadcrumbs << { label: I18n.t('views.password_change.new.h1').downcase, path: new_password_change_path }
  end
end
