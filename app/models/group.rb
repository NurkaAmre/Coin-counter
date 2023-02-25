class Group < ApplicationRecord
  validates :name, presence: true, length: { in: 1..15 }
  validates :icon, presence: true, length: { in: 1..150 }

  belongs_to :user, class_name: 'User', foreign_key: :user_id
  has_many :entities, dependent: :destroy

  def total_transactions
    entities.sum(:amount)
  end
end
