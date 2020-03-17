# == Schema Information
#
# Table name: personal_informations
#
#  id                         :integer          not null, primary key
#  current_age                :integer
#  inflation_rate             :float
#  life_expectancy            :integer
#  monthly_retirement_savings :integer
#  retirement_age             :integer
#  return_on_savings          :float
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  budget_id                  :integer
#  user_id                    :integer
#

class PersonalInformation < ApplicationRecord
  
end
