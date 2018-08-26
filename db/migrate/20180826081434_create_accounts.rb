class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.references :user, foreign_key: true
      t.references :bank, foreign_key: true
      t.integer :account_no, :limit => 8, default: 1441
      t.float :balance

      t.timestamps
    end
  end
end
