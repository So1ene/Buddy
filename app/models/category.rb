class Category < ApplicationRecord
  has_many :events, through: :event_categories
  has_many :event_categories, dependent: :destroy
  validates :name, presence: true
end
