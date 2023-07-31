class SessionController < ApplicationController
  # 　リダイレクト先の作成
  before_action :redirect_to_rooms, only: %i[new create]

  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      flash[:notice] = 'ログインしました'
      session[:login_user_id] = user.id
      # リダイレクト先の作成
      redirect_to rooms_path
    else
      # フラッシュメッセージが表示されない
      flash.now[:alert] = 'ログインに失敗しました'
      render 'new'
    end
  end

  def destroy
    session[:login_user_id] = nil
    redirect_to signin_path
  end

  private

  # リダイレクト先の作成
  def redirect_to_rooms
    redirect_to rooms_path if session[:login_user_id].present?
  end
end
