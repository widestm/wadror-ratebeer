class ModifyBeer < ActiveRecord::Migration
  def change
  	change_column :beers, :style, :integer,  'integer USING CAST(column_name AS integer)'
  end
end
