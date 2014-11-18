class AddZonePositionToThings < ActiveRecord::Migration
  def change
    add_column :things, :zone_position, :integer
  end
end
