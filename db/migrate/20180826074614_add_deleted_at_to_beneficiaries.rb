class AddDeletedAtToBeneficiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :beneficiaries, :deleted_at, :datetime
    add_index :beneficiaries, :deleted_at
  end
end
