# app/models/vibration_analysis_asset_type.rb
class VibrationAnalysisAssetType < ApplicationRecord
    
  establish_connection :development

    self.table_name = "dbo.Vibration_Analysis_Asset_Type"
    self.primary_key = "VibrationAnalysisAssetTypeID"
end
  