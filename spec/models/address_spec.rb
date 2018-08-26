# == Schema Information
#
# Table name: addresses
#
#  id            :integer          not null, primary key
#  area          :string
#  building_name :string
#  city          :string
#  deleted_at    :datetime
#  floor_no      :string
#  house_number  :string
#  landmark      :string
#  permanent     :boolean
#  pin_code      :string
#  state         :string
#  street_no     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#
# Indexes
#
#  index_addresses_on_deleted_at  (deleted_at)
#  index_addresses_on_user_id     (user_id)
#

require 'rails_helper'

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
