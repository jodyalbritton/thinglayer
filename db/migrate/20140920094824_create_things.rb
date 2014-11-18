class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :label
      t.string :device_type

      t.timestamps
    end
  end
end
