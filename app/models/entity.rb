class Entity < ApplicationRecord
  belongs_to :users
  has_many :groups
end
