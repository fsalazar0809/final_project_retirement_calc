class Removemonthlycontribution < ActiveRecord::Migration[6.0]
  def change
    remove_column :personal_informations, :monthly_contribution
  end
end
