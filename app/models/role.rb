class Role < ActiveRecord::Base
  belongs_to :authorizable, :polymorphic => true
end
