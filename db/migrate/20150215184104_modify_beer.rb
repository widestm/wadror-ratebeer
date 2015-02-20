class ModifyBeer < ActiveRecord::Migration
  def change
  	change_column :beers, :style, :integer
  end
end
# when rebuilding psql db use following:
# change_column :beers, :style, 'integer USING CAST(style AS integer)'