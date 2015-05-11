class AddReportConfig < ActiveRecord::Migration
  def up
	create_table :reportconfig do |t|
		t.integer :id_checklist
		t.timestamps null: false
	end
  end

  def down
	drop_table :reportconfig
  end
end
