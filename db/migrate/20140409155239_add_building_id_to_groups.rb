class AddBuildingIdToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :building_id, :string
  end
end
