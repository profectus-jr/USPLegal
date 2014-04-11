class AddDefaultValueToGroupsVistDate < ActiveRecord::Migration
  def change
    change_column_null :groups, :vist_date, true
  end
end
