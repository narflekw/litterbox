class PlaylistItem < ActiveRecord::Base
  belongs_to :broadcast
  belongs_to :item, :polymorphic=>true
end
