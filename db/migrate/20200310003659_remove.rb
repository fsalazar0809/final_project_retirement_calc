class Remove < ActiveRecord::Migration[6.0]
  def change
    remove_column :budget_calculators, :monthly_spend__budget
  end
end
