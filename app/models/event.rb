class Event < ApplicationRecord
  belongs_to :user
  has_many :requests
  has_many :categories, through: :event_categories
end
