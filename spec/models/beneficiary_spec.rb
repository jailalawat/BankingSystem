# == Schema Information
#
# Table name: beneficiaries
#
#  id         :integer          not null, primary key
#  deleted_at :datetime
#  name       :string
#  relation   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_beneficiaries_on_deleted_at  (deleted_at)
#  index_beneficiaries_on_user_id     (user_id)
#

require 'rails_helper'

RSpec.describe Beneficiary, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
