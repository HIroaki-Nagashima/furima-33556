class CreateAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :adresses do |t|
      t.string :postal_code, null: false
      t.integer :area_id, null: false
      t.string :municipalty, null: false
      t.string :adress, null: false
      t.string :building
      t.string :phone_number, null: false
      t.references :user, forign_key: true
      t.timestamps
    end
  end
end
