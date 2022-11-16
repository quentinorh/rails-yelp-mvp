Restaurant.destroy_all

all_categories = ["chinese", "italian", "japanese", "french", "belgian"]

10.times do |i|
  Restaurant.create(name: Faker::Restaurant.name , address: Faker::Nation.capital_city, category: all_categories.sample)
end
