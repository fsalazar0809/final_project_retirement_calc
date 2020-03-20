class Addinflationrate < ActiveRecord::Migration[6.0]
  def change
    add_column :personal_informations, :inflation_rate, :float
  end
end
