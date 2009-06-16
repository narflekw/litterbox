class DjProfile < ActiveRecord::Base
  belongs_to :user
  has_one :show
  has_and_belongs_to_many :broadcasts
end
