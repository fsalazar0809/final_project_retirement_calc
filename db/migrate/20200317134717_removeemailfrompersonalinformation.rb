class Removeemailfrompersonalinformation < ActiveRecord::Migration[6.0]
  def change
    remove_column :personal_informations, :email
  end
end
