def assign_favorite_food(pet_type)
	favorite_food = ""
	if pet_type == "Cat"
		favorite_food = %w(Milk Water Bread).sample
	elsif pet_type == "Dog"
		favorite_food = %w(Water Meat).sample
	elsif pet_type == "Horse"
		favorite_food = %w(Carrot Grass Water).sample
	elsif pet_type == "Mouse"
		favorite_food = %w(Water Cheese).sample
	end
end

def create_pets(user)
	pets = %w(Cat Dog Horse Mouse)
	(0..3).to_a.sample.times do
		random_pet = pets.sample
		random_pet.constantize.create(
			name: Faker::Creature::Dog.name,
			owner_id: user.id,
			age: (1..15).to_a.sample,
			favorite_food: assign_favorite_food(random_pet)
		)
	end
end

def add_fridge_to_user(user)
	if user.calculate_age >= 18
		fridge = Fridge.create(
			owner_id: user.id,
			brand: %w(Siemens Whirpool AEG).sample,
			last_technical_check: Faker::Date.backward(days: 365)
		)
		user.update_attribute(:fridge_id, fridge.id)
	end
end

def add_food_to_fridge(user)
	fridge = Fridge.find_by(owner_id: user.id)
	if fridge != nil
		foods = %w(Milk Water Bread Meat Carrot Grass Cheese)
		(1..10).to_a.sample.times do
			random_food = foods.sample
			random_food.constantize.create(
				fridge_id: fridge.id,
				expiration_date: %w(Milk Bread Meat Carrot Cheese).include?(random_food) ? Faker::Date.forward(days: 3) : nil,
				brand: %w(Milk Bread Meat Carrot Cheese).include?(random_food) ? %w(cheap expensive).sample : nil,
				volume: random_food == "Milk" ? %w(0.5 1).sample : nil,
				size: random_food == "Bread" ? %w(big small).sample : nil,
				color: random_food == "Carrot" ? %w(orange purple white).sample : nil 
			)
		end
	end
end

500.times do
	first_name = Faker::Name.first_name
	last_name = Faker::Name.last_name
	email = Faker::Internet.email(name: first_name)
	date_of_birth = Faker::Date.birthday(min_age: 1, max_age: 50)
	User.create(
		first_name: first_name,
		last_name: last_name,
		email: email,
		date_of_birth: date_of_birth
	)
end

users = User.all

users.count.times do |n|
	create_pets(users[n])
	add_fridge_to_user(users[n])
	add_food_to_fridge(users[n])
end