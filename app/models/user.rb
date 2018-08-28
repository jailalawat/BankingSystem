# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  deleted_at             :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  locked_at              :datetime
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  unconfirmed_email      :string
#  unlock_token           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_deleted_at            (deleted_at)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#

class User < ApplicationRecord
	acts_as_paranoid
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, 
         :confirmable, :lockable, :timeoutable, :trackable
  has_one :profile, dependent: :destroy
  has_one :beneficiary, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_one :account
  has_one :bank, through: :account
  has_many :transactions, through: :account
  delegate :full_name, to: :profile
  delegate :mobile_no, to: :profile

  validates :addresses, length: { :minimum => 1 }
  validates_associated :profile, :beneficiary, :addresses, :account, :bank
  accepts_nested_attributes_for :profile, :beneficiary, :addresses, :account, :bank

  # def self.search(ids, start_date, end_date)
  #   query = ""
  #   if(ids.present? && (start_date.blank? && end_date.blank?))
  #     query = "users.id IN(?)"
  #   elsif(start_date.present? && (ids.blank? && end_date.blank?))
  #     query = "transactions.created_at #{start_date}"
  #   elsif(end_date.present? && (start_date.blank? && ids.blank?))
  #     query = "users.id IN(?)"
  #   end

  #   if(query.blank?)
  #     eager_load(:transactions).all
  #   else
  #   end
  # end
end
