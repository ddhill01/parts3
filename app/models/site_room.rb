class SiteRoom < ActiveRecord::Base
    has_many :assets, foreign_key: "SiteRoomID"
    belongs_to :site_area, foreign_key: "SiteAreaID"
    
    # establish the database connection and table name
    establish_connection :development
    
    self.table_name = "dbo.Site_Room"
    self.primary_key = "SiteRoomID"
  end