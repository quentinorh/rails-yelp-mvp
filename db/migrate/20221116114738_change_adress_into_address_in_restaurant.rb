class ChangeAdressIntoAddressInRestaurant < ActiveRecord::Migration[7.0]
  def change
    remove_column :restaurants, :adress
    add_column :restaurants, :address, :string
  end
end
