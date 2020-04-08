class Recipe < ActiveRecord::Base
  has_many :ingredients 
  accepts_nested_attributes_for :ingredients
  # has_accepted_attributes_for :ingredients
end
