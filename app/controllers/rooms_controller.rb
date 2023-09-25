class RoomsController < ApplicationController
  before_action :authenticate_user!
  def index
    # ユーザーが参加しているルームのエントリーを取得
    user_entries = Entry.where(user_id: current_user.id).pluck(:room_id)
    
    # ユーザーが参加しているルームの一覧を取得
    @room_lists = Room.where(id: user_entries)
    
    if @room_lists.empty?
      @room_lists_none = "グループに参加していません。"
    end
  end

  def show
    @room = Room.find(params[:id])
      if Entry.where(user_id: current_user.id, room_id: @room.id).present?
        @messages = @room.messages.all
        @message = Message.new
        @entries = @room.entries
      else
        redirect_back(fallback_location: root_path)
      end
  end

  def create
    @room = Room.create
    Entry.create(room_id: @room.id, user_id: current_user.id)
    Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to "/rooms/#{@room.id}"
  end
end
