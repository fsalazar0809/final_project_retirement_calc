# == Schema Information
#
# Table name: budget_calculators
#
#  id                                        :integer          not null, primary key
#  educational_expenses__college_tuition     :string
#  educational_expenses__school_supplies     :integer
#  educational_expenses__student_loans       :integer
#  food_and_personal__clothing               :integer
#  food_and_personal__entertainment          :integer
#  food_and_personal__groceries__household   :integer
#  food_and_personal__medical                :integer
#  food_and_personal__other_expenses         :integer
#  food_and_personal__pet_supplies           :integer
#  housing_expenses__cable__tv__internet     :integer
#  housing_expenses__hoa_fees                :integer
#  housing_expenses__home_insurance          :integer
#  housing_expenses__mortgage                :integer
#  housing_expenses__phone_cell              :integer
#  housing_expenses__repairs_maintenance     :integer
#  housing_expenses__water__gas__electricity :integer
#  monthly_income__other_income              :integer
#  monthly_income__salarywages               :integer
#  monthly_savings__emergency_fund           :integer
#  monthly_savings__investments              :integer
#  transportation_expenses__car_insurance    :integer
#  transportation_expenses__car_payment      :integer
#  transportation_expenses__car_repairs      :integer
#  transportation_expenses__gas__fuel        :integer
#  created_at                                :datetime         not null
#  updated_at                                :datetime         not null
#  user_id                                   :string
#

class BudgetCalculator < ApplicationRecord
  has_one :personal_information, :foreign_key => "budget_id", :dependent => :destroy

end

