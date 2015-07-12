class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate
  before_filter :mailer_set_url_options
  private

  def mailer_set_url_options
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end

  def authenticate
    @current_user = User.find_by_id session[:user_id] if session[:user_id]
  end

  def check_if_admin
    redirect_to root_path unless @current_user.present? && @current_user.admin?
  end
end
