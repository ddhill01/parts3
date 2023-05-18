class CycleYear < ActiveRecord::Base
    
    establish_connection :development
  
    self.table_name = "dbo.Cycle_Year"
    self.primary_key = "CycleYearID"
end