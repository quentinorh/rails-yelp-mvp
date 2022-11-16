class RestaurantsController < ApplicationController
  before_action(:set_restaurant, only: %i[show edit update destroy])

  def index
    @restaurants = Restaurant.all
  end

  def show

  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    ##### Ancienne Version #####
    # @restaurant = Restaurant.create(restaurant_params)
    #
    # # Rediriger vers la show du restaurant @restaurant
    # # Au lieu de chercher à afficher une view create.html.erb
    # redirect_to restaurant_path(@restaurant)
    ############################

    ## Si la validation échoue, ça ne marche pas !
    ## Ce qu'on veut, c'est vérifier si on a pu sauver notre restaurant
    @restaurant = Restaurant.new(restaurant_params)

    ## Si ça ne sauve pas (erreur de validation), #save renverra false
    if @restaurant.save
      # Rediriger vers la show du restaurant @restaurant
      # Au lieu de chercher à afficher une view create.html.erb
      redirect_to restaurant_path(@restaurant)
    else
      # Afficher la vue new.html.erb
      # Au lieu de chercher à afficher une view create.html.erb
      # Pour remontrer le formulaire et essayer encore
      render(:new)
    end
  end

  def edit
  end

  def update
    ##### Ancienne Version #####
    # @restaurant.update(restaurant_params)
    #
    # # Rediriger vers la show du restaurant @restaurant
    # # Au lieu de chercher à afficher une view update.html.erb
    # redirect_to restaurant_path(@restaurant)
    ############################

    ## Si la validation échoue, ça ne marche pas !
    ## Ce qu'on veut, c'est vérifier si on a pu sauver les modifications de notre restaurant

    ## Si ça n'update pas (erreur de validation), #update renverra false
    if @restaurant.update(restaurant_params)
      # Rediriger vers la show du restaurant @restaurant
      # Au lieu de chercher à afficher une view update.html.erb
      redirect_to restaurant_path(@restaurant)
    else
      # Afficher la vue edit.html.erb
      # Au lieu de chercher à afficher une view update.html.erb
      # Pour remontrer le formulaire et essayer encore
      render(:edit)
    end
  end

  def destroy
    @restaurant.destroy
    # Rediriger vers l'index des restaurants
    # Au lieu de chercher à afficher une view destroy.html.erb
    redirect_to restaurants_path, status: :see_other
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  # Strong params !
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end
end
