class Removefourth < ActiveRecord::Migration[6.0]
  def change
      remove_column :budget_calculators, :email
  end
end
