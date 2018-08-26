class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :account, foreign_key: true
      t.float :amount

      t.timestamps
    end
  end
end
