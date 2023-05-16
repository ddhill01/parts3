class Asset < ActiveRecord::Base
#class Asset < ApplicationRecord
    belongs_to :site_room, foreign_key: "SiteRoomID"
    establish_connection :development
  
    self.table_name = "dbo.Asset"
    self.primary_key = "AssetID"
end