class VibrationAnalylsis < ActiveRecord::Base
    has_many :assets, foreign_key: "AssetID"
    establish_connection :development

    belongs_to :db_user
    validates :db_user_id, presence: true
    
    self.table_name = "dbo.Vibration_Analysis"
    self.primary_key = "VibrationAnalysisID"
end