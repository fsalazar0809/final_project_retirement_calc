class Doublehousingandbudget < ActiveRecord::Migration[6.0]
  def change
    remove_column :budget_calculators, :housing_expenses__rent
    end
end
