class Group < ApplicationRecord
  belongs_to :users
  belongs_to :entities
end
