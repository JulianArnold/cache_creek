class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :start_breadcrumbs

  protected

  def start_breadcrumbs
    @breadcrumbs = [{ label: 'home', path: root_path }]
  end
end
