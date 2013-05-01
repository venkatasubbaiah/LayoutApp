class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string      :name
      t.integer     :facebook_uid
      t.references  :user
      t.timestamps
    end
  end
end
