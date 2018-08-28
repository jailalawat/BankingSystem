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

class Profile < ApplicationRecord
	acts_as_paranoid
	extend FriendlyId
	friendly_id :first_name, use: :slugged
  belongs_to :user
  validates :first_name, :last_name, presence: true
  validates :mobile_no, :presence => true,
  										:numericality => true,
                     	:length => { :minimum => 10, :maximum => 12 }

  def full_name
  	"#{first_name} #{middle_name} #{last_name}"
  end
end
