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

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
