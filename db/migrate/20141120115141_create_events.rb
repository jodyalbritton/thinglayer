class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :date
      t.string :device
      t.string :name
      t.string :value
      t.references :thing

      t.timestamps
    end
  end
end
