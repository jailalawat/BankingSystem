# == Schema Information
#
# Table name: profiles
#
#  id          :integer          not null, primary key
#  deleted_at  :datetime
#  first_name  :string
#  last_name   :string
#  middle_name :string
#  mobile_no   :string
#  slug        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
# Indexes
#
#  index_profiles_on_deleted_at  (deleted_at)
#  index_profiles_on_user_id     (user_id)
#

require 'rails_helper'

RSpec.describe Profile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
