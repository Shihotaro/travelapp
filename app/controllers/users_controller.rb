class UsersController < ApplicationController
  before_action :redirect_to_signin, only: %i[edit update]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name, :email, :password, :password_confirmation)
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = '登録しました'
      session[:login_user_id] = @user.id
      redirect_to rooms_path
    else
      flash.now[:alert] = '登録に失敗しました'
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    user_params = params.require(:user).permit(:email, :password, :password_confirmation)
    if @user.update(user_params)
      flash[:notice] = 'アカウント更新しました'
      redirect_to user_path(@user)
    else
      # フラッシュメセージが表示されない
      flash.now[:alert] = 'アカウント更新に失敗しました'
      render 'edit'
    end
  end
end
