class AddDateToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :vist_date, :date
  end
end
