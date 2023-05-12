class Site < ActiveRecord::Base
    has_many :site_areas, foreign_key: "SiteID"
    establish_connection :development
    
    self.table_name = "dbo.site"
    self.primary_key = "SiteId"
end