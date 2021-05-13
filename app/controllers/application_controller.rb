class ApplicationController < ActionController::Base
  def logged_in_user
    return if logged_in?

    flash[:danger] = t("users.please_log_in")
    redirect_to login_url
  end
end
