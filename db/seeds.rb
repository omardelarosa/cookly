# blow up database each time
Cookbook.delete_all
Recipe.delete_all
Chef.delete_all


def make_cookbook_title(author_name)
  last_name = author_name.split(" ")[1]
  topics = [
    "Food",
    "Pies",
    "Sandwiches",
    "Cuisine",
    "Dishes"
  ]

  name_patterns = [
    "#{last_name}'s Guide to #{topics.sample}",
    "#{last_name} Does #{topics.sample}",
    "#{last_name} Makes #{topics.sample} and More",
    "#{topics.sample} by #{last_name}",
    "#{topics.sample}, #{topics.sample} and #{topics.sample}",
    "The Joy of #{topics.sample}"
  ]
  return name_patterns.sample
end

def make_cookbook_description(author_name)
  first_name = author_name.split(" ")[0]
  last_name = author_name.split(" ")[1]

  topics = [
    "food",
    "pies",
    "sandwiches",
    "cuisine",
    "dishes"
  ]
  adjectives = [
    "runny",
    "lost",
    "dead",
    "hilarious",
    "depressed",
    "missing",
    "loud"
  ]
  prefixes = [
    "Just when you thought #{first_name} was #{adjectives.sample}, ",
    "After years of being #{adjectives.sample} and #{adjectives.sample} #{first_name}, ",
    "As #{adjectives.sample.capitalize} #{first_name} arrives on the scene, ",
  ]
  sentence_patterns = [
    "#{last_name}'s back, even more #{adjectives.sample} than before.",
    "#{last_name} will make some #{adjectives.sample} #{topics.sample} with you.",
    "#{last_name} will help you fry up some #{adjectives.sample} #{topics.sample} for your hefty family.",
  ]

  return "#{prefixes.sample}#{sentence_patterns.sample}"
end


def make_recipe_name(ingredients)
  food_types = [
    "Salad",
    "Stew",
    "Cake",
    "Casserole"
  ]
  name_patterns = [
    "#{ingredients[0].name.titleize}y #{ingredients[1].name.titleize} #{food_types.sample}",
    "#{ingredients[0].name.titleize} and #{ingredients[1].name.titleize} #{food_types.sample}",
    "#{ingredients[0].name.titleize}tastic #{food_types.sample}",
    "#{ingredients[0].name.titleize}licious #{food_types.sample}",
  ]
  return name_patterns.sample
end

def make_recipe_content(ingredients)

  verbs = [
    "squash",
    "crush",
    "pulverize",
    "mash",
    "grind",
    "jiggle",
    "stir",
    "squeeze",
    "pound"
  ]

  prepositions = [
    "into",
    "around",
    "with",
    "inside of",
    "next to",
    "between",
    "betwixt"
  ]

  direction_patterns = [
    "#{verbs.sample} the #{ingredients[0].name} #{prepositions.sample} the #{ingredients[1].name}.",
    "#{verbs.sample} some #{ingredients[2].name} while you #{verbs.sample} #{ingredients[1].name} #{prepositions.sample} the #{ingredients[0].name}."
  ]

  directions_list = []
  rand_directions = direction_patterns.shuffle
  2.times do
    directions_list << rand_directions.pop
  end
  return directions_list.join(" ")
end

# temporary chefs array
chefs = []
10.times do
  # create a chef and shovel them onto temp array
  new_chef = Chef.create({
    name: Faker::Name.name,
    bio: Faker::Lorem.paragraphs(2).join(""),
    email: Faker::Internet.email,
    password: "password123"
    })

  # check to see if new chef's email was valid
  if new_chef.valid?
    chefs << new_chef
  end
end

# make my chef
Chef.create({
    name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
    bio: Faker::Lorem.paragraphs(2).join(""),
    email: "test@test.com",
    password: "password123"
    })

ingredients = [
  "eggs",
  "water",
  "noodles",
  "bread",
  "tomato sauce",
  "bacon"
]

unit_names = [
  "grams",
  "buckets",
  "mouthfuls",
  "gallons",
  "dollops",
  "slices",
  "gigabytes"
]

ingredients.each do |ingredient_name|
  Ingredient.create({
    name: ingredient_name
    })
end


100.times do

  cookbook = Cookbook.new

  # empty array of recipes
  recipes = []

  # make 10 random recipes
  10.times do
    #add each of those 10 recipes to the array of recipes
    recipe = Recipe.new

    # add three random ingredients to our recipe
    random_ingredients = Ingredient.all
    3.times do
      valid_ingredient_name = random_ingredients.to_a.pop.name
      random_quantity = rand(1..100)
      # using a custom Model Method called .add_portion
      recipe.add_portion(
        random_quantity,
        unit_names.sample,
        valid_ingredient_name
        )
    end

    recipe.save

    recipe.title = make_recipe_name(recipe.ingredients)
    recipe.content = make_recipe_content(recipe.ingredients)

    recipe.save

    # add new recipe to array
    recipes << recipe
  end

  # add each recipes from the array to my cookbook
  recipes.each do |recipe|
    # use .recipes to attach recipes
    cookbook.recipes << recipe
  end

  # assigns a random chef to the new book
  cookbook.chef = chefs.sample

  cookbook.title = make_cookbook_title(cookbook.chef.name)
  cookbook.description = make_cookbook_description(cookbook.chef.name)

  # save the newly created cookbook
  cookbook.save!

end
