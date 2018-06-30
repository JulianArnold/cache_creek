class UserSignUpsController < ApplicationController
  skip_before_action :logged_in_required
  before_action :add_breadcrumbs

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.account_activation_email(@user).deliver_now
      flash[:success] = I18n.t('controllers.user_sign_ups.create.success')
      redirect_to new_user_session_path
    else
      render :new
    end
  end

  def confirm
    if User.activation_valid?(params[:code].to_s)
      flash[:success] = I18n.t('controllers.user_sign_ups.confirm.success')
    else
      flash[:error] = I18n.t('controllers.user_sign_ups.confirm.error')
    end
    redirect_to new_user_session_path
  end

  protected

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :mobile_number, :password, :password_confirmation)
  end

  def add_breadcrumbs
    @breadcrumbs << { label: I18n.t('views.user_sign_ups.new.h1'), path: new_user_sign_up_path }
  end
end