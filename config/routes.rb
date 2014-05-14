Rails.application.routes.draw do

  # root route
  root to: "home#index"

  # display all cookbooks
  get "/cookbooks" => "cookbooks#index"

  # display one cookbook
  get "/cookbooks/:id" => "cookbooks#show", as: :cookbook

  # display the EDIT form for a cookbook
  get "/cookbooks/:id/edit" => "cookbooks#edit", as: :edit_cookbook

  # process an UPDATE or edit to a cookbook record
  patch "/cookbooks/:id" => "cookbooks#update"

  # renders a NEW cookbook form
  # get "/cookbooks/new" => "cookbooks#new"

  # this processes the form input
  post "/cookbooks" => "cookbooks#create"

  # for demo purposes
  # get "/secret" => "cookbooks#secret_code"

  # post or ADD one or more recipes
  post "/recipes" => "recipes#create"

  # get one RECIPE
  get "/recipes/:id" => "recipes#show", as: :recipe

  # get EDIT form for recipes
  get "/recipes/:id/edit" => "recipes#edit", as: :edit_recipe

  # process form data for UPDATE or edit actions
  patch "/recipes/:id" => "recipes#update"

  # chefs...

  # get ALL chefs
  get "/chefs" => "chefs#index"

  # get ONE chef
  get "/chefs/:id" => "chefs#show"

  # show NEW chef form
  get "/chef/new" => "chefs#new"

  # process chef CREATE action from form
  post "/chefs" => "chefs#create"

  # show LOGIN form
  get "/chef/login" => "chefs#login"

  # process login form
  post "/chef/login" => "chefs#process_login"
end
