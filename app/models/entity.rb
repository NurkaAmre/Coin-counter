class Transaction < ApplicationRecord
  belongs_to :users, class_name: 'User', foreign_key: :user_id
  belongs_to :groups
  
  validates :name, :group, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
