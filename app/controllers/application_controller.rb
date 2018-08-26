class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  http_basic_authenticate_with name: 'Julian.Arnold', password: 'JulianSaidICanUseThis' if Rails.env.production?

  protect_from_forgery with: :exception

  before_action :start_breadcrumbs
  before_action :logged_in_required

  protected

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  helper_method :current_user_session

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session&.user
  end
  helper_method :current_user

  def logged_in_required
    unless current_user
      flash[:error] = 'You have to be logged in to do that'
      redirect_to new_user_session_path
      false
    end
  end

  def admin_access_required
    unless current_user.admin_access
      flash[:error] = 'You have to be an admin user to do that'
      redirect_to root_path
      false
    end
  end

  def logged_out_required
    if current_user
      flash[:error] = 'You have to be logged out to do that'
      redirect_to root_path
      false
    end
  end

  def start_breadcrumbs
    @breadcrumbs = [{ label: 'home', path: root_path }]
  end
end
