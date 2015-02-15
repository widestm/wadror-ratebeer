class ModifyBeer < ActiveRecord::Migration
  def change
  	change_column :beers, :style, :integer
  end
end
