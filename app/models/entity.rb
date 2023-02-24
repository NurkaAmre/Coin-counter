class Entity < ApplicationRecord
  belongs_to :group
  belongs_to :user, class_name: 'User'
  has_many :group_entities
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
