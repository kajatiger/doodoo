class Todo < Granite::Base
  adapter pg
  table_name todos

  # id : Int64 primary key is created for you
  field title : String
  field urgent : Bool
  timestamps
end
