class ApplicationController < ActionController::Base

  before_action :set_login_user_data

  def redirect_to_signin
    redirect_to signin_path if session[:login_user_id].blank?
  end

  def set_login_user_data
    # ログインしているユーザがいるかどうかを確認
    if session[:login_user_id].present?
      @login_user = User.find(session[:login_user_id])
    else
      @login_user = nil
    end
  end
end
