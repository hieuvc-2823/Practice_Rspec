class ApplicationController < ActionController::Base
  include MicropostsHelper
  def logged_in_user
    return if logged_in?

    flash[:danger] = t("users.please_log_in")
    redirect_to login_url
  end
end
