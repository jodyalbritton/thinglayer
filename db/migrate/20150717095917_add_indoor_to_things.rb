class AddIndoorToThings < ActiveRecord::Migration
  def change
    add_column :things, :indoor, :boolean, :default => true
  end
end
