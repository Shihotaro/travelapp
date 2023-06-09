class ReservationsController < ApplicationController
  def index
    # ログイン中のユーザIDに該当する予約を取得する>>rooms,usersテーブルの合併
    @reservations = Reservation.where(users_id: session[:login_user_id]).joins(:rooms,
                                                                               :users).select('reservations.*, rooms.*, users.*')
  end

  def new
    @reservation = Reservation.new
    session[:rooms_id] = params[:rooms_id] if params[:rooms_id].present?
    @room = Room.find(session[:rooms_id])
  end

  def confirm
    reservation = params.require(:reservation).permit(:checkin, :checkout, :party)
    reservation['users_id'] = session[:login_user_id]
    reservation['rooms_id'] = session[:rooms_id]
    @reservation = Reservation.new(reservation)
    @room = Room.find(session[:rooms_id])

    if @reservation.valid?
      @checkin = @reservation.checkin.to_date
      @checkout = @reservation.checkout.to_date
      @number_of_night = @checkout - @checkin
      @amount = @room.roomrate * @reservation.party * @number_of_night.to_i
    else
      render :new
    end
  end

  def create
    # 登録するデータの準備
    reservation = params.require(:reservation).permit(:checkin, :checkout, :party)
    reservation['users_id'] = session[:login_user_id]
    reservation['rooms_id'] = session[:rooms_id]
    # データの仮作成
    @reservation = Reservation.new(reservation)
    # データの保存
    if @reservation.save
      redirect_to reservations_path
    else
      # どこに戻るか決める
    end
  end
end
