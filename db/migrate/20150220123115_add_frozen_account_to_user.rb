class AddFrozenAccountToUser < ActiveRecord::Migration
  def change
    add_column :users, :frozen_account, :boolean
  end
end
