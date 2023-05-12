class SitesController < ApplicationController
  def index
    @sites = Site.all
  end

  def show
    @site = Site.find(params[:site_id])
  end

  def site_areas_by_site
    site_id = params[:site_id]
    @site_areas = SiteArea.where(SiteID: site_id)
    render json: @site_areas
  end

  private 

  def site_params
    params.require(:site).permit(:SiteLongName, :SiteDescription)
  end
end