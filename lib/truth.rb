class Truth < ActiveRecord::Base 
  belongs_to :honesty, :polymorphic => true
end