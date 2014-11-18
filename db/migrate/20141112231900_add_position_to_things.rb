class AddPositionToThings < ActiveRecord::Migration
  def change
    add_column :things, :position, :integer
  end
end
