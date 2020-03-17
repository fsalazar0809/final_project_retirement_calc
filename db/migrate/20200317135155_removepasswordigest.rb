class Removepasswordigest < ActiveRecord::Migration[6.0]
  def change
    remove_column :personal_informations, :password_digest
  end
end
