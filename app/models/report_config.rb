class ReportConfig < ActiveRecord::Base
	def self.clear
		self.connection.execute("DELETE FROM reportconfig")
	end
	
	def self.read
		self.connection.execute("SELECT equip_types.kind,reportconfig.id_checklist FROM reportconfig JOIN equip_types ON reportconfig.id_checklist = equip_types.id").to_a
	end
	
	def self.readidonly
		self.connection.execute("SELECT reportconfig.id_checklist FROM reportconfig").to_a
	end

	def self.update (data)
		self.clear
		data.each do |d|
			self.connection.execute(sanitize_sql(["INSERT INTO reportconfig (id_checklist,created_at,updated_at) VALUES (?,?,?)",d.to_i,Date.today.to_s,Date.today.to_s]))
		end		
	end	
end
