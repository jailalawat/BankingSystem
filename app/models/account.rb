# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  account_no :integer          default(1441)
#  balance    :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bank_id    :integer
#  user_id    :integer
#
# Indexes
#
#  index_accounts_on_bank_id  (bank_id)
#  index_accounts_on_user_id  (user_id)
#

class Account < ApplicationRecord
  belongs_to :user
  belongs_to :bank
  has_many :transactions
  validates :account_no, presence: true
  before_create :generate_account_no

  def generate_account_no
  	increment!(:account_no)
  end
end
