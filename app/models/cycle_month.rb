class CycleMonth < ActiveRecord::Base
    
    establish_connection :development
  
    self.table_name = "dbo.Cycle_Month"
    self.primary_key = "CycleMonthID"
end