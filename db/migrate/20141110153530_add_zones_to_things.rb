class AddZonesToThings < ActiveRecord::Migration
  def change
    add_reference :things, :zone, index: true
  end
end
