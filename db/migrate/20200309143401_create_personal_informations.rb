class CreatePersonalInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :personal_informations do |t|
      t.string :email
      t.string :password_digest
      t.integer :current_age
      t.integer :retirement_age
      t.float :retirement_savings
      t.float :return_on_savings
      t.integer :life_expectancy
      t.integer :monthly_contribution
      t.integer :user_id
      t.integer :budget_id

      t.timestamps
    end
  end
end
