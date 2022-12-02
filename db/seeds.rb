# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


5.times do
    Recipe.create(title:Faker::Food.dish,instructions:"Here's how you make it.
  
## Ingredients

- 1c Sugar
- 1c Spice

## Instructions

**Mix** sugar and spice. _Bake_ for 30 minutes.",minutes_to_complete:rand(10..40),user_id:1)
end