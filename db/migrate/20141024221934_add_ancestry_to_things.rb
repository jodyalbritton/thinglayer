class AddAncestryToThings < ActiveRecord::Migration
  def change
    add_column :things, :ancestry, :string
    add_column :things, :uid, :string
    add_column :things, :name, :string
    add_column :things, :description, :text
    add_column :things, :provider, :string
    add_index :things, :ancestry
  end
end
