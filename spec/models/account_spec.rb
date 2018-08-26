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

require 'rails_helper'

RSpec.describe Account, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
