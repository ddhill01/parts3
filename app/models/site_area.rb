class SiteArea < ActiveRecord::Base
    has_many :site_rooms, foreign_key: "SiteAreaID"
    belongs_to :site, foreign_key: "SiteID"
    establish_connection :development
  
    self.table_name = "dbo.Site_Area"
    self.primary_key = "SiteAreaID"
end