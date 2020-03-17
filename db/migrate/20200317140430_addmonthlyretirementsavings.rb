class Addmonthlyretirementsavings < ActiveRecord::Migration[6.0]
  def change
    add_column :personal_informations, :monthly_retirement_savings, :integer
  end
end
