class RecipesController < ApplicationController
  def show
    # byebug
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: "First Ingredient")
    @recipe.ingredients.build(name: "Second Ingredient")
  end

  # def new
  #   @person = Person.new
  #   @person.addresses.build(address_type: 'work')
  #   @person.addresses.build(address_type: 'home')
  # end

  def create
    recipe = Recipe.create(recipe_params)
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, ingredients_attributes: [:name, :quantity])
  end
end

# <%= render 'form', recipe: @recipe %>

# <%= form_for (@recipe) do |f| %>
#   <%= f.label :title %>
#   <%= f.text_field :name %>

#   <%= f.fields_for :ingredients do |i| %>
#       <%= i.label :name_1 %>
#       <%= i.text_field :name_2 %><br>

#       <%= i.label :quantity_1 %>
#       <%= i.label :quantity_2 %><br>
#   <% end %>
#   <% = f.submit %>
# <% end %>

