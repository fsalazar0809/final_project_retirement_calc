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
  validates :current_age, presence: true
  validates :inflation_rate, presence: true
  validates :life_expectancy, presence: true
  validates :monthly_retirement_savings, presence: true
  validates :retirement_age, presence: true
  validates :return_on_savings, presence: true

  belongs_to :user
  belongs_to :budget, :class_name => "BudgetCalculator"
  
end
