class AddFieldsToFriends < ActiveRecord::Migration
  def up
    add_column :friends, :city, :string
    add_column :friends, :longitude, :float
    add_column :friends, :latitude, :float
  end
  def down
    remove_column :friends, :city
    remove_column :friends, :longitude
    remove_column :friends, :latitude
  end
end
