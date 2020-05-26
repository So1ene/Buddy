class EventCategory < ApplicationRecord
  belongs_to :event
  belongs_to :category
  validates :event, :category, presence: true
end
