class ChefsController < ApplicationController

  # # before filter :name_of_some_method
  # before_action :authenticate_with_basic_auth


  def index
    # show me all the chefs
    @chefs = Chef.all
    # render :index
  end

  def show
    # show me one chef
    @chef = Chef.find(params[:id])
    # render json: @chef
  end

  def new
    @chef = Chef.new
  end

  def create
    chef_hash = params[:chef]
    if chef_hash[:password] == chef_hash[:password_confirmation]
      chef = Chef.new
      chef.password = chef_hash[:password]
      chef.name = chef_hash[:name]
      chef.bio = chef_hash[:bio]
      chef.email = chef_hash[:email]
      chef.save

      if chef.valid?
        # log the chef in when they register
        @current_user = chef
        redirect_to "/chef/login"
      else
        render text: "Email is already taken!"
      end
    else
      render text: "Passwords Did Not Match!"
    end
    # render json: params
  end

  # not a restful route, really...
  def login
    # show LOGIN form

  end

  def process_login
    # process login form

    email = params[:email]
    password = params[:password]

    @current_user = Chef.authenticated?(email, password)

    if @current_user
      redirect_to cookbooks_path
    else
      render text: "Login Failed! Invalid email or password!"
    end

  end

end
