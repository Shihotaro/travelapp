class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @rooms = @rooms.where('roomaddress LIKE ?', "#{params[:roomaddress]}%") if params[:roomaddress].present?
    @rooms = @rooms.where('roomname LIKE ? OR roomdetails LIKE ?', "%#{params[:keyword]}%","%#{params[:keyword]}%")
  end

  def own
    #  ログインユーザが作成した部屋の取得
    @rooms = Room.where(user_id: session[:login_user_id])
  end
  

  def new
    @room = Room.new
  end

  def create
    # 登録するデータの準備
    room_params = params.require(:room).permit(:roomname, :roomaddress, :roomdetails, :roomrate, :room_image)
    room_params['user_id'] = session[:login_user_id]
    #　データの仮作成 
    @room = Room.new(room_params)
    # データの保存
    if @room.save
      redirect_to rooms_path
    else
      render :new
    end
  end
end
