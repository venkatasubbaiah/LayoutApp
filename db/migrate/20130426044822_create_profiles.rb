class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references        :user
      t.string            :first_name
      t.string            :last_name
      t.date              :date_of_birth
      t.attachment        :profile_image
      t.timestamps
    end
  end
end
