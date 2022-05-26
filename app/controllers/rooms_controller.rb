class RoomsController < ApplicationController

  def index
    @room = Room.new
    @rooms = Room.public_rooms
    @users = User.all_except(current_user)
  end

  def show
    @user_logged = cookies[:user_id]
    @single_room = Room.find(params[:id])
    @room = Room.new
    @rooms = Room.public_rooms

    @message = Message.new
    @messages = @single_room.messages.order(created_at: :asc)

    @users = User.all_except(current_user)

    render 'rooms/index'
  end

 


  def create
    @room = Room.create(name: params['room']['name'])
  end

end
