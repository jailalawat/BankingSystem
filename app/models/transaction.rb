# == Schema Information
#
# Table name: transactions
#
#  id               :integer          not null, primary key
#  amount           :float
#  transaction_type :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  account_id       :integer
#
# Indexes
#
#  index_transactions_on_account_id  (account_id)
#

class Transaction < ApplicationRecord
  belongs_to :account
  has_one :user, through: :account
  
  validates :amount, presence: true, numericality: {only_float: true}
  validate :withdrawl_amount
  after_commit :update_account_balance
  after_commit :send_email_to_user

  def transaction_type_name
  	self.transaction_type == "DR" ? "Withdraw" : "Deposit"
  end

  def update_account_balance
    account.update(balance: [account.balance, self.amount].inject((self.transaction_type=="CR" ? "+" : "-" ).to_sym))
  end

  def withdrawl_amount
  	errors.add(:base, "Your withdrawl amount is more than account balance") if (self.transaction_type=="DR" && self.amount > self.account.balance)
  end

  def send_email_to_user
    TransactionMailer.transaction_notifier(self).deliver_now
  end
end
