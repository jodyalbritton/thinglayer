class AddUriToServices < ActiveRecord::Migration
  def change
    add_column :services, :uri, :string
    add_column :services, :url, :string
    add_column :services, :base_url, :string
  end
end
