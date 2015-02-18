class RenameStyletoName < ActiveRecord::Migration
	def change
		change_table :styles do |t|
			t.rename :style, :name
		end
	end
end
