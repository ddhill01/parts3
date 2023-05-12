class SiteRoomsController < ApplicationController
    

  
  def room_assets_by_room
      site_room_id = params[:site_room_id]
      @site_room = SiteRoom.find_by(SiteRoomID: site_room_id)
      @room_assets = @site_room.room_assets
      render json: @room_assets
  end
end
