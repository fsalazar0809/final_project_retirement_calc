namespace(:dev) do
  desc "Hydrate the database with some dummy data to look at so that developing is easier"
  task({ :prime => :environment}) do
     
   User.destroy_all

    u = User.new
    u.email = "bob@example.com"
    u.password = "password"
    u.save
    p u.errors.full_messages

    b = BudgetCalculator.new
    b.user_id = u.id
    b.educational_expenses__school_supplies = rand(1000)
    b.educational_expenses__student_loans = rand(1000)
    b.food_and_personal__clothing = rand(1000)
    b.food_and_personal__entertainment = rand(1000)
    b.food_and_personal__groceries__household = rand(1000)
    b.food_and_personal__medical = rand(1000) 
    b.food_and_personal__other_expenses = rand(1000)
    b.food_and_personal__pet_supplies = rand(1000)
    b.housing_expenses__cable__tv__internet = rand(1000)
    b.housing_expenses__hoa_fees = rand(1000)
    b.housing_expenses__home_insurance = rand(1000)
    b.housing_expenses__mortgage = rand(1000)
    b.housing_expenses__phone_cell = rand(1000)
    b.housing_expenses__repairs_maintenance = rand(1000)
    b.housing_expenses__water__gas__electricity = rand(1000)
    b.monthly_income__other_income = rand(1000)
    b.monthly_income__salarywages = rand(1000)
    b.monthly_savings__emergency_fund = rand(1000)
    b.monthly_savings__investments = rand(1000)
    b.transportation_expenses__car_insurance = rand(1000)
    b.transportation_expenses__car_payment = rand(1000)
    b.transportation_expenses__car_repairs = rand(1000)
    b.transportation_expenses__gas__fuel = rand(1000)
    b.save
    p b.errors.full_messages

    pe = PersonalInformation.new
    pe.user_id = u.id
    pe.budget_id = b.id

    pe.current_age = rand(62)
    pe.inflation_rate = rand(10)
    pe.life_expectancy = rand(18..150)
    pe.monthly_retirement_savings = rand(1000)
    pe.retirement_age = (30..70)
    pe.return_on_savings = rand (15)
    
    pe.save

    p pe.errors.full_messages
  end



  end
end
