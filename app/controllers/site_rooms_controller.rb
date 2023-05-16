class SiteRoomsController < ApplicationController
  def assets_by_room
    site_room_id = params[:site_room_id]
    @assets = Asset.where(SiteRoomID: site_room_id)
    render json: @assets
  end
end

