class TimeSlot < ActiveRecord::Base
  belongs_to :scheduled, :polymorphic=>true
end
