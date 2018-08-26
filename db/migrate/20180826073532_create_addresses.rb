class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :house_number
      t.string :floor_no
      t.string :building_name
      t.string :street_no
      t.string :landmark
      t.string :area
      t.string :state
      t.string :city
      t.string :pin_code
      t.references :user, foreign_key: true
      t.boolean :permanent

      t.timestamps
    end
  end
end
