class SiteAreasController < ApplicationController
    def site_rooms_by_area
        site_area_id = params[:site_area_id]
        @site_rooms = SiteRoom.where(SiteAreaID: site_area_id)
        render json: @site_rooms
    end
end
