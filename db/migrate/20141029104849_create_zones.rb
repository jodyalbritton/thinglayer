class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.string :name
      t.string :ancestry
      t.text :description
      t.references :location

      t.timestamps
    end
  end
end
