class Removeretirementsavings < ActiveRecord::Migration[6.0]
  def change
    remove_column :personal_informations, :retirement_savings
  end
end
