class ProfilesController < ApplicationController

  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    user_params = params.require(:user).permit(:icon_image, :name, :message)
    if @user.update(user_params)
      flash[:notice] = "プロフィール更新しました"
      redirect_to profile_path
    else
      flash.now[:alert] = "プロフィール更新に失敗しました"
      render :edit
    end
  end
end
