class Fact < ActiveRecord::Base
  #include Honesty::Fact
  belongs_to :honest, :polymorphic => true
  default_scope :order => 'created_at ASC'

  # add the models this fact can belong to
  # belongs_to :show
  # belongs_to :user
  # etc...
end
