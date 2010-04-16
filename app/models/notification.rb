class Notification < ActiveRecord::Base
  belongs_to :noteworthy, :polymorphic => true
end
