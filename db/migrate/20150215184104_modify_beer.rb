class ModifyBeer < ActiveRecord::Migration
  def change
  	change_column :beers, :style, :integer,  'integer USING CAST(style AS integer)'
  end
end
