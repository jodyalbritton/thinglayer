class AddProviderToServices < ActiveRecord::Migration
  def change
    add_column :services, :provider, :string
  end
end
