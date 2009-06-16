class DjProfile < ActiveRecord::Base
  belongs_to :user
  has_one :show
end
