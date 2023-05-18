class VibrationAnalysisResult < ApplicationRecord
    
    establish_connection :development
  
    self.table_name = "dbo.Vibration_Analysis_Result"
    self.primary_key = "VibrationAnalysisResultID"
end