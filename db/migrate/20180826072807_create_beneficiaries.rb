class CreateBeneficiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :beneficiaries do |t|
      t.string :name
      t.integer :relation
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
