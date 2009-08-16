class User < ActiveRecord::Base
  has_one :dj_profile

  validates_presence_of :email, :name
end
