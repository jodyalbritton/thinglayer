class AddVisibleToThings < ActiveRecord::Migration
  def change
    add_column :things, :visible, :boolean, default: true
  end
end
