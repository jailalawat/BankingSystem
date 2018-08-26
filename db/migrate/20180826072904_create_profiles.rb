class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :mobile_no
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
