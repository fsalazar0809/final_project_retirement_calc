# == Schema Information
#
# Table name: personal_informations
#
#  id                   :integer          not null, primary key
#  current_age          :integer
#  email                :string
#  life_expectancy      :integer
#  monthly_contribution :integer
#  password_digest      :string
#  retirement_age       :integer
#  retirement_savings   :float
#  return_on_savings    :float
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  budget_id            :integer
#  user_id              :integer
#

class PersonalInformation < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
end
