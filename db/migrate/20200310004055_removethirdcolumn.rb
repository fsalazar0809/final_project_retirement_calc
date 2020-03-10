class Removethirdcolumn < ActiveRecord::Migration[6.0]
  def change
   remove_column :budget_calculators, :password_digest
  end
end
